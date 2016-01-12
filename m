Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3D578731F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 10:24:31 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id z14so122213954igp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aowsy0sx33x6Y/ySAMJ4cY9Ey5ku9f4WhPj0tJJmlIM=;
	b=p9Ndyglcv9ABuxpHVb9Cv/3ZgKtKsZ17I59qCGiYLF+/CNUI+HsOF0Lwpy6sR8/oTZ
	Vtvx92pXnpxTwsizrIW2KOPyGGIOSWf89KhUps8CD5oow6Smge0Pb7G4oonKSHCDmvfv
	kFwKtZEUZ+7siwihbpa1bHoQA0hFvCctl8hdR74xYwlfcDOq0EUGXDRdBdrgAF37LzVL
	yW4bBM/Njp0D72MKxITHE0gQOJscBIlrE2V3Mfo/+l2LrjFpZJcaQWHKXzpuWFQm5BoE
	A6JCbqGJbO6JRuSvpJNgcEHr4h32v5qGS8Jrnp9p/qNPfZjC2QftvUzvJnEUDjATk+Ff
	1EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aowsy0sx33x6Y/ySAMJ4cY9Ey5ku9f4WhPj0tJJmlIM=;
	b=IZ7l6/ozNyWnQ3owxSyGgVWTvks1MOkwZpLr02cSuoRkEoZRh8FPc+xVlPDUtJXRT8
	t68EtjnA4A3GYAHFcorU4JqCYYifXiCwR4k9VKcx24LR9RpG7vNW7l5MJRRs4OnLqrks
	xG/PNi+3nuxNhAqQl7IQLaUpdDInG4w+zntnDUpYs4IdN6poCPoNMxDe+UEP7vd0N9X4
	vvKS+2ir4dOvwAh4bliB/mr8bbcPV1nt0JH5gyryjNsm36zuqBsQCsFj0P00fdEjGeNn
	ryc/VceijEjofbvaVUN1dY246rcnGgvEx4h8thl6/hSST200sb7txIi7ffjsRcYju8Ux
	qnNA==
X-Gm-Message-State: ALoCoQnMNsNrHZE4u/qkiJFjvxLvV+3zsnHrR+wDMn493n8egXLUjgkT4PISsIlVE3jRRtGTYuX5c1Uh6FMejgWvML0qNzo+eZQbBQHnU1Nsdr19ZSMHQxg=
X-Received: by 10.50.43.133 with SMTP id w5mr16109324igl.52.1452594272410;
	Tue, 12 Jan 2016 02:24:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 12 Jan 2016 02:24:13 -0800 (PST)
In-Reply-To: <CAJ86T=XLn=tLvxv+aOH4=Z0ma3B7A_fuuESZYUZA=K4KKsLOfg@mail.gmail.com>
References: <CAJTo0LaHTkODDiLfOYDQoFC-VBDD5h4XctAidjzRfyYGgdAfKA@mail.gmail.com>
	<1452020669-24036-1-git-send-email-haris.okanovic@ni.com>
	<CAJ86T=XLn=tLvxv+aOH4=Z0ma3B7A_fuuESZYUZA=K4KKsLOfg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jan 2016 10:24:13 +0000
Message-ID: <CAJTo0LbktbQ2h=LCveqxqFuuxajwZAYGJT3M9JcVNqTqf0WwJQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Haris Okanovic <haris.okanovic@ni.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] tzdata: Make /etc/timezone optional
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
X-List-Received-Date: Tue, 12 Jan 2016 10:24:32 -0000
Content-Type: multipart/alternative; boundary=089e01175f2b9c3ad1052920750f

--089e01175f2b9c3ad1052920750f
Content-Type: text/plain; charset=UTF-8

On 12 January 2016 at 04:03, Andre McCurdy <armccurdy@gmail.com> wrote:

> You lose a style point for == in a shell script...
>

Patch sent.  We really need to scan for bashisms in our shell fragments.

Ross

--089e01175f2b9c3ad1052920750f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 January 2016 at 04:03, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":22z" class=3D"a=
3s" style=3D"overflow:hidden">You lose a style point for =3D=3D in a shell =
script...</div></blockquote><div><br></div><div>Patch sent.=C2=A0 We really=
 need to scan for bashisms in our shell fragments.</div><div><br></div><div=
>Ross=C2=A0</div></div></div></div>

--089e01175f2b9c3ad1052920750f--
