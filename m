Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4C27F6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 14:08:55 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id q83so184334465iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 07:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UpIXG41+9swGd7tFzbX1K1J9vxGmlaysc7oI8vzg+zg=;
	b=neneFT3C2NG+U95I7EAdxJD/6kdghoUd23T/hU/6PBf2XBIu3CtTtDLuY2C9O+4ZEl
	N+6Jy8/FvZX7p3pFFS5uYlFqV9JRRYxxXMCZf8ypSS8NBKmgmqleZ4DuDYKCQJhcQzrM
	AeEU/G/ij6tPl44Ffq2bChAg10hWF1lQ5egbzY1BUBgLSORTE0Rl8dYgHuHOXnjVDniF
	PC/0d3uD06lZSpLOAT1IpNTSbOEelDUr9HW/7ZyOhraMcZXHxmffy72Vm0/bIDw0cToy
	4j7OuKa3MRTvgHeRyVvULvnhLRRt8nxTpmDwOtg0f3A1e+B+Dwu3YTr7NPmt6Xvg9K87
	X6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UpIXG41+9swGd7tFzbX1K1J9vxGmlaysc7oI8vzg+zg=;
	b=Rx1eW3Bs3Vp2/sd9fH2ziajz/+AO9MLTY99Qt3kq4NR3M4h6hmQ3+SCYWaB2qU+GB/
	H+1SwCKnvMe+iB/ytSBBUwSbcZA0hJOXlpFKvDtFRwBfI2rxAQXuJ1fQyiybUxQ2Z9Xp
	axT0sAmCPx9vw91+1RcaDibnxWG4xWasReNNOdtqIP6sB0J04PcAyVETeCPgqfRrB1rm
	g04AytbuRttcxxXw/i72oZGyvJkwhuj6WyDcvcf/lLibVX5zSe2IZEdXPiCdl3cJ8+8W
	yhrPRr55ta2MMvTQtbGVWwEA7pANg6CMS9CZL38xCD07GG8YqDc1373ZY9yuBDlgtU3k
	3DZw==
X-Gm-Message-State: AEkoouuZ4HuOoYObH/UJFopBcPpnqIhG/RWXP4qibFhY0nwuUtzAGHirmrsdsMYv/5o8/jTzrv8uWBd8AH6r/cUs
X-Received: by 10.107.154.196 with SMTP id c187mr53769355ioe.99.1470060535998; 
	Mon, 01 Aug 2016 07:08:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 1 Aug 2016 07:08:36 -0700 (PDT)
In-Reply-To: <CADkTA4Pa0pjQ8HQwAFq6jZUW5TXjfYd=pkdaOoDgU5S7x2hhsQ@mail.gmail.com>
References: <20160801123253.9292-1-twoerner@gmail.com>
	<CADkTA4Pa0pjQ8HQwAFq6jZUW5TXjfYd=pkdaOoDgU5S7x2hhsQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Aug 2016 15:08:36 +0100
Message-ID: <CAJTo0LaXhsr4xJwR05DP2F+mNjJOwGQ+xfGb=d2cTgn2DaTiKw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Mon, 01 Aug 2016 14:08:57 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e0c036005390324bf

--001a1140e81e0c036005390324bf
Content-Type: text/plain; charset=UTF-8

On 1 August 2016 at 15:07, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> Not a large dependency, but it does bring to mind the question if this
> could be conditional on the type of image being built ? via  distro
> feature, some other mechanism ?
>

Exactly this: image building adds dependencies automatically based on what
is actually being used, so can the kernel do this too?

Ross

--001a1140e81e0c036005390324bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 August 2016 at 15:07, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Not a large d=
ependency, but it does bring to mind the question if this could be conditio=
nal on the type of image being built ? via =C2=A0distro feature, some other=
 mechanism ?</div><div></div></blockquote></div><br>Exactly this: image bui=
lding adds dependencies automatically based on what is actually being used,=
 so can the kernel do this too?</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a1140e81e0c036005390324bf--
