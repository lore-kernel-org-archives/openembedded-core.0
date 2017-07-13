Return-Path: <lans.zhang2008@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id D274C71D9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 01:54:12 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 188so4944999itx.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 18:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=dIi16HSOS5OBIRmzWhol8MnMoxG8rrsK4cLFQz9XCGA=;
	b=SMc5KgZjll6vh1gaw2ykJSo8H85kisqW/Q+6mbjflMDZ/Y9pHPv1rVrHGE7qXNujdh
	w8ezql0H1uDviJcUzx5Hm9zjvNXRwn3JKAVKiZc9DaCQgaYl80RsBHn+A4HxnQvWXf4o
	pHkhphXp/IiCVj/PTDOFZA8za7hoWVdmy8oKX15YMj9mXAIsnsyszgK8DCB7vp5w5Gge
	g2l4P6CjX0YZey06yY2jNklZCT2tPLMRqwY8U9DWcuIfEd72KINbyDystt8LKQdHbSfe
	hXgJVBJBw1O2EULkIMGjfLv9n6MrHv2lIriMNsS7o+ejBRz7sFULIrGW037yvnzvO005
	98gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=dIi16HSOS5OBIRmzWhol8MnMoxG8rrsK4cLFQz9XCGA=;
	b=qp3dJ8IIw6muSYvAvlaQcfqpnfC2uwk8455KoHt6q108Kge17DrTYETaj1nL2SLvLI
	DAIAFV4bLUh1ztJPsBhbFuQ+l/7W7kbk6RgEVewyWH4BRTOy4IJ4nznJ1iJGeGNSP8KO
	bDKKtzs/CuNqQxpC2Nu4K2b9lgycx6N/nMtMeWei+dWZ8sNUDGRBgXNdFnm/Kh9e66mf
	Joh7P0GD8qtlgyzpEn/5oG9Wod1SGzP5v/AsDBCJgzJaUE0DCyAgIvL4L2g8zGo+90jH
	I8wYUry9iI61wNVMF2yucLTzSFBgGGNkN80zYv8pjYaYyWkyuazE0++j2EuwlzmaYOmD
	e8/g==
X-Gm-Message-State: AIVw110SFf3uphfjx9vdsxwicPOrTA21fomKlIDxNCcEJh7RPW+UbiJu
	7RCI2oCBHu2A593P
X-Received: by 10.107.18.198 with SMTP id 67mr1380572ios.171.1499910853890;
	Wed, 12 Jul 2017 18:54:13 -0700 (PDT)
Received: from [0.0.0.0] (unknown-224-169.windriver.com. [147.11.224.169])
	by smtp.gmail.com with ESMTPSA id x83sm2170711ita.5.2017.07.12.18.54.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 18:54:13 -0700 (PDT)
To: Robert Yang <liezhi.yang@windriver.com>
References: <1499748183-17886-1-git-send-email-lans.zhang2008@gmail.com>
From: Lans Zhang <lans.zhang2008@gmail.com>
Message-ID: <0fa800ab-be41-1791-0862-b2b727ee0ab8@gmail.com>
Date: Thu, 13 Jul 2017 09:54:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1499748183-17886-1-git-send-email-lans.zhang2008@gmail.com>
Cc: jzhang0 <jia.zhang@windriver.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gpg_sign.py: fix overwriting the RPM macro __gpg in a wrong way
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
X-List-Received-Date: Thu, 13 Jul 2017 01:54:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Robert,

Could you help me to review this RR?

Thanks,

Jia


On 07/11/2017 12:43 PM, Jia Zhang wrote:
> From: Lans Zhang <jia.zhang@windriver.com>
>
> The RPM macro used in --define option should not be prefixed by %%.
>
> Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
> ---
>   meta/lib/oe/gpg_sign.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index 7ce767e..c53df54 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -36,7 +36,7 @@ class LocalSigner(object):
>               gpg_args += ' --pinentry-mode=loopback'
>           cmd += "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args
>           if self.gpg_bin:
> -            cmd += "--define '%%__gpg %s' " % self.gpg_bin
> +            cmd += "--define '__gpg %s' " % self.gpg_bin
>           if self.gpg_path:
>               cmd += "--define '_gpg_path %s' " % self.gpg_path
>   


