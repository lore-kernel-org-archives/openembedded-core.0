Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
	[209.85.222.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2B97F9A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:53:05 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id z9so1282253uan.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 09:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7RzG8R6BKrNDqMMU7iOMhV7rbuPxT5UUJNU4j5PVM4M=;
	b=RFwxCvpk+LLteodvXnMQZc3GYM8fO0XDDqMRqev1GOv5p4tqf56QYkD4oc+PPUGc8r
	lX4XFzPg+QR9gymtMAOJ4efJh5PzC7+3zj7nAzvJWMBwsdHFg5tZk8gvy9DBSjaAN7mO
	wNbcFfWk8BG23uaZkwz7o7o/+Gons61DxYhggrE0b3NGWNnHuGmB4PS7vaW92Q0qTgqb
	34z179TU1xdSKI5JApEQOD8W/Yby/5MNhXUB+gm9Z7JBBfr9QOrZsIql2btzDOFoZ96J
	b4ErzNZ3xXEKkbBBGk/QgQM6fBwbMR1yQei2hq+sOAE+e7lAMTtU1unpqvREe3k3yvn0
	A3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7RzG8R6BKrNDqMMU7iOMhV7rbuPxT5UUJNU4j5PVM4M=;
	b=QgHEGhJp1QSYxs8eVv6lAWAjFSuNnuF+gIf3+Hi+IYD9iKqIoMkHzU6tHenAUEe174
	7K3Yz3E/YxNy4Co9h7UzUMX6qbaKnlqdGqN/uWwQLzjhDpVQfktupwR8bLIdfX5/PxCf
	cA18rqNkHCPkZ2S2ZH6EVWn0T9cunohnZA2ufMZS2iXXuBeDX/w3i+9MVAfhKvnZNHYG
	x8liC5ct3tmFAheUdogn40Y1UmEGvdcre2UMcOmjb9MKxQonXmnfPyj+9xfNItpuhRLp
	ps9XApV85p+03WGAJzFX9y2jAj5rjyUyMmLSdRhoYKvJ75hglkCjimHwCq7/ZfNWZRqB
	XnQA==
X-Gm-Message-State: APjAAAXvfvMsendnHQSIb3yYdXhhaVILQM26UNQ04HB2aYBGkK9GMbl0
	AvtAFaF5uwJhJW4ggkfbn4T3/EB24QzLh4lXZnE=
X-Google-Smtp-Source: APXvYqw7vEC9kgFhX69a0ERFwhWj4jmhZfs7sJ+hqsOv5MwljXBw6q9aihIyjPz2r9UkS+emIrMVgHCZgXczonjNzjs=
X-Received: by 2002:ab0:3399:: with SMTP id y25mr6864439uap.100.1574358786374; 
	Thu, 21 Nov 2019 09:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20191121174318.4512-1-Trevor.Gamblin@windriver.com>
In-Reply-To: <20191121174318.4512-1-Trevor.Gamblin@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Nov 2019 18:52:55 +0100
Message-ID: <CANNYZj9UeD13ytgBgQ45G3B5kGX3bA-HnMVkunozwL=_uZpGHQ@mail.gmail.com>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Adding coreutils ptest to oe-core
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
X-List-Received-Date: Thu, 21 Nov 2019 17:53:05 -0000
Content-Type: multipart/alternative; boundary="00000000000036002a0597def81a"

--00000000000036002a0597def81a
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Nov 2019 at 18:43, Trevor Gamblin <Trevor.Gamblin@windriver.com>
wrote:

> MACHINE    | PASS | FAIL | SKIP | TOTAL |
> qemux86-64 |  481 |    2 |  132 |   615 |
> qemuarm64  |  481 |    2 |  132 |   615 |
> MACHINE    | PASS | FAIL | SKIP | TOTAL |
> qemux86-64 |  483 |    1 |  131 |   615 |
> qemuarm64  |  483 |    1 |  131 |   615 |
>

One (and two) is very close to zero. Can you reach that?

Alex

--00000000000036002a0597def81a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 21 Nov 2019 at 18:43, Trevor Gamblin &lt;<a href=3D"mailto:T=
revor.Gamblin@windriver.com">Trevor.Gamblin@windriver.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">MACHINE=C2=A0 =C2=
=A0 | PASS | FAIL | SKIP | TOTAL |<br>
qemux86-64 |=C2=A0 481 |=C2=A0 =C2=A0 2 |=C2=A0 132 |=C2=A0 =C2=A0615 |<br>
qemuarm64=C2=A0 |=C2=A0 481 |=C2=A0 =C2=A0 2 |=C2=A0 132 |=C2=A0 =C2=A0615 =
|<br>
MACHINE=C2=A0 =C2=A0 | PASS | FAIL | SKIP | TOTAL |<br>
qemux86-64 |=C2=A0 483 |=C2=A0 =C2=A0 1 |=C2=A0 131 |=C2=A0 =C2=A0615 |<br>
qemuarm64=C2=A0 |=C2=A0 483 |=C2=A0 =C2=A0 1 |=C2=A0 131 |=C2=A0 =C2=A0615 =
|<br></blockquote><div><br></div><div>One (and two) is very close to zero. =
Can you reach that?</div><div><br></div><div>Alex<br></div></div></div>

--00000000000036002a0597def81a--
