Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0936612C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 18:07:54 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id kj7so154273igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=JYLxA7yALWnWk6XMSWyAT0qJpN7vRaIgnZz2oCVH0FI=;
	b=bFomx/fajPyBMImRN1FgQDRdNwhs3EDO5ajRdEdHmxCGx3frHE//uEARpJ/SS+LjqC
	Uwk0HRV9hhKiH+VE2fwrH+gZ9H/TnhHdlDQ6Yw6D68n1mW1iRT9LThN+m+mtAV6oK8C+
	Nsojwh5W2qPVsqbvzdGlL5wXoY6xeTNNlLkro5js71fYBpnEWZRB4BF3cMEhu+2e1Kpu
	Jy463gPhF6MWXINzgxXo7mG6BXcQApaiR9R94igd60AlTImDNrTwMmzoDqevUGChN/Ug
	P3iwoAArClVC3N8w/BEkKVezjPKSWJW3wTazaEs5lX6ZgRFE1YK7ThlotA3LyCNJxoHS
	x/rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=JYLxA7yALWnWk6XMSWyAT0qJpN7vRaIgnZz2oCVH0FI=;
	b=bGEENJLwMfmFvYW5QhQ18xEItmjjlevcWJd14CpsbJD9SFB2FLTYeD+DEfuGsjXAhJ
	wUVhfgyooq+T3Q/CQLU0lVSgSP1RXDA4IbN30sWFaG7VQG7FbMSKhwMG+kxMMu8VyjZc
	PvHWHyBd1xyKk5iCBiTqp9YxKZ7HD0WZueBQmhYzVErrO6ExaxihLECpbTUaztmrSiTZ
	AJRin/v/vp8KnYfXxNO+c5tlAEvIB1foDuCAvCEWOIwIB2iRPY70jpNdFgCp7EREXwtf
	yaZfb29ubiDooAZD3I44lSn/s3jLwZW27yYJdDJSWICRMI//5hufARIE39EIMMYxnNeN
	ZzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=JYLxA7yALWnWk6XMSWyAT0qJpN7vRaIgnZz2oCVH0FI=;
	b=cWlJ7wfHMnojXdsHL6pnS1oL2TyYKcTuVbvRfArmPjSl9Aiwspvn/deoLbDz0meXqW
	vxQ8Oy4ETWXqrZKEEkVC2u7e/zr9/PkP5CMAo40LiOo2fS8TKD+n2Xny/m4t1JP0gPbp
	TQWtSNF3zsNAH6HkGINxq+DhQ1NV9kGY69W+h7BB73b9iJzzZW186LTiBUX9RjA+ViWE
	6UlryT85poQviht+DTkrwP3dUGxgubpE7yUZybzmpNQPW3P/lFD3gePi8dlh0iBWxz6A
	f32IDkRXtMvtYC9NC7tlbheg7vGICjlv/AxvT5fbtUapDMxfJ5szUlQlwDRkaQctpf1A
	emNg==
X-Gm-Message-State: AOPr4FXh7twj2XDVwSi6m9gmH8AED60iZq07dfYUlZIOl6RIZu51l7ZVUT/9C7zDJSmvjINDPoZsjoTkB+QzdA==
X-Received: by 10.50.29.76 with SMTP id i12mr28724880igh.87.1463076475645;
	Thu, 12 May 2016 11:07:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Thu, 12 May 2016 11:07:36 -0700 (PDT)
In-Reply-To: <CABcZAN=ZXjXSSeQsVb9etn5X-jsL+W7Ft82r7Z+eKgRcLe1OYA@mail.gmail.com>
References: <cover.1462216694.git.chris_larson@mentor.com>
	<e9b4b7a9c7391a30eb2c08ef245e70d8@smile.fr>
	<CABcZAN=ZXjXSSeQsVb9etn5X-jsL+W7Ft82r7Z+eKgRcLe1OYA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 12 May 2016 11:07:36 -0700
X-Google-Sender-Auth: MrxkM8P_Y9mT8a0AJWWV2EGeb-o
Message-ID: <CABcZAN=j5N6D7HKnKFcSKHRnETDFRusAPc0XYubxCkWyvToymQ@mail.gmail.com>
To: Jeremy ROSEN <jeremy.rosen@smile.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-master][RFC PATCH 0/3] Support template files for wic wks
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
X-List-Received-Date: Thu, 12 May 2016 18:07:56 -0000
Content-Type: multipart/alternative; boundary=047d7bd759849c33b50532a9090d

