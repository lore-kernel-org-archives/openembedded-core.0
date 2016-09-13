Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3E85373216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 14:49:57 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id n143so40847573ita.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rtioa+dCeofBB2Lc9/TYwKFCtyopK3pznKzC2dQu8E8=;
	b=XP6w//OzKHuruTfE1uC433N4RHj1mK6CKIRPZic4zgpps6hBcfgJlz6T8Q0+xARLA3
	om+uwGCQrQjRFSHDBY1WIf+EAGyuoGww2Va4fHomXmWS9aIs73JoVyQf67HTQdICKgwY
	P3e+v3XD6qwUMxPpLC8Q4rsZtnXD6Q4CMCLvM2w5C68Lz4DbZsvAr5/alH1X/jr6cvG1
	QvuO4Xp3jJ+geU31vCax5OGwdneBtSJBaDHCw3WAh3OD9d008C4cf3AzGVjAQ0cvGzSM
	+HO5pBDh1cRI6ZXtrLeuJ/SHYP6pTpL3Nu2JR/siIBbAEDD3OFHLmWjR4kpal0mBqk6T
	534g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rtioa+dCeofBB2Lc9/TYwKFCtyopK3pznKzC2dQu8E8=;
	b=bqbxF7XOKOjISWduG76vEznEmXrkS3lusX+dJGx1H9N7QrVbAkq29vryHj8X08pei8
	XoDonLFl35T+bgI4RiYgK4fjCPlKZ2pFtpSqASviiGnQdHelyOLIdqcLRfn+L/lLBKN0
	VBV1kpLI+5axK2WqfaufTUPy6NZoyE2Njor1J9PitK1+Zo1fCX8iqWaM6V4CmbOXXFvM
	Q6eo1G9++onkoaRoufNDwoyc7kt8qk80+HyjECP4vc5bTnQJxUcTkOZdBOXOVgr5LQQe
	LelRcuq1xd2uZMk2prKPx4cKGGheBzrRO6H2tCAnxuDVg21pKiOjFZO+ksJa+sDUU3Mt
	ytcQ==
X-Gm-Message-State: AE9vXwNTQm23KAWbWEX0zVtOQYHSmC2EuhWEu2GE+SxxRmOp7lq3I+YjeEQWt4P7PccyL2c0TdlV7bU+moNWUrtR
X-Received: by 10.107.130.203 with SMTP id m72mr2622323ioi.8.1473778198372;
	Tue, 13 Sep 2016 07:49:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Tue, 13 Sep 2016 07:49:38 -0700 (PDT)
In-Reply-To: <CAHiDW_H5mYg6QVY7L2ABnGms0LsfXth7K0ykcJN2Jp5mQWhQNQ@mail.gmail.com>
References: <20160907233743.18699.54755@opal.openembedded.org>
	<20160907233744.4852350198@opal.openembedded.org>
	<20160911193712.GA6859@jama>
	<CAJTo0Lap_gBdBjbTpoNs5rF038TcNEGs+QybDb=G1GMM3nH4Bg@mail.gmail.com>
	<CA+chaQfeWvse-+vAb87m1A2BKVuii4SKEquZtDq-3WWFF9AKBA@mail.gmail.com>
	<CAJTo0LZm=X0c9t-cP2vLeUrvVRK=U1DaNYq1MCDomTgiYVFyqg@mail.gmail.com>
	<CAHiDW_H5mYg6QVY7L2ABnGms0LsfXth7K0ykcJN2Jp5mQWhQNQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Sep 2016 15:49:38 +0100
Message-ID: <CAJTo0LZoNOUrQFLnY0iDQ9HzyaCk4KTTwKGpdE+ZEztz7H_n0w@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/24: gnutls: update to 3.5.3
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
X-List-Received-Date: Tue, 13 Sep 2016 14:49:58 -0000
Content-Type: multipart/alternative; boundary=001a113ea9dcfe15b9053c64b92f

--001a113ea9dcfe15b9053c64b92f
Content-Type: text/plain; charset=UTF-8

On 13 September 2016 at 14:04, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> The good news: Upstream just fixed this today.
> The bad news: The fix is a 7000 line asm patch.
>
>
>
> It's a revert to some earlier code so not _quite_ that scary... but we
> don't have ptests for gnutls and reviewing that patch is plain impossible.
> I guess I'll do some manual tests and send the patch in any case?
>

Or just sent an INSANE_SKIP for now as the next release will incorporate
the fix?

Ross

--001a113ea9dcfe15b9053c64b92f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 September 2016 at 14:04, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>The good =
news: Upstream just fixed this today.</div><div>The bad news: The fix is a =
7000 line asm patch. =C2=A0</div><div><br></div><div><br></div><div><br></d=
iv><div>It&#39;s a revert to some earlier code so not _quite_ that scary...=
 but we don&#39;t have ptests for gnutls and reviewing that patch is plain =
impossible. I guess I&#39;ll do some manual tests and send the patch in any=
 case?</div></blockquote><div><br></div><div>Or just sent an INSANE_SKIP fo=
r now as the next release will incorporate the fix?</div><div><br></div><di=
v>Ross=C2=A0</div></div><br></div></div>

--001a113ea9dcfe15b9053c64b92f--
