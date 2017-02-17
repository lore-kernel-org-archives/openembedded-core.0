Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6650077339
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 17:47:51 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id w20so46253028qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wq8Aei7uul8D7IFw447Fh+SF1Q6aReEGUsYKRKrhPTw=;
	b=GQrtvBNcWKPYxHME/AhR4sYPxijE2PnzkEjP0Zu7lV5J3+cCrjEtK41mE/VuovsuHK
	DhW1R8NFOxgNzCXB3ywf+ww90JmsD1INgU/PDgqbjMSJ88LTRbnsXgA1ou0a6ws/LzHA
	VODKZyQeHazHSS34Gb6kws474dE0U6K1RrSISKYkWhjzEDM2TiurozxYfvpTebhSuD4r
	gXv06N/X5kfieWD6uQizKhmHhXEOWenNGtN6RaZAKTgsy+R5+9Lz+Z4yF8nCosoGQdub
	ILCioCgxc1QB6O+A23aoYTlpvIeCWgdNEfAqvqRtDYt6OcQF1ivKQB4+xXbNw4h60dfM
	Hc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wq8Aei7uul8D7IFw447Fh+SF1Q6aReEGUsYKRKrhPTw=;
	b=JaMpTnRXT7DhFh7it7IrIrSh7ivkvpk8VTYXqTaKssb5yEfWA7DDa9pJUrZTIiWFs4
	QAoQEzgTP4SWxrU/DQ4Ac6K4fgcKRwoyuv0kFQ+DEmYAg6ujx3LOS1UxLTlkW2y/O9xO
	bJNGzdD7sX8PJonUGFDwG/PyJTaPFhWW/wqUrT2MfvwCxCnKQSfA4KzrNCtzgbsuBhty
	0AA01O6YoaN4J2FgyVjCdmpyLA3hvR37GCtlJQg73tpM3u508HpZUM4mF+rX0qz4tMPr
	67JIsnd1HvXzXbhdpIKvCtEHupP/x29uMl/pOfQIIkz9unny8L4rBhiIuwQsyCJk6aTW
	Jvkw==
X-Gm-Message-State: AMke39kAWcDB6Eh7p3ysMV7wI2bGhVW/XPtC5aUKYsUSkII83hASUrewXywbb26ETKu0vxK3Rik2vCGV4tiOhZU+
X-Received: by 10.200.53.247 with SMTP id l52mr8751651qtb.144.1487353671999;
	Fri, 17 Feb 2017 09:47:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 17 Feb 2017 09:47:31 -0800 (PST)
In-Reply-To: <CAD4b0_J=aGp2gJHSRQdYczQ7azG-TrZc1e9ubAy5yKLK1EL84Q@mail.gmail.com>
References: <20170216211957.23670-1-raj.khem@gmail.com>
	<CAJTo0LayVZF5CjD6r3UXZfBORY1TNn3GPUf8ZUTYwyeJdmHdEA@mail.gmail.com>
	<CAD4b0_J=aGp2gJHSRQdYczQ7azG-TrZc1e9ubAy5yKLK1EL84Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Feb 2017 17:47:31 +0000
Message-ID: <CAJTo0Lb2pgvXswKVWNVmK0pm-7YWBendZtfcnWrPvsipU-Tnjw@mail.gmail.com>
To: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] qemu-native: Point python to python2 on build host
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
X-List-Received-Date: Fri, 17 Feb 2017 17:47:53 -0000
Content-Type: multipart/alternative; boundary=001a1142ba2046897e0548bd8300

--001a1142ba2046897e0548bd8300
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 February 2017 at 17:31, Maciej Borz=C4=99cki <maciej.borzecki@rndity.=
com>
wrote:

> maciek@corsair:~ ls -l /usr/bin/python
> lrwxrwxrwx 1 root root 7 01-16 12:14 /usr/bin/python -> python3
>

Pretty sure that it's only Arch here as everyone else listens to Python
instead of thinking they know best...

(reads PEP-394 and sighs)

Ross

--001a1142ba2046897e0548bd8300
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 February 2017 at 17:31, Maciej Borz=C4=99cki <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:maciej.borzecki@rndity.com" target=3D"_blank">maciej.borzec=
ki@rndity.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":14h" class=3D"a3s aXjCH m15a4d215d6f91bec">maciek@corsair:~ ls -l /u=
sr/bin/python<br>
lrwxrwxrwx 1 root root 7 01-16 12:14 /usr/bin/python -&gt; python3<br></div=
></blockquote><div><br></div><div>Pretty sure that it&#39;s only Arch here =
as everyone else listens to Python instead of thinking they know best...</d=
iv><div><br></div><div>(reads PEP-394 and sighs)</div><div><br></div><div>R=
oss=C2=A0</div></div><br></div></div>

--001a1142ba2046897e0548bd8300--
