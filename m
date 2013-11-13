Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 55B7C6D39D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 13:39:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rADDd567016603
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Nov 2013 05:39:05 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 13 Nov 2013 05:39:05 -0800
Message-ID: <528380F8.5020705@windriver.com>
Date: Wed, 13 Nov 2013 07:39:04 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>, Martin Jansa <martin.jansa@gmail.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>	
	<20f7dafc5f5948e7954203a0d57c25b68a419568.1384305535.git.mark.hatle@windriver.com>	
	<20131113081253.GB3663@jama>
	<1384341268.12863.6.camel@phil-desktop.brightsign>
In-Reply-To: <1384341268.12863.6.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] binutils: Ensure old -symlinks packages get removed
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
X-List-Received-Date: Wed, 13 Nov 2013 13:39:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/13, 5:14 AM, Phil Blundell wrote:
> On Wed, 2013-11-13 at 09:12 +0100, Martin Jansa wrote:
>> On Tue, Nov 12, 2013 at 07:23:22PM -0600, Mark Hatle wrote:
>>> When the -symlinks package was removed and an RPROVIDES was added, nothing
>>> was put in to cause the removal of the older package in an upgrade.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>> ---
>>>   meta/recipes-devtools/binutils/binutils.inc | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
>>> index 17c66bc..ea2383e 100644
>>> --- a/meta/recipes-devtools/binutils/binutils.inc
>>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>>> @@ -21,6 +21,7 @@ FILES_${PN} = " \
>>>   	${prefix}/${TARGET_SYS}/bin/*"
>>>
>>>   RPROVIDES_${PN} += "${PN}-symlinks"
>>> +RREPLACES_${PN} += "${PN}-symlinks"
>>
>> IIRC for opkg backend you need also RCONFLICTS for opkg to really remove
>> old ${PN}-symlinks.
>
> Also for dpkg.  If you have Replaces: without Conflicts: then this just
> means that the replacing package is allowed to overwrite files in the
> replaced one, not that the replaced one will actually be uninstalled.

This seems incredibly strange to me.  But I can adjust the 2/6 and 3/6 patches 
by adding the appropriate RCONFLICTS.

--Mark

> p.
>
>


