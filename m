Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id E814E7CABF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 20:15:36 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id w26so5551553otp.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 12:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oqTmEZ0nt5uSVFHi1SRh86SMPJREZeb+4vvH0ykg17M=;
	b=M8lqWkRftxQOPrZkB+981r68fz3DrbSr6WKAYH22cs48LymgJ0LZiztT6fNAeHPvlZ
	23lBPFh5HQ8uSZJQdWk7A+33DlHDaxBceBsiVDfe/AJfVuZWn1ZMf8gyR5b8Sp7NsEHZ
	mQu+nBd+QZRAdNYd++1t/fy+X3x1DYlK3wzsiTTmDCOhywWCpivGuOGcEAEDCzSF4ne2
	cNvXgfyzUaEAK8S0kZIhD3udzEy+LrkpDAreeoCQPGpDF17oDz0LcH1F0vf/RLOJLm+A
	IppvTBzg/ycdnLoDM7FbuARZrT1YNwCRTfoQ2gpZmKFo44l+Ae/vZKlxSsXp0mkuKh7I
	huxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oqTmEZ0nt5uSVFHi1SRh86SMPJREZeb+4vvH0ykg17M=;
	b=Xg+m4x2N9llFDcm8lcTsg8l192HijOVbew2Sm65+dn9ahZsPZp1xlJXURhP7ElJ2r0
	rnBtKzPw9OmVkTrhPflimWLxmLiLRjre2TRLRCSQ4a0iRwxW0TCYulsNVHeI4j4so2XR
	ZcHInP1iBlgiaWelDdJWGFbXMF4WO14rMrCgMMCOvE9hqEAHj+lqm5xeE0GSoJKM7qLK
	/6kHQ5noeNuOyD3nYwrZzZMaDMqmp4t+c3guohAkFumm45QfXrxxRk0i0QNstKJb8ASd
	hkiLL2yMyO+OW/UZVT+GIebT2y8tDdQdsbRaiHLfLTFXOYYiEngkpoYP6+lgODoAEs4v
	LX7A==
X-Gm-Message-State: APjAAAUHjlzHn0qOMAlJTJcBC7p8dwtSdxa4Zvs543fD7/2MgR8krTqm
	H1tRuIhMvGf9/vwB1JqDPmgptuoR7WktchEbuSw=
X-Google-Smtp-Source: APXvYqzwk7SFqCQAhedYDpYLROwn5/EI9gc7SzZyvX/Zvsk/L41rEyZA4gjy9GSDCtaKnfVOIoflfrBQeOVQapi474Y=
X-Received: by 2002:a9d:4c85:: with SMTP id m5mr928493otf.367.1551384937860;
	Thu, 28 Feb 2019 12:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20190228183224.26536-1-alistair.francis@wdc.com>
In-Reply-To: <20190228183224.26536-1-alistair.francis@wdc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Feb 2019 21:15:26 +0100
Message-ID: <CANNYZj_Qc1in4voneFDom8pJ-rqzBQbtWQmU=ycO_v1g5N_rNA@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: Add missing dtc-native dependency
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
X-List-Received-Date: Thu, 28 Feb 2019 20:15:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Feb 2019 at 19:33, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> index c8acff8e19..e3efd873ca 100644
> --- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> @@ -1,6 +1,6 @@
>  BPN = "qemu"
>
> -DEPENDS = "glib-2.0-native zlib-native"
> +DEPENDS = "glib-2.0-native zlib-native dtc-native"
>
>  require qemu-native.inc

The dtc dependency is pulled into qemu-system-native recipe via 'fdt'
PACKAGECONFIG. Is there a reason it needs to be in qemu-native? (which
since today provides only the usermode bits)
If there is, it should be in the commit message.

Alex

