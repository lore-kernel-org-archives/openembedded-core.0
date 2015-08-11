Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 27F54767EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:26:39 +0000 (UTC)
Received: by qkfj126 with SMTP id j126so21512412qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 12:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jwriQ8UxodrQiIY75XIrn3/wqxbqKdOAArh48FNpNME=;
	b=O5cWrugyuvR3Z85CphLYYp91MALNn/Kmf73igI1l/SSwqhO9khq/1JXVYcwKevHKWH
	eAzmQjZliHCEk5m+0qXQKIWPpC3yedmpuxQA8rHuMq4MiBDy4CcPAeGP18Q86xm0nxDw
	X08oNyl9dZtT954u2FQToZGyXAviqDYnEHKDk8UTclSA4p1EiBZ6Xqi+hogAOlIbeHPk
	D+bvG3btuG7euCVpsQS2fAuZzQzC4gdq6VpPy088lNVQWHNNZhsbsizx0bGhhuR3HQX7
	2EIoIsEQccgYtjti/AF9/NO3Q/KYvuOu/AybLj4wSVBjXG4U+mJ0rbVrkTn+KLdLVjdv
	InuQ==
X-Gm-Message-State: ALoCoQnXmbWGeJ/67tx3C6oPAsscTyj4wWRCNSsOzTd63ZMlZ93zh+x+jvNLXoSf6F0FSmCX9Njt
X-Received: by 10.55.53.193 with SMTP id c184mr50091300qka.62.1439321199741;
	Tue, 11 Aug 2015 12:26:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 12:26:20 -0700 (PDT)
In-Reply-To: <CAMKF1soS8PM-4NwJ3jxmzfdo=1KyrTkuAaB6QQQpvvJfO8bJaA@mail.gmail.com>
References: <cover.1438811921.git.raj.khem@gmail.com>
	<CAMKF1soS8PM-4NwJ3jxmzfdo=1KyrTkuAaB6QQQpvvJfO8bJaA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 20:26:20 +0100
Message-ID: <CAJTo0LbyhwxBW1HXmSV616hC+dkLDYzTPvo80jVphGjUGjnE=A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Upgrade glibc to 2.22
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
X-List-Received-Date: Tue, 11 Aug 2015 19:26:40 -0000
Content-Type: multipart/alternative; boundary=001a11476f14d42627051d0e1471

--001a11476f14d42627051d0e1471
Content-Type: text/plain; charset=UTF-8

On 11 August 2015 at 20:14, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Aug 5, 2015 at 3:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > glibc 2.22 is now released. This has been tested on feature branch for
> months
> > now as the release is out, therefore proposing it for master
>
> I have updated the pull request to fix the issue where PV was still
> using AUTOREV


Where can this branch be found?

Ross

--001a11476f14d42627051d0e1471
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2015 at 20:14, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, Aug 5, 201=
5 at 3:02 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@g=
mail.com</a>&gt; wrote:<br>
&gt; glibc 2.22 is now released. This has been tested on feature branch for=
 months<br>
&gt; now as the release is out, therefore proposing it for master<br>
<br>
</span>I have updated the pull request to fix the issue where PV was still<=
br>
using AUTOREV</blockquote></div><br>Where can this branch be found?</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a11476f14d42627051d0e1471--
