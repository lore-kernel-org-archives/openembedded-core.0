Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id ED9F971AEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 17:11:18 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id c195so7409084itb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 10:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/F9JANaQBLrLpWXCTXkRJ2fwm0VaC7MJikYQ2XM5or4=;
	b=vuTLN+eOEYczXDx9WxQjehw87f50g2P3ktkGK+LQLfoy6rqPw2T1oQm0a73sWrgMpZ
	YVDY8nEuOz1Ek4VZMNJENIv/oSNA1aUeqrPjlRQeIdadBg9Es7QSDofqOv9CrKRFUTrD
	FK5fx3lUpl9OLQaYayjOrP9LNcsJlDIBGmNzKcbG5z1uaESMz0SGjj0FFtsxuW2kw/oW
	BYMpPoXLwynejYBlySG/M65tSdgBeu5owkYGgJcIcQbJHU3CSeaDHvwqmahAghJgxJv9
	arGuGrNJKykyBh41gz+K6RFFIx+6Hg5WWYNz9tszxdopus+I4qJTn9DC/HoOOqzxJabf
	iHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/F9JANaQBLrLpWXCTXkRJ2fwm0VaC7MJikYQ2XM5or4=;
	b=KqrCnEh6+xtV6DaP+1c6Nne0eWebmzyCTE5pv82jCldKXKSEO++8YUzX7iGTvbTn3Q
	grXnyuPXS0c22Tc11TKt4Zu87pEMUhSJLyX8/hU2s55kIHSz72LejjHZ2Yo+Y8h3wair
	2t2Skwf5T6TBp18R45FV4VMgbNp3W37xEzL3rRffkPxXrPdreDFA1nJySD7qbnObOW7e
	s5HmKDYHdfZfItM7M8dbag7oL8ym9+W5A1iM5Oc0qLA24tGfJUp7rdUWhahVnX87FTAC
	HwOxikxjtbzpT/jTzqHYE3RKTcGWXZY0mokZStn/6as6PKNZ0uwjw/Wdl0Ah4S6lMKuS
	B4Pg==
X-Gm-Message-State: AHPjjUgBhGkZZ+8OyXHsprq7Zn5PSCoBI/+91Z5hB3t16kkj1+HE6vN8
	8KC6W/VbAMBaStlDVTsmYKYFLBc0hQQjJLLWvoJP2w==
X-Google-Smtp-Source: AOwi7QCclh94r3Ew3yu//LUTkzOFPy2iJ1vWTgd2u2bJKgbtZ6BQHix8+FWTKo9RZZN+ODFoR+jI2b7h8ge8u5WNMtU=
X-Received: by 10.36.181.73 with SMTP id j9mr1695646iti.6.1506532279417; Wed,
	27 Sep 2017 10:11:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 27 Sep 2017 10:10:58 -0700 (PDT)
In-Reply-To: <1506531609-5917-1-git-send-email-trini@konsulko.com>
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Sep 2017 18:10:58 +0100
Message-ID: <CAJTo0Lbw39PVXdjqvtksLxcsWWhYR4GGXO1+RAGuXcnH2QX4fw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Wed, 27 Sep 2017 17:11:19 -0000
Content-Type: multipart/alternative; boundary="f403045d9e425b9875055a2ee155"

--f403045d9e425b9875055a2ee155
Content-Type: text/plain; charset="UTF-8"

On 27 September 2017 at 18:00, Tom Rini <trini@konsulko.com> wrote:

> With RSS we need to ensure that when making a bmap image that the
> python3 that we created is found via /usr/bin/env rather than the host
> python3.  Otherwise we're relying on the build host to have bmaptool
> support installed.
>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> I played around with a few ways to try and fix this problem, and this
> was the best I could come up with.  Once this is in we need this in pyro
> as well as it's broken there too.
>

Doesn't bmap in Pyro use Python 2?

Ross

--f403045d9e425b9875055a2ee155
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 September 2017 at 18:00, Tom Rini <span dir=3D"ltr">=
&lt;<a href=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.=
com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">With RSS we need to ensure that when=
 making a bmap image that the<br>
python3 that we created is found via /usr/bin/env rather than the host<br>
python3.=C2=A0 Otherwise we&#39;re relying on the build host to have bmapto=
ol<br>
support installed.<br>
<br>
Signed-off-by: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com">trini@kon=
sulko.com</a>&gt;<br>
---<br>
I played around with a few ways to try and fix this problem, and this<br>
was the best I could come up with.=C2=A0 Once this is in we need this in py=
ro<br>
as well as it&#39;s broken there too.<br></blockquote><div><br></div><div>D=
oesn&#39;t bmap in Pyro use Python 2?</div><div><br></div><div>Ross=C2=A0</=
div></div></div></div>

--f403045d9e425b9875055a2ee155--
