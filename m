Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 26EF371AD6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 17:32:49 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id u19so80556139qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 10:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NQvAShc/tgI/xqt3HV73PZKHD1ypFiRyn8RdwEUGFIY=;
	b=osY9Q7T0wxvLTjR1bQHBrAQfkPXTRscoCtE8ZlfOSkYhjTc9QaKTANxv8R1sHLruMU
	mMTQQ8bHYCZdazDPXHaA/eCYxtmltMlIXxoy86FUccccYgoJCyRXa1w6k4TW/kJlqSWF
	Vccjnj9vn8GvhKYASaavvnGsNjPi7JkAcj53pHS2yU+5mBr5z6BHTit5S5Tn58z6xAoM
	nkxHRp2SPCo8HmRFmUFjD3nvuZu+KuH0bzl2Wsuko8GKyzd3YpiMF/CDvta1OJUZlnE5
	M+PFvM9XbzI7BXZtZJs56OdbMHsPXP/AABpVK1+STxnG0rrzgL+bDtandENp1LktmPcE
	I0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NQvAShc/tgI/xqt3HV73PZKHD1ypFiRyn8RdwEUGFIY=;
	b=jp3UCJeAi87KbKcVZVoWAedfrZvv1gVaxPn6SXjcXYxspDHyDhk3p+Zz7lhaewlHKN
	pSPjAKKmnUulpurktXvQCkVgi7cl9oOaahegZQaXJ02J0ZXmusMN9GeaecomQMwIIrXX
	uGyzdG8o94/yCeZnbIfNVMXb8mH5OxQQxsby09BsXoJw+Lue0t/Svf1mr+vdrcUfjGyA
	9YURRv9RnLigqglIzdinFbUQx94Vb5woBT2ji5CEnOXVStPauYe94y5XZPC9P2P5sblz
	P/XByJvy/XtNcHmMrIscp9fGCBMuZEZjBuLrubLNhUhqLAJYLG8C6lY3T4MLeP2LxNSK
	DIfA==
X-Gm-Message-State: AKS2vOz/qSl77XTJ0pVO80TRGalMafCE/zkCNF2tEpr8MBhmPGQd8yJQ
	p+0r5DfAlh9pEze13poCOERto78r2OU0
X-Received: by 10.200.58.38 with SMTP id w35mr10181743qte.93.1496770370696;
	Tue, 06 Jun 2017 10:32:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 6 Jun 2017 10:32:30 -0700 (PDT)
In-Reply-To: <20170606171346.21413-1-raj.khem@gmail.com>
References: <20170606171346.21413-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jun 2017 18:32:30 +0100
Message-ID: <CAJTo0Lad6-=shjk=C9_AJVyYsGP3dJ1dDUXcRH6j=coywGMqMQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Add define to indicate missing 64bit atomics on armv5
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
X-List-Received-Date: Tue, 06 Jun 2017 17:32:50 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ca10c418bf305514e021f"

--94eb2c0ca10c418bf305514e021f
Content-Type: text/plain; charset="UTF-8"

On 6 June 2017 at 18:13, Khem Raj <raj.khem@gmail.com> wrote:

> This is wrongly detected by configure since it only checks for
> __sync_add_and_fetch and not __atomic_fetch_add, it decides
> to let compiler emit references to atomic functions which
> it expects to be provided by libgcc, but thats not the
> case for armv5 arch
>

Is the true fix to adjust configure to look for the right operations?

Ross

--94eb2c0ca10c418bf305514e021f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 June 2017 at 18:13, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":3f3" class=3D"a3s aXjCH m1=
5c7e66a44ad2fb7">This is wrongly detected by configure since it only checks=
 for<br>
__sync_add_and_fetch and not __atomic_fetch_add, it decides<br>
to let compiler emit references to atomic functions which<br>
it expects to be provided by libgcc, but thats not the<br>
case for armv5 arch</div></blockquote></div><br>Is the true fix to adjust c=
onfigure to look for the right operations?</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0ca10c418bf305514e021f--
