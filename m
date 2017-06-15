Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4022278371
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 07:20:05 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id x23so1493894wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sm0wIc/VOGXBkLf3OU/Pd7Jbb5+jWOqHFfbi9+OmCtE=;
	b=EC5eadNZuCQWLBPj3nBt9kWNXNdISO7tuqjUDhrn+yqJyrjfGHR75qKA91TdwXpYA9
	vqtjecDe9xuEslTn8iHUWZxYgmAelEIN4SdLr4eGYGFKzRgJExeoxL8h+fHgCLV5XonV
	SPGu3gGBFahlZ4Twn3xkM3nCBHnjPN3+HLOPbU7EUZbPjtTxwoHbUHGwfYA77cSGZNbN
	K5xUGoI8eVgH16c8nABy69Tp7kjtXGa9//cCI1105QtB9sYuD77tKYSO4QQAprgi5P+l
	1AGRYuuDnJoDDkTKVrqboZGOkInnil/HF2cAch01SFcqkJwsaqxqm66BZKvH7eVk+7br
	6a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sm0wIc/VOGXBkLf3OU/Pd7Jbb5+jWOqHFfbi9+OmCtE=;
	b=QriqwkGGJHGGzSAyjalwFeI2fqeNm5aIb46KMjQOaccS1nFWsVkl0gn539wwujybtZ
	Py/v73yLtyI6TYFmTucgzgPknfMe78D97NwkoaEKaakLLlLu43UCYiQYKiDIAOB3S7S0
	sSBLSnI5wtytngAi9oCrERYZUJKBixA4jCTwGtEVeubaFXROky8vCERfX9eHwOUabzs+
	ivYLMXGzNUxpY8GSD1y/i3yX4blFpm6qnHTOXSwcT/9/t0a0wVKJMyTNeVCHABGsO3Yk
	Dhh33YQ+CehxR4B8QrT4MleM2M0pvg6AWmVrkVYTxN/q6CBrbXba0b5TD3Dd9vuRc0/R
	9xSw==
X-Gm-Message-State: AKS2vOwOZX2B6I3fgMsjharntbDn0MT5TNdDMXPnk4pvuMTxzJjESf+i
	jRFVfoUGgiTiLSf4uj4QxGoMu5CkeA==
X-Received: by 10.80.152.22 with SMTP id g22mr2622845edb.10.1497511206701;
	Thu, 15 Jun 2017 00:20:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.172.100 with HTTP; Thu, 15 Jun 2017 00:20:06 -0700 (PDT)
In-Reply-To: <1497481558-144957-2-git-send-email-yin.thong.choong@intel.com>
References: <1497481558-144957-1-git-send-email-yin.thong.choong@intel.com>
	<1497481558-144957-2-git-send-email-yin.thong.choong@intel.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 15 Jun 2017 09:20:06 +0200
Message-ID: <CAAQYJAurJSt2HCD4jcDzctbNtx8MiqU16g0EGPnDh4TTSY2XYQ@mail.gmail.com>
To: yin.thong.choong@intel.com
Cc: otc-pg-team@eclists.intel.com, paul.eggleton@intel.com, saul.wold@intel.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] image_types.bbclass: Added default argument for ubi and ubifs image creation
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
X-List-Received-Date: Thu, 15 Jun 2017 07:20:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2017 at 1:05 AM,  <yin.thong.choong@intel.com> wrote:
> From: Choong YinThong <yin.thong.choong@intel.com>
>
> Added default argument for ubi and ubifs image creation.

Hello,

Is it better to error out *before* ot to create an *invalid* image?
How can you guess such defaults?

Cheers
Andrea



> MKUBIFS_ARGS and UBINIZE_ARGS both argument still able to
> edit in local.conf
>
> [YOCTO #11589]
>
> Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
> ---
>  meta/classes/image_types.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index 7749b00..bbde08d 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -292,3 +292,12 @@ IMAGE_EXTENSION_live =3D "hddimg iso"
>  # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAG=
E_FSTYPES,
>  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdd=
direct, hddimg, iso, etc.
>  IMAGE_TYPES_MASKED ?=3D ""
> +
> +# Default argument to create ubi and ubifs image with core-image-sato-sd=
k (http://www.linux-mtd.infradead.org/faq/ubifs.html)
> +# -m 2048: tells mkfs.ubifs that the minimum input/output unit size of t=
he flash this UBIFS image is created for is 2048 bytes (NAND page in this c=
ase);
> +# -e 129024: logical eraseblock size of the UBI volume this image is cre=
ated for;
> +# -c 8749: specifies maximum file-system size in logical eraseblocks; th=
is means that it will be possible to use the resulting file-system on volum=
es up to this size (less or equivalent); so in this particular case, the re=
sulting FS may be put on volumes up to about 251MiB (129024 multiplied by 2=
047); See this section for more details.
> +# -p 128KiB: tells ubinize that physical eraseblock size of the flash ch=
ip the UBI image is created for is 128KiB (128 * 1024 bytes);
> +# -s 512: tells ubinize that the flash supports sub-pages and sub-page s=
ize is 512 bytes; ubinize will take this into account and put the VID heade=
r to the same NAND page as the EC header.
> +MKUBIFS_ARGS ??=3D " -m 2048 -e 129024 -c 8749 "
> +UBINIZE_ARGS ??=3D " -p 128KiB -m 2048 -s 512 "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

