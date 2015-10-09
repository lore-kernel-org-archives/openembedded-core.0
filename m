Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id AE1DC75A38
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 10:52:10 +0000 (UTC)
Received: by qgx61 with SMTP id 61so65012748qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 03:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+BsPo0XZbGhkPwDvwUjKV+SosoXkxX/I31H5wLZMPZI=;
	b=fHzU7rGzoB9OsIg9kouV4oy3YiO0wuUBsqCmE1KvVJirY1cHiBwzK7DbsT2pMSuF6M
	OUmPHudt25CW7X8BSY7lmlxZqDupVwM9g8sbpMYzA2ft31tuZJ35lBwq+mjx04iAwFQf
	x8V3qayUmqXu0OvbafMzjauSvmUzeLy2g+n/0PdlvmB3+t6dGEY0zyxOaYMBbM7F37Po
	NXxmI215241vEYGN6UPjLMykyd5L1x2qYoRMuHwUq4hYRFmgr0SbOnOUh7B9ttyXWmfM
	av+7logUGcTshk9VehRKiSBYft0hInkCmOc9VKgNqHeaZJ+v72ktH+tuATSllOI7N9mf
	k7Bw==
X-Gm-Message-State: ALoCoQnrpHqxMsYSBuGvHiW/pX2t4VS6mzK8COSbHarB7aF06N1RGamEtH87m7071pEkwiji2aMJ
X-Received: by 10.140.93.47 with SMTP id c44mr2312764qge.59.1444387930569;
	Fri, 09 Oct 2015 03:52:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 9 Oct 2015 03:51:51 -0700 (PDT)
In-Reply-To: <56171848.4010805@windriver.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
	<5c927d04a3d915e5949f36f5ec9da9f81d8459bd.1444310101.git.liezhi.yang@windriver.com>
	<CABcZAN=wK-941ihO18dr68bxCa6vnN2LJgSz=LMynfoOZopVzA@mail.gmail.com>
	<CABcZANm6GfP7sqVdcDo2x2v-Uq85Hns7WOG+s3K9j9N1NqG1EQ@mail.gmail.com>
	<CAJTo0Lbe64X4-vG4uBfypz9zDREU6vYiU0LWNk1aFe+CHYzZYg@mail.gmail.com>
	<56171848.4010805@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Oct 2015 11:51:51 +0100
Message-ID: <CAJTo0LbgZb=Q+sAd9W82U9Y5AQsR1xcyoRUQy=6HeS5b1LN4XA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] autotools.bbclass: use relative path to run configure script
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
X-List-Received-Date: Fri, 09 Oct 2015 10:52:11 -0000
Content-Type: multipart/alternative; boundary=001a113ac09885715b0521a9c5f1

--001a113ac09885715b0521a9c5f1
Content-Type: text/plain; charset=UTF-8

On 9 October 2015 at 02:28, Robert Yang <liezhi.yang@windriver.com> wrote:

> I'm afraid that realpath is not generally existed on the build host ?
>

It's part of coreutils on my Debian stable box.  I guess the real question
is "does it exist on Centos 6?".  [looks].  Hmm, it's not present on that.

Ross

--001a113ac09885715b0521a9c5f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 October 2015 at 02:28, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5dw" c=
lass=3D"a3s" style=3D"overflow:hidden">I&#39;m afraid that realpath is not =
generally existed on the build host ?<br></div></blockquote></div><br>It&#3=
9;s part of coreutils on my Debian stable box.=C2=A0 I guess the real quest=
ion is &quot;does it exist on Centos 6?&quot;. =C2=A0[looks].=C2=A0 Hmm, it=
&#39;s not present on that.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a113ac09885715b0521a9c5f1--
