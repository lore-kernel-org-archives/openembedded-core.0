Return-Path: <fpiechocki@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2D46EABE
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 21:18:05 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id w7so8756450lbi.13
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 13:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fDpMH+gw/uRjNA2wCTTrd9xoWQywywP8XtYrcNqsKV0=;
	b=JeAnA12C3q7m1jOBpldiV78cBM0EEe6WSN4w5dJ/tnFdj6pubLUTUDn+GOZWCrxC19
	3/mhH975XkorZN2839kI51GdmJ3VBf24WNxL5++LypNaPBlqJe5rndjdVngA+CeSWBUo
	ynLRictkjeIaWrsV/mLIaggAWzNfbBzCea5JEyD9m98jTsLdd4oGVOElOwGxO+AdzFXV
	YeHadkVoM0aPjac1c/NY+3sMGzqtKfzD6FxvPsBv21M8D8/od6iiagqg95jSqJqQr46r
	PzzVizFfqNpWcQ7qtygOMS0VGmfgopzm/77wuz3zxYPziELWfMZGls24KWCnal3XIoNd
	Y0Iw==
MIME-Version: 1.0
X-Received: by 10.152.228.172 with SMTP id sj12mr2484167lac.32.1392326285960; 
	Thu, 13 Feb 2014 13:18:05 -0800 (PST)
Received: by 10.112.199.103 with HTTP; Thu, 13 Feb 2014 13:18:05 -0800 (PST)
In-Reply-To: <CAALoMC3-u9W024+cQXwfuD4VF7xjqLO-itjk-X8YswdeaHWJHg@mail.gmail.com>
References: <CAALoMC3-u9W024+cQXwfuD4VF7xjqLO-itjk-X8YswdeaHWJHg@mail.gmail.com>
Date: Thu, 13 Feb 2014 22:18:05 +0100
Message-ID: <CAALoMC2p2UJAwuVBdMW38QmY3AUJi9gugBGh6n1-0v7q=7tkfg@mail.gmail.com>
From: Filip Piechocki <fpiechocki@gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: Re: Problem with libicudata.so in OE master
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
X-List-Received-Date: Thu, 13 Feb 2014 21:18:06 -0000
Content-Type: multipart/alternative; boundary=001a113436f0afa96104f25039af

--001a113436f0afa96104f25039af
Content-Type: text/plain; charset=ISO-8859-1

I've compiled icu for my own, and the issue still exist :( does anyone has
any suggestions?

Regards,
Filip


On Wed, Feb 12, 2014 at 12:18 PM, Filip Piechocki <fpiechocki@gmail.com>wrote:

> I am facing same problem on my RaspberryPi. I've build rpi-basic-image
> with some additional libraries including "icu". I've added them to
> IMAGE_INSTALL_append, then I've corss-compiled Qt 5.2.1 and I get the exact
> same error with libicudata.so:
>
> error while loading shared libraries: /usr/lib/libicudata.so.51: internal error
>
>
> Does anybody know what is the cause of this error?
>
> Best regards,
>
> Filip Piechocki
>
>

--001a113436f0afa96104f25039af
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve compiled icu for my own, and the issue still exis=
t :( does anyone has any suggestions?<div><br></div><div>Regards,</div><div=
>Filip</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_qu=
ote">
On Wed, Feb 12, 2014 at 12:18 PM, Filip Piechocki <span dir=3D"ltr">&lt;<a =
href=3D"mailto:fpiechocki@gmail.com" target=3D"_blank">fpiechocki@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div dir=3D"ltr">I am facing same problem on my RaspberryPi. I&#39;ve build=
 rpi-basic-image with some additional libraries including &quot;icu&quot;. =
I&#39;ve added them to IMAGE_INSTALL_append, then I&#39;ve corss-compiled Q=
t 5.2.1 and I get the exact same error with libicudata.so:<div>

<br></div><div><pre style=3D"white-space:pre-wrap">error while loading shar=
ed libraries: /usr/lib/libicudata.so.51: internal error</pre><pre style=3D"=
white-space:pre-wrap"><br></pre><pre><font face=3D"arial"><span style=3D"wh=
ite-space:normal">Does anybody know what is the cause of this error?</span>=
</font></pre>

<pre><font face=3D"arial"><span style=3D"white-space:normal">Best regards,<=
/span></font></pre><pre><font face=3D"arial"><span style=3D"white-space:nor=
mal">Filip Piechocki</span></font></pre></div></div>
</blockquote></div><br></div>

--001a113436f0afa96104f25039af--
