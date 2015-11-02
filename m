Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (unknown [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 979D460124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 21:16:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA2LGYYc023325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 2 Nov 2015 13:16:34 -0800
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 2 Nov 2015 13:16:34 -0800
To: Hongxu Jia <hongxu.jia@windriver.com>,
	<openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <cover.1446448302.git.hongxu.jia@windriver.com>
	<4e960b4b187cd48e690046bd856103ac87fc2485.1446448302.git.hongxu.jia@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <5637D2B0.7040201@windriver.com>
Date: Mon, 2 Nov 2015 16:16:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <4e960b4b187cd48e690046bd856103ac87fc2485.1446448302.git.hongxu.jia@windriver.com>
X-Originating-IP: [128.224.56.84]
Subject: Re: [PATCH 1/1] default-distrovars: remove less from WHITELIST_GPL-3.0
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
X-List-Received-Date: Mon, 02 Nov 2015 21:16:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-11-02 02:12 AM, Hongxu Jia wrote:
> As oe-core commit 37c8c2c5f6937520eaf9f5d981f9315e36eba4bb and
> fa7bdf96b8eb8b5078db38249c5c60ec511c35c6 said, Mark Nudelman
> (author of less) has given permission to utilize a generic 2-clause
> BSD, so we remove it from WHITELIST_GPL-3.0 which caused
> a QA Warning while INCOMPATIBLE_LICENSE += "GPLv3 LGPLv3 GPLv3+ LGPLv3+"
> ...
> |NOTE: INCLUDING less as buildable despite INCOMPATIBLE_LICENSE
> because it has been whitelisted
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/conf/distro/include/default-distrovars.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 8366904..8866f0d 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -24,7 +24,7 @@ IMAGE_FEATURES ?= ""
>   # This is a list of packages that are used by the build system to build the distribution, they are not
>   # directly part of the distribution.
>   HOSTTOOLS_WHITELIST_GPL-3.0 ?= ""
> -WHITELIST_GPL-3.0 ?= "less"
> +WHITELIST_GPL-3.0 ?= ""
>   LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan gnutls libtasn1 libidn"
>
>   COMMERCIAL_AUDIO_PLUGINS ?= ""
>

I've confirmed the license info below.

../Randy


$ head ifile.c
/*
* Copyright (C) 1984-2015 Mark Nudelman
*
* You may distribute under the terms of either the GNU General Public
* License or the Less License, as specified in the README file.
*
* For more information, see the README file.
*/


$ head README
Less, version 481

This is the distribution of less, version 481, released 31 Aug 2015.
This program is part of the GNU project (http://www.gnu.org).

This program is free software. You may redistribute it and/or
modify it under the terms of either:

1. The GNU General Public License, as published by the Free
Software Foundation; either version 3, or (at your option) any
later version. A copy of this license is in the file COPYING.
or
2. The Less License, in the file LICENSE.


$ find * -name "*\.[ch]" | xargs grep -L " terms of either"
funcs.h <-- generated, no copyright, not license
help.c <-- generated
regexp.c <-- BSD-like license
regexp.h <-- no copyright, not license, just interface for above.



regexp.c
/*
* regcomp and regexec -- regsub and regerror are elsewhere
*
* Copyright (c) 1986 by University of Toronto.
* Written by Henry Spencer. Not derived from licensed software.
*
* Permission is granted to anyone to use this software for any
* purpose on any computer system, and to redistribute it freely,
* subject to the following restrictions:
*
* 1. The author is not responsible for the consequences of use of
* this software, no matter how awful, even if they arise
* from defects in it.
*
* 2. The origin of this software must not be misrepresented, either
* by explicit claim or by omission.
*
* 3. Altered versions must be plainly marked as such, and must not
* be misrepresented as being the original software.
*
* Beware that some of this code is subtly aware of the way operator
* precedence is structured in regular expressions. Serious changes in
* regular-expression syntax might require a total rethink.
*
* *** NOTE: this code has been altered slightly for use in Tcl. ***
* Slightly modified by David MacKenzie to undo most of the changes for TCL.
* Added regexec2 with notbol parameter. -- 4/19/99 Mark Nudelman
*/


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

