Return-Path: <anibal.limon@linaro.org>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4B56E79CEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 17:25:21 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id c205so25747036vsd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7BBxtyI7yPkXEvkIl2irN63B6b/kQprYoPGnxd4kGDg=;
	b=Q1LM9xjvdLQcC3f3aA77SLQm8wPjQastXD4ghwd2umT4Vx4Odh+smLXx8aEFVj5muZ
	jRXkDMGlDh7NtOC8E31IyEb0JGdGS58O6wzHR9G4mO4dQf5CJc61GAHvUbKUUJY861Wj
	/7PI5FJ3v1LXsT465844VQo3v8t684lxtyNbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7BBxtyI7yPkXEvkIl2irN63B6b/kQprYoPGnxd4kGDg=;
	b=pnYGxGSsylIMBR9Kb2KllMVCjWXn+rHbuxq47zH5/aTKjvg4bn1F9gb293PRWIDVlu
	ydF8RYxcBluEfzQaF1nfD686lufNyZp21BMok3kZ1eP3SWdRBFQw7GQnUy8ZCmq9N4HH
	uLyhdTwEygNqr0Rao75CjX3VnIaRZDgCFHszbMjqyUy4/A0wErSZBQjbpO6xO7LmDRTT
	FElVpllV1YweHOdIsuHk4L0Unc8X4afirHp+lbpIKtrmEg0ZMy7SJFLgTo8ah/AhNzkL
	Q819Zoa6WCk/1c4pib4Ye/1X0UdrJrDY2dJ24p6w4v5HCck7OCgzTz+1ZO9+C+al89Qu
	r+wQ==
X-Gm-Message-State: ABuFfoj8FcgmmWk4D0rYSYXX19a60ciMzSfgM/ts2mTkC5UdsyeEIoL1
	gahNXPEWecuUYhNv7moYGM8aSbdYSDKJhbxFqCyH6g==
X-Google-Smtp-Source: ACcGV622W/A+sLhrIgQrQIH/qCRKEwreRCpdCBHtGTl5o4l2oHfNvl/rktJT2DwwQg7qn6yINItcIrmbImRV878Pbi8=
X-Received: by 2002:a67:2cd0:: with SMTP id
	s199mr14597978vss.117.1539969922097; 
	Fri, 19 Oct 2018 10:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20181017230044.24098-1-anibal.limon@linaro.org>
	<a15a465d714ee34a86f62da18e17972d40b15f00.camel@linuxfoundation.org>
In-Reply-To: <a15a465d714ee34a86f62da18e17972d40b15f00.camel@linuxfoundation.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Fri, 19 Oct 2018 12:25:11 -0500
Message-ID: <CA+_Aqivb7BOhA22GjFEREVGtD8p+o1+U1Zwwo2hgM482crZuZw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] meta/classes/testexport: Use manfiest filenames for package and testdata
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
X-List-Received-Date: Fri, 19 Oct 2018 17:25:21 -0000
Content-Type: multipart/alternative; boundary="0000000000002c077805789830b2"

--0000000000002c077805789830b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I need to update the selftest testcase, i will send v2.

I send other patch, can you take a look?

http://lists.openembedded.org/pipermail/openembedded-core/2018-October/1567=
62.html

Regards,
Anibal

On Thu, 18 Oct 2018 at 10:43, <richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2018-10-17 at 18:00 -0500, An=C3=ADbal Lim=C3=B3n wrote:
> > Is clear to know for what image and machine the testexport package
> > manifest and testdata was build.
> >
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> > ---
> >  meta/classes/testexport.bbclass  | 4 ++--
> >  meta/lib/oeqa/runtime/context.py | 9 +++++++--
> >  2 files changed, 9 insertions(+), 4 deletions(-)
>
> I think this breaks oe-selftest:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/28/builds/132/ste=
ps/7/logs/step2d
>
> Cheers,
>
> Richard
>
>

--0000000000002c077805789830b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Richard,<div><br></div><div>I need to =
update the selftest testcase, i will send v2.</div><div><br></div><div>I se=
nd other patch, can you take a=C2=A0look?</div><div><br></div><div><a href=
=3D"http://lists.openembedded.org/pipermail/openembedded-core/2018-October/=
156762.html">http://lists.openembedded.org/pipermail/openembedded-core/2018=
-October/156762.html</a><br></div><div><br></div><div>Regards,</div><div>An=
ibal</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Th=
u, 18 Oct 2018 at 10:43, &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Wed, 2018-10-17 at 18:00 -0500, An=C3=ADbal Lim=
=C3=B3n wrote:<br>
&gt; Is clear to know for what image and machine the testexport package<br>
&gt; manifest and testdata was build.<br>
&gt; <br>
&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.lim=
on@linaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/testexport.bbclass=C2=A0 | 4 ++--<br>
&gt;=C2=A0 meta/lib/oeqa/runtime/context.py | 9 +++++++--<br>
&gt;=C2=A0 2 files changed, 9 insertions(+), 4 deletions(-)<br>
<br>
I think this breaks oe-selftest:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/28/build=
s/132/steps/7/logs/step2d" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/28/builds/132/steps/7/logs/ste=
p2d</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000002c077805789830b2--
