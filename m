Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 102F760EB8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 22:25:44 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u57so5190961wes.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 14:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3ibchQ46i76VhHeDGp+fvOp8d7hVj2gjfutYJ/4FG3c=;
	b=fOOG4vJF9Gc42eqrNti0enrnwQ6j6gdlyZq1Yhh9vQpUwEphDqyXAE3/f83X2snlXF
	/Y9xyua+cB1ipQ6AY6ny4QMpO03iN9ZGekj9lTxIlwv3xLBRey2EenWN58DuYkC+Z8H+
	XzeAgOMxcXYDHKeIBohBUhcv0bjSxo89yoVogsPbSCOnXKtSeAoQbimh2ILtCGBoBKrM
	n6rvLziRMzPTNmLdweTXGke2W0KjP99pLsMmrymgexrKMzEtWkQ3jJcAZ75pujz+Uls5
	nD2nkGWyrHYmh2/tWKm8IP2Q1oCy/M6cdowr7LcDZKct+y3hKYcFmi3vc270pzPwzYu+
	juxQ==
X-Gm-Message-State: ALoCoQkenfz9uuNAhXHkUGmPEu5O8i97ZPAG62uUQilBJjAkJ2N8F2TOmvlKSxq5wKGYQHAuQX2o
X-Received: by 10.180.187.72 with SMTP id fq8mr8624793wic.26.1389479145430;
	Sat, 11 Jan 2014 14:25:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Sat, 11 Jan 2014 14:25:24 -0800 (PST)
X-Originating-IP: [5.13.221.193]
In-Reply-To: <175AE9EA-538B-4B3E-9693-65D8866F926B@dominion.thruhere.net>
References: <CAK18fxG3_D9kRoiWrPJsTQxN=EOZSx3Vue8288maf_rMGHOrvQ@mail.gmail.com>
	<175AE9EA-538B-4B3E-9693-65D8866F926B@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 12 Jan 2014 00:25:24 +0200
Message-ID: <CAK18fxE+11_RbOYHBCFm9Au3y5pqEVx1zf_4N4ZN=kf_B9Tweg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: eglibc not buildable for on thumb2 only instructions
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
X-List-Received-Date: Sat, 11 Jan 2014 22:25:45 -0000
Content-Type: multipart/alternative; boundary=001a11c2679ce3496b04efb95247

--001a11c2679ce3496b04efb95247
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 11, 2014 at 8:18 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

>
> Op 11 jan. 2014, om 17:25 heeft Andrei Gherzan <andrei@gherzan.ro> het
> volgende geschreven:
>
> > Hello,
> >
> > I'm trying to build eglibc for a thumb2 only processor: here is the log
> http://pastebin.com/KgwtJYAC.
> >
> > I know Raj tried in the past this and I want to know if it makes sense
> to dig further into this or there is a known incompatibility in eglibc. I
> searched a in eglibc and they seem to have patches that add thumb2 support.
> So things, at least in theory, should work.
>
> I built eglibc in thumb mode a while ago by accident using the
> meta-linaro-toolchain gcc, could you give that a try?
>

No go: I get again a lot of "Error: attempt to use an ARM instruction on a
Thumb-only processor" for different instructions.

-- 
*ag*

--001a11c2679ce3496b04efb95247
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sat, Jan 11, 2014 at 8:18 PM, Koen Kooi <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion=
.thruhere.net</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><br>
Op 11 jan. 2014, om 17:25 heeft Andrei Gherzan &lt;<a href=3D"mailto:andrei=
@gherzan.ro">andrei@gherzan.ro</a>&gt; het volgende geschreven:<br>
<div class=3D"im"><br>
&gt; Hello,<br>
&gt;<br>
&gt; I&#39;m trying to build eglibc for a thumb2 only processor: here is th=
e log <a href=3D"http://pastebin.com/KgwtJYAC" target=3D"_blank">http://pas=
tebin.com/KgwtJYAC</a>.<br>
&gt;<br>
&gt; I know Raj tried in the past this and I want to know if it makes sense=
 to dig further into this or there is a known incompatibility in eglibc. I =
searched a in eglibc and they seem to have patches that add thumb2 support.=
 So things, at least in theory, should work.<br>


<br>
</div>I built eglibc in thumb mode a while ago by accident using the meta-l=
inaro-toolchain gcc, could you give that a try?<br></blockquote><div><br></=
div><div>No go: I get again a lot of &quot;Error: attempt to use an ARM ins=
truction on a Thumb-only processor&quot; for different instructions. =A0</d=
iv>

</div><div><br></div>--=A0</div><div class=3D"gmail_extra"><b style=3D"colo=
r:rgb(51,51,51);font-family:Arial;text-align:center">ag</b>
</div></div>

--001a11c2679ce3496b04efb95247--
