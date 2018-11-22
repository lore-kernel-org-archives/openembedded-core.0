Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 204846C57A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 09:30:16 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id h25so6972145oig.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 01:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=CeWkNlhilf09NP7Ecs2oPJAx5N8grTpNfOeeCVJNVCE=;
	b=HI82MkIS6NRmAHvjzLWXRyCweHxGTpPiH3KGPkb1HhNX8pJqy3CdRgcy9zqwD8rp37
	UM+vBJmJ50ZH3KmdsX8cyEgx1MB9JTxZ7E8JtqtMjGEc7TzQaTs9UoeNWbBTk7Ohk/5W
	iDn4OGvxl5YarHYEGFczjpBxh+YUC8ZFria+WDBXYPzQ4QAOSfIbNEQVO5sbvFHXUfsM
	foJtm7o6JphaY9OSRx+WAimwu94qiktf6QQ8nKtLS/HfZRl+MjgbOZ36Wu0Ve4o3khUn
	pa3KaMLPtsxXoi2rLBFfsL6eoywP9dpDW0pait23rsjKu3xlhCKOq/dP8wV1uDWKEyYh
	uu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=CeWkNlhilf09NP7Ecs2oPJAx5N8grTpNfOeeCVJNVCE=;
	b=CDm9aurTXE+Mh9cOKhNYdkvEjdi3cpJL27Ynkrvn0mX2sy3WQGYL8fhwRxREL+O3g/
	WPfQfOY04Cw9m0hqKDgZwSjkzo2AK+rbjAj0OmlnZ7Zj0rGFRaAq5HvwkmkinyTZjm/y
	YY9FRiqwIw0qm57I+ucVLy0nZEPPimmba4I/N0iiL2gUXFadrSnPFHn9tgv78z4VmYW4
	MRDsrw57gK/TD/PY0dTwz6IC23SAUdG4YkvILGj2S9lv0FkyV3YYhjDVqItW3QNFzZsN
	9kg0AaLsGBRfUuG4JZa8gWRqjmFUW8cYRHE6+LMO/UcEx9vr7V1MT3U5h7GhxeKfTYA+
	FLDg==
X-Gm-Message-State: AGRZ1gJGQQ2O4yKwVGkS1Zn7uUomrRdnJTrqeQVc1cgZCahV1hq2RGCM
	+ESA4OkIUBcbFw6ewQOILqRRMzH5srlkTg==
X-Google-Smtp-Source: AJdET5fm5fkaPOrgZeu77nFfr+JKRlqwcf/M24VdmwoUlb86YiF8DewAxhK+pFCCOcnsLqvqKWOpQQ==
X-Received: by 2002:aca:c413:: with SMTP id u19mr5363853oif.209.1542879017551; 
	Thu, 22 Nov 2018 01:30:17 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
	[209.85.210.53])
	by smtp.gmail.com with ESMTPSA id r184sm92304oif.56.2018.11.22.01.30.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 01:30:15 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f53.google.com with SMTP id 40so7513144oth.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 01:30:15 -0800 (PST)
X-Received: by 2002:a9d:3095:: with SMTP id s21mr6134737otc.359.1542879014893; 
	Thu, 22 Nov 2018 01:30:14 -0800 (PST)
MIME-Version: 1.0
References: <20181122082807.39508-1-abrodkin@synopsys.com>
In-Reply-To: <20181122082807.39508-1-abrodkin@synopsys.com>
Date: Thu, 22 Nov 2018 07:30:00 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo46bnbLLBrhUJHPa1QYKSc0c_TtFVd2Q-Tv7j193K+ug@mail.gmail.com>
Message-ID: <CAP9ODKo46bnbLLBrhUJHPa1QYKSc0c_TtFVd2Q-Tv7j193K+ug@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Marek Vasut <marex@denx.de>, linux-snps-arc@lists.infradead.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 22 Nov 2018 09:30:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Alexey,

On Thu, Nov 22, 2018 at 6:28 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
>
> As of today this utility is added per-board like here [1]
> for Intel Edison board.
>
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
>
> Given there're quite some U-Boot tools that we may want to add later
> this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> still for compatibility we provide "u-boot-mkimage" with help
> of PROVIDES as well as proposed "u-boot-mkenvimage".
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Marek Vasut <marex@denx.de>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

I'd like to thank you to keep the pace until it was ready. I know it
may be challenging to contribute to new projects and OpenEmbedded is
no different.

You were very welcoming to comments and change requests and I believe
it was a great thread of changes which lead to a good patch. I look
forward to the new patches you'll start submitting from now on :-)

Keep the good work.

Best Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

