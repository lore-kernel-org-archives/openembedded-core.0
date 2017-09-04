Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id BCEDC6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 10:09:37 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id y123so184615iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w1v/yH6CX4KxOq7bsbGjVL28c12smm6KzrKjCm8eASA=;
	b=nPo6MJcv0C5N70fngJWdQImuYw87F1gILZ+MsopgaWrXiM+l9hOIn5H7ITFhflMzWR
	fYB1N0XlQ1szYJmr7tFMB+ydC7jHP9rT6am5YSmggW9pf+vYtl8ux5h3cjNs5lmz1rsY
	QUnm7Hi0n2kz8jOYk6ikMfZY6koiadKAG2M7xrR88VC/ltXN/slQRHb289t48JXVfX+Y
	D7USzJ6SSfrAqmMIvywdQAzKr1g3R8Y7h10Tfmd6XMgY5PloyQF9vznkTtbbNe0Hqdoj
	UL/YG+BVnAYSYKKr1kfTAbQXUJcfU85ckl+qnWoSBK4A/zozcGLh4MFBg33JHviOH08r
	+bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w1v/yH6CX4KxOq7bsbGjVL28c12smm6KzrKjCm8eASA=;
	b=IZoDidrS1Moi64FkGutHCq5bQe+KspeG+3MlPP3PRNovZ4k88CHQR6/nDgnlJgROcv
	9qvWVZ5oT0GJE8dgmsgysL/e6VZhpjENOmne7UErr19zZjMmFj9X18bLwDGLd6mCzh3u
	za4ptojuoNjSLhso0ArUESwqFbk7h4pS0z+9h06anHrtuTcfXaRzzPj7WnPzGpo9lFbl
	DBbJINNDJde5ylhl4NUE6XxX4koA+Cn5Vg0nTcZRawYXytG2AaX2fulpsZgxog8+PUPc
	TlLWDbERKAdcZ5ft1lrbTQ4IzmdlWXSdMfkK/5iUIQedbgQSOYX6duPvYCYVgGchhFBy
	AI+g==
X-Gm-Message-State: AHPjjUjQEjggdEbS1YNE86fmB0M+20CWr9zZt/jPFScN2D4h2NQ2IzJw
	cVFNx5fQWRXaGVMvE+iojgaZ3Qr5su7cr6Q=
X-Google-Smtp-Source: ADKCNb6TqSLnuoE7VXJIuh+dVvJGAkukZrm8A4JSx3QpifMaguK/PEe2KXfSsT0KvatXjUVzz/fMwh+Ip9c0cYNdwM8=
X-Received: by 10.107.16.210 with SMTP id 79mr141137ioq.196.1504519778980;
	Mon, 04 Sep 2017 03:09:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Mon, 4 Sep 2017 03:09:18 -0700 (PDT)
In-Reply-To: <20170903192536.491-1-otavio@ossystems.com.br>
References: <20170903192536.491-1-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Sep 2017 11:09:18 +0100
Message-ID: <CAJTo0LbPBn=TmjGb6ozkVjsMdF8H+MaYF32DhZi8Evs7N=n5sA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] go-dep: Add 0.3.0 release
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
X-List-Received-Date: Mon, 04 Sep 2017 10:09:37 -0000
Content-Type: multipart/alternative; boundary="001a113edb52fbe9af05585a4e4a"

--001a113edb52fbe9af05585a4e4a
Content-Type: text/plain; charset="UTF-8"

On 3 September 2017 at 20:25, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> This is the Golang dependency management tool under development; it is
> ready for production use and intended to be merged onto Golang
> 1.10. Until that, projects are starting to use it and making it
> available on OE-Core reduces the Golang integration work for new
> recipes.
>

ERROR: go-dep-0.3.0-r0 do_package: QA Issue: go-dep: Files/directories were
installed but not shipped in any package:
  /usr/lib64/x86_64-poky-linux/go/bin/dep
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
go-dep: 1 installed and not shipped files. [installed-vs-shipped]

Ross

--001a113edb52fbe9af05585a4e4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 3 September 2017 at 20:25, Otavio Salvador <span dir=3D=
"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otav=
io@ossystems.com.br</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-=
color:rgb(204,204,204);padding-left:1ex">This is the Golang dependency mana=
gement tool under development; it is<br>
ready for production use and intended to be merged onto Golang<br>
1.10. Until that, projects are starting to use it and making it<br>
available on OE-Core reduces the Golang integration work for new<br>
recipes.<br></blockquote><div><br></div><div>ERROR: go-dep-0.3.0-r0 do_pack=
age: QA Issue: go-dep: Files/directories were installed but not shipped in =
any package:</div><div>=C2=A0 /usr/lib64/x86_64-poky-linux/go/bin/dep</div>=
<div>Please set FILES such that these items are packaged. Alternatively if =
they are unneeded, avoid installing them or delete them within do_install.<=
/div><div>go-dep: 1 installed and not shipped files. [installed-vs-shipped]=
</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113edb52fbe9af05585a4e4a--
