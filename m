Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S24Dl-00068W-4o
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 18:18:45 +0100
Received: by lagw12 with SMTP id w12so849021lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 09:10:18 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.147.1 as permitted sender) client-ip=10.152.147.1; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.147.1 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.147.1])
	by 10.152.147.1 with SMTP id tg1mr12161024lab.22.1330362618328
	(num_hops = 1); Mon, 27 Feb 2012 09:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=6hGSNcACQ4TRg4kNsnCuNaE5PLg2R0cr7KRMiYh77kc=;
	b=hONnQQBY3Q6Ouquu98nY1mtdMtPLuCji8942frIt++QcGN1xixUpX2HEJ1OgK67v9Z
	NNyYwETPZp+NKcvBhcG37yifTPRiFikJfscKWY8sCtV+A+CTR393g1vVSAUrYiVnyYe4
	aozxtZidbLB7SbAqgRTiN+EHtHSMIk6J2GhoU=
Received: by 10.152.147.1 with SMTP id tg1mr10164175lab.22.1330362618251; Mon,
	27 Feb 2012 09:10:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 27 Feb 2012 09:09:48 -0800 (PST)
In-Reply-To: <CALbNGRT3g9z-5-=9ePN88X9f-1FrDTQuyhBPveHTGmtrPbpRcw@mail.gmail.com>
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
	<CAEsOVNdi-m0y=FsJ_yu8CxK=UiPYdrV8bAV3_Y0mzKc6ft+h3g@mail.gmail.com>
	<CAMKF1srj5zBNQy=bQ1Co0jEV6yryx=EU=vyy2+3KwGUEUxiYkw@mail.gmail.com>
	<CALbNGRS49UDHDMCS9=fePkuEXEd_fOJ0WSxcsSf2aeCstdNxKg@mail.gmail.com>
	<6DB1E138-F4A8-432A-AB83-793B911CE68A@dominion.thruhere.net>
	<CALbNGRQU7BDK5WGYgaXbCwmki922wk_EBkBqZadLL5G=5pCPQA@mail.gmail.com>
	<1330345164.4593.18.camel@ted>
	<CALbNGRT3g9z-5-=9ePN88X9f-1FrDTQuyhBPveHTGmtrPbpRcw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Feb 2012 09:09:48 -0800
Message-ID: <CAMKF1sqqUUxE3kw9noizK0vhEOdQ_8krRZ6uofknt8k45C0w5A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] gcc-cross-initial patching fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2012 17:18:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 5:31 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
>
>
> SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
>
> Is this a possible culprit?

it definitely should not be there. Move this patching of SRC_URI to
gcc-4.5.inc and test it out in your environment


