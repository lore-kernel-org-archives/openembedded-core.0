Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCCE71C07
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 11:48:34 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id k15so25182191qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 03:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f7noaQ50Xv93bPpkJQRhRmF/rsl3NRtv5ngXfwvgqhw=;
	b=SjRkybZzMMmLVde/0NGVYn62R+ADLjB5e7Y4RWD6d7PVsyZdcvozAhGLZ5NORkIB9I
	lWBrCYN1UFhjt+uQrqvymK6gK9lPwerrFoaeskQPXntJV2y/YkwNZXdLRmBRDnrjDCe1
	hgZmUcEakAVj3BKk8AlFnMyg4htQryn5NZLGuEGRnPiYGcWFJEFWU9InwClL8qunHwmh
	OFe8jG/da6LMhlqUKQiFIBkarUBBCDJ2f5RVVXCyt7tixk39qxzZcAVQFIYm6Fthgm+z
	rZGcDankMU4cxzblzcTUuYxAL9ba01dfSIMtNReACnhilaP0rOHIpXaHc1X++pBZarE4
	k0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f7noaQ50Xv93bPpkJQRhRmF/rsl3NRtv5ngXfwvgqhw=;
	b=uDM7D8hYM4rcNiy7a4oyIQ9pD912twVMKV7FvqmwlZlpYZiua8xQcgMbkZ1XhiK7Pg
	KUsugxvudNRjibZ7pr1ZlNwKPxuV54RSDgRazWgfFod2OYyRvAWp4LN7bHHIOCLNt0XX
	jYjOEkxNPFm1v6YqL3jm94Fbhh22SOueHWp6uf30jU+UtOvtj22UTLoGBkq1GNRMMDGR
	NayxwNMyyFA/08pOHPzRJjOeAkYLwBAyI//A+Kwr5WoRkCoTGmhXUreiKFYNf1EpmRvo
	2HKqliOh0mJvoLHf0/icZO7WSSj6c8wC0cIsvWnoumsMIyw8JjgR1aDLuHa2TjTVTJYH
	066A==
X-Gm-Message-State: AIkVDXKt9CblzUKzHS+mpZ4HaTxzVaak70yCMOPFBSVU09lE7ngwtoltIUCER1KieXFimAv0bDybmC5zG2R7UG6m
X-Received: by 10.200.39.212 with SMTP id x20mr7245353qtx.109.1486036114462;
	Thu, 02 Feb 2017 03:48:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Feb 2017 03:48:14 -0800 (PST)
In-Reply-To: <b8f21f98-445d-a91b-aba7-c9ba7263f539@mlbassoc.com>
References: <1484974938-6497-1-git-send-email-gary@mlbassoc.com>
	<b8f21f98-445d-a91b-aba7-c9ba7263f539@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Feb 2017 11:48:14 +0000
Message-ID: <CAJTo0LaeNMccibT-8OjHe4Zka5AEa_-KY9xFLCimvXyQVUVaew@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: native package should not depend on DISTRO_FEATURES
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
X-List-Received-Date: Thu, 02 Feb 2017 11:48:37 -0000
Content-Type: multipart/alternative; boundary=001a1135b542ba1f9a05478abe34

--001a1135b542ba1f9a05478abe34
Content-Type: text/plain; charset=UTF-8

On 31 January 2017 at 05:08, Gary Thomas <gary@mlbassoc.com> wrote:

> Ping?
>

Staged locally, thanks Gary.

Ross

--001a1135b542ba1f9a05478abe34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 January 2017 at 05:08, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":6n2" class=3D"a3s aXj=
CH m159f2f24b3dcbe42">Ping?<br></div></blockquote><div><br></div><div>Stage=
d locally, thanks Gary.</div><div><br></div><div>Ross=C2=A0</div></div><br>=
</div></div>

--001a1135b542ba1f9a05478abe34--
