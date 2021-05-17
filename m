Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.103])
 by mx.groups.io with SMTP id smtpd.web08.17072.1621246232746838908
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=SrtBOuQI;
 spf=pass (domain: outlook.com, ip: 40.92.75.103, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/XYB1RPF3tjSSz1zkD/4ZdZ6xZIT+54YHI21JwMZgffzyMyNC1bK/P70DceRX8GNwoKsLLZCDuH4WwMCktP3cl2z61iBV30cJQYJk6qkgYfGl4kqXKwa8dqWP/0pyW8KFzR2nkPKtTDOJ8uVbDjFjr7raY61+4S2jI1Pf8OwIF9P2ACegPCDT5DeE7DfqdmEGe8AWVF79YFAF2XQNDARJCtqzmCpBErw0ftZXog62a6fKyEeAmBUOkspjJj1DuWZB/oVXB7TCxunCfBfK3p7eAG0mlowJxTAc98UQAfryjYwwNNWiM5s2CzVMExwcqlCzwWopa8bA5dtnANLHIu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWN2Az6loobRHXL2SZlul1XpEuP1b1ZSDHugiaHVU38=;
 b=msQXdhrf0/A+R0PDrdFzK64wKH1wGIejeFRc5kljcV+W1FXGbqqF8XyX8TAp+EUchB8Qvb0yP0V0uK/hWY3HcUZcETA/kOznW4FTDOWeyyq7sP30+yIKUjevqcf0n/IEKwZ2q+mb11egpzfFLBLpoZzj2nng6gUbLZjML4ezAaz3DI22ztAfKsQN5GVmObcNACmJg54ulyOKTeWUG1jZas/YoxOvlFxNdRsfDCiC65BKsDKs7Iu3bnJmffbvdUe2PiNs5e6j1gy/AYrnAb0RarCN+wdxZ8F4/r+S2/rpMO0Nd/xQag4P1KY0QwDCeQIdAUknAhDnAfZN380u6OrQvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWN2Az6loobRHXL2SZlul1XpEuP1b1ZSDHugiaHVU38=;
 b=SrtBOuQI9GdzIjiX9VyyagfH0vGFVFX1ffuM1vlOfp6STFyqurNJoALu8lXPumj7LLvJcsiXK7idSdaH1zLEW5eiK5Kf20r9RqTz/Qj5p8tk/MYRr6j9aAl5GUe5o3rT4dDqZyQJup1JBCLcsCuXYzMlTqbt4H2WjzJPssb9On5nMfJN66ZN4LP/Ki6VOjzsQMypJSX5zz8cQi3a/SJrqksAbWMzXWgzIK07xZOgZT3FsCxRu6/TbrIl7x9sm6OAWwZkCo5KpTPeXeYUXng9P2jCR+VgV9WcCLXkbmomOGbSAKQV6D0cWAhbWEll/9rIwmwhiwd1Uc40occhA1Uh7A==
Received: from VI1EUR04FT015.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::48) by
 VI1EUR04HT202.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::112)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 10:10:29 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0e::4b) by VI1EUR04FT015.mail.protection.outlook.com
 (2a01:111:e400:7e0e::148) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Mon, 17 May 2021 10:10:29 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:440DB9A81AD86B63C3EA27BA3031FD632D5EF407CEDEE0AD755E74B0553A638B;UpperCasedChecksum:C8E178537B63A83AF9A17D634823D6D5C0CCF1CEB32614756EE42ADA75673D7F;SizeAsReceived:8741;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 10:10:29 +0000
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210517091616.2414045-1-richard.purdie@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464240F22D172EFD67A0D389A82D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 17 May 2021 12:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210517091616.2414045-1-richard.purdie@linuxfoundation.org>
X-TMN: [fRuLx6uCcGzPw4FxLBp50mmHaLsxJIXT]
X-ClientProxiedBy: AS8PR04CA0092.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::7) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <783787ff-b31d-923e-e947-9ded631169e2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.93.83) by AS8PR04CA0092.eurprd04.prod.outlook.com (2603:10a6:20b:31e::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 10:10:28 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: bb07b8bc-cf4b-41f2-7848-08d9191bff52
X-MS-TrafficTypeDiagnostic: VI1EUR04HT202:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AKO5UoWfNO8OC4UvsFvzZ56dCc2Z9r1/sKNBSPBSZKGGlftcY5INS+vmwu2m9NJi44h7zgVfzpC4YXA9RtqY2zYch7aKQngCk+Zra2vROKGSI3dK41iGuADVU1UZxVNZPjWA48MKwzanFXWJtqrhlFKskUf1R5Mp5MtG8Eiot0gshfro0MogOwcOY8THg0E4Q3Wa1no/WUd2z48U2ouIFzi6m3ZNSzDzY+e6to4ClVBpj2qV2LJykPV5KurmI6uxUCsmA8s7/GaqbBYxluTysJ6jiw9iLJmHxNiGWB/BDCadL+2iY5emdCi1GcksFe/Tb3kXZFlcLv50j++QqxzO4QlJy9UOvkXw6CrfRuUuwPgAitZ7IlkF86hzFyRL57ZYbVW0dDM01Mx/6pFVb4atxT87jQwNXr8PbM6A6cXwS0KpsiwChDSyinP1+A608w1EXn71diM4xx+0mf1VHsgDig==
X-MS-Exchange-AntiSpam-MessageData: 
	BN32gOPE5Q5PwxFjk5wsP2f1mQvdemKWajH9nOsyxfy9s/DkIXxCe4grBdFQCv4UZSulgjJxhUPW9BQ4/IkR7c60kEukA0uHHlGBuJPMOxWxUph/xPKRGK56KIq+l3mIbYEb/e+fOoax8GTJzhA/6g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb07b8bc-cf4b-41f2-7848-08d9191bff52
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 10:10:29.2392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT015.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT202
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 17.05.21 11:16, Richard Purdie wrote:
> The preferred methods for CVE resolution are:
> 
> 1. Version upgrades where possible
> 2. Patches where not possible
> 3. Database updates where version info is incorrect
> 4. Exclusion from checking where it is determined that the CVE
>     does not apply to our environment
> 
> In some cases none of these methods are possible. For example the
> CVE may be decades old with no apparent resolution, and with broken
> links that make further research impractical. Some CVEs are vauge
> with no specific action the project can take too.
> 
> This patch creates a mechanism for users to remove this type of
> CVE from the cve-check results via an optional include file.
> 
> Based on an initial patch from Steve Sakoman <steve@sakoman.com>
> but extended heavily by RP.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   .../distro/include/cve-extra-exclusions.inc   | 91 +++++++++++++++++++
>   1 file changed, 91 insertions(+)
>   create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc
> 
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> new file mode 100644
> index 00000000000..2d774f3706c
> --- /dev/null
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -0,0 +1,91 @@
> +# This file contains a list of CVE's where resolution has proven to be impractical
> +# or there is no reasonable action the Yocto Project can take to resovle the issue.
> +# It contains all the information we are aware of about an issue and analysis about
> +# why we believe it can't be fixed/handled. Additional information is welcome through
> +# patches to the file.
> +#
> +# Include this file in your local.conf or distro.conf to exclude these CVE's
> +# from the cve-check results or add to the bitbake command with:
> +#     -R meta/conf/distro/include/cve-extra-exclusions.inc
> +#
> +# The file is not included by default since users should review this data to ensure
> +# it matches their expectations and ussage of the project.
> +#
> +# Wemay also include "in-flight" information about current/ongoing CVE work with
> +# the aim of sharing that work and ensuring we don't duplicate it.
> +#
> +
> +
> +# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
> +# CVE is more than 20 years old with no resolution evident
> +# broken links in CVE database references make resolution impractical
> +CVE_CHECK_WHITELIST += "CVE-2000-0006"
> +
> +# epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238
> +# The issue here is spoofing of domain names using characters from other character sets.
> +# There has been much discussion amongst the epiphany and webkit developers and
> +# whilst there are improvements about how domains are handled and displayed to the user
> +# there is unlikely ever to be a single fix to webkit or epiphany which addresses this
> +# problem. Whitelisted as there isn't any mitigation or fix or way to progress this further
> +# we can seem to take.
> +CVE_CHECK_WHITELIST += "CVE-2005-0238"
> +
> +# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756
> +# Issue is memory exhaustion via glob() calls, e.g. from within an ftp server
> +# Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=681681
> +# Upstream don't see it as a security issue, ftp servers shouldn't be passing
> +# this to libc glob. Exclude as upstream have no plans to add BSD's GLOB_LIMIT or similar
> +CVE_CHECK_WHITELIST += "CVE-2010-4756"
> +
> +# go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509
> +# go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511
> +# The encoding/xml package in go can potentially be used for security exploits if not used correctly
> +# CVE applies to a netapp product as well as flagging a general issue. We don't ship anything
> +# exposing this interface in an exploitable way
> +CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
> +
> +
> +
> +#### CPE update pending ####
> +
> +# groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
> +# Appears it was fixed in https://git.savannah.gnu.org/cgit/groff.git/commit/?id=07f95f1674217275ed4612f1dcaa95a88435c6a7
> +# so from 1.17 onwards. Reported to the database for update by RP 2021/5/9. Update accepted 2021/5/10.
> +#CVE_CHECK_WHITELIST += "CVE-2000-0803"
> +
> +# grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865
> +# Looks like grub-set-bootflag is patched in by Fedora/RHEL:
> +# https://src.fedoraproject.org/rpms/grub2/blob/498ea7003b4dd8079fc075fad7e19e0b190d0f97/f/0133-Add-grub-set-bootflag-utility.patch
> +# Does not exist in upstream grub2:
> +# https://git.savannah.gnu.org/cgit/grub.git/tree/util
> +# Reported to the database for update by RP 2021/5/9 Update accepted 2021/5/12
> +#CVE_CHECK_WHITELIST += "CVE-2019-14865"
> +
> +# tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
> +# https://bugzilla.redhat.com/show_bug.cgi?id=280961 - issue affects paxutils included in tar
> +# http://cvs.savannah.gnu.org/viewvc/paxutils/paxutils/paxlib/names.c?r1=1.2&r2=1.4 was the fix
> +# included in tar 1.19 and later
> +# CPE update sent, may or may not exclude for us
> +#CVE_CHECK_WHITELIST += "CVE-2007-4476"
> +
> +
> +
> +#### Upstream still working on ####
> +
> +# qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255
> +# There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html
> +# however qemu maintainers are sure the patch is incorrect and should not be applied.
> +
> +# flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293
> +# Upstream bug, still open: https://github.com/westes/flex/issues/414
> +# Causes memory exhaustion so potential DoS but no buffer overflow, low priority
> +
> +# wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879
> +# https://mail.gnu.org/archive/html/bug-wget/2021-02/msg00002.html
> +# No response upstream as of 2021/5/12

What is the use of that information? From my perspective an open 
unresolved issue is an open unresolved issue - from a product 
perspective it's not that important if upstream is working on it or not 
- rather as the actual liable party I have to check myself, if my 
product is affected in any way - and if not, whitelist it myself.

So how does this provide additional information, other than it's prone 
to be outdated or prone to very frequent updates (which doesn't work 
well, when doing only bumps from a point release to another)?

Still I like the idea of this file, but it should be documented better 
(section in the manual?)

IMHO it would be better to use this file just for the CVEs which will 
not be fixed anytime soon, but not for things beyond that scope

> +
> +# bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25215
> +# Fix not in upstream release yet as of 2021/5/12
> +
> +
> +
> 
> 
> 
> 
> 
