Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9587766C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 14:42:16 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id 1so59413841qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 06:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Em9ttr8Y3adx+Yk0xWAKiWO/0WnooZKb/hyzKleFgTE=;
	b=08DG1V3LqKIIlgRq4lOTIR5TfdWtdVSIi1pECls7Noi0KR76C+DrsDNpg9xWVnt4gW
	LnN2KxlbfVrEFQZuC3hVfbdQ0wk5Z3dAdzvlxaPLqt1LxrRD7h8W5wVoKNyDzKhmetjG
	jLlkuP4x0EXUoiIj8DjD103g5PYLTGdiA7wWecRxy7b8ud4FKFhlGCwYWwkBAHSoFsCI
	CO8afHlXINs8Z+GzAWNYL2PnfX+hr35oz+INSdFlJDruWsAYRBkrYDBnNJs2kACcMUp4
	j3EO6FY/++WZvG9SdWIcb1ZV2SoRU0SB+B6oiZRLsyqLX1cA2UjJC6PAOmPYFJvKRwN2
	SFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Em9ttr8Y3adx+Yk0xWAKiWO/0WnooZKb/hyzKleFgTE=;
	b=hnhkHv5CEJVMaTj6Xe5prJkMhEwHcA4ICXtO0NyCXiQa7ZAwYtQaLIOz3K/KZjUglA
	p45irzBsed3bNK4bKF3Cg4qq6AXJmjPLAx9mp/DIt6DxaJaVdWwoZNUT2DgVikkzXZpg
	GDx0TIaSmHjDLmbhO0ZPjGbXA2lxkASbkn/Vky5Ue6O5g7VAc9+xe6bboKvP96vQUqwU
	D5fNkJ74WEX+r2VxiZfgm7jfZ1x1Sbx1l7+5vyWTYjnCxqtU5WeijG0CELTwJIzB8Vyh
	F4IW4tpjf+YNOCpqTG6VhC2vYXBYl0L3M83Lurpiv2Dbf8OYqxVwC0+wfOaFk7noDZOA
	T3KA==
X-Gm-Message-State: AMke39nBz0yJeMUr9LtjpNd4R/+lFI+11GOk+u2oUWlaW5nokLv9tjRQc6EuTm/AYxRKjZrKM1LnLee6SQn+dfcP
X-Received: by 10.237.39.158 with SMTP id a30mr3089288qtd.65.1488552138084;
	Fri, 03 Mar 2017 06:42:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 3 Mar 2017 06:41:57 -0800 (PST)
In-Reply-To: <cover.1488164498.git.bruce.ashfield@windriver.com>
References: <cover.1488164498.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Mar 2017 14:41:57 +0000
Message-ID: <CAJTo0LYbO0_oE0cB-fmXXNPeZF=YwEWTwQ1-YEyRbYKe3oGomQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] linux-yocto: kernel version updates
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
X-List-Received-Date: Fri, 03 Mar 2017 14:42:17 -0000
Content-Type: multipart/alternative; boundary=f403045f26a46bd19f0549d48d8a

--f403045f26a46bd19f0549d48d8a
Content-Type: text/plain; charset=UTF-8

Hi Bruce,

On 27 February 2017 at 03:10, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:
> Here is the latest updates to the linux-yocto kernel versions, and
represents
> the versions that we'd like to be included in the upcoming release.

This appears to be causing cryptodev-module to fail:
http://errors.yoctoproject.org/Errors/Details/134637/

TOPDIR/tmp/work/qemux86_64-poky-linux/cryptodev-module/1.8-r0/cryptodev-linux-1.8/zc.c:63:8:
error: too few arguments to function 'get_user_pages_remote'
  ret = get_user_pages_remote(
        ^~~~~~~~~~~~~~~~~~~~~

Ross

--f403045f26a46bd19f0549d48d8a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,<div><br>On 27 February 2017 at 03:10, Bruce Ashf=
ield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@win=
driver.com</a>&gt; wrote:<br>&gt; Here is the latest updates to the linux-y=
octo kernel versions, and represents<br>&gt; the versions that we&#39;d lik=
e to be included in the upcoming release.<br><br>This appears to be causing=
 cryptodev-module to fail: <a href=3D"http://errors.yoctoproject.org/Errors=
/Details/134637/">http://errors.yoctoproject.org/Errors/Details/134637/</a>=
<br><br>TOPDIR/tmp/work/qemux86_64-poky-linux/cryptodev-module/1.8-r0/crypt=
odev-linux-1.8/zc.c:63:8: error: too few arguments to function &#39;get_use=
r_pages_remote&#39;<br>=C2=A0 ret =3D get_user_pages_remote(<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~<br><br></div><div>Ross</div></div>

--f403045f26a46bd19f0549d48d8a--
