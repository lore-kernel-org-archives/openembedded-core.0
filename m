Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id DFB3A6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 20:05:00 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id kc10so29690900igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 13:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yLg9kEROR6QOKvaCX72gXZMMeR46FW2se4nP3MPfsnc=;
	b=N2UWR/UEKgpP868JxGNDtjZKPimx7smXnNY/ad31wHR31OltoZkWqAr7M7keMNbo2X
	0oc3Ep4z1OQv9XCuPcRuxlRSEEG/SBewW8h2odBur59+XUlN0rg9j+VJC/PaRZKCw+DX
	8C6ESOJPgHi5cwPTXhKi6evaXeKlryPLbJ4PSCsjXi82HEDoj1ZsdRabuDwhcJmK1pNz
	0WxkEwGSR1l2SN+kE0ynq3T1xdMKqygzAgQ2hRQC4xx8W1c4MFvWav/FLLj0KJ+3o3pe
	MwEl+77XuOmh4OUObF2+u2uqWeFohNZmYGLNCbd6Eim2T83IeMOHxoWqe6q8wwHvC7oS
	myCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yLg9kEROR6QOKvaCX72gXZMMeR46FW2se4nP3MPfsnc=;
	b=milNtlwhlPIR1bMxoj8SkkF+qeM6ANbV2JR4ZunB7gPI/wmz+r9j+w8DMqoGK79PcQ
	5hmyqnSBZUN8r4SEaHs8OJ60TrLPzmJpIJ6VDbzFpTq6QnlL66Mbu9kk6Yqelm9EKhA2
	i7Rabbw/EpcBTXyGNS8Zh52C0/m4+iv44J/+R0YrsSqBGxE1A3lXxDrdIA0I9OKejFpx
	ua99rix671fr2yag+NWrKz2yHokhlTXHSPnoxViIYm0yj7mT4a7vGFCwGXe5yOO/MOzT
	XIOkxOtWH0sCm/ofYDEQRLbtfnU5T/zlV85Pg3UALdHuNnkxIxNpXgwYNf6Wp6xQO6gV
	hDng==
X-Gm-Message-State: AD7BkJKS1sFZZdCPgkCV1oODQ/EvfhUYjr9GQFoj2GEhqW/oJmtGxzg3y23zOfu1AgENRH61lQGFxcsklXOQp+as
X-Received: by 10.50.150.41 with SMTP id uf9mr1232587igb.64.1458331501713;
	Fri, 18 Mar 2016 13:05:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 18 Mar 2016 13:04:42 -0700 (PDT)
In-Reply-To: <CAP9ODKoF0kqMr9UAiGLsqC9DZytTJnuHa21kQ0npNtUDM8QJ5w@mail.gmail.com>
References: <1456337541-4269-1-git-send-email-javier.viguera@digi.com>
	<56E06C6D.5020008@digi.com> <56EC1FC2.1020502@digi.com>
	<CAP9ODKoF0kqMr9UAiGLsqC9DZytTJnuHa21kQ0npNtUDM8QJ5w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Mar 2016 20:04:42 +0000
Message-ID: <CAJTo0LYEHUmrXrH41d9SfUpYyFnyKvO456BahKjUU7+Q75O5WQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Javier Viguera <javier.viguera@digi.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez5: allow D-Bus to spawn obexd in systems without systemd
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
X-List-Received-Date: Fri, 18 Mar 2016 20:05:02 -0000
Content-Type: multipart/alternative; boundary=001a11345c0c1ffc84052e58434c

--001a11345c0c1ffc84052e58434c
Content-Type: text/plain; charset=UTF-8

On 18 March 2016 at 18:48, Otavio Salvador <otavio.salvador@ossystems.com.br
> wrote:

> Agreed; this is good to be included as it does address an issue for a
> lot of users. Ross, could you queue it for MUT please?
>

I didn't merge it straight away as I wanted to understand why upstream
rejected this, but it was merged earlier today.

Ross

--001a11345c0c1ffc84052e58434c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 March 2016 at 18:48, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":72p" class=3D"a3s" style=3D"overflow:hidden">Agreed; this is goo=
d to be included as it does address an issue for a<br>
lot of users. Ross, could you queue it for MUT please?<br></div></blockquot=
e><div><br></div><div>I didn&#39;t merge it straight away as I wanted to un=
derstand why upstream rejected this, but it was merged earlier today.</div>=
<div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a11345c0c1ffc84052e58434c--
