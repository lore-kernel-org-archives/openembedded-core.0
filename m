Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6503F7D28D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:25:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a15so2169017wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=WOtBG8zbrF+EnT2GQ+UwQAiJZdKEii3LzC+mB12H4iY=;
	b=a9zeVoHKcEhhNdyV2wNPJgYffKaQJy7hqbzmYzC4E8ClpdvjPlgsU8mtiXMTHV0Gfi
	ZdlOBzlbWUoZ53/IP5lyTmQF0x9gxgcN+orR6Jj9oT2wvTlk3pDuTrd3CFPdQbZUO/6s
	c9TI0aVY/i6Esb7UC5Ih678kaz2IfUUImv2+qZWBk3PrI1JEnNm1ZItwUMZKQpCgpJy7
	09VvX+30eo9zzvQicwqQvdx7CRnR8vBe676Th2EddsDTVniH07uNE58xZVMhkwWScMNW
	vphg5rj5IRy/e8otV/ISTHa7DFmMNZSzTuNi2kWromQsoeioQXeVPiWTclKu2x4e2UYz
	Xn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WOtBG8zbrF+EnT2GQ+UwQAiJZdKEii3LzC+mB12H4iY=;
	b=ncqnYMd4Hp8cJVbGMoHoXscoIvqE3kG8f7AsqhPMtTgyV7RyM30ql4MXWCAmq3Y4KQ
	/8L8PK3QRWZCDu5TZkkEdDXkUy4Ipp697WPwVSlETd24rZjqHn5OK48vs8cezqd8Fo7c
	8vUPZNBBqFOXLf5HBTKDLe+23YmaAOHWjhkfDDd112oB/P/HMXbp8zUlXd1fRMEmRkSD
	m0UKUHXzM9+521+9KsH4xM+Fr62KeM17Pl4QnaEyd7R2kHngHARjEfk0N61t2jS46AeY
	cy2t5W2bdt3lhKYflSfEXCsplzQxR9S1yYN+8G1BZ9OdCebR8gqbEcbBD1j8D7KLQmGW
	CYLw==
X-Gm-Message-State: APjAAAV9bnh6smCKdm2KQMdrmeD6Nyp/KEkEVQoWs7gmrgZC6O1bF0ju
	728uTLjE0LE3MCendUNHtyOZOYAd
X-Google-Smtp-Source: APXvYqySXn9AFmuG/wr9FewIGoW00ozgI4IDC6QIwMG4OT1Nud/tHV4DCH5Mckxu4cIA0BOZJJ/45Q==
X-Received: by 2002:a1c:1d8d:: with SMTP id d135mr2232799wmd.54.1560846348843; 
	Tue, 18 Jun 2019 01:25:48 -0700 (PDT)
Received: from bluca-lenovo ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	d3sm33609369wrf.87.2019.06.18.01.25.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 01:25:47 -0700 (PDT)
Message-ID: <f1aeb71da144e3cf77b9f1c1e402bb0f5f71e847.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 09:25:47 +0100
In-Reply-To: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
References: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-oe,v2] kernel-fitimage: introduce FIT_HASH_ALG
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
X-List-Received-Date: Tue, 18 Jun 2019 08:25:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-11-02 at 16:48 +0100, Ayoub Zaki wrote:
> sanitize fitImage hash algorithm selection with FIT_HASH_ALG
> switch default hash algorithm from sha1 to sha256
> 
> Signed-off-by: Ayoub Zaki <
> ayoub.zaki@embexus.com
> >
> Acked-by: Denys Dmytriyenko <
> denys@ti.com
> >
> ---
>  meta/classes/kernel-fitimage.bbclass | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> index 179185b..3cc3a33 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -36,6 +36,9 @@ python __anonymous () {
>  # Options for the device tree compiler passed to mkimage '-D'
> feature:
>  UBOOT_MKIMAGE_DTCOPTS ??= ""
>  
> +# fitImage Hash Algo
> +FIT_HASH_ALG ?= "sha256"
> +
>  #
>  # Emit the fitImage ITS header
>  #
> @@ -95,7 +98,7 @@ EOF
>  # $4 ... Compression type
>  fitimage_emit_section_kernel() {
>  
> -	kernel_csum="sha1"
> +	kernel_csum="${FIT_HASH_ALG}"
>  
>  	ENTRYPOINT=${UBOOT_ENTRYPOINT}
>  	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> @@ -128,7 +131,7 @@ EOF
>  # $3 ... Path to DTB image
>  fitimage_emit_section_dtb() {
>  
> -	dtb_csum="sha1"
> +	dtb_csum="${FIT_HASH_ALG}"
>  
>  	cat << EOF >> ${1}
>                  fdt@${2} {
> @@ -152,7 +155,7 @@ EOF
>  # $3 ... Path to setup image
>  fitimage_emit_section_setup() {
>  
> -	setup_csum="sha1"
> +	setup_csum="${FIT_HASH_ALG}"
>  
>  	cat << EOF >> ${1}
>                  setup@${2} {
> @@ -179,7 +182,7 @@ EOF
>  # $3 ... Path to ramdisk image
>  fitimage_emit_section_ramdisk() {
>  
> -	ramdisk_csum="sha1"
> +	ramdisk_csum="${FIT_HASH_ALG}"
>  	ramdisk_ctype="none"
>  	ramdisk_loadline=""
>  	ramdisk_entryline=""
> @@ -237,7 +240,7 @@ EOF
>  # $6 ... default flag
>  fitimage_emit_section_config() {
>  
> -	conf_csum="sha1"
> +	conf_csum="${FIT_HASH_ALG}"
>  	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
>  		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
>  	fi

Hi,

Any update on this patch? It was acked almost 2 years ago.

It would be great to have a way to change the hashsum algorithm when
building signed images.

Thanks!

-- 
Kind regards,
Luca Boccassi


