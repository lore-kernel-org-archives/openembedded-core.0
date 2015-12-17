Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id BF3717318B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 16:21:40 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id m11so16051093igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ezCNvc6aRhkmOiwd0G+EIBJRJaSi1qerp7fG91I7CbQ=;
	b=CQPXhV6VLh4D/do7kxsn0vt8jjGFBUX06cmgxSayvK7xtPj0nUbxbNF8rF2HxQGLsr
	eqlnCOkpLQK0EszDue/ceB4FKleoFAE8HtZO1ZouvFq/uMYJ8+Fr7pbQjCe+x7FqH1g4
	4mfGST7xgIEG8DdjH8tJfcznPY1afgaHYJ1Gbvj4wnjt+lVX4QQNhjA+fd5CnyoNJOCq
	JkmeN//Ca3LbKU81qYM4OZ2d2W2Z/nhynzNYqP/QiVEPmqUS9j/WoB1zpQFNmLfCckPI
	ubYQUq44WroWzVTmVLJeozsiLJHLEvXnG7WwOKayb/Wfn33lzSUDtBXUsqCKNDzUJL79
	XxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ezCNvc6aRhkmOiwd0G+EIBJRJaSi1qerp7fG91I7CbQ=;
	b=DSDxcEUIaOImDuA8shxf4FXCeW2Ix/z8A2LXs+lPDQHPyf1MznNwTuJIRuf0GtuoCE
	0rRvviiuVLd0dtxD52ohsFt0DG7xsk2xs6OBsxqOGheI2XamTvjTKadzINUx0RtE71FG
	x0IjKmSWNDgtJCSgpp40Q5IHcK19HrdvFSKGCYIWynC/X6YmUOcFQbtEdKIgmOTVvJnp
	BL/ImQ3fUCvp9781uGTfywvRJ68hbps4I/LEwY7+P/ZKd/3xVDGRbsiYraSwDW7G14l7
	AHefQd4n5OSNqEsvBHqKabsuFJWFZdJxEq3vOybFNCJsp8fF9KHUvPD8xeAdgk1KFI/S
	RHWg==
X-Gm-Message-State: ALoCoQn0GpPgvdjv9qR9Nz5d3XbAA/IiIq36E+5x/8OCxWYllqHfr4M+DiB/Has22GcO6SwWcNaN/I1oZRkGWMyevZQCAv0UmY2YBH88i4qPLvjltrEpmuM=
X-Received: by 10.50.22.33 with SMTP id a1mr4320233igf.52.1450369300796; Thu,
	17 Dec 2015 08:21:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 17 Dec 2015 08:21:20 -0800 (PST)
In-Reply-To: <1450368555-20921-1-git-send-email-joshua.lock@collabora.co.uk>
References: <1450283593-26774-1-git-send-email-joshua.lock@collabora.co.uk>
	<1450368555-20921-1-git-send-email-joshua.lock@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Dec 2015 16:21:20 +0000
Message-ID: <CAJTo0LbLOLuych6csLX4gEc9ZpboknLiEj9jw6HezmshtCCcLQ@mail.gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/wic: add test case for sparse images
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
X-List-Received-Date: Thu, 17 Dec 2015 16:21:40 -0000
Content-Type: multipart/alternative; boundary=047d7b10ca19f7d19205271a6a1f

--047d7b10ca19f7d19205271a6a1f
Content-Type: text/plain; charset=UTF-8

On 17 December 2015 at 16:09, Joshua Lock <joshua.lock@collabora.co.uk>
wrote:

> +        used = int(runCmd("du %s | awk '{print $1}'" % path).output)
> +        apparent = int(runCmd("du --apparent-size %s | awk '{print $1}'"
> % path).output)
>

Surely os.stat() can do this instead?

Ross

--047d7b10ca19f7d19205271a6a1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2015 at 16:09, Joshua Lock <span dir=3D"ltr">&lt;<a href=3D"=
mailto:joshua.lock@collabora.co.uk" target=3D"_blank">joshua.lock@collabora=
.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
os" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 us=
ed =3D int(runCmd(&quot;du %s | awk &#39;{print $1}&#39;&quot; % path).outp=
ut)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 apparent =3D int(runCmd(&quot;du --apparent-si=
ze %s | awk &#39;{print $1}&#39;&quot; % path).output)<br></div></blockquot=
e></div><br>Surely os.stat() can do this instead?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b10ca19f7d19205271a6a1f--
