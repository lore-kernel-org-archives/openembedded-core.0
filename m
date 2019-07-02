Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 762FB7C79F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 00:57:32 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id x15so1201037wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 17:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bn0sfPRBis3HwsBRZF32tjszK/YTzWL/zTEUhcGbT0Y=;
	b=CwEN2lfotKySlUvhHT8I6SUG5hwNqLoK5eZx3cwsY839KhJ6lx7MyrkFrhtzJP+RXy
	VgnZnSNqmot/eE+Kr+1FEpO5OvMRjTM5Uz9BxvDleLgn/HScLIzlXGV8ouDeK+T6yAyf
	Ff0g7UPkp4QMXliH5QmjaRbr+EYZxjn2js2ofh8W4FsS0ePGfjnDhVzFwicSljaGGh45
	9FG3N0S8h5I0s9tXoRWDJZTqnIMkfxd79UtI3zSx64oyUlfgfCI0EAW771V6uqkHv2Cp
	iSqEjui+NIbVzx0d5vZA6gVhT5KIcUXzhEpkOxYTtbCkXV3m5UnKzGwbLexRsscNQnhC
	caEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bn0sfPRBis3HwsBRZF32tjszK/YTzWL/zTEUhcGbT0Y=;
	b=nIRpd5ONyFqtWx7a8N4xqvTUw76bmC6xWLTzYKFCdzk2uZS6izqMm6aC+YmB3JWYC3
	eE/Ukhva7LuLdgFQljz5tyWjIYhlxtD1HsQ+lOwrAroGF0s0pUHSQ7+dnDu8BCKXZuAd
	cXmQomda9rVRkCL1tFEKj668C699yJb7S6o2EzZjXqeyS84CI56BFs+d3aoD6MJl630w
	o1csaUA5pIEtg77aMf2gmn2hzYr30G1oS71qSVqLz1xvp6FXcbfTolPtrqzUYSWjjhnh
	cN6Gbl+ZlBDtqMUtw+lAVx6wd/C6kCeRmqxccksUrrV3WGBWT1BDD25V+nZ7B6aPXB0U
	Bs2g==
X-Gm-Message-State: APjAAAUVhY2E3CruRhEaSYP+YECbmL8850HnxqTvg2XoIAzxGig+vjQO
	+0/bWJmjIe39WqlQbuEYxixdKUZGqdt011xDc0lQhA==
X-Google-Smtp-Source: APXvYqwKFPwC1lPhrvLG0m0tGkeCBBhG0rnz+F+NnOn8SdSVHh7z1ts6aF+dBvm9i+IG7R/QuQ74BThcQW1UU3QhhaU=
X-Received: by 2002:a7b:c8d4:: with SMTP id f20mr1096586wml.90.1562029052981; 
	Mon, 01 Jul 2019 17:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <ba3936e9-0582-4187-89d7-0a8f1dd4c550@gmail.com>
	<f01d7add-70c1-dfe7-597c-75c414dbe643@taitradio.com>
In-Reply-To: <f01d7add-70c1-dfe7-597c-75c414dbe643@taitradio.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 1 Jul 2019 19:57:20 -0500
Message-ID: <CAJdd5Gajd1DuCxaO3n2m5Wy7Stgq4Fn9wReR7ckMT8oQE8B4tQ@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: The state of reproducible Builds
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
X-List-Received-Date: Tue, 02 Jul 2019 00:57:32 -0000
Content-Type: multipart/alternative; boundary="000000000000d4f754058ca83ae4"

--000000000000d4f754058ca83ae4
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 1, 2019, 7:43 PM Douglas Royds <douglas.royds@taitradio.com>
wrote:

> On 2/07/19 3:58 AM, Joshua Watt wrote:
>
> > 1. Testing RPM and IPK package formats. I think RPMs will be pretty
> > easy; IPKs might be more challenging since AFAIK the tools that make
> > them don't generate reproducible output to begin with.
>
>
> This has not been my experience. I have been building reproducible ipks,
> indeed, it is the hashsums of the ipks that I've been examining. In most
> cases, the correct SOURCE_DATE_EPOCH is enough, but there have been
> cases where I've had to correct upstream projects to cope with the
> SOURCE_DATE_EPOCH or avoid the effect of differing uname settings.
>

Ah, fair enough. I must have misremembered something.


