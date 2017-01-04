Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38F95605C3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 02:12:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v042CgcP018142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jan 2017 18:12:43 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 3 Jan 2017 18:12:41 -0800
To: Andreas Oberritter <obi@opendreambox.org>, Andre McCurdy
	<armccurdy@gmail.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
	<6efb8d002491cd1e736b9126e09a5a63b4acd4d1.1482300982.git.liezhi.yang@windriver.com>
	<CAJ86T=X_cPiiTWb_mdrcWre=XmAkB=kk7QE0kJ-SKu9Z1B1Fxw@mail.gmail.com>
	<67916363-806f-7f9e-e9e8-941bb2614cfb@windriver.com>
	<02079360-2340-5cdb-b23c-db371383d408@opendreambox.org>
	<ea7ce818-05fa-a41d-c70e-b94260328d09@windriver.com>
	<d99876dc-4982-496b-2b9d-34540ce09b01@opendreambox.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <0f5cdc36-9eda-e73a-5c10-ab5c09ec2712@windriver.com>
Date: Wed, 4 Jan 2017 10:12:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <d99876dc-4982-496b-2b9d-34540ce09b01@opendreambox.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] hdparm: 9.48 -> 9.50
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2017 02:12:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Thanks, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/pu
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (5):
   debianutils: 4.8 -> 4.8.1
   mklibs-native: 0.1.41 -> 0.1.43
   quilt: 0.64 -> 0.65
   guile: 2.0.12 -> 2.0.13
   hdparm: 9.48 -> 9.50



Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Tue Dec 20 03:09:45 2016 +0000

     hdparm: 9.48 -> 9.50

     Remove "-e MAKEFLAGS=" from EXTRA_OEMAKE to fix:
     ERROR: hdparm-9.50-r0 do_package: QA Issue: File '/sbin/hdparm.hdparm' from 
hdparm was already stripped, this will prevent future debugging! [already-stripped]
     ERROR: hdparm-9.50-r0 do_package: Fatal QA errors found, failing task.

     The "-e MAKEFLAGS=" would cause submake can't get vars from environment,
     The git log said that it was added for fixing a QA warning, but
     everything is OK after remove it now.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-extended/hdparm/hdparm_9.48.bb 
b/meta/recipes-extended/hdparm/hdparm_9.50.bb
similarity index 81%
rename from meta/recipes-extended/hdparm/hdparm_9.48.bb
rename to meta/recipes-extended/hdparm/hdparm_9.50.bb
index cd85776cf8f..f89c30e4dda 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.48.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.50.bb
@@ -20,12 +20,12 @@ FILES_wiper = "${bindir}/wiper.sh"

  RDEPENDS_wiper = "bash gawk stat"

-SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz "
+SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz"

-SRC_URI[md5sum] = "213efdbe7471fad3408198918e164354"
-SRC_URI[sha256sum] = 
"ce97b4a71cb04146f54cf6f69787e7f97ddfda9836dc803b459d3b3df3a4fbee"
+SRC_URI[md5sum] = "d380062ad6c4b40076736efbb640f1f5"
+SRC_URI[sha256sum] = 
"0892b44bd817c251264a24f6ecbbb010958033e0395d2030f25f1c5608ac780e"

-EXTRA_OEMAKE = '-e MAKEFLAGS= STRIP="echo"'
+EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'

  inherit update-alternatives


// Robert

On 12/22/2016 09:34 PM, Andreas Oberritter wrote:
> On 22.12.2016 04:14, Robert Yang wrote:
>> On 12/22/2016 11:09 AM, Andreas Oberritter wrote:
>>> On 22.12.2016 03:47, Robert Yang wrote:
>>>> On 12/21/2016 09:27 PM, Andre McCurdy wrote:
>>>>> Passing LDFLAGS on the make command line might be a cleaner solution
>>>>> than patching the Makefile.
>>>>
>>>> We can't do that since there is a "-e MAKEFLAGS=" in EXTRA_OEMAKE,
>>>> and its
>>>> Makefile is:
>>>>
>>>> all:
>>>>     make -j2 hdparm
>>>>
>>>> hdparm: hdparm.h sgio.h $(OBJS)
>>>>     $(CC) $(LDFLAGS) -o hdparm $(OBJS)
>>>>     $(STRIP) hdparm
>>>>
>>>> The "make -j2 hdparm" doesn't pass any env vars to sub make since
>>>> MAKEFLAGS=,
>>>> so that need use weak assignment "?=" here.
>>>
>>> You don't need to use target 'all'. Try this:
>>>
>>> do_compile() {
>>>     oe_runmake hdparm
>>> }
>>
>> I know this will work, but "make hdparm" rather than "all" may cause other
>> issues in the future when hdparm gets ugpraded, for example, "all" doesn't
>> only contain "hdmarm". And do we have really have to add a do_compile()
>> here ?
>
> It's certainly easier to delete do_compile in a future version's recipe
> than regenerating patches. hdparm is looking for a new maintainer, btw.
>
> 'hdparm' has been the only target built by 'all' since at least version
> 3.1, which dates back to 1996.
>
> Regards,
> Andreas
>

