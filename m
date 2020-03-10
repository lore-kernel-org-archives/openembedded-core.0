Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id F00A16095A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 21:29:35 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id v3so8299289iom.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 14:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=F1P6K3a19iMyoTTevsBo6Jfm4adhWvZQHEYWT1F6sMA=;
	b=sGcjHjocZadPjduzYhIcmkz0WWNo3yWSGE4I9iRLSjgREOjryfrMstThBuBHZxeX11
	G6BRsdqLPaV6Wn9W30CUdD0syIBQ50W1PjcDRpPlI+PnozAQq8vKr2xd66wty8OyadEE
	Kv04gQsZbFJSLuHJD0+7zcgAJoilQ2hv703ip6TUmve4dtumcgGb1wFm3VaTYTvdFVpX
	PUiQGXhep36IcMTs50GTVG0OtETKd20x0XotTol9n328TxU85A0cbgi8mlj4fo7e2HjO
	ZVhYHGwkJZQlVz8WWtjDNHoFLrFBCZcg+YiOwu20QlB4sQ+a4kbDocCICKQ16+bhmKHV
	r+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=F1P6K3a19iMyoTTevsBo6Jfm4adhWvZQHEYWT1F6sMA=;
	b=DfQZo1cr6n6IVAhRf8c3A+bCOS+QZ5m3M3c90hJAvr2bxmtSwlkOJgylWW326NBeH0
	00JwjtettoY1DipDoiQGeuH8cAMfNDnh7NvfWXWPmxFP6OykKaho5LwEoHYLHQeXU2sO
	aZEGaKebzmRldH1pvWoWM56EchkBnUfZ3JD5Q9cDbXG5/9fuGR63hY6H71WxGcw7Bm5V
	0MNVcpZcOYL2/HC0fEmrT5WKziPXDHo/5qDpNFx4wDdtWwd1zV0ChjPtsXJOPjngWgpk
	N0+TG39SAD/06KF7+0H9WjcgI17HbTpboiHYCFVwhUEUSwSjchNAucnXkAKWSb/cLpvi
	w2Mw==
X-Gm-Message-State: ANhLgQ1vJCfbbmDGl2aH4mlgAaSnq6FMqx5oLP0gk47zv2IIZ/oPNlok
	CkZoDYkm0f9KWOkvMPE/mIpSuV0bHVA=
X-Google-Smtp-Source: ADFU+vufgN2krI8EwSY7/oHpJP3A6o+iw1Id4IkRl20K9FRv5sCWflAf36Vataq4rAowvxzm4nKpgg==
X-Received: by 2002:a05:6602:2190:: with SMTP id
	b16mr58014iob.98.1583875776363; 
	Tue, 10 Mar 2020 14:29:36 -0700 (PDT)
Received: from [10.30.196.58] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	a9sm11041548ilh.68.2020.03.10.14.29.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 10 Mar 2020 14:29:35 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Rich Persaud <rp@stacktrust.org>, openembedded-core@lists.openembedded.org
References: <20200309225507.29578-1-rp@stacktrust.org>
Message-ID: <435df8e7-f4b2-65b7-0a5f-ba8b228a4c7e@gmail.com>
Date: Tue, 10 Mar 2020 16:29:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309225507.29578-1-rp@stacktrust.org>
Subject: Re: [PATCH] image-live: multiconfig ISO generation
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
X-List-Received-Date: Tue, 10 Mar 2020 21:29:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/9/20 5:55 PM, Rich Persaud wrote:
> When a target is specified for INITRD_IMAGE_LIVE, a task dependency is
> added for do_image_complete. At present, image-live initrd will not
> accept multiconfig dependency targets.

Can you give an example? That might help with understanding what this is 
supposed to do.


>
> If BBMULTICONFIG is non-empty and INITRD_IMAGE_LIVE is a multiconfig
> target, use mcdepends instead of depends. The packaging recipe must
> also override machine-specific path construction of INITRD_LIVE.
>
> Required to build an ISO with mixed machine types, a primary use case
> for multiconfig. This is a minimal fix to make multiconfig ISOs
> possible.
>
> Signed-off-by: Rich Persaud <rp@stacktrust.org>
> ---
>   meta/classes/image-live.bbclass | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
> index 54058b350d..1afd48005a 100644
> --- a/meta/classes/image-live.bbclass
> +++ b/meta/classes/image-live.bbclass
> @@ -50,11 +50,14 @@ IMAGE_TYPES_MASKED += "live hddimg iso"
>   python() {
>       image_b = d.getVar('IMAGE_BASENAME')
>       initrd_i = d.getVar('INITRD_IMAGE_LIVE')
> +    depends_type = ('mcdepends' if (d.getVar('BBMULTICONFIG')
> +                                    and initrd_i.count(':') == 3)
> +                                else 'depends')

Potentially, this could be simplified:

  depends_type = 'mcdepends' if initrd_i.startswith('mc:') else 'depends'

?

>       if image_b == initrd_i:
>           bb.error('INITRD_IMAGE_LIVE %s cannot use image live, hddimg or iso.' % initrd_i)
>           bb.fatal('Check IMAGE_FSTYPES and INITRAMFS_FSTYPES settings.')
>       elif initrd_i:
> -        d.appendVarFlag('do_bootimg', 'depends', ' %s:do_image_complete' % initrd_i)
> +        d.appendVarFlag('do_bootimg', depends_type, ' %s:do_image_complete' % initrd_i)
>   }
>   
>   HDDDIR = "${S}/hddimg"

