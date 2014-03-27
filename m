Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 148106F6FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 14:48:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2REmKQg023119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 07:48:20 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 27 Mar 2014 07:48:20 -0700
Message-ID: <53343A32.6070109@windriver.com>
Date: Thu, 27 Mar 2014 22:48:18 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1395906475.git.liezhi.yang@windriver.com>
	<9bd12f5fca3736b2975ce0249b3428b5b0af194e.1395906475.git.liezhi.yang@windriver.com>
	<20140327113949.GQ3709@jama>
In-Reply-To: <20140327113949.GQ3709@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] gummiboot: add COMPATIBLE_HOST
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
X-List-Received-Date: Thu, 27 Mar 2014 14:48:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/27/2014 07:39 PM, Martin Jansa wrote:
> On Thu, Mar 27, 2014 at 04:11:22AM -0400, Robert Yang wrote:
>> The gummiboot depends on gnu-efi which had set:
>>
>> COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
>>
>> We also need set this for gummiboot, otherwise there would be build
>> failures for other non-x86 archs.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-bsp/gummiboot/gummiboot_git.bb |    2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
>> index 5868a23..61de58c 100644
>> --- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
>> +++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
>> @@ -13,6 +13,8 @@ PV = "43+git${SRCPV}"
>>   SRCREV = "4062c51075ba054d4949c714fe06123f9ad3097d"
>>   SRC_URI = "git://anongit.freedesktop.org/gummiboot"
>>
>
> It would be good to add comment here saying it's only because of gnu-efi
> dependency (if gummiboot itself can in theory work on other hosts).
>

Sounds reasonable, updated:

   git://git.openembedded.org/openembedded-core-contrib rbt/gummiboot
 
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/gummiboot

diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb 
b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
index 61de58c..035cec1 100644
--- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -13,6 +13,9 @@ PV = "43+git${SRCPV}"
  SRCREV = "4062c51075ba054d4949c714fe06123f9ad3097d"
  SRC_URI = "git://anongit.freedesktop.org/gummiboot"

+# Note: Add COMPATIBLE_HOST here is only because it depends on gnu-efi
+# which has set the COMPATIBLE_HOST, the gummiboot itself may work on
+# more hosts.
  COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"

  S = "${WORKDIR}/git"

// Robert


> People won't notice it in commit message when they are looking at
> recipe.
>
>> +COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
>> +
>>   S = "${WORKDIR}/git"
>>
>>   EXTRA_OECONF = "--disable-manpages --with-efi-includedir=${STAGING_INCDIR} \
>> --
>> 1.7.10.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

