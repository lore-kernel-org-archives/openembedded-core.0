Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id E2930781CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:57:20 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 21so8987034iof.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 03:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WnG5XjWH/b9DgEv+xHSigCrt20S6hslanWzaUh/g8jE=;
	b=kDgPPLd6F1HlxJ8J+P/W6cTHou3Hkq884Hu2Rv/HumRq+3kSxabfaMc11ngMXfTTDl
	/utgLAYAlArHG//HNa/0L3bCzcfhHni8Y6vBjMgj4dFVri5/Dkkvdma8u6ipigfZBQOB
	08V0XuMB3S0c196c48N8OtXgljIUfDpxpg/Qx29u8ninDhOIiv28kuNMWpmGQKpztMtJ
	j1U9A2uAc3rr1622WZtJVwIHVjJPjytwAqUb1wsB1uId/Dy9WzRryEsQoicMzQW/rk4e
	UTeKEjvApPaqzB6Yzksoo7n5S114N+lejv+K9MiNoVxoCQ8jzgosZBvA37XPjIYAf4jE
	oBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WnG5XjWH/b9DgEv+xHSigCrt20S6hslanWzaUh/g8jE=;
	b=RD1guxDitv2inUpAgM2FhIYQhYaap7xuYGbIUa30jz10SENXnmnMIpA9/xnmqwbf5q
	lUaIgPR8H8nhZym6GGGxcec0/Go5kUxyRzzT3jiE09ciEWtRj3hta7MI1rkRT5d3SdOT
	c3XoAbYarhWr7mPggD33iX010iyXkUNkdXC4TZgiLXbr56rt9NoL6118ckpXyXWN4cJ1
	IdSnMG4hoQkZMd102fEfIhOgsrGYZleBaOZ7M+tvEqstJMnnhAxSpVgUh1gLBcrcHs5W
	wNF8V9L0r0EcCIrjIrpiCX31ddwfw9eRo54WvOJBn52BsurVvQ2ttTYO/VRVlBtSBuXg
	RsKg==
X-Gm-Message-State: AHPjjUgiubE18lXl0ej3/L5N+jPgzp766aIal804W5UfyoDsc0bMdXYJ
	iInUebeCRiVKx98fPDPqJtNzKmJ/BrI/XpvQUMXJPQ==
X-Google-Smtp-Source: AOwi7QC3w9LN4SKEzO+kJWAB7Ea2x0OJ+0iOD/TelnbLUpaAaUwawxFeCkWZu3b+rP4vdtm/ju3ZIgfQRZK8wPDhQuA=
X-Received: by 10.107.135.72 with SMTP id j69mr1366363iod.210.1505818641580;
	Tue, 19 Sep 2017 03:57:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 03:57:00 -0700 (PDT)
In-Reply-To: <20170919083205.ojully66ojq6l2mq@hiutale>
References: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
	<20170919083205.ojully66ojq6l2mq@hiutale>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 11:57:00 +0100
Message-ID: <CAJTo0LaPjXPT4SKz+J0Qw8af4eo4t+LaMZfvBdYXgMxpub1xsw@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Use of github /archive/ tarballs in SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 10:57:21 -0000
Content-Type: multipart/alternative; boundary="001a113f8e703a7bdc055988b93b"

--001a113f8e703a7bdc055988b93b
Content-Type: text/plain; charset="UTF-8"

On 19 September 2017 at 09:32, <Mikko.Rapeli@bmw.de> wrote:

> Yes, we have been affected by this several times too.
>
> In addition to fixing recipes, a sanity test to warn about the situation
> would be nice to have so that the issue could be detected in other
> meta layers too.
>

So I have a class adding a few tests to package_qa, including this one:

https://github.com/rossburton/meta-ross/blob/0f788385dbe13914e9e07d382793c494c4927ef9/classes/insanitier.bbclass#L93

If I get a moment I'll move it to insane.bbclass.

Ross

--001a113f8e703a7bdc055988b93b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 September 2017 at 09:32,  <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:Mikko.Rapeli@bmw.de" target=3D"_blank">Mikko.Rapeli@bmw.de</a=
>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204)=
;padding-left:1ex">Yes, we have been affected by this several times too.<br=
>
<br>
In addition to fixing recipes, a sanity test to warn about the situation<br=
>
would be nice to have so that the issue could be detected in other<br>
meta layers too.<br></blockquote><div><br></div><div>So I have a class addi=
ng a few tests to package_qa, including this one:</div><div><br><a href=3D"=
https://github.com/rossburton/meta-ross/blob/0f788385dbe13914e9e07d382793c4=
94c4927ef9/classes/insanitier.bbclass#L93">https://github.com/rossburton/me=
ta-ross/blob/0f788385dbe13914e9e07d382793c494c4927ef9/classes/insanitier.bb=
class#L93</a><br><br></div><div>If I get a moment I&#39;ll move it to insan=
e.bbclass.</div><div><br></div><div>Ross</div></div></div></div>

--001a113f8e703a7bdc055988b93b--
