Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id EDFD6764AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 16:25:52 +0000 (UTC)
Received: by qged69 with SMTP id d69so27732646qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 09:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OnWQWGc8QsNVnhUNIDuJYqItLu5iuFyE64KHIJ/6D1k=;
	b=Kroz0JzLc0BujzcQLuxqKU/1wO5b0+PsRjv5e0T07QAMBJUOqgcpFIG0YHbhwsADWM
	U9Nw3qMPKr13tbhyCbfl5OJVEmAGwCLP1vlYcB6hzHMb2AVMQTiIbG/wAgJEgbWh7Luq
	CJq573vmHajDdQLXFm1uc/VjZvD41/2Jh+AE4TIhtTUTYL2fRTpxMWAtoxQIGC+3BFyq
	t4D9dujlN3xSuYlb7A4p7RYMSjlrbovBPdHYqZ/DzjnrQQJMMpzyxcJ9Hsi/h4zxqNJa
	U1T5Cf9BrS4s9uqTXC5fiC3y9eUTtQYPSxWrlK0Wj4ueHj/ca3aBJU2EhrYkSdp2g2ds
	/0Xw==
X-Gm-Message-State: ALoCoQk5CJuxorlAC5A26xO7J9XI1Okl8HZsSEQmlq6anpC5m8vLj0m49VEt+ZsszIOwr2R0w51Z
X-Received: by 10.141.28.6 with SMTP id f6mr7129482qhe.64.1438273552600; Thu,
	30 Jul 2015 09:25:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 09:25:33 -0700 (PDT)
In-Reply-To: <55BA4399.2030302@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<86b43671f02c22f328e3801e0711a33731156ba8.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143658.GK2457@jama> <55BA4399.2030302@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 17:25:33 +0100
Message-ID: <CAJTo0LajDS9QaEdczNG9OnpkQWj_B148+TSwKwNCxXLyk9xnjA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/26] systemd: remove PV from the recipe
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
X-List-Received-Date: Thu, 30 Jul 2015 16:25:56 -0000
Content-Type: multipart/alternative; boundary=001a11422ff4316596051c1a288b

--001a11422ff4316596051c1a288b
Content-Type: text/plain; charset=UTF-8

On 30 July 2015 at 16:32, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> No, it contains only 219
>>
>>> -PV = "219-stable+git${SRCPV}"
>>>
>>
> The idea here is that we only need the basic version, if the revision
> being fetched matches that version, and there is no need for all that git
> revision clutter in the version string.
>

For the release tag I'd agree with you, but as 219 < 219-stable we can't
just change this now (without adding an epoch, and adding epochs are evil).

Does the RRS have a way of mapping a PV to something that can be used in
the upstream comparison?

Ross

--001a11422ff4316596051c1a288b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 July 2015 at 16:32, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">No, it contains only 21=
9<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
-PV =3D &quot;219-stable+git${SRCPV}&quot;<br>
</blockquote></blockquote>
<br>
The idea here is that we only need the basic version, if the revision being=
 fetched matches that version, and there is no need for all that git revisi=
on clutter in the version string.<br></blockquote></div><br>For the release=
 tag I&#39;d agree with you, but as 219 &lt; 219-stable we can&#39;t just c=
hange this now (without adding an epoch, and adding epochs are evil).</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Does the RR=
S have a way of mapping a PV to something that can be used in the upstream =
comparison?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a11422ff4316596051c1a288b--
