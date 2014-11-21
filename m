Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 17FF960DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 17:07:38 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id t59so2550376yho.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 09:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5EJZwsVDBCVoBmmll0TXDf0RBm++8kzYvMc+ts9ZbRs=;
	b=mR0k2tTyRtxM24HLQRs6JTYQc95KICmAecYaDwcem7QrMOV//F1MLpGwhwVIieldkz
	irMdeo7thpDJ/bMd//2zDzAHMcph1QfaS8pIBnYNbeFNu0dnVGpf7DCQa0K2bsOvKIax
	B3hC09D7oQ5LFz7giy81hzllusSsobVwNCMrD50icpbrwnWVcH3VTo/9SEPm+Gs7VUWL
	0EBS823KmZZA9WXgMg0dowb3Cgo7ADLbdi+HCCZAUxCLCm5cko5rOmFlVPrq1+r0PhDF
	0L2efm74nq7N/v6I6dkW/b7duUNV9+gZzf/7RAMiH2nGF+5uSQkh8UtYgh1DvA3WYTu3
	djEQ==
MIME-Version: 1.0
X-Received: by 10.170.116.21 with SMTP id i21mr3401358ykb.105.1416589659204;
	Fri, 21 Nov 2014 09:07:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Fri, 21 Nov 2014 09:07:39 -0800 (PST)
In-Reply-To: <b922d73bb68345b5989401a77426c885@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1416477996-13841-1-git-send-email-B40290@freescale.com>
	<CAP9ODKrqNDd4eWZDTwuH=4XvC=+wfq2gCE1enRTWKD6ge48Rpg@mail.gmail.com>
	<b922d73bb68345b5989401a77426c885@BY2PR03MB441.namprd03.prod.outlook.com>
Date: Fri, 21 Nov 2014 15:07:39 -0200
X-Google-Sender-Auth: ur24dvtSfbmfDC0858c9jZvrh3g
Message-ID: <CAP9ODKqg6p0q59ci_1CQAOSBwY=kS963W0Yud-oZptKK7ewFEA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "B40290@freescale.com" <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Fri, 21 Nov 2014 17:07:39 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 21, 2014 at 1:28 AM, B40290@freescale.com
<B40290@freescale.com> wrote:
> Uboot config includes SPL type.
> So I think spl type should be the same built with other uboot config type.

You removed the install block of SPL binary; I think it will break SPL
based ones.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