>
> > 1. HOSTTOOLS differences. There are a lot of tools listed in
> > HOSTTOOLS, and unfortunately some of them have version dependent
> > output and are used for target builds (the one I've currently stumbled
> > upon is pod2man, but I'm sure there are others). Unfortunately, one
> > could probably argue that HOSTTOOLS is somewhat antithetical to the
> > above statement, at least in regard to target builds. Any host tool
> > output that "leaks" into the target build output can result in a
> > non-reproducible build across hosts, and possibly should be avoided;
> > the alternative is to use (or mandate) the corresponding -native
> > recipe that provides that tool as a DEPENDS so that the controlled
> > internally built version is used instead. Note that this only really
> > applies target builds, not -native (or nativesdk right now). -native
> > recipes would obviously need more HOSTTOOLS to help bootstrap the
> > system. I suspect this would require reworking how HOSTOOLS works so
> > that they can be split into two categories somehow; the tools that
> > have "ubiquitous and stable" interfaces and are fine for all recipes
> > (e.g. cat, sed, true, rm, etc.) and those that are variable and should
> > only be used for -native builds (e.g. pod2man, rpcgen(?), chrpath(?),
> > tar(?)... others?). Anyone have thoughts on this?
>
>
> Perhaps reproducibility is the decision-point for adding a tool to the
> HOSTTOOLS: If the precise version of the tool has no impact on
> reproducibility (eg. cat, sed, and even gawk), it is a good candidate
> for the HOSTTOOLS. pod2man shouldn't be in the HOSTTOOLS, because we
> need to control the version.
>
>

--000000000000d4f754058ca83ae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jul 1, 2019, 7:43 PM Douglas Royds &lt;<a href=
=3D"mailto:douglas.royds@taitradio.com">douglas.royds@taitradio.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On 2/07/19 3:58 AM, Joshua =
Watt wrote:<br>
<br>
&gt; 1. Testing RPM and IPK package formats. I think RPMs will be pretty <b=
r>
&gt; easy; IPKs might be more challenging since AFAIK the tools that make <=
br>
&gt; them don&#39;t generate reproducible output to begin with.<br>
<br>
<br>
This has not been my experience. I have been building reproducible ipks, <b=
r>
indeed, it is the hashsums of the ipks that I&#39;ve been examining. In mos=
t <br>
cases, the correct SOURCE_DATE_EPOCH is enough, but there have been <br>
cases where I&#39;ve had to correct upstream projects to cope with the <br>
SOURCE_DATE_EPOCH or avoid the effect of differing uname settings.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ah, fair =
enough. I must have misremembered something.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
<br>
&gt; 1. HOSTTOOLS differences. There are a lot of tools listed in <br>
&gt; HOSTTOOLS, and unfortunately some of them have version dependent <br>
&gt; output and are used for target builds (the one I&#39;ve currently stum=
bled <br>
&gt; upon is pod2man, but I&#39;m sure there are others). Unfortunately, on=
e <br>
&gt; could probably argue that HOSTTOOLS is somewhat antithetical to the <b=
r>
&gt; above statement, at least in regard to target builds. Any host tool <b=
r>
&gt; output that &quot;leaks&quot; into the target build output can result =
in a <br>
&gt; non-reproducible build across hosts, and possibly should be avoided; <=
br>
&gt; the alternative is to use (or mandate) the corresponding -native <br>
&gt; recipe that provides that tool as a DEPENDS so that the controlled <br=
>
&gt; internally built version is used instead. Note that this only really <=
br>
&gt; applies target builds, not -native (or nativesdk right now). -native <=
br>
&gt; recipes would obviously need more HOSTTOOLS to help bootstrap the <br>
&gt; system. I suspect this would require reworking how HOSTOOLS works so <=
br>
&gt; that they can be split into two categories somehow; the tools that <br=
>
&gt; have &quot;ubiquitous and stable&quot; interfaces and are fine for all=
 recipes <br>
&gt; (e.g. cat, sed, true, rm, etc.) and those that are variable and should=
 <br>
&gt; only be used for -native builds (e.g. pod2man, rpcgen(?), chrpath(?), =
<br>
&gt; tar(?)... others?). Anyone have thoughts on this?<br>
<br>
<br>
Perhaps reproducibility is the decision-point for adding a tool to the <br>
HOSTTOOLS: If the precise version of the tool has no impact on <br>
reproducibility (eg. cat, sed, and even gawk), it is a good candidate <br>
for the HOSTTOOLS. pod2man shouldn&#39;t be in the HOSTTOOLS, because we <b=
r>
need to control the version.<br>
<br>
</blockquote></div></div></div>

--000000000000d4f754058ca83ae4--
