Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id A7E62607AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 11:58:51 +0000 (UTC)
Received: by oies6 with SMTP id s6so47858927oie.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 03:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UButIMLfFDkCO5gCtMPVVSPONCfH7VrcVl9Q6H6nJ7I=;
	b=iUcoG+dDP6zF1nEzENZaYFBvc25o95VdhtaPUOk6t5M96RuFEbcwT8jjFFYURlPFAl
	4xcY4Kt+EaPPt0BMjyh/1Cl99C8dWbyi6GuEwNIl7ozCJYBb3sCJ/lbvffqkM2PugEXM
	w6L22e3KUxBL5Ky88UgPIgZTmssAgGHSLSQnkmD8LFm3e/kxRiZfDt3eTTLGQgBgiHo7
	NUJQoRetKl8HWi85nQfBYIOzKZ8AoZ9x5D3oqDflfETfrmK4kQqQY95nMXFDKKC3ratz
	+/J5J+N3o+yqDos7QwFkUPW6qxv4PTNHaVVeyTrkMzPwepT8VZr8BdXCcOCAgneVBcCR
	fKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UButIMLfFDkCO5gCtMPVVSPONCfH7VrcVl9Q6H6nJ7I=;
	b=iQqZqoUK61nIYxqfWg7zXMOFQj1RaSPS81VsR3KRsGEEB9Ag7ZyI5yxNx7s4XTFOdE
	wEY3vmKPAX/hezzX0rLsvn1he/JYHO61GBliZxd2kCkp2xM1pUM0ErLOLW3pNL5DhBta
	2+PjHnMWMUn+sE2vFTXAfpa5rbK84w3BoFf5Uexro7Dpkmab140XbPm/9tUnB94uQt/S
	OknC44LcFIHtLCadwrAqNLyp8vHdR1LMZkeSpKYj6LXAnLGMDbgyb9ZCIwFM8Vh/ZSpu
	hMHFgc0w45IF0pbKN2s4qIlLgUqv1nYoUDPErL+bSiQCf7Nvmn9B5Bf7C/X568nk3Chb
	wMzg==
X-Gm-Message-State: ALoCoQlaQcG6tRXJ0qsnjhYV0DvCCgXOu9NrsztkuCyeA+MbV2IgyfoBY7hWGRukzjvHG/tcZrJV
X-Received: by 10.202.186.198 with SMTP id k189mr6921218oif.105.1449143932444; 
	Thu, 03 Dec 2015 03:58:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.51.67 with HTTP; Thu, 3 Dec 2015 03:58:23 -0800 (PST)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C7598D7@ALA-MBA.corp.ad.wrs.com>
References: <1448948830-9690-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0LYtfrPYpfYMDfmO=-CbFcO4=8_K0dWLChEq+AwgAcxYBQ@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C7598D7@ALA-MBA.corp.ad.wrs.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 3 Dec 2015 13:58:23 +0200
Message-ID: <CAHiDW_GuGGZTeTSuN+0frWGZS9aPUwGTeAcjo5NZhACbsW+3vA@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] matchbox-desktop: sync with gio for the inotify-sub
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
X-List-Received-Date: Thu, 03 Dec 2015 11:58:53 -0000
Content-Type: multipart/alternative; boundary=001a113cd2b0528cf30525fd1d55

--001a113cd2b0528cf30525fd1d55
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3 December 2015 at 11:11, Huang, Jie (Jackie) <Jackie.Huang@windriver.co=
m>
wrote:
>
> I agree to drop those codes, and it should already be part of the rewrite=
,
>
> where I can find info about the rewrite, I don=E2=80=99t see any actives =
in:
>
> git.yoctoproject.org/cgit/cgit.cgi/matchbox-desktop-2
>
> The latest commit is 3 years ago.


They're not very recent either but most of the matchbox-* repos have a
branch 'gtk3' that contains the most up to date work. I've just started
looking at the code with the intention of finishing this gtk3 transition:
an up-to-date poky branch with these changes is 'jku/shuku' in git://
git.yoctoproject.org/poky-contrib. Be warned that it's currently quite
broken: I hope I have something that runs in a week or two.

I agree with ross about preferably getting rid of things like custom
inotify code.

 - Jussi

--001a113cd2b0528cf30525fd1d55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 3 December 2015 at 11:11, Huang, Jie (Jackie) &lt;<a hr=
ef=3D"mailto:Jackie.Huang@windriver.com">Jackie.Huang@windriver.com</a>&gt;=
 wrote:<br>&gt;<br>&gt; I agree to drop those codes, and it should already =
be part of the rewrite,<br>&gt;<br>&gt; where I can find info about the rew=
rite, I don=E2=80=99t see any actives in:<br>&gt;<br>&gt; <a href=3D"http:/=
/git.yoctoproject.org/cgit/cgit.cgi/matchbox-desktop-2">git.yoctoproject.or=
g/cgit/cgit.cgi/matchbox-desktop-2</a><br>&gt;<br>&gt; The latest commit is=
 3 years ago.<br><br><br>They&#39;re not very recent either but most of the=
 matchbox-* repos have a branch &#39;gtk3&#39; that contains the most up to=
 date work. I&#39;ve just started looking at the code with the intention of=
 finishing this gtk3 transition: an up-to-date poky branch with these chang=
es is &#39;jku/shuku&#39; in git://<a href=3D"http://git.yoctoproject.org/p=
oky-contrib">git.yoctoproject.org/poky-contrib</a>. Be warned that it&#39;s=
 currently quite broken: I hope I have something that runs in a week or two=
.<div><br></div><div>I agree with ross about preferably getting rid of thin=
gs like custom inotify code.<br><br></div><div>=C2=A0- Jussi=C2=A0<br></div=
></div>

--001a113cd2b0528cf30525fd1d55--
