Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC5F771F9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 03:06:23 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id f81so78657713iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 19:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=gKXz+EvjJCrJTxMXkU7SbL+HqTteKabmQKlpZReVhTg=;
	b=CTBt9RVaO3fjFS5x0tGOgOcsa+gKQPJ9LwUvCvOMaggATMllCUOodpj2mD+P8+9pWh
	dA5Go1kFLlDb+zUrFRn/torzQO+/HLrkGvuVJy5W4OQzpumMcd7AbOmbUhkty/pVpaBE
	0gaLNpO8h0hmE4gBiV1QlFVMKL7g10ee7TdVOmCpBed+2XuwnYNOn/r4xynMaiyjxsx+
	KxOKhEgElpu5AC6T9b+0wWuJe8GTUIQv0QgXaHZbJjZ1fiKPE52RPyhrnNwZeH3cX+kB
	tq52MrLNxohGiKtHuSeh43+iwRYXwrwKygEGT7nAzVzvgD66vdgvFc1yaNNjwcMcjxLR
	nNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=gKXz+EvjJCrJTxMXkU7SbL+HqTteKabmQKlpZReVhTg=;
	b=AzISYaTqsaMPctLyFVPMXlp05Rb2KXe2W1DANGz1dCBojuoMdZ84LRdvvuL9lKzyQX
	CCPkL4EkmZTsH8e4irF2fW3eKOXTSGIyt+/JWyztwKJHwczRNfCoMcq6TXkRk31kGkh2
	Z3Vqj38sDBIw2lEGWEWkHdWjMkDleaN+O4ldHCtzVpQPXVv1bJNEZ/O52pIMHo3cJawn
	U7/2eqIIKeSKyiB0sYq8Y9r0yfn0+7j2H7wgpo+LYTdcLGtr2Wfhve5TfNdmKrh1Om0O
	bZo7TMCMonj14kczWNogcNk4+2p8rLjqdqj1YLpncPjoplcoXrsPMyA0SDgQA7qKlnkv
	F/PA==
X-Gm-Message-State: AG10YOTUlkycaQ/QWbAGbX9Yk++NiX7sCmWZUW/Ww70Qe4eyQ/ry2/cGwMMw+PH9ivFadg==
X-Received: by 10.107.137.142 with SMTP id t14mr7651851ioi.172.1454555184162; 
	Wed, 03 Feb 2016 19:06:24 -0800 (PST)
Received: from [192.168.141.106] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.googlemail.com with ESMTPSA id
	k103sm4133372iod.29.2016.02.03.19.06.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 19:06:23 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
	<1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
	<56E071BC-9E02-44DD-8236-9697A647F8F7@gmail.com>
	<CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56B2C02C.90607@gmail.com>
Date: Wed, 3 Feb 2016 22:06:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Thu, 04 Feb 2016 03:06:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/16 15:32, Martin Jansa wrote:
> This could be caused by chromium using own bundled binutils where the 
> version doesn't match, I've solved it in our recipe by:
> +GYP_DEFINES_append = " linux_use_bundled_gold=0"
> +GYP_DEFINES_append = " linux_use_bundled_binutils=0"

w00t!! awesome. works for me :-)

So it looks like we both have working chromium recipes, yet the upstream 
one doesn't work. What version are you building? For what arch (which 
archs)? x11/wayland?

I have a working recipe for 50.0.2636.0, but I'm only interested in 
x86_64 and x11. wayland+ozone is a whole other mess ;-)

At some point it'll probably be easier if we build chromium with 
llvm-clang, the same as google is doing. Is that possible?