--047d7bd759849c33b50532a9090d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2016 at 11:06 AM, Christopher Larson <clarson@kergoth.com>
wrote:

>
> On Sun, May 8, 2016 at 9:05 AM, Jeremy ROSEN <jeremy.rosen@smile.fr>
> wrote:
>
>> Le 02/05/2016 21:23, Christopher Larson a =C3=A9crit :
>>
>>> From: Christopher Larson <chris_larson@mentor.com>
>>>
>>> This adds support for .wks.in files as WKS_FILE.
>>>
>>> These files are treated as the contents of a bitbake variable, so usual
>>> bitbake variable references are supported. I considered using another
>>> templating mechanism, for example the one used by yocto-layer, but then
>>> we'd
>>> end up largely mapping metadata variables to template fields anyway,
>>> which is
>>> a pointless indirection. Let bitbake expand the variables directly
>>> instead.
>>>
>>> This feature lets us, for example, reference ${APPEND} in --append, and
>>> avoid
>>> hardcoding the serial console tty in the wks file, and let the user's
>>> changes
>>> to APPEND affect wic the way they do the other image construction
>>> mechanisms.
>>>
>>> The template is read in and set in a variable at parse time, so changes
>>> to the
>>> variables referenced by the template will result in rebuilding the imag=
e.
>>>
>>> It's been suggested that the name should better reflect how its content=
s
>>> are
>>> used, i.e. .bbin or so. I've also considered including something like
>>> 'bbv' or
>>> similar, to indicate its contents are that of a bitbake value. I think
>>> this
>>> should be discussed.
>>>
>>> I'd love to hear questions or comments on this. I think the value is
>>> clear,
>>> and it's something we need to solve, but I'd like to hear if others
>>> agree or
>>> disagree on that, and whether this implementation is appropriate.
>>
>>
Given that there don't seem to be any real objections here, I'm going to
re-submit this as a non-RFC patch series to try to get it merged. If anyone
has any issues adding this feature, let me know. Thanks for the feedback.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7bd759849c33b50532a9090d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, May 12, 2016 at 11:06 AM, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div=
 class=3D"gmail_extra"><div><div class=3D"h5"><br><div class=3D"gmail_quote=
">On Sun, May 8, 2016 at 9:05 AM, Jeremy ROSEN <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen@smile.fr<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>Le 02/05/2016=
 21:23, Christopher Larson a =C3=A9crit=C2=A0:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com" tar=
get=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
<br>
This adds support for .<a href=3D"http://wks.in" rel=3D"noreferrer" target=
=3D"_blank">wks.in</a> files as WKS_FILE.<br>
<br>
These files are treated as the contents of a bitbake variable, so usual<br>
bitbake variable references are supported. I considered using another<br>
templating mechanism, for example the one used by yocto-layer, but then we&=
#39;d<br>
end up largely mapping metadata variables to template fields anyway, which =
is<br>
a pointless indirection. Let bitbake expand the variables directly instead.=
<br>
<br>
This feature lets us, for example, reference ${APPEND} in --append, and avo=
id<br>
hardcoding the serial console tty in the wks file, and let the user&#39;s c=
hanges<br>
to APPEND affect wic the way they do the other image construction mechanism=
s.<br>
<br>
The template is read in and set in a variable at parse time, so changes to =
the<br>
variables referenced by the template will result in rebuilding the image.<b=
r>
<br>
It&#39;s been suggested that the name should better reflect how its content=
s are<br>
used, i.e. .bbin or so. I&#39;ve also considered including something like &=
#39;bbv&#39; or<br>
similar, to indicate its contents are that of a bitbake value. I think this=
<br>
should be discussed.<br>
<br>
I&#39;d love to hear questions or comments on this. I think the value is cl=
ear,<br>
and it&#39;s something we need to solve, but I&#39;d like to hear if others=
 agree or<br>
disagree on that, and whether this implementation is appropriate.</blockquo=
te></span></blockquote></div></div></div></div></div></blockquote><div><br>=
</div><div>Given that there don&#39;t seem to be any real objections here, =
I&#39;m going to re-submit this as a non-RFC patch series to try to get it =
merged. If anyone has any issues adding this feature, let me know. Thanks f=
or the feedback.=C2=A0</div></div>-- <br><div class=3D"gmail_signature">Chr=
istopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmb=
edded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor=
 Graphics</div>
</div></div>

--047d7bd759849c33b50532a9090d--
