Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id D94FE77500
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 12:48:41 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id y76so19977571qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 04:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gr8NUF0o9MgdhpaG1uYm6mlcP9E3GUiXuCEJX7TRUwk=;
	b=RdqinusVDrKNtO91Bi4J8GOSIuA4NmHHenqHUi0oIUekc/gVI+mSDN0uAvXt1zBJ6M
	32c/uMewW5YhQdvCKxEsqWg8ciUq+JiVy2T60a4FN9ibzW++N/zi3Se61kcxZfohAlJG
	hJhFtB3Nl2IhI00caxptT8qga7LQ3pM250GojYce6kUWCulYP+qmPO9wPx5O9Qtdl/AZ
	24zNLAizOqSlSqtMuRaX3Cijs1ftNzByUjjhyErKQzhIRJ7gHm5NgIXxH0/VT2W3yuR5
	aR12GtpP+2D6SOH7tHCxIE2Mc/P3DRy6N+UPjqZ/0LV8nXGulGNd2W9N6w+bSUT8dzh6
	lcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gr8NUF0o9MgdhpaG1uYm6mlcP9E3GUiXuCEJX7TRUwk=;
	b=DfUuMnPMcRM8GaK0ZCiKvV2pLhzrZFfDjZ2CewMWd6dMcJjpBkOWxJTu+UTA7HmLjQ
	/0ST2bUPOpykn91GSmuKvDYfgSEvOA5rj9B1idlR+lCnW0986fP628ThlLNoEoXrjkbe
	dd/CCvE8GPXYTSfaakb+g/8eFxArYO9LNTrVXs8Jc69P6dyrHk12T8oWkYPnCcSRZfKr
	225+HiBhQ9wlbaSToOVER1VKPxyBih3klfzhVLMDZFQtQu8ro3qPecKL+a8HSQLrWKbt
	+PgjN2BBXvHxdUINqDmMbF75Y99DEyG/j+vn3MOMQ3GlGMZwwpPklV7lFUmQ6LijXp3+
	EHNA==
X-Gm-Message-State: AMke39mXXxjmLpdoOivG+06ad/S8hM9wY4Wy3nljUlCVZ2AamrR2zU5ERX/UDCCG619VKS1Ft8o1nU+qFLXwR9Of
X-Received: by 10.55.3.151 with SMTP id 145mr14316256qkd.244.1488804522685;
	Mon, 06 Mar 2017 04:48:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 04:48:22 -0800 (PST)
In-Reply-To: <4236179.UN52qSrgop@crde-port-20.cahors.local>
References: <4236179.UN52qSrgop@crde-port-20.cahors.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 12:48:22 +0000
Message-ID: <CAJTo0LZaxR+jMiyc21N3fPGANzANkiP0x3F4o952TwmWCnKmxw@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: conditional inclusion of login utilities
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
X-List-Received-Date: Mon, 06 Mar 2017 12:48:42 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b93a0b75df2054a0f50ef

--94eb2c0b93a0b75df2054a0f50ef
Content-Type: text/plain; charset=UTF-8

On 6 March 2017 at 08:31, David Vincent <freesilicon@gmail.com> wrote:

> +           ${@["", "file://login-utilities.cfg"][(d.getVar('VIRTUAL-
> RUNTIME_login_manager') == 'busybox')]} \
>

VIRTUAL_RUNTIME can be set per-image, so you can't do this.

Ross

--94eb2c0b93a0b75df2054a0f50ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2017 at 08:31, David Vincent <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:freesilicon@gmail.com" target=3D"_blank">freesilicon@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":18i" class=3D"=
a3s aXjCH m15aa2bf8f0b36e69">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@[=
&quot;&quot;, &quot;file://login-utilities.cfg&quot;][<wbr>(d.getVar(&#39;V=
IRTUAL-<br>
RUNTIME_login_manager&#39;) =3D=3D &#39;busybox&#39;)]} \<br></div></blockq=
uote></div><br>VIRTUAL_RUNTIME can be set per-image, so you can&#39;t do th=
is.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--94eb2c0b93a0b75df2054a0f50ef--
