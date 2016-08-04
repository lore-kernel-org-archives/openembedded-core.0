Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5E3731D2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 23:19:34 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id j124so9827802ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 16:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GIiVEDsTcQHfgoTNPNKgvIJy1XU0xCceDO2JxWqsOx4=;
	b=G/o2TkNe+qgMQ3y/fFcIPo+5ULhMTlmJ/bWLc2YenQ4uHHY1TpdPW05RJS898d2irI
	MnupjlNy7iTzibM7ryIsVBl1kWTGvDmrYJ8RgJ8G84Mmwwf4GjgykILBhUDyXciS6Ydh
	r4KxjvM3ikTtjUZtrRW76AvsnM6i5Hga073g8Umgx2Spq8m782v+Dfu++ABlwauNtDIO
	znAy+AKp2k1l1iIiwGMiTNPswiHQD9KPHzBxQ3NAsiOZrbM0xpx4J4NQNVg0RKzeyBiG
	02hKnJN4w3HfJEJhIVmnbbmb+afquYmR7+csdb4K6MbKx8nTaJptis0uN317pd2qDPJV
	tsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GIiVEDsTcQHfgoTNPNKgvIJy1XU0xCceDO2JxWqsOx4=;
	b=Ixzc2Ylkz0GSDDjeirF1iiS08hoiRXn2OjFi9fLbcdN0SlL5/w2sQliHdAkOg7uimW
	H7++/IpAZomqF/7Qr46K7028kWCnRRHT+4sq1oBZ6x4yIqOBurWwP72id2ezrM3G7kul
	U0+yrv/h/ymg1Ri8GzslHTTTLzHTk2AJ1z2hS1dBRPwaybO94JaylaNvpXJWkAuu8d2G
	kcQfH0BlLiY1wsxX4a8bIHInn0CXbVpSgelsaZHZLpBTuECVAD4DT7rAj+SBSE5RVNkp
	U2H8qM3vr1CI3EHksZkVvHNM3hs8fZ1lbmhcTCRUJmYxkgVkuVKUyUYZdzrVq4yjZjK/
	ylvg==
X-Gm-Message-State: AEkoousktJcO+1LSGKvcpiSh9bvgARMe0zQjjNXEfjSvJqItIB2oXKJPwRNGo8UB/eQL1koVlJQusWQnRWktT2Sg
X-Received: by 10.36.129.213 with SMTP id q204mr649525itd.38.1470352774827;
	Thu, 04 Aug 2016 16:19:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 4 Aug 2016 16:19:14 -0700 (PDT)
In-Reply-To: <CA+chaQc0hKwRL1rJohYRxTG3GBre8xAqBpqrKzBwd6mnE9_sxQ@mail.gmail.com>
References: <20160804195645.1254.80390@opal.openembedded.org>
	<20160804195647.4E7D15017B@opal.openembedded.org>
	<CA+chaQc0hKwRL1rJohYRxTG3GBre8xAqBpqrKzBwd6mnE9_sxQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Aug 2016 00:19:14 +0100
Message-ID: <CAJTo0LZRnm8znSGYtYLx_-ar4DZG7Ydhz13RdTTNbqBciky4_A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 06/10: tslib: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Thu, 04 Aug 2016 23:19:34 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fcd6a36d0539472e1f

--94eb2c08b1fcd6a36d0539472e1f
Content-Type: text/plain; charset=UTF-8

On 4 August 2016 at 21:08, Martin Jansa <martin.jansa@gmail.com> wrote:

> Since when tslib reads pointercal-xinput file?
>

That was my comment on the list too, but this series was left in my staging
branch so ended up getting sucked into master.  I propose a revert for this
too.

Ross

--94eb2c08b1fcd6a36d0539472e1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 August 2016 at 21:08, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Since w=
hen tslib reads pointercal-xinput file?</div><div class=3D"gmail_extra"></d=
iv></blockquote></div><br>That was my comment on the list too, but this ser=
ies was left in my staging branch so ended up getting sucked into master.=
=C2=A0 I propose a revert for this too.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fcd6a36d0539472e1f--
