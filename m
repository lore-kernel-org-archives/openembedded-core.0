Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id E548F762B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 18:44:21 +0000 (UTC)
Received: by qkas77 with SMTP id s77so15092087qka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=I8aStuknIE26L8a1eMyim7cki7mzRG03tP14YFPRcm0=;
	b=oGU6AMJLVbMLR97CO3QRRniHN6BFToac3GsUGC511pUZ1l4s3CkO8tk3HnDbqWfQ4H
	B4jwdxjRq8MvI8fhkNRE2Be2QqrPD2bu19+/3bbw/VZOlzWAU9qjKlbL2t67Aeuxd54P
	NsRk1KtdtV3vtH7UAWd8+B5SL01QY4Z7RZ8q7JwOvpnd+IXTnlOiBYivWG92DnclBBYp
	wPxxWOKHZpT+1S0pBS1pXHU9TepJFsBUZRblXu25YzYxcKI25Mc/q3li9mcRBH7u6s/E
	MS7HaSPW+odFHMtEhthsYirVOeY6tdLkKadfngZcyGOqq5aZU4JRINRABopUGWtAgm9d
	VVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=I8aStuknIE26L8a1eMyim7cki7mzRG03tP14YFPRcm0=;
	b=go1/DhMf9QvwwO57uWEzguLEmDAFEOhTidLdguOhimKsHaupzC1knQnM5vOI8kpUUu
	qvldsUUFVr2NP5zG/WPr0trKopFYs6GAQUs8F3Swpka09Lrq2Fy+5WJ6YnZdyuC7jY//
	4fwlnbMdgA+BG8Y3EGS5/51Js9kSX/OzsI4QtYTz47oh3+dUYCZ9uk+PnK///+441fWJ
	28b/rEjgzAKL5HBd6B2MP8ulfqqZDaaWEkBJ00nQcpKe1+PZ/6+xQppow2sYnW9c2AGH
	B2KxuciTD7GHTj7XCw4DCaZMUECl7va3Ozij1AG6WJTJnI5XtRlQNEUl/lCtuMY/1LuH
	KIlw==
X-Gm-Message-State: ALoCoQmj7bIDvFcbZV175W64Y04GKmU1nyKMjga4zJZSTyO8P5vtmCl4AorjRqxSwJ8nq1MzHW4R
X-Received: by 10.55.78.143 with SMTP id c137mr12022108qkb.72.1447267461649;
	Wed, 11 Nov 2015 10:44:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Wed, 11 Nov 2015 10:44:02 -0800 (PST)
In-Reply-To: <563C5648.5050009@jp.fujitsu.com>
References: <563C5648.5050009@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Nov 2015 18:44:02 +0000
Message-ID: <CAJTo0LZsG+_bo5=+bYrfP3theSrW-aw2TR4Y-Ax_JVY3YnEKDg@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: upgrade to 2.5
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
X-List-Received-Date: Wed, 11 Nov 2015 18:44:23 -0000
Content-Type: multipart/alternative; boundary=001a114a8f68f26cda052448361b

--001a114a8f68f26cda052448361b
Content-Type: text/plain; charset=UTF-8

On 6 November 2015 at 07:27, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> 1. upgrade to 2.5
> 2. remove eight patches since they have been modified in 2.5
>

Did you verify that the patches are not required anymore, or did you just
drop the patches that don't apply?

Also, this patch doesn't apply, can you try re-sending it?

Ross

--001a114a8f68f26cda052448361b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 November 2015 at 07:27, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:fan.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ly" class=3D"a3=
s" style=3D"overflow:hidden">1. upgrade to 2.5<br>
2. remove eight patches since they have been modified in 2.5<br></div></blo=
ckquote></div><br>Did you verify that the patches are not required anymore,=
 or did you just drop the patches that don&#39;t apply?</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Also, this patch doesn&#3=
9;t apply, can you try re-sending it?</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a114a8f68f26cda052448361b--
