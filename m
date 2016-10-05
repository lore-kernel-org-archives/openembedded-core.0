Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8272B71A5B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 13:56:06 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id r192so187739437ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2016 06:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z9nahnmk98pac4LXCkpCpqeIL5ndstmqEZWKp8FINc0=;
	b=fPviY/ZciYpGkwbYzi1Sc3MjiScoL2tfe3Y3u+ndHulW7w5gukM1UhtgziT2xZYWQ5
	tv++NJOKeQNvmE77rPLKUTunA/aIu4Ht6PqQTCbnC2AVrXZGGZ1lLo27lCf9tucP9fZl
	c6EQPVyLDOzxo3c8oOJbfyUlasj6KXLGqtsc9xmac/ZSS0O6hqvz7aXzunMzqsNfT2b7
	xfKPoiTLlDpWCPysGrNjjuIgJi2PXPKGXEJj3aTjzVdftm2Xj8/zGnG93kDPEZESfmyJ
	vK22Cx27WfCffXPkeMJLT8bZhGklDZyETRYApfc0XgBOeeyPGnIUimvlPdJoR4e1OgTH
	v2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z9nahnmk98pac4LXCkpCpqeIL5ndstmqEZWKp8FINc0=;
	b=hYGSQE2kH7scjYLYxuADEKqS58yQyLhLZlD5HqNTQpT/TG206mRJdk1LmRnieA3naH
	VR80+wau1pTjuoDZOUwUI7iyhcy7e7o6ue+EvylwTcXUHH7saRAlbkE/toKeYi3ugNrR
	wts5TeJD+vaEPgDGspA1oy95Qh5ty7nUzNn6wM9sDaQQrEo5zTQxyx5WO1xjxwAZCVm+
	kmAj4gqspd1WnHe8irmBO6+crFKXMh8PORNKkuJ8oD4GP4xHNNGqrFHh102xDjiLb+X+
	iTmPJorkKjSTmqi3ahKHg9MnIODrK5fIudahsWWkJEZn11biC3FTSXErNerCcGBQJ0nX
	G43A==
X-Gm-Message-State: AA6/9RlSme8t15XQYgEe3EXA7yrKZFD4hvJg0Oco8UJKqLAskWTg6KCCz3/JOS7942PF9JcZzbSgIQuMF1OiHzVv
X-Received: by 10.36.200.85 with SMTP id w82mr19106720itf.29.1475675767217;
	Wed, 05 Oct 2016 06:56:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Wed, 5 Oct 2016 06:55:46 -0700 (PDT)
In-Reply-To: <878tu3gg6m.fsf@adi-pc-linux.i-did-not-set--mail-host-address--so-tickle-me>
References: <20160908095633.26651-1-adrian.ratiu@ni.com>
	<CAJTo0LaDjgTd20i-BQ5QQrWrKms3rfq-vNCiqVB7yz6f8VAmpg@mail.gmail.com>
	<878tv2znhb.fsf@ni.com>
	<CAJTo0LY_6wg10ft-RNRrYH7xa93=aWB9LuH=gxEpgf19vC446Q@mail.gmail.com>
	<871t0tzads.fsf@ni.com>
	<CAJTo0LZtsxhz=5=XdBWDQVMZpXyXqi11h2OS5XY5HOrUXkMmnA@mail.gmail.com>
	<87bmyzdqfp.fsf@ni.com>
	<878tu3gg6m.fsf@adi-pc-linux.i-did-not-set--mail-host-address--so-tickle-me>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Oct 2016 14:55:46 +0100
Message-ID: <CAJTo0LZcE63=JYaK1sTVh4wiSyktb4XLRkOx=XbMc4jRtJ-JqA@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: add libpcre to DEPENDS
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
X-List-Received-Date: Wed, 05 Oct 2016 13:56:06 -0000
Content-Type: multipart/alternative; boundary=94eb2c05a3b4e8b4e9053e1e896b

--94eb2c05a3b4e8b4e9053e1e896b
Content-Type: text/plain; charset=UTF-8

On 5 October 2016 at 12:59, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> I think libpcre_%.bbappend in meta-selinux is just missing the following
> line:
>
> ln -sf ${relpath}/${realsofile} ${D}${libdir}/libpcre.so.1
>
> after creating this symlink the build works without problems (previously
> only libpcre.so symlink was created).
>
> Is this a proper solution?
>

As meta-selinux is messing around with library locations, yes.

Ross

--94eb2c05a3b4e8b4e9053e1e896b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 October 2016 at 12:59, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1hs" class=
=3D"a3s aXjCH m15794b7e02ae464c">I think libpcre_%.bbappend in meta-selinux=
 is just missing the following<br>
line:<br>
<br>
ln -sf ${relpath}/${realsofile} ${D}${libdir}/libpcre.so.1<br>
<br>
after creating this symlink the build works without problems (previously<br=
>
only libpcre.so symlink was created).<br>
<br>
Is this a proper solution?</div></blockquote></div><br>As meta-selinux is m=
essing around with library locations, yes.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c05a3b4e8b4e9053e1e896b--
