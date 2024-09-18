Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549E9CDD54F
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 17:14:19 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.21038.1726679651971508436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 10:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d4FUbZPQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.49, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365c512b00so8399603e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 10:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726679650; x=1727284450; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S2w0lIZeno292BJf70gPLLc1gQNugjoA6tOV/O0dOs0=;
        b=d4FUbZPQA2u/EezxzKdAwi2OSX+vByidahVjddn/pY9GDTl0jGr/jRJIL6LgjeHRrC
         NLYixFZPLDLjDhe2+d5klU9hNpZxJdqR4l9xKU4vkpDfu/WIRSEWbr3pKrxcV8/ZJeOz
         rLhHZDNy2WIsg6wJFVnRLjIpM3+PO1hurXqRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726679650; x=1727284450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2w0lIZeno292BJf70gPLLc1gQNugjoA6tOV/O0dOs0=;
        b=V0RNmEPALP6E3dWVKELHUA886ZtZatFPx5ooilZOY1RUEmCFrUb43E9ZdSd1Lq5HZ5
         jn7SX4V8Rxrje85SPmD8B9raWmbhCrIKr3wgzQRiMNH2NX+7cCMo+UJXqumoKxFzKizn
         OWctLCuyal83YzGQUrYv1fkovbRyz4+IwrWihF6sutSAWL561e2WngHQ8jQWWkOR6am6
         oJ9uq83SAWNR8lzp48a6btgiFZNkV4hiSVrZJYekE3y5TZc+bsReRORIzCuIoZ8ap4nm
         LyOtR6qmqs7yy8MzPx5PBXPtjhPxt45Fh8aMdTK2ic23jRY2rpq1UMF8W1ZdrfTSEQWg
         HUjQ==
X-Gm-Message-State: AOJu0YxqR2VSqhf3lOrH1TPrC5sIDDjLtABUOy3+h8tzKfLKd2g3Sj5r
	fDZ0NYvqH3NHbfJAOneA2ye8ZygR6TwfZYrBMONI22OzpLESGzt+MH8tGQFO2sxS0+v8bU9j6TM
	0CAxobDuAxzC0CQMUscd62C6jESqChRFqV1fLyw==
X-Google-Smtp-Source: AGHT+IHajbjQgm+VrEPjTZ+sCi1DWoIcKGxjFUklFQAJy2V0LJwsLH5WHdJq6J7Ghz8pkf8iUA/xF+dZtwXMLuVSVdc=
X-Received: by 2002:a05:6512:104c:b0:52c:dc6f:75a3 with SMTP id
 2adb3069b0e04-53678feb159mr14265933e87.40.1726679649878; Wed, 18 Sep 2024
 10:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <dc8deba20a5d6f5fdc521415df9427fb8ef8576a.camel@linuxfoundation.org>
In-Reply-To: <dc8deba20a5d6f5fdc521415df9427fb8ef8576a.camel@linuxfoundation.org>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 18 Sep 2024 10:13:58 -0700
Message-ID: <CADfgfoa=7xRTBgoGpdrB0=fZc5n37Q2QW+sM-yBedELHTB5VBw@mail.gmail.com>
Subject: Re: userns issues on Ubunu 24.04/24.10
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002c27b2062267efb8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 17:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204654

--0000000000002c27b2062267efb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll revert back to disabling the restriction as outlined at
https://gitlab.com/apparmor/apparmor/-/wikis/unprivileged_userns_restrictio=
n#permanently-disabling-the-restriction.
That should have a similar effect and follow apparmor norms.


On Wed, Sep 18, 2024 at 4:16=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I wanted to give people some real world data on the userns issues on
> Ubuntu 24.04 and 24.10.
>
> The advice has been to create /etc/apparmor.d/bitbake:
>
> abi <abi/4.0>,
> include <tunables/global>
> profile bitbake /**/bitbake/bin/bitbake flags=3D(unconfined) {
>         userns,
> }
> EOF
>
> and then reparse the config:
>
> sudo apparmor_parser -r /etc/apparmor.d/bitbake
>
> This "works" to a point however we started seeing weird failures on
> some of the new autobuilder workers even with this applied.
>
> The problem is BB_SERVER_TIMEOUT=3D60 the autobuilder uses which means
> task execution commands may not be started with a "bitbake" command but
> could be started by devtool or something else. Those don't match the
> glob above.
>
> So far the only reliable solution I've found was to effectively disable
> the userns restrictions with a /** glob.
>
> I wanted to try and stop someone else scratching their head over why
> this fails.
>
> Cheers,
>
> Richard
>
>
>
>

--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--0000000000002c27b2062267efb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ll revert back to disabling the restriction as outli=
ned at=C2=A0<a href=3D"https://gitlab.com/apparmor/apparmor/-/wikis/unprivi=
leged_userns_restriction#permanently-disabling-the-restriction">https://git=
lab.com/apparmor/apparmor/-/wikis/unprivileged_userns_restriction#permanent=
ly-disabling-the-restriction</a>. That should have a similar effect and fol=
low apparmor norms.<div><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 18, 2024 at 4:16=E2=80=AFAM R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I wanted to give people some real world da=
ta on the userns issues on<br>
Ubuntu 24.04 and 24.10.<br>
<br>
The advice has been to create /etc/apparmor.d/bitbake:<br>
<br>
abi &lt;abi/4.0&gt;,<br>
include &lt;tunables/global&gt;<br>
profile bitbake /**/bitbake/bin/bitbake flags=3D(unconfined) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 userns,<br>
}<br>
EOF<br>
<br>
and then reparse the config:<br>
<br>
sudo apparmor_parser -r /etc/apparmor.d/bitbake<br>
<br>
This &quot;works&quot; to a point however we started seeing weird failures =
on<br>
some of the new autobuilder workers even with this applied.<br>
<br>
The problem is BB_SERVER_TIMEOUT=3D60 the autobuilder uses which means<br>
task execution commands may not be started with a &quot;bitbake&quot; comma=
nd but<br>
could be started by devtool or something else. Those don&#39;t match the<br=
>
glob above.<br>
<br>
So far the only reliable solution I&#39;ve found was to effectively disable=
<br>
the userns restrictions with a /** glob.<br>
<br>
I wanted to try and stop someone else scratching their head over why<br>
this fails.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project</div><=
div>Systems Operations Engineer</div></div></div>

--0000000000002c27b2062267efb8--

