Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id E68F360017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 22:08:07 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so40026601qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 15:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7iC96/p11Tc2+40IC9JVEwfc5khCat51UAFCrGB8bUo=;
	b=MgKlpf8aAkUc/xSqLETSLe+2sLHm9HqXhNgtUdxYN2/J4IBL8rErkl5wzeY3lpJ40k
	hbxn/LYi1+bWdn9I0h446ss/x9l24sTz8EKm+qScAyVYyWjttWiNP7kzNdGTjVd0M/D6
	43YJKF4q0gZasfJ3J7WPQT1VTbHBoQLkSIWTTa9SrZM1M8xEFSlR8HoazLBCrprrgLaE
	cJuHSEt9ExAAON1Rss8S/C0hsJHBTpGj02bixLVdO2Fk5aTKrG7VHnhrJw2s04m3oEGJ
	K3mdLuq1CpZnynJY1J/EOoJNzR0+l7KHhkWitQkg7FgG67rbsC7yk4eLWJvXtwX8siah
	JQEQ==
X-Gm-Message-State: ALoCoQkto12LCtyKGa3LVSNX3E0f55Kq4bp3EWy6qH14XVpyFbekYG1hWg1WTG0Dnc5Z2WBuEmOo
X-Received: by 10.55.23.86 with SMTP id i83mr59210442qkh.100.1435788487733;
	Wed, 01 Jul 2015 15:08:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 1 Jul 2015 15:07:48 -0700 (PDT)
In-Reply-To: <efc583454a3f6cce0b15d122320258aa8636b92c.1435774899.git.raj.khem@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
	<efc583454a3f6cce0b15d122320258aa8636b92c.1435774899.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Jul 2015 23:07:48 +0100
Message-ID: <CAJTo0LZdPcAh-bQCkO=WN49b_SAa3Gj8yPLTPPpKD+jVn_mG7Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] weston: Upgrade weston_1.6.0.bb -> weston_1.8.0.bb
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
X-List-Received-Date: Wed, 01 Jul 2015 22:08:10 -0000
Content-Type: multipart/alternative; boundary=001a11470c8ac8cc280519d78e55

--001a11470c8ac8cc280519d78e55
Content-Type: text/plain; charset=UTF-8

On 1 July 2015 at 19:24, Khem Raj <raj.khem@gmail.com> wrote:

> Make error() portable, Fix build on musl
>

Upstream points out that theres lots of other GNU-specific bits in Weston
(such as gnu-specific printf formats).  Does musl support those or is this
a token step towards being musl-friendly?

Ross

--001a11470c8ac8cc280519d78e55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 July 2015 at 19:24, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":19g" class=3D"a3s" style=
=3D"overflow:hidden">Make error() portable, Fix build on musl<br></div></bl=
ockquote></div><br>Upstream points out that theres lots of other GNU-specif=
ic bits in Weston (such as gnu-specific printf formats).=C2=A0 Does musl su=
pport those or is this a token step towards being musl-friendly?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11470c8ac8cc280519d78e55--
