Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 323E6606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 20:38:30 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id f6so117213531ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gwRebQ36JmLDYYADx2ja/Bd8caYCgMSXbryidGXhjng=;
	b=BuiaB3jBAoHURu5hmH0e2sSdeubnlwDDXlLVFdr1uKx6SYfPxg5vL8uPFm/F+M3pRh
	cLJSw8/rdbQQXfsV75bO7U2R1tax//u3I+kFFRqzwFTLq9SH5Qzz5EdRkvIiwDkKpwg3
	FJq9HUloybIRC/mNEXZrYVRwW9/sUsb2cocn1Vl7Y9XqcDZf7p4SfR/8Rkz9gW51n08Z
	KWWwc4lpNDeUrU/kYAQAChZy75cN0VulCWcDeBdwlu32s/kkd47nUWMezlXEEhahvNXK
	VmlS9CQDveWMsoBHemEs9dEOu3W8BSuPqGYBJf3lCnNweBkkPOmqtZnfszZYI8fWPcBO
	yqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gwRebQ36JmLDYYADx2ja/Bd8caYCgMSXbryidGXhjng=;
	b=ln+c/n89RC4NgMHWWM3cQ4T1OdP9IoxFtQ1+ohzif/kj3iugcn7P88zvL6qkqG6SH4
	4ZTBbEdCk2ImeBuLpumnsbJCqV5iEiFAGKZA9/pNysQYeq1ohD+p/j8eMXeRa+o6kWe9
	SIVAxRW7yA+F4xXJzlb4vgi4i8enf5OQC/I/hMJpyAv3J6VG3u7eN7+/zjs9OB88jaGs
	XtR6JTgzITDMFIxvfAdfliUibPUYl83y3xIB9gxJqr1s5oo9+wljVSPZtO68nU8EdYwX
	NAJAevBJz+EbL6YW3x/YYk5JGvhWh6dPj5TviIBcaSnpkd44mTYLUMi5l1xyNviQRQZR
	Cn+Q==
X-Gm-Message-State: AEkoouuRKS1Q8a90/d+00ZKNbdFfDS4SHg7T5lupOuRaAHgq16HsG+P3xQQkoe03JLUoGJKGdKrkjd0WhkN9T1xE
X-Received: by 10.36.87.140 with SMTP id u134mr23252487ita.38.1469479111225;
	Mon, 25 Jul 2016 13:38:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 25 Jul 2016 13:38:11 -0700 (PDT)
In-Reply-To: <2357580.smmtpJgC3U@peggleto-mobl.ger.corp.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
	<1789904.LeABdRZOVU@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LY0eNa94dkMuLow_hSh2_V=thCxGAVexfEf3v4fpXrgDA@mail.gmail.com>
	<2357580.smmtpJgC3U@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jul 2016 21:38:11 +0100
Message-ID: <CAJTo0Lb09LQuOS=VOzNbSm1EXtzyfqPYHzWERwcR+pSc4M9Oew@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Extensible SDK improvements
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
X-List-Received-Date: Mon, 25 Jul 2016 20:38:31 -0000
Content-Type: multipart/alternative; boundary=001a1135018c6e0fbe05387bc42c

--001a1135018c6e0fbe05387bc42c
Content-Type: text/plain; charset=UTF-8

On 25 July 2016 at 21:33, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> > The error reporting tool use to replace TOPDIR with " " but that got
> > confusing as it looked like either whitespace was being added, or the
> > sysroot was missing in various places.  It now replaces the paths with
> > TOPDIR or WORKDIR to hide these personal paths in the logs for both
> privacy
> > and to let errors.yp have a better chance of finding matching logs.
>
> Yep that makes sense. For the autobuilder it's a minor inconvenience but
> you
> can just click through and find the real log so no big deal.


I find that it actually makes the logs easier to read as there are less
giant paths to read, but yeah the full logs are on the AB still.

Ross

--001a1135018c6e0fbe05387bc42c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 July 2016 at 21:33, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">&gt; The error reporting tool use to replace TOPDIR with &quot; &q=
uot; but that got<br>
&gt; confusing as it looked like either whitespace was being added, or the<=
br>
&gt; sysroot was missing in various places.=C2=A0 It now replaces the paths=
 with<br>
&gt; TOPDIR or WORKDIR to hide these personal paths in the logs for both pr=
ivacy<br>
&gt; and to let errors.yp have a better chance of finding matching logs.<br=
>
<br>
</span>Yep that makes sense. For the autobuilder it&#39;s a minor inconveni=
ence but you<br>
can just click through and find the real log so no big deal.</blockquote></=
div><br>I find that it actually makes the logs easier to read as there are =
less giant paths to read, but yeah the full logs are on the AB still.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a1135018c6e0fbe05387bc42c--
