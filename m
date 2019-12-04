Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F98A7DD6A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 10:17:36 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id x18so4492710vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 02:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bfYun8HvoSBNtpvX5azRDaBpkKulvRIgApq3WXhRpCg=;
	b=ijDdMKNpCSBkgOn6eI6kP6k9vCqP3uaheQOV5qxrVvdYpTH3ot02fb9jCPxZbyBIld
	r4mnVKETWniFx54kpNj2rgxux83k5qLpkdKMtZVlissWc7RB+OxM3wn7toFObC8bwg1R
	Sk3hyNwuA/y9QapFFNilQa4MM2yyqGaufybvsl87nGewHAAolmWeuAGNGHWv9uYdmz0A
	e2G/dO0guCxppzkhEtnlxhE1ySaZSmcXeJZkIhwdlfD4p6MBr5XWEy2+N5Fc+ltYfxpz
	tDIgWXLcNgbp+OhGNcpKYyWzzSP1Kwy7rgQYvaN0KQfdhF8bWbN70JxuZM+xSCJ23c+r
	byYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bfYun8HvoSBNtpvX5azRDaBpkKulvRIgApq3WXhRpCg=;
	b=k2cTE+SjekK1XggHUdtuBIRcXbWbOPc4F+euAk/gcWOY37rzehN3hRzNkqymXbMioZ
	nbwrTZHVmbA9f9P+AdwZj7u+8yZn70Cy4KOUPBww6G4Kuh7SylJ8S8MmodH3ABVvXR3g
	02vD56ODNZOvxd8GhZ/0Qt4uSkt/D+pN/eG/iZkE0zltT2KEGE70gJ55fMGKiC8THvhz
	DMhrnamTnxX3ILGBk9/HZcwDy2q/xtRUrGDFx9A0c56gQfQxZbeMI1BGGKDNcihHdne/
	4dcZNdcfKgpevGnxTg9IItoVdiRzDjOt414/x2pt7jr6Iv8/owgdi/KXG6ftsDiENGdY
	9jUg==
X-Gm-Message-State: APjAAAVrghNTlxvqOeBXgalTDmOlILKRDDrCCLbr/o8Er8AVokckDUhH
	CQieMZ+UF4vhU04+RtR3qBeAVQHjWhAvUEWTmgs=
X-Google-Smtp-Source: APXvYqyGQWu44z6ju6T8Ib4w3qiNXCWnoZWrNqLKAa8pIjcV2Fih2egNkFOIOOBP6yN6Ep9ht/Y5OHFCKIX2el6ueL8=
X-Received: by 2002:a05:6102:21d8:: with SMTP id
	r24mr1175485vsg.83.1575454657980; 
	Wed, 04 Dec 2019 02:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<1b6971c1-ce0d-5cda-862b-d0a84b5be20a@intel.com>
	<CANNYZj-b0Ufwum+4vA5aqNm+=E+a+HM0vso=61UPERm57QrCDw@mail.gmail.com>
	<661436bf-4167-10a7-a632-473948d8c950@intel.com>
	<ed34d6cb-50bc-7185-3d8d-f5a0c7bd6db5@intel.com>
In-Reply-To: <ed34d6cb-50bc-7185-3d8d-f5a0c7bd6db5@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Dec 2019 11:17:26 +0100
Message-ID: <CANNYZj_+37AxAzFipHGt-JD+sRGsdQan6mGmjjwQxn8kDfjtng@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/15] rpm: upgrade to 4.15.1
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
X-List-Received-Date: Wed, 04 Dec 2019 10:17:37 -0000
Content-Type: multipart/alternative; boundary="0000000000003faf1b0598de1f64"

--0000000000003faf1b0598de1f64
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Dec 2019 at 00:52, Ross Burton <ross.burton@intel.com> wrote:

>
> Okay, maybe this is actually due to my gcrypt-using patch...
>

This implies rpm's usage of gcrypt is somehow not thread-safe :( as the
backtrace includes those openmp routines that we use to write packages in
parallel.

Alex

--0000000000003faf1b0598de1f64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 4 Dec 2019 at 00:52, Ross Burton &lt;<a href=3D"mailto:ross.=
burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><br>
Okay, maybe this is actually due to my gcrypt-using patch...<br></blockquot=
e><div><br></div><div><div dir=3D"ltr"><div>This implies rpm&#39;s usage of=
 gcrypt is somehow not thread-safe :( as the backtrace includes those openm=
p routines that we use to write packages in parallel.</div><div><br></div><=
div>Alex<br></div></div>=C2=A0</div></div></div>

--0000000000003faf1b0598de1f64--
