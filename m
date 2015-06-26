Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id A7ABE7404A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 14:48:02 +0000 (UTC)
Received: by qkei195 with SMTP id i195so17797434qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 07:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wrFHUax7mlX80owKjTWnEs1Q5ph8bXHzOgLQplD1sZ8=;
	b=JkRu31OF7A5adMGNoUolXp98eYKIe9CTg/eBoIn2b9LbB3UZoV011Lk+7RY08LMort
	dIq1vkrm5Ug8nNL/GghkYTTJULsvpCLM5cTShRWScfKBUYCkPbHUwpwCujQdZfKNFOzq
	+DEuwCpriFoShhZvU4D3Nk/dMJtSTB9nF+ewpRFUIxaZBgVQkFqFzO4nknaG4UJaJCtE
	4ndCo4Hz09ObyJZXyVm7wTBXBzQh+n9qndKvV989PgLzIHrRz0Hn6kQPZrihFrmFIc5c
	jHHMJ5AWLfWNaYtxCVfB1+FeszNaVovqdsGosjhhR+oW78CejisqJ/xz8cHpHVHw2kQT
	G8wg==
X-Gm-Message-State: ALoCoQkhlchL9vQRw4Pvxa4/S0zAdrHZsgPwXtiATLndryLofG8XE6sWwkTKy1Vi4eBieW2vBuS/
X-Received: by 10.55.40.20 with SMTP id o20mr4607913qkh.14.1435330083711; Fri,
	26 Jun 2015 07:48:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 26 Jun 2015 07:47:43 -0700 (PDT)
In-Reply-To: <5E0378F8-62E0-4A7F-AB07-0209CD229BF3@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAHiDW_GjW0PSnNRGekiYkg+qdhg=xbbmiVhWY95cv6GxQPJ1Bw@mail.gmail.com>
	<5E0378F8-62E0-4A7F-AB07-0209CD229BF3@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jun 2015 15:47:43 +0100
Message-ID: <CAJTo0Lb0S_b4Wnb0dWmVae9Ezmn=dB0G2=DFyEjD2nivoa6Jfw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Fri, 26 Jun 2015 14:48:04 -0000
Content-Type: multipart/alternative; boundary=001a1142ea98c676bd05196cd33b

--001a1142ea98c676bd05196cd33b
Content-Type: text/plain; charset=UTF-8

On 3 June 2015 at 22:21, Khem Raj <raj.khem@gmail.com> wrote:

> > Can you explain why? The revision looks like 0.16.0 release.
>
> its easy to develop libinput and prepare/test upstream patches since all
> upstreams want the patches against their latest master and its easy to
> switch to AUTOREV locally and do it.


That's not a great reason and I'm against using git fetches when there's
perfectly good tarballs available.

Ross

--001a1142ea98c676bd05196cd33b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2015 at 22:21, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; Can you explain =
why? The revision looks like 0.16.0 release.<br>
<br>
</span>its easy to develop libinput and prepare/test upstream patches since=
 all upstreams want the patches against their latest master and its easy to=
 switch to AUTOREV locally and do it.</blockquote><div><br></div><div>That&=
#39;s not a great reason and I&#39;m against using git fetches when there&#=
39;s perfectly good tarballs available.</div><div><br></div><div>Ross=C2=A0=
</div></div></div></div>

--001a1142ea98c676bd05196cd33b--
