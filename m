Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6408777BC8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 13:16:38 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 72so9301025itl.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 06:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ehpDR4xU2qkNnlGcmJRLHRFNTowvtMtYntpo22+LQXQ=;
	b=EZBi1NfPJdODiKivgOXF5e4Y+GpmvvRmSneAf7Q85Hu7jc1mDpFk1BhQrl7/h1otDa
	sWUSjFdgCEDYeZmwdy/YUJ1AwNazmHgdarM5JAQI/EPKcCzf83YTQWCf8blxu7b+Fgs1
	YC01dfBnn6aMsFYk8B+HgHiR8ThVvwD7ZjxFiQkJBofqOcD58et5I2Q9wvaXd4H+OC4A
	yM8l6cEtEVwPC+uGKuHHhg8CG7nUyBcQgwnwxLaxR93bHOzeKfvix3Jraw2zEZq0c+sE
	+kEZYNvm5g73tntVySW/jYcDIGh961HBDg5Fhrw11zpC3qI41WuRlpEoBZHrKt3/J7bh
	KB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ehpDR4xU2qkNnlGcmJRLHRFNTowvtMtYntpo22+LQXQ=;
	b=tFU4rRG7cKydjujq7ePX4kqNYQW8tfQ189LydnRQvrGMyQ70spCPx02/te7I+VH3OP
	5jzV3UQIxKsDiUa2c5WcSV+qW5MgnGdKw8LKB5fKD5/e3GwWi5ReXkcbiJ1fctGt4MoE
	b1PhvZkQyTYHV6UFYCEPe59sOcmVQQEEzZ1adHHZgZKhvoQbCk92GvgB2liZF38hKEWY
	hxCsU0LPE+Yd033Qb1hTZ9zkYJ7gL14NAde1mnCpzHaoHV7g+CjtGd2VXKqW22dxsZ5O
	L84TYlYgQAGei3KKEk04PIz5Jw5Kj1zd12QqXsw6C71F6X03nUBHwriOaeymJ7WoniVy
	IMBw==
X-Gm-Message-State: AMCzsaUZ/fRgTs2QVbV9oqINz+Iy9LqdosXbV5o1ly2tQ+cGO0Rdl0g2
	asl3OtlQMYQvqmsbdaaCz1k5z4+0icn7Lp66XrCx2Q==
X-Google-Smtp-Source: AOwi7QCZCvPqqTyqRGi4jciCtkBVJ+Dwv5TW3YzSkD2YURZVFuf7oomh37tnyzpyHaSe2qJfYq7XzFSSaqgaNhPZZw8=
X-Received: by 10.36.167.79 with SMTP id s15mr13214960iti.6.1507554999636;
	Mon, 09 Oct 2017 06:16:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Mon, 9 Oct 2017 06:16:19 -0700 (PDT)
In-Reply-To: <CAPyrkgyxtx7faVZu0g7WQYMiTi=FwXabiGXPExtHt_sA_OhDRQ@mail.gmail.com>
References: <1507551680-26238-1-git-send-email-pbarker@toganlabs.com>
	<20171009123030.2783.41744@do.openembedded.org>
	<CAPyrkgyxtx7faVZu0g7WQYMiTi=FwXabiGXPExtHt_sA_OhDRQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Oct 2017 14:16:19 +0100
Message-ID: <CAJTo0LZ8GBKvKEcNCej=FTSC2mEuQFeZOMo=iao43OAJM9o8oA@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpYmdjcnlwdDogRml4IGJ1aWxkaW5nIG9uIGFybXY2?=
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
X-List-Received-Date: Mon, 09 Oct 2017 13:16:38 -0000
Content-Type: multipart/alternative; boundary="f403045fb2183b99dc055b1d00a7"

--f403045fb2183b99dc055b1d00a7
Content-Type: text/plain; charset="UTF-8"

On 9 October 2017 at 13:35, Paul Barker <pbarker@toganlabs.com> wrote:

> Huh, it has got an upstream status:
>
> +Upstream-status: Backport
>
> I think this is a false-positive.
>

The test is pedantic, the tag is Upstream-Status.  Note the capitalisation.
 :)

(fixed when I queued it)

Ross

--f403045fb2183b99dc055b1d00a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 9 October 2017 at 13:35, Paul Barker <span dir=3D"ltr">=
&lt;<a href=3D"mailto:pbarker@toganlabs.com" target=3D"_blank">pbarker@toga=
nlabs.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Huh, it has got an upstream st=
atus:<br>
<br>
+Upstream-status: Backport<br>
<br>
I think this is a false-positive.<br></blockquote><div><br></div><div>The t=
est is pedantic, the tag is Upstream-Status.=C2=A0 Note the capitalisation.=
 =C2=A0:)</div><div><br></div><div>(fixed when I queued it)</div><div><br><=
/div><div>Ross=C2=A0</div></div></div></div>

--f403045fb2183b99dc055b1d00a7--
