Return-Path: <andrew@bradfordembedded.com>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 2A34B7742C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 13:41:47 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id F33322144F;
	Thu,  2 Jun 2016 09:41:46 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Thu, 02 Jun 2016 09:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=A784iT/i4xhlr4avCnManmccWEE=; b=bS1/B3
	USBrSaNDl4rz561v3bo+cL2TsgLViFxeduozJuIdRLbPa40QWBYmDTJZ+U1xz077
	N+GWDgPDi1ADUxSO5UZ+2Mh75wy2/ryVAI1l3Rs07O4DrAmgIKouNimso5bC8A/I
	3Z0ARV2q0DlApWPT2Di68yJ3xrKFwbgQZeTg8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=A784iT/i4xhlr4avCnManmccWEE=; b=c3fHc
	OQZJkgPTnb+a+fKQrdlsRWW5t7kZs2zgEbsxv2VrSC7LRldcPr1P11hPjXtXe44R
	a1PwID99u5ZFkWzehUhs02X6pLFtQi4GFlIa37X40otLOLmOgESZC3KjM1LDZgPY
	9jhyLYWkkk4Q1MT500wXYVLbkA1fpymqN4rbaQ=
X-Sasl-enc: 2e8UfhZzPSFRwftd2uKgfhMT0mEAR1kZIlOL+PZBIk5O 1464874906
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id 93A65CC078;
	Thu,  2 Jun 2016 09:41:46 -0400 (EDT)
Date: Thu, 2 Jun 2016 09:41:45 -0400
From: Andrew Bradford <andrew@bradfordembedded.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160602134145.GA31801@kaim-eeyore.kodakalaris.net>
References: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
MIME-Version: 1.0
In-Reply-To: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: Re: [PATCH 0/3] Setup for bitbake perforce fetcher changes
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
X-List-Received-Date: Thu, 02 Jun 2016 13:41:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 05/25 15:46, Andrew Bradford wrote:
> From: Andrew Bradford <andrew.bradford@kodakalaris.com>
> 
> The perforce fetcher does not yet support using SRCREV="${AUTOREV}" or
> the use of the P4CONFIG variable [1].  These patches setup a few things
> in oe-core so that changes in bitbake can take advantage of them to fix
> these two issues as well as simplify and better document the use of the
> perforce fetcher.
> 
> [1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=6303
> 
> Thanks,
> Andrew
> 
> Andrew Bradford (3):
>   oe-buildenv-internal: Add P4CONFIG to BB_ENV_EXTRAWHITE_OE
>   bitbake.conf: Add P4DIR and FETCHCMD_p4
>   base.bbclass: p4 fetcher supports srcrev
> 
>  meta/classes/base.bbclass    | 4 ++++
>  meta/conf/bitbake.conf       | 2 ++
>  scripts/oe-buildenv-internal | 2 +-
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> -- 
> 2.8.1
> 
> -- 

Ping on this series?

Thanks,
Andrew

