Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 38DEB7865C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:45:43 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id u42so2446512ioi.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 04:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EOPulwhWSSm2UP4E4fYzkkTuVK29AMGuxfxkGg/zg4Y=;
	b=wkDe5iaiB/ccnKARGDoiYvoKrSpcpJtvc9fF0/Q7+9VrgpnSFsiNhNje0jDi93m9+u
	wLK8GaKjy192ihFfRZm0sJjxKssQLzqpJVFaS8wTZN0wi/umyHmjGC56LP8D/gxNFChm
	uthp2q3fPAIsbiTw2OeRJZISxgSZOB9xdVRyGl3voA16NfXP0580HgyDLBdH8NIO3Tey
	1niu8EgXjYcE0NePzV6Ylr8QOKIz3XKbU8ELBfvjhSLCyfcmj3SdXUUVVhjMYbk0RfhM
	58OJMka5q7y4JH1EQeG5Ih1FKEYc946KzKWU4ftagNFUC1cXnn1p+4rjGMFxdht+3gDd
	m8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EOPulwhWSSm2UP4E4fYzkkTuVK29AMGuxfxkGg/zg4Y=;
	b=Z1glybJQGFVsYmvQDBcVrGIV4IDV4pdoST+2mc7M2hfppj6BtKjEfbZvjbjBpAI7j0
	aWr1xdVWbnRRxAi6eZi5bN+SVv25gHST0jF0xs1Vo5v4oB8SQzXCarA0pd4dI2IE0sjz
	H6Gg+dlCsr0RqOM54HFOg3dwcN9HzIpE0fh1fLCyYqORumSP+cYL2UD380lOB8Txkk+d
	9F2pgGuCvLQ2Ufr5+is5+8ubQl/UKBmyYesjcwUdbjdAkfItJuKgaSETAf/WeOTyC07l
	gythwSH53IPfmVOyhWjgQFkXZ2Otcm3TEgEX90M4OjbbvgbOXv3ceEUJBqugexXEJH4f
	bENw==
X-Gm-Message-State: AJaThX6irhbgq9nLbnSj66heGKFlOUbWv2LqOgDuWIXinxn3b+uIM5HT
	4mkEGEfRiwFAGDDJ2z3iQbU4oRmqfIpYJFrDCqL3cw==
X-Google-Smtp-Source: AGs4zMZWd74jAO/nYpiob769ZWLCrPNf7V7YKgK/32Ycv0XfV+/dzd8ap4pbo3HH5Yi9vQiJXGMKAYoKIb3LOlV2iSE=
X-Received: by 10.107.178.145 with SMTP id b139mr4026663iof.52.1510577145296; 
	Mon, 13 Nov 2017 04:45:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Mon, 13 Nov 2017 04:45:24 -0800 (PST)
In-Reply-To: <1510576722-29881-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
References: <1510576722-29881-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Nov 2017 12:45:24 +0000
Message-ID: <CAJTo0LapQMMWKDpwHU6Y-e-8d6G-LeWTt__johzU3AvbtnajMA@mail.gmail.com>
To: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: upgrade to 7.56.1
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
X-List-Received-Date: Mon, 13 Nov 2017 12:45:44 -0000
Content-Type: multipart/alternative; boundary="001a114ca16226d1a6055ddca658"

--001a114ca16226d1a6055ddca658
Content-Type: text/plain; charset="UTF-8"

On 13 November 2017 at 12:38, Oleksandr Kravchuk <
oleksandr.kravchuk@pelagicore.com> wrote:

>  inherit autotools pkgconfig binconfig multilib_header
>
> -do_install_append() {
> -       oe_multilib_header curl/curlbuild.h
> -}
> -
>

If we're not using oe_multilib_header than the multilib_header inherit can
be removed.

Ross

--001a114ca16226d1a6055ddca658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 November 2017 at 12:38, Oleksandr Kravchuk <span dir=
=3D"ltr">&lt;<a href=3D"mailto:oleksandr.kravchuk@pelagicore.com" target=3D=
"_blank">oleksandr.kravchuk@pelagicore.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">=C2=A0inherit autotools pkgconfig binconfig multilib_header<br><br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header curl/curlbuild.h<br>
-}<br>
-<br></blockquote><div><br></div><div>If we&#39;re not using oe_multilib_he=
ader than the multilib_header inherit can be removed.</div><div><br></div><=
div>Ross</div></div></div></div>

--001a114ca16226d1a6055ddca658--
