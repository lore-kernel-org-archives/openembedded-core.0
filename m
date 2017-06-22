Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id B928A77E97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 09:52:57 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id r62so7807502qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 02:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S6WtTDO6LSBlbpdKcINmXVnrHmBJsru1/sfR0JvX4jU=;
	b=YTSvpE7Ez3dZPgS5ndpHGPOXsYhs/OxJe/faXgtU9pzjjTBH9HA9itZL/ihjU74StK
	Z5gIUP8oVgt57uNE7PwPiTUc+NvQ5qM5NE1z2eqUe1VprAURijOVzZUkFBS1WJ3R5D6z
	0EIbqK/zX5fwZpBGjumG1izzJWCj5WU2Rn4Et0iZwMdeeom70icoklSYrdYOawWJ/msk
	hfxinbHpM4hIZ+U8IKV5YtuISGDO5iJJN4xp+xjuMjsJwyP3/5CJMY+3J8KzykCZocZp
	AvKPFLKYRcEJJnLjk37+4nBGVUU14a9URnqVINeO92uiNcx3GUgxEzgf8+M2jBepaghF
	R5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S6WtTDO6LSBlbpdKcINmXVnrHmBJsru1/sfR0JvX4jU=;
	b=bEjgLIaFL7GX81HYIgcpvIeWjshYvAWAhEPRRzECFl2Mh3oCcRml7uYEgV1YSbgIjb
	ADckSfk5Nxh6n2cUN3ppSocUUEoEq+LSe7mCHXpv9Q85PDxD7uZY76X4zbVJfwQquu0V
	AXSlK9hOXvbzcc5R39/BGd0lBibD3F0go5Dgj30a8RwTxgeYEy0s87/ysSH1+RU5v3Yr
	/Z32ZT61D1jF8P6WdxrXdAVdz2YYnCaUjZsHQIjV8hrtZlTCffGVdYdAEXAEDUs76snQ
	qXLjmZV5MfNkQPipVRUj45tLOEBKJ9C3VCBejvLmXkw15MvtqbfqcmnUpelK6BhA8O3x
	EuRQ==
X-Gm-Message-State: AKS2vOwwxC+Vk02gRMKz0Bcg2C6IcO9c0WfCCpwP05jB9A3t33RK+S6a
	UueqkZDOkuowSgugYFefzW9es/f2BUtE
X-Received: by 10.55.181.69 with SMTP id e66mr1611882qkf.109.1498125178818;
	Thu, 22 Jun 2017 02:52:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 22 Jun 2017 02:52:38 -0700 (PDT)
In-Reply-To: <1498119816-31276-1-git-send-email-ovpanait@gmail.com>
References: <1498119816-31276-1-git-send-email-ovpanait@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jun 2017 10:52:38 +0100
Message-ID: <CAJTo0LaL_OkPRt=qhnkMukfmB7JnNApQp-PaR6DpzqmPNb3SNA@mail.gmail.com>
To: Ovidiu Panait <ovpanait@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: CVE-2017-9526
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
X-List-Received-Date: Thu, 22 Jun 2017 09:52:57 -0000
Content-Type: multipart/alternative; boundary="94eb2c05d2221ceeda05528973d7"

--94eb2c05d2221ceeda05528973d7
Content-Type: text/plain; charset="UTF-8"

On 22 June 2017 at 09:23, Ovidiu Panait <ovpanait@gmail.com> wrote:

> In Libgcrypt before 1.7.7, an attacker who learns the EdDSA session key
> (from side-channel observation during the signing process) can easily
> recover the long-term secret key. 1.7.7 makes a cipher/ecc-eddsa.c change
> to store this session key in secure memory, to ensure that constant-time
> point operations are used in the MPI library.
>

An upgrade to 1.7.7 is preferred as we're not upgrade-frozen right now.

Ross

--94eb2c05d2221ceeda05528973d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 June 2017 at 09:23, Ovidiu Panait <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ovpanait@gmail.com" target=3D"_blank">ovpanait@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":2nz" class=3D"a3s aX=
jCH m15ccee8c4367e5c9">In Libgcrypt before 1.7.7, an attacker who learns th=
e EdDSA session key<br>
(from side-channel observation during the signing process) can easily<br>
recover the long-term secret key. 1.7.7 makes a cipher/ecc-eddsa.c change<b=
r>
to store this session key in secure memory, to ensure that constant-time<br=
>
point operations are used in the MPI library.<br></div></blockquote></div><=
br>An upgrade to 1.7.7 is preferred as we&#39;re not upgrade-frozen right n=
ow.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--94eb2c05d2221ceeda05528973d7--
