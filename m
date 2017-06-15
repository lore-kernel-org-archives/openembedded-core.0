Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3489C783AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 12:31:21 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id u19so18221096qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 05:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QM2wZ2dV5EmBOKdF9+5rV1qR4E6H957whXzGZ3i7Kyw=;
	b=uBR8aUPVfidI1+4ZcBMTfDvtJocYSRyuWPqQvDiuR3aA64rVSWMhFlRcl44Wl/eNHl
	vq5iEJvVPYAQdPCEBK7iW8uE8pNAj2wa9MR9Ae+oroNoWgxkcY+pLtZ8m+RJsWjswdss
	fx8UENeCil00dxXIpa//1UApXsecwxtB8kvtJMTGEkLAUKObgSKANvFoxSw5K5rFbVQZ
	gEZkCEEK4nOZ7r84WtHKcq0+tgPR/38pNXsijgSvSI7GeQM4pwLxJQwigqlLJc323h+y
	XxbOA7zE28kthntrZ5CHTOEUz3+RHA1fkFCCpADYfkcLUyJIbRWYPOe97l4ebsupkv9X
	pUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QM2wZ2dV5EmBOKdF9+5rV1qR4E6H957whXzGZ3i7Kyw=;
	b=IJh5PtxeQ/b8WE821whdkdVdyf6tR8olgyKTWtjJQhj4YoNpXDra4pu5nQTdZOFkQ5
	/fnDGWUJIka0508Yjs/Nfl5vWqy8rifs9iVoYX3+ccZufOXBJ/6XHtJHiH+HaQL6XkQF
	6jVmvRtBsjgRqe4OchaAhakYRbD8cVuKDs4Tcaj/dv6lumM/9casAsdUCFGor1uueEeX
	ek8wBNU1QYsqgP0vPExXx8RYFyLdtlrdSqh2rg1TDiCwXtQE1XCU9haits1oT7V7kWLx
	5IJM0D7h0hXPYZPNRcPJK86yMo36414VEaAKwcarVpOMVEGDuKd6wnf4GUxwxiB2i2o0
	HNNQ==
X-Gm-Message-State: AKS2vOyk2OuPbZKavGu44bNmbfg58QtjqdEiOnSDyJF0f6paYqvsRkrD
	1x1jx7R0gLyqKSnnq7G8Dsp3TRlZTrcG
X-Received: by 10.237.52.33 with SMTP id w30mr5867229qtd.139.1497529882379;
	Thu, 15 Jun 2017 05:31:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 05:31:02 -0700 (PDT)
In-Reply-To: <22aa14ac1a926e97fb676743cb1e440ff2aaae1f.1496218782.git.jackie.huang@windriver.com>
References: <cover.1496218782.git.jackie.huang@windriver.com>
	<22aa14ac1a926e97fb676743cb1e440ff2aaae1f.1496218782.git.jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 13:31:02 +0100
Message-ID: <CAJTo0LbG_JMejjRPoK+g4Kq5+G8eszwPj4+oWcUjhpJ4-7esNg@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ncurses: add SYSROOT_DESTDIR for siteconfig_gencache
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
X-List-Received-Date: Thu, 15 Jun 2017 12:31:22 -0000
Content-Type: multipart/alternative; boundary="001a114dc03eae1e4d0551fed862"

--001a114dc03eae1e4d0551fed862
Content-Type: text/plain; charset="UTF-8"

On 31 May 2017 at 09:27, <jackie.huang@windriver.com> wrote:

> +EXTRASITECONFIG = "CFLAGS='${CFLAGS} -I${SYSROOT_DESTDIR}${includedir}'"
>

Why is this ncurses specific, it sounds like something which will impact
all users of siteconfig?

Ross

--001a114dc03eae1e4d0551fed862
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 May 2017 at 09:27,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jackie.hu=
ang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":mi" class=3D"a3s a=
XjCH m15c5d9f69337bb63">+EXTRASITECONFIG =3D &quot;CFLAGS=3D&#39;${CFLAGS} =
-I${SYSROOT_DESTDIR}${<wbr>includedir}&#39;&quot;<br></div></blockquote></d=
iv><br>Why is this ncurses specific, it sounds like something which will im=
pact all users of siteconfig?</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a114dc03eae1e4d0551fed862--
