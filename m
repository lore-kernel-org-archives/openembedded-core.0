Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0CF60777
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 19:14:54 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id m88so17242116iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A48FbNNx0by3AyC7RQTxV/IXmlUMDxoKf4KmArb2oAI=;
	b=tOhUdUS5th0S9ltKRyNGAnLAzqpHv+0VHY6k8dUxXAUfqTXWUw2bMZsx02wMgRBgQO
	NsIU46JI2S+z+IIG4hvB+RdjadOc/n1zXcZXPKb55e7HVWCY3dzu2d6ZoFlBoGpNJCCh
	BPYUAdljca/Ta+6dBxjs+wxx8JWcGNX8+vk9MH3wj2OFU0ByLEqhPln/gVv/e+kIyv8A
	O2FvCtFhZaT7NF7r4SJaaeRasjWK3+1nEd9aJex9LJ9W3CBG9PVtB/oUAti4nHNcUocP
	xj8dE4tYrv20fsCBDfVjM243N3xdJnyUpR4dYhk+bSTlyjDTauqRDuMj1SsxUYPG6120
	LQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A48FbNNx0by3AyC7RQTxV/IXmlUMDxoKf4KmArb2oAI=;
	b=QzAT8dpvPM2clF1k2I3NQu4E1CfSZfbPS/PJFE8mjXdqeaJhEwwHtYj/uaUF6Dx/X0
	L7Cu85jnUJDymW6OMwYsUn7QIW6j0h5vR/d4zFIXBbYH1G3g2UZxGxp/2SGgamJbpVD+
	gEL9E6vA7IT/9MpSJuZYCY7A4aK3OW44ViqD8AyfENfeAqJkxJI+/WBKy4NTHrC5oX9h
	l0tfPqMpmkgOgEwMVQqAtBarFiqpk4AIqnBR68MJYo6mTa5FxsHje2JykoCwxeNL/p5/
	SGD3AST4tc6cMenAT6+X8CiICUU0A+7DoV8oR3VuL6BluRZ8U37wZSd0vvrmVvPGyXpR
	HILw==
X-Gm-Message-State: AIVw1108roopqGJFkdZq4LYQcMt0Pfdn06zlkaLQ7EzF22iNg56+zb5u
	31QLVTcnVZFN1eq/HzD8N9UO/UGVQgyz
X-Received: by 10.107.170.170 with SMTP id g42mr4835078ioj.19.1502219695671;
	Tue, 08 Aug 2017 12:14:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 8 Aug 2017 12:14:35 -0700 (PDT)
In-Reply-To: <c9af037d-bd8f-691c-ec3d-ba17e723805d@linux.intel.com>
References: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
	<7ef3f08bdec1e383464085347222b59894526872.1502206031.git.alexander.kanavin@linux.intel.com>
	<4ae3a694-c172-c4e7-8cf9-97f6cd8507cd@windriver.com>
	<c9af037d-bd8f-691c-ec3d-ba17e723805d@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Aug 2017 20:14:35 +0100
Message-ID: <CAJTo0LZoTQ__hYMFjbGOYkggYoggxtMiEtwRaapSkwacNVhQMA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] gstreamer-plugins-bad: replace openssl dependency with nettle for hls plugin
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
X-List-Received-Date: Tue, 08 Aug 2017 19:14:54 -0000
Content-Type: multipart/alternative; boundary="001a114260ba55e59a055642c7b2"

--001a114260ba55e59a055642c7b2
Content-Type: text/plain; charset="UTF-8"

On 8 August 2017 at 18:35, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 08/08/2017 06:58 PM, Mark Hatle wrote:
>
>> Can we somehow make openssl(10) or nettle a choice when compiling?
>>
>> I ask because I've worked on a few systems where people seem to want one
>> encryption engine for as much of the system as possible (usually openssl).
>> While gstreamer has not been a problem in such systems, I could see it
>> being
>> something that would need to be considered.
>>
>
> This would need to be done across all recipes where such choice is
> supported, as a 'preferred crypto engine' distro feature. There's been talk
> of doing this, but I don't remember what was the outcome.
>

There was a bug for this but I literally closed it earlier today on the
grounds that it would mean patching every user of a crypto library to add
an abstraction and alternative codepaths.  If you don't patch every
instance then there is no point in a global option.

We can have packageconfigs, and expose the choice if the upstream does, but
I think the only sane option is to leave it to the user to set the
options.  It's trivial enough to blacklist openssl if you never want to use
it.

Ross

--001a114260ba55e59a055642c7b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 8 August 2017 at 18:35, Alexander Kanavin <span dir=3D"=
ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_bl=
ank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On 08/08/2017 06:58 PM, Mark Hatle wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Can we somehow make openssl(10) or nettle a choice when compiling?<br>
<br>
I ask because I&#39;ve worked on a few systems where people seem to want on=
e<br>
encryption engine for as much of the system as possible (usually openssl).<=
br>
While gstreamer has not been a problem in such systems, I could see it bein=
g<br>
something that would need to be considered.<br>
</blockquote>
<br></span>
This would need to be done across all recipes where such choice is supporte=
d, as a &#39;preferred crypto engine&#39; distro feature. There&#39;s been =
talk of doing this, but I don&#39;t remember what was the outcome.<br></blo=
ckquote><div><br></div><div>There was a bug for this but I literally closed=
 it earlier today on the grounds that it would mean patching every user of =
a crypto library to add an abstraction and alternative codepaths.=C2=A0 If =
you don&#39;t patch every instance then there is no point in a global optio=
n.</div><div><br></div><div>We can have packageconfigs, and expose the choi=
ce if the upstream does, but I think the only sane option is to leave it to=
 the user to set the options.=C2=A0 It&#39;s trivial enough to blacklist op=
enssl if you never want to use it.</div><div><br></div><div>Ross</div></div=
></div></div>

--001a114260ba55e59a055642c7b2--
