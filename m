Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 631C760125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 20:18:28 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id h190so48853056ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 13:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FCyrpRongs/HtOCTB1kROx8iHVSiBlDHpPeqaMS93yU=;
	b=xHy4lhYPajDDgtLcQMyU+GmLlnoEEydRcu8VrLlgnQ539Or8dSEF05/ThnGTfF0jav
	06MbwWh00u8CI62pJBc+QVnpGqiCyPBt4ehBeP1jfpP7ApPtARzF/zhoWjSxC14MfmfL
	bMfphD9PJRV5wNzMCtq5REJC+3/bErOILtL6F/W9WiG6TBhtYhnzVSTltzsNO5/n4x31
	cbBb7kaBaPaFouFKHNr8gO3zNukwzz3C9j2WdIL7i4SRrANHweSeNOHJZhYo5etINBcz
	0+lMGqhmhqDqe5p02unSnfNPM6ione0OAcKFWzWA7rzvJqS5OrWEJ66VE0D7jXcfTeaD
	eX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FCyrpRongs/HtOCTB1kROx8iHVSiBlDHpPeqaMS93yU=;
	b=LdO6qD9bQXv+wEKdFoPWzEiK2s2MZv+Ut/Xq6y7RWuettfpJoJ7vJfuGYVI5b3lC1f
	dXZDnjkjzeEe8HIL/kN4ZiptY33yvfxXSAl713hERxWwqfl1zIxBgnbH4OoH6md7yOOB
	71g74WcjtQro1Ifzzh5Z5C4m7rTzWPcm5AWOwY5RUSnKYZ4wJIqaQnyb7pNB0EN+TYCl
	3RoQNN2+4A/5kIvxHsn0pnt56vcZPFncrO6Ll8FKtsGlFLrCfIPNbTt+PvbVCuMp9Q4F
	GAsV36DRBXCGT0bND5Fnhf2XHBvg7lhGSXOnYpwGqJDTAJ4yZzZbxT/QR2M2KgePHVDr
	A/tg==
X-Gm-Message-State: ALyK8tKD3mEdmo3oomxkzipckNW1ktry6zx0muDluAvCzoQn4qzwMBASnI2wouyIlm73hEfi2X0gEAwRLk6L9gl8
X-Received: by 10.36.57.211 with SMTP id l202mr17155705ita.22.1466626709695;
	Wed, 22 Jun 2016 13:18:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 22 Jun 2016 13:18:10 -0700 (PDT)
In-Reply-To: <CALbNGRRsxRZompgFMb+EtLdSXdnCZbUgXFmuf8WC8rztncox5w@mail.gmail.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
	<cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
	<e12014df714d835b217acfbfbcfc1b5d1b4408db.1465891164.git.jussi.kukkonen@intel.com>
	<CALbNGRRsxRZompgFMb+EtLdSXdnCZbUgXFmuf8WC8rztncox5w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jun 2016 21:18:10 +0100
Message-ID: <CAJTo0LaFO1qPMVWK_kk3H7mxviFuV4=_a7-4H5KSU_FTTq1svw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 10/30] vte: Upgrade to 0.44.1
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
X-List-Received-Date: Wed, 22 Jun 2016 20:18:29 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca0cd8f50535e3a47e

--001a114ab3ca0cd8f50535e3a47e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 June 2016 at 19:24, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
>
wrote:

> Could we move vte to meta-oe to avoid further world blacklisting?
>

This was the agreement in the other thread - Mark was going to restore the
old version with a new PN for meta-xfce.

Ross

--001a114ab3ca0cd8f50535e3a47e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 June 2016 at 19:24, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=
=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@go=
oglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":5v1" class=3D"a3s aXjCH m155795c864c68b65">Could we move vte to meta-=
oe to avoid further world blacklisting?<br></div></blockquote><div><br></di=
v><div>This was the agreement in the other thread - Mark was going to resto=
re the old version with a new PN for meta-xfce.</div><div><br></div><div>Ro=
ss</div></div><br></div></div>

--001a114ab3ca0cd8f50535e3a47e--
