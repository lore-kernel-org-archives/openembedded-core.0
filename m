Return-Path: <kergoth@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0A986719F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 15:16:38 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id s68so11790830ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 07:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=yHaVNqtPcWwMEp2DndBuNW37JkWi8hn8ZV5yRzfHqdU=;
	b=D4uhkHQYg1Qxiv7Ei44C9B0OujtlZvRb9WeQe9Z5TTCNBFgYMys5RluVFrN5MsRJmj
	iM+8dNSWNwRq7GnIOHR1iZXpoRnuNuBHZP16dsrdLs1oAPgadJfuMFVtBy9ri/YfHmrr
	ZkkpSHdIgXgE1hrDZ/tUK1DcaYebCDrAm8TlnEmEkWmZ8agbPmC5BlL2G6rVccnRQA43
	W1TuPm9kz9XZhM+lmkqxI2PYXJ9AZitqXxESj0csnk8iBrDF3EYH9oWJmTjIXYdcnptJ
	X41boQWLaywtpefh8A6s/i4RbGnzgtxN9WJx6SpOuaQScuyfXAlHUz/P5xQPlfwDjS62
	BFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=yHaVNqtPcWwMEp2DndBuNW37JkWi8hn8ZV5yRzfHqdU=;
	b=Q99O4ao9vNysZ5YOYy/x8+FUPiSmSOgTPnU/sOlRtT1ZC2csHQsV4oXYiPcTBhE8Ff
	VBLxgghfWOuyar5kGZud9fNLEK4HQdpuOhFZGEeH0hQqQokydIHl2oj9TWMkQVTZnFVX
	QxRYgDLeio6PYPmpcGzHZwqpyB4681zhOyBlXZxa6CCisxjmCQ2WpFwRd7QEF/6ETWkF
	ewKyp94MX07DFkV80Y8lL1lAwQvR8SHSGday3lqCJf0TZtlje0yf9Lv8AAkNi2d1+KHU
	I865W13LG5mKGQaxZ1mp5wroKYVsDgWNyMYGyv0eHm9kaauqfHLxcv9g486J+QYUSXr6
	XNtQ==
X-Gm-Message-State: ABUngvcIwswvQVViu5q8OVV4yI2lAC5A9ecNpUYhoyGUyvI5VefGFJvF+91NJag/oFoEy3QDNAxkkbo3qjsTNQ==
X-Received: by 10.157.51.104 with SMTP id u37mr8676938otd.9.1479223000045;
	Tue, 15 Nov 2016 07:16:40 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.29.137 with HTTP; Tue, 15 Nov 2016 07:16:19 -0800 (PST)
In-Reply-To: <20161115142842.75276-2-stephano.cetola@linux.intel.com>
References: <20161115142842.75276-1-stephano.cetola@linux.intel.com>
	<20161115142842.75276-2-stephano.cetola@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 15 Nov 2016 08:16:19 -0700
X-Google-Sender-Auth: GLmUH1yVUqgrGFiOvCW4yZDboFM
Message-ID: <CABcZANmaZUQiBGEqKDygtAwHTH=Qime=ATnU1wOvic3Rio=tBQ@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] subprocess: remove strings and migrate to direct arrays
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
X-List-Received-Date: Tue, 15 Nov 2016 15:16:39 -0000
Content-Type: multipart/alternative; boundary=001a11c16686761faf0541587181

--001a11c16686761faf0541587181
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2016 at 7:28 AM, Stephano Cetola <
stephano.cetola@linux.intel.com> wrote:

> When using subprocess call and check_output, it is better to use arrays
> rather than strings when possible to avoid whitespace and quoting
> problems.
>
> [ YOCTO #9342 ]
>
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
>

The commi message summary isn=E2=80=99t prefixed the way the OE commit mess=
age
guidelines indicate.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c16686761faf0541587181
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Nov 15, 2016 at 7:28 AM, Stephano Cetola <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:stephano.cetola@linux.intel.com" target=3D"_blank">stephano.c=
etola@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D":30r" class=3D"a3s aXjCH m1586866b975cb8dc">When using subpro=
cess call and check_output, it is better to use arrays<br>
rather than strings when possible to avoid whitespace and quoting<br>
problems.<br>
<br>
[ YOCTO #9342 ]<br>
<br>
Signed-off-by: Stephano Cetola &lt;<a href=3D"mailto:stephano.cetola@linux.=
intel.com">stephano.cetola@linux.intel.<wbr>com</a>&gt;</div></blockquote><=
/div><br>The commi message summary isn=E2=80=99t prefixed the way the OE co=
mmit message guidelines indicate.<br>-- <br><div class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth=
 dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tsl=
ib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c16686761faf0541587181--
