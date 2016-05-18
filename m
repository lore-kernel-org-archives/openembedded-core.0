Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 93583766E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 15:54:45 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id d62so70687583iof.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bLspA4W8jhrq7D7Bq3hYjrXO1lmYq+ok7guZH0NGzdQ=;
	b=TsaxNsiyPhcSXZxEUNpvwM3IqUn6rtJ+QK2J74xrzs59fpb8x9XH4vwIVnY5gVZaZV
	0YC8bYVAPc9wJoENhngckG73oGVBtwRks6qvD2NQNOkVgG16RuGuiNo5vY9HBRUSPlLC
	aXKnqaFUuE0oe6VqIw8MYX1RoOfyyIrZrqzAx3qnw+sfWUlhksmdtkUY68wUv3oLFecV
	DNyI5NC75dpPgiCauNnxZZ16znvvuU75mE2xJMMjItgjpFQ4OwDFUu0HChkdb6iOabw+
	g0Ltka8nFgW6q/dvtmBewbESd6RoIByF6mDi77rhegmTYmQwHER5hEOpkZXQ09S1GIgG
	zDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bLspA4W8jhrq7D7Bq3hYjrXO1lmYq+ok7guZH0NGzdQ=;
	b=Su41ALpfM3G6I967PdMyc331Kta8rtnCoOGKZU3c0p7tJ3LQDohAsWTHNVGTGyhv94
	IXxQ0Vuhl3r/u7NVkIeoMzlHMWN+Ymguu09cgyNQYHjK4tWCdteOMyIe2o6FvU2RS/3y
	f2BOZEOpBau33L4S9+KtPP3yQny9Mp3HAUasKzTctpFEhA3azQlhzRu7KSwDHWXTXzp+
	Nz2v6cde+Sb80aigzAQrHcqQVPfG1bTTDAblUvkHG1za9aAMQXh7XqPlhaf2zIcdyMEw
	X1qfANnJ3U3SqY4pgKBNJa+EXPL92eShPiPuEsMV07NyHPlDI+ed3tR2FKz8ht7wX39O
	RUzw==
X-Gm-Message-State: AOPr4FVUQ18HlW2c8WWYJi9nKn3rVkeHkWf/OYQR3L6Ff6gT3eMhjXpyDyOvrMDvBqkyEuTKNzPf40xsM2fjrHN1
X-Received: by 10.107.135.211 with SMTP id r80mr6153865ioi.133.1463586885695; 
	Wed, 18 May 2016 08:54:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 18 May 2016 08:54:26 -0700 (PDT)
In-Reply-To: <20160518141444.GC2579@jama>
References: <1463574817-22238-1-git-send-email-herve.jourdain@neuf.fr>
	<1463574817-22238-2-git-send-email-herve.jourdain@neuf.fr>
	<20160518141444.GC2579@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 May 2016 16:54:26 +0100
Message-ID: <CAJTo0La+1imJmmC5-q6crW7GYDty3iLB77FgvreJ22doYoJ5FA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [mesa][PATCH v2 1/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 15:54:45 -0000
Content-Type: multipart/alternative; boundary=001a113ed20a6b8f2605331fe0bf

--001a113ed20a6b8f2605331fe0bf
Content-Type: text/plain; charset=UTF-8

On 18 May 2016 at 15:14, Martin Jansa <martin.jansa@gmail.com> wrote:

> Use os.path.join instead of +
>

I just went and edited the patch directly to do that, so no need to send it
again.

Ross

--001a113ed20a6b8f2605331fe0bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2016 at 15:14, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mail=
to:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":nd" class=3D"a=
3s aXjCH">Use os.path.join instead of +<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>I just went and ed=
ited the patch directly to do that, so no need to send it again.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed20a6b8f2605331fe0bf--
