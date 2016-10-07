Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 421D56022E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 07:42:30 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id j37so39516889ioo.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2016 00:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=onP33FOuGNLEzYuQoEJQRUrp7FurQz1fmAW8Um654M8=;
	b=rr0sXkokem/gdklMjYDzC9xdpg6qtVm+jOrLR22xz08yaY7FHEF5NGku6In64DnOuB
	7CGpXBlojcS6v92wIUKP13wj+C9snug4YzRmTS1+xjIypdwCwWNTQerG9L2dK/7tArZm
	V1RKCVNUBn5kgQJRfx67S6lTZxtBRU4YZUOgdzivyf2nqDAzeQi5B0Wg1yAq+lbNGb0e
	EMiFxAZ3rkHjnBhrMnGOemmyoCKT8drtr9WhE89YhH5DDuYuWbvKoKFCY1puy4EVuMcc
	0w1QvEbHpchu7MPd+Te0FvYhRWe3b3Fl720kX0FJqIToF6VYIijCnS8Q5A/k5SVHfuPY
	S1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=onP33FOuGNLEzYuQoEJQRUrp7FurQz1fmAW8Um654M8=;
	b=f9jvHpyGytvtDf0ACK+pz+2fGiN9KTeXJdgcrsAPUByxchBlnA0SGI1slEKLry8ZtP
	LEiSIiTufEEPa42J0ItGPL3jVAiGyJLPTcsAAzrpxmb+CTUzAqhYZishxly3YiHRIISO
	5JfK+oxeo8VLQkyWgzURJ8SILgXJP/mg1qiG7PqKh49pT+9Piz6DIZofsG6rLwiGjg1w
	Evu3lFQjl4ToVGW2XB+KUP1YG5+smGoHZWXss+lPuaPrV/aHfI88bPZ/0WPkV+hH8zEq
	2eQklGEM5yAW2e73FlOCm3YAYuSYSgfDLaTWXxXCUT7psRyw0si77ckR7yKjOM3cRkKX
	VU7A==
X-Gm-Message-State: AA6/9Rl2fZ15eGpwa+uXx3TH/cWqLtenMAKBfho5+yGPtJsbLMUjSL72ThBVn2j0VtijOSEEwmkr03C3Db3VLfPX
X-Received: by 10.107.5.72 with SMTP id 69mr6056772iof.132.1475826151396; Fri,
	07 Oct 2016 00:42:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Fri, 7 Oct 2016 00:42:10 -0700 (PDT)
In-Reply-To: <1475812376-20184-1-git-send-email-akuster808@gmail.com>
References: <1475812376-20184-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Oct 2016 08:42:10 +0100
Message-ID: <CAJTo0LbLhZAeRahpMLU5dXogjRSqwm1QiHfRyOG9iHwHge+8oQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mklibs-native: update broken SRC_URI
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
X-List-Received-Date: Fri, 07 Oct 2016 07:42:31 -0000
Content-Type: multipart/alternative; boundary=001a113efe2c81344d053e418d1b

--001a113efe2c81344d053e418d1b
Content-Type: text/plain; charset=UTF-8

On 7 October 2016 at 04:52, Armin Kuster <akuster808@gmail.com> wrote:

>
> -SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${
> BPN}_${PV}.tar.xz \
> +SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mklibs/${
> BPN}_${PV}.tar.xz \


Once the archive disappears from ubuntu releases then the same problem will
happen again, right?  Generally we've been using snapshot.debian.org as
that won't ever be removing releases.

Ross

--001a113efe2c81344d053e418d1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 October 2016 at 04:52, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><br>
-SRC_URI =3D &quot;<a href=3D"http://ftp.de.debian.org/debian/pool/main/m/m=
klibs/${BPN}_${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://ftp.=
de.debian.org/<wbr>debian/pool/main/m/mklibs/${<wbr>BPN}_${PV}.tar.xz</a> \=
<br>
+SRC_URI =3D &quot;<a href=3D"http://archive.ubuntu.com/ubuntu/pool/main/m/=
mklibs/${BPN}_${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://arc=
hive.ubuntu.com/<wbr>ubuntu/pool/main/m/mklibs/${<wbr>BPN}_${PV}.tar.xz</a>=
 \</blockquote></div><br>Once the archive disappears from ubuntu releases t=
hen the same problem will happen again, right?=C2=A0 Generally we&#39;ve be=
en using <a href=3D"http://snapshot.debian.org">snapshot.debian.org</a> as =
that won&#39;t ever be removing releases.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113efe2c81344d053e418d1b--
