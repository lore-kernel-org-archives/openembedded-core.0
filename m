Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE12679704
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 12:20:25 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id l82-v6so3185513oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 05:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H01FMBvpCiabIyrdlBOGkb8MxUA/8jo0ovp0EiLasZ0=;
	b=wiX6dlcJgmx/Cm7PmueB6fZtDI0LMcatqOIF3BzQUE8hVUNGjl8BeRhfSgMAhX2Mxl
	vH/WMUS5hf79K7igl6E1PbedijQqvgvXvQ2DPKrLZVGAaqXMGpI0P/yzGL/dtCRFCMu2
	nYlL22hT/Ol6VMXYEI+esAnrFXTYG7Q65tdbYgYHzi+NWkLRbm81A8jrTnso/fzNLFm1
	diigYa9/0jmEBk9ZV0annQl3dGNqUUxsEkooK/G1jEIseCtN65cb3x7TSbcBiUoP4vj1
	rDlZi6RXee6LmgtrI4TEhAtXmw+Mr0UBwoSNx8tyz8fqR1Pq5gvEVRb+Vht97ZxvG/KI
	whVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H01FMBvpCiabIyrdlBOGkb8MxUA/8jo0ovp0EiLasZ0=;
	b=m+p3mCoeYfnfDzCcAIx/CdRshdXYQ/DpaJuRg9mYJXttxsbABBpAhZ0gwgWABizy1T
	XmeWqxcy7MG1j4Is29oNIie9oUiLonvzoRFrSF+wTfnQkTIwB4NpfL+UX1rhM8vnqPJk
	3rK+15od+5YjYMM4fmBqBIBfXm6fg6jwyN+j3Ntu+TMdJ+5mh7UptrD8ZzlTEybLSOs2
	nXntAn9cBdAHywV3iJxZEHTd7QstT821vZTOn7iW9QRXbEovUMA8paOVG/LfAgZqvT9p
	FWQawqVjHDLlyoQVNusfcWrwYNnKcjH8yST0q7APAEWOlD+zDSCHb/cgRAkn/f40FiJr
	RLuw==
X-Gm-Message-State: APzg51Bp+4q9+SWzMtg2gWTMQfatoYTM+J13GvmE89dZw5qaWDJSuZqN
	kUV7qD3Fb54iz3cwClDO512LX11QCwtaDXuWK6T3TjrX
X-Google-Smtp-Source: ANB0Vdbcys3Vet47vNB9/eC52avJoXgF8zgzlkwgIaCBTkihHZ0J0xHSkpfH4CqjjhrHx0iurLQcNVbZ0+pyy8ietQ8=
X-Received: by 2002:aca:c74d:: with SMTP id
	x74-v6mr1627314oif.97.1536754826792; 
	Wed, 12 Sep 2018 05:20:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Wed, 12 Sep 2018 05:20:06 -0700 (PDT)
In-Reply-To: <YjGq1y00H3g4RYs01jGq8X@charter.net>
References: <YjGq1y00H3g4RYs01jGq8X@charter.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Sep 2018 13:20:06 +0100
Message-ID: <CAJTo0Lbh9uf7zg0MhmQtuBmnRxZZjO0ArLuX6hWPuX_zsuqeyg@mail.gmail.com>
To: joseph-reynolds@charter.net
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] disable medium-strength dropbear ssh ciphers
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
X-List-Received-Date: Wed, 12 Sep 2018 12:20:26 -0000
Content-Type: text/plain; charset="UTF-8"

Presumably this doesn't actually work as you're just adding a file to
git without actually referring to it anywhere.

Ross

On 7 September 2018 at 20:16,  <joseph-reynolds@charter.net> wrote:
> This changes the Dropbear SSH server configuration so it will not
> accept medium-strength encryption ciphers including: CBC mode, MD5,
> 96-bit MAC, and triple DES.
>
> Upstream-Status: Pending
>
> Signed-off-by: Joseph Reynolds <joseph-reynolds@charter.net>
> ---
>  meta/recipes-core/dropbear/dropbear/localoptions.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/localoptions.h
>
> diff --git a/meta/recipes-core/dropbear/dropbear/localoptions.h
> b/meta/recipes-core/dropbear/dropbear/localoptions.h
> new file mode 100644
> index 0000000..ec48c26
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/localoptions.h
> @@ -0,0 +1,8 @@
> +/* Customize dropbear per default_options.h in the dropbear project */
> +
> +/* Disable insecure ciphers */
> +#define DROPBEAR_TWOFISH256 0
> +#define DROPBEAR_TWOFISH128 0
> +#define DROPBEAR_ENABLE_CBC_MODE 0
> +#define DROPBEAR_SHA1_HMAC 0
> +#define DROPBEAR_SHA1_96_HMAC 0
> --
> 2.7.2
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

