Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5DC6057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 20:45:59 +0000 (UTC)
Received: by igcto18 with SMTP id to18so45364181igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 12:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FZzE/C50MvKabT2jcD2iiD+2snG+GlQXyUrptP6lsUc=;
	b=wvVmE04EebWwl7ez/RyprvFNRQ9KK4IPEwZZGJGWXmtKBe8gxTD6LIdEnyefyTLAW/
	/vOeKFWJ+4zMSslkTTIP37QIBrw7lGeO/Wov7cD0M9nkUZC8z5Fc2BkbXMAqYbuvBj7Q
	bxQQ0QLoWDDivuQTg4Vccrr9R+64uiq6kvME6eYQQXgn0ttk+Tsy921VWXc2w+S3iX/N
	7fAAbN0BNQqEhho3EsjaGrKkqDqyxhCKS+kenp59HImEkdEmbQOCE+ba7s5lZY5MpJOH
	n+9nYR9JY9mq3LUxopMLRAszUijWtyMyoXRHeewy7V5nCk4rXJ5L2aXbsYqpToSvMHE5
	OxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FZzE/C50MvKabT2jcD2iiD+2snG+GlQXyUrptP6lsUc=;
	b=kAd86muaODXGUjY24u0+09q6uAk/mEnR+O7HloYz5QNu+egmfuNYwgwcs5Gncbd7rA
	L4HvaGItU9X9MktNiC+7wCsvVB5k84JSynZzfSgskDD3/ZnZVzTsA+mltDCJlOthbIKS
	+fynPWY3LnEeIHZv9cOLeR53neEJaYavtti8NPy5Db+9sGJqRs6qmITa5UsoqIKro8d2
	ftuBV9La9j69j47k4ZyYVcJCe/tko/sQ99ujwTqWSiiZKUrqwi/nGRFawH/rgx9rEBTZ
	mxAzxwCI4UZYaDNk/6Pq85zDj1j0siupaL+qdUpJ4azYphz2yAlWz7jr23pkqa6dSgmO
	cZMQ==
X-Gm-Message-State: ALoCoQk1pPLb5fDcWTjMkKTgALwsmTJK5fo6E/12vh6ebzcaov/mRZHDZbxSkGreVgFp1HxXmwI9
X-Received: by 10.50.79.129 with SMTP id j1mr5685598igx.52.1448484359941; Wed,
	25 Nov 2015 12:45:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 25 Nov 2015 12:45:40 -0800 (PST)
In-Reply-To: <cover.1448458595.git.bruce.ashfield@windriver.com>
References: <cover.1448458595.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Nov 2015 20:45:40 +0000
Message-ID: <CAJTo0LYycPrr6S2VED=kTZNzP_quAiNMx=8HkwhF84d3ok1vmg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] linux-yocto/4.1: -stable/-rt and old kernel removal warning
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
X-List-Received-Date: Wed, 25 Nov 2015 20:46:01 -0000
Content-Type: multipart/alternative; boundary=089e011609fcbcd1ad0525638bc0

--089e011609fcbcd1ad0525638bc0
Content-Type: text/plain; charset=UTF-8

On 25 November 2015 at 13:41, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> I'm not sure if anyone actually reads these pull requests, but if they
> do, the kernel versions scheduled to be dropped from master are:
>
>   - 3.14
>   - 3.19
>

I read them!  As the kernel maintainer, you can send the removals. ;)

Ross

--089e011609fcbcd1ad0525638bc0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 November 2015 at 13:41, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":9nc" class=3D"a3s" style=3D"overflow:hidden">I&#39;m not sure if anyo=
ne actually reads these pull requests, but if they<br>
do, the kernel versions scheduled to be dropped from master are:<br>
<br>
=C2=A0 - 3.14<br>
=C2=A0 - 3.19<br></div></blockquote></div><br>I read them!=C2=A0 As the ker=
nel maintainer, you can send the removals. ;)</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e011609fcbcd1ad0525638bc0--
