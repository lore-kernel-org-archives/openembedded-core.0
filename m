Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9A44A60670
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 11:03:06 +0000 (UTC)
Received: by qcjl8 with SMTP id l8so9354008qcj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 04:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=a/O4Fu5yd7RdMfeOPV59mqtFFC6PYHmA4VDKfKfl78g=;
	b=ShYhc3U5VhLOuC+fAnXsXJ1MzmY55J92fuU3u0x1QEHmLQUf/uvCfYBUSwP0dkIITN
	2c0sPC5pFl8KL5a12Vs25Dr3iBb051GK0JdgkSYQlu6PqiRJf8m3YJeNh6RsuYS/B5c4
	Fkx0MXPTWKTlYkQ2Mk5fTl+kAKviLmvAHWrkF/snAuUC7yjC7n9LQnsb+c0TOfvWTvdY
	NavWCz4nVBTwWgj1vSDdKuozDzcLYwg5mNkWFvNy21B7SbFRIRnghDJ84akOscOwMVEc
	Ly8szgGJmFrPpqJ6f/ICbw4wQB/CsP6oIBiqWiWNsKR13TKDTZnNCiQvLX4sxJthPsrM
	QjDQ==
X-Gm-Message-State: ALoCoQmhit5KH6RnRaCcR6BNa6Q1m0dbCioeVitiHn38mqLQ8wvdXvOC22rAiWSwZ1xsZ75/duTC
X-Received: by 10.140.231.19 with SMTP id b19mr17826001qhc.22.1434106987336;
	Fri, 12 Jun 2015 04:03:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 12 Jun 2015 04:02:46 -0700 (PDT)
In-Reply-To: <e8e90b46fb79d09ae36e4df169bdde25cd6a1f1f.1434079315.git.liezhi.yang@windriver.com>
References: <cover.1434079315.git.liezhi.yang@windriver.com>
	<e8e90b46fb79d09ae36e4df169bdde25cd6a1f1f.1434079315.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jun 2015 12:02:46 +0100
Message-ID: <CAJTo0LaNmdRWusSMab4DfL6uWktYswrTg--QGKbKUzjOoyGg3A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Remove invalid ac_cv
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
X-List-Received-Date: Fri, 12 Jun 2015 11:03:09 -0000
Content-Type: multipart/alternative; boundary=001a11c12f008cf1160518500d45

--001a11c12f008cf1160518500d45
Content-Type: text/plain; charset=UTF-8

On 12 June 2015 at 04:23, Robert Yang <liezhi.yang@windriver.com> wrote:

> -PACKAGECONFIG[bluez] =
> "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
>

This patch series has very little context (what's ac_cv_invalid, for a
start), but strace 4.10 definitely still contains a check for the bluetooth
header, so you're removing non-deterministic fixes:

AC_CHECK_HEADERS(m4_normalize([
        asm/cachectl.h
        asm/sysmips.h
        bluetooth/bluetooth.h
...

Ross

--001a11c12f008cf1160518500d45
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 June 2015 at 04:23, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":2ys" class=3D"" style=
=3D"overflow:hidden">-PACKAGECONFIG[bluez] =3D &quot;ac_cv_header_bluetooth=
_bluetooth_h=3Dyes,ac_cv_header_bluetooth_bluetooth_h=3Dno,${BLUEZ}&quot;<b=
r></div></blockquote></div><br>This patch series has very little context (w=
hat&#39;s ac_cv_invalid, for a start), but strace 4.10 definitely still con=
tains a check for the bluetooth header, so you&#39;re removing non-determin=
istic fixes:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra"><div class=3D"gmail_extra">AC_CHECK_HEADERS(m4_normalize([</div><div=
 class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 asm/cachectl.h</div><div=
 class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 asm/sysmips.h</div><div =
class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 bluetooth/bluetooth.h</di=
v><div class=3D"gmail_extra">...</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div></div>

--001a11c12f008cf1160518500d45--
