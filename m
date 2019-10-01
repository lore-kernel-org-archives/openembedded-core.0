Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	by mail.openembedded.org (Postfix) with ESMTP id 08B9E7E08E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 19:16:27 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id l2so10168721vsr.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=saQM0YMfmsNzlyDrR/hUmmkZagejvJrEVsSPgy/0AOE=;
	b=AcZlL4GBvrXnZVpn9cQjhtV1Jh2P+x5a3xiGl9Nf2Q+lfkG/ocU0v+vgNlekxAfpRr
	VnZQ0WLh9xEv4Bgoq2iDKgaPviQl2umIeNdHrXTsj2u+TSEMqBmZLJ2VotXhSJ0bL7r8
	GDypoK2yOH30U+N4JDp6o1YQg26BEr7/s6yxShAgR8CpI1KO3r5y+Pn9g/NJYT7cZ1P/
	ygMvSkyaSqKDJ7ZIHW2j25A1pBfValCVbFWVL3Fmda5QZbNHLlH8VyvI+3O1dZ3FqQQ/
	U3J3/BISTi2MIn/urkwF8cYdMHphun20sZ5kUNbxbHYwqHi5elzPZlzRsagpRnBQjI8s
	diqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=saQM0YMfmsNzlyDrR/hUmmkZagejvJrEVsSPgy/0AOE=;
	b=CA8xfy+Uh2gmNb8QDv6JMVMvMz5vGLFPY50a1YMqNks4ieI5qfiY6fOXSx02UqoAvd
	DiQTiVZhy8uxStGCWZkCMD6x0AZodJuzJ9J6QLQUaYJU49KSvLFwih9ZOY5knqogncd+
	xZcR9calmN6QEhnbZfVylaOdrdscO3zIHRmLZVNZB+fUA/l5xRKLImgRUjlequhUCSSf
	eUgk8YLK6L40SaicE9ngMEAKeW7HueeMoPEGenbRErjAjeQnDJWDPn7eRAj4CdnLBFTV
	j1X3m5HbfpJCh1tDPwN7R2C9LUuKlBPGuE0IymOq0j4QCQ0/HdcBQBrGP7MjNzUWql+M
	7lnw==
X-Gm-Message-State: APjAAAUcdOt4f5wLCERgBxyhAuIVIGgUzDbdgjUVVRro1/1xBZNn8XrD
	d5BF+MjkU2jETRX6B4IL0mMy6OO7CFxx6aW/cm0=
X-Google-Smtp-Source: APXvYqwWMgxP7lpAKE5PY/T/M3ZPt+CxgmQyenPfJ9lQG7JCqczUULCUZRLnhx7I017WLX8iiK9T3CHuviawQGum7oM=
X-Received: by 2002:a67:2c43:: with SMTP id s64mr13389043vss.94.1569957388067; 
	Tue, 01 Oct 2019 12:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9KAnpTGSC_V4W40AwD7nSPm-Q+RcxRBqMLHLw=ykBcNA@mail.gmail.com>
In-Reply-To: <CAK5yBb9KAnpTGSC_V4W40AwD7nSPm-Q+RcxRBqMLHLw=ykBcNA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Oct 2019 21:16:16 +0200
Message-ID: <CANNYZj9q28NdSq8w1fHsJE3yLGoQJjqCwVewni3TXz1YVfJ=NA@mail.gmail.com>
To: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDDigJkxOQ==?=
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
X-List-Received-Date: Tue, 01 Oct 2019 19:16:28 -0000
Content-Type: multipart/alternative; boundary="0000000000006da70e0593de30fe"

--0000000000006da70e0593de30fe
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Oct 2019 at 16:54, Stephen K Jolley <sjolley.yp.pm@gmail.com>
wrote:

> A significant performance problem has been found on the autobuilder where
> some builds are scaling in time badly as the sstate cache grows, taking 12
> hours or more in some cases. Unfortunately nobody seems motivated to help
> work on this kind of issue.
>

Wait a moment, I believe there is a patch for this issue?
http://lists.openembedded.org/pipermail/openembedded-core/2019-September/287445.html

Alex

--0000000000006da70e0593de30fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 1 Oct 2019 at 16:54, Stephen K Jo=
lley &lt;<a href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">A significant per=
formance problem has been found on the autobuilder where some builds are sc=
aling in time badly as the sstate cache grows, taking 12 hours or more in s=
ome cases. Unfortunately nobody seems motivated to help work on this kind o=
f issue.</span></p>
</div></blockquote><div><br></div><div>Wait a moment, I believe there is a =
patch for this issue?</div><div><a href=3D"http://lists.openembedded.org/pi=
permail/openembedded-core/2019-September/287445.html">http://lists.openembe=
dded.org/pipermail/openembedded-core/2019-September/287445.html</a></div><d=
iv><br></div><div>Alex<br> </div></div></div>

--0000000000006da70e0593de30fe--
