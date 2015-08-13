Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 077DC766DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 19:34:36 +0000 (UTC)
Received: by qgdd90 with SMTP id d90so38188097qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 12:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mjyMO6FZmi5Uu/FSgAfg1I/D55oseZxnQBYICY4S//g=;
	b=J9g3Tv12A1yTZ43I5yqoF4GCMROSyDdWavM+qy9vT5k6+6PMkxW7MaBjfhoOPbzbk+
	Lm/B/S0BIu67R4CVUYFHZ/KYdVJQdzVLrp4kL1oJuu5C9tcFkU98UoglmTwDMZe+eC1L
	1+r0xIHqxBehI8WZg7OPFr1cIs8Dfza8z/MpxLkeqyMvP0wPpQL7eG3H0JTtFd2WuX6u
	eIFX6wpA/+aDWW3xhtqcNdIz8E9+qR8/QnOfvHOwST4a2j6T+EDnpDihPYqTMhnB+sRF
	zZVm+/u2bL/qu0USM5OlgJOy+yakWDvElJgZpZHgPJZ7GOa0Bw1zW92W6kLpBdJD6wKe
	B/qw==
X-Gm-Message-State: ALoCoQmdyVsMy54MoYG8Q2wXpkpBValpArkinn67CSkyyCZ7ppiVEtGqyCwtp9sWUKxCA7MOAFOA
X-Received: by 10.140.89.100 with SMTP id u91mr70801336qgd.15.1439494476333;
	Thu, 13 Aug 2015 12:34:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Thu, 13 Aug 2015 12:34:16 -0700 (PDT)
In-Reply-To: <CAMKF1sqHK5q-Xq9Gv4wae4MZdSw57e_OVyc_kdFkWgeAKd8v+g@mail.gmail.com>
References: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<757e0230b801d19350e30523d62ac9b963c542bf.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LbpYSNWZ39Vik4U8eT-+B+tg4-RpY+0nsDphLA5a-wOQA@mail.gmail.com>
	<CAMKF1sqHK5q-Xq9Gv4wae4MZdSw57e_OVyc_kdFkWgeAKd8v+g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Aug 2015 20:34:16 +0100
Message-ID: <CAJTo0LaTHTHis8e3X+5STP8VDsJ0z8mcNLGjJQS9RFLGmZNDSQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] package_deb.bbclass: Handle exception when encoding non-ASCII characters
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
X-List-Received-Date: Thu, 13 Aug 2015 19:34:38 -0000
Content-Type: multipart/alternative; boundary=001a11c1334eeb3e78051d366cb1

--001a11c1334eeb3e78051d366cb1
Content-Type: text/plain; charset=UTF-8

On 13 August 2015 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:

> but check it still fine isnt it.
>

Of course, gracefully handling encoding failures is still sensible.

Ross

--001a11c1334eeb3e78051d366cb1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 August 2015 at 20:21, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":10x" class=3D"a3s" styl=
e=3D"overflow:hidden">but check it still fine isnt it.</div></blockquote><d=
iv><br></div><div>Of course, gracefully handling encoding failures is still=
 sensible.</div><div><br></div><div>Ross</div></div></div></div>

--001a11c1334eeb3e78051d366cb1--
