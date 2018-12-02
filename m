Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id F0E8A6BE39
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 18:50:57 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n32so11401860qte.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2018 10:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JDu6lTMC7kkKMepKnzFHk0DLh1AU6P0kRsRA36Bq+B8=;
	b=BJEtsdGIegAGteOpxH/XfUs2RSJMVu/gsMPyrZyuS6C/iWCUvTJ2aRgEl+b/m2KTWA
	tNTOaa/izJtL3cPjKXA7eP6r9IK31b0+3UID5W1Pm5U65BhF6fI9Pu1zXGcDxE74kDSG
	RFaCNjHwlRqIoN1zs5dQpAlI9SkwU83Vpj7JkAUWlJ/chtAVGgojAQPXCnSHEA/sz5xM
	GRdrhi0f1zjlXAV7HauNe3t28OWtZU6MuhJrYTiN3rEoCT+/f3GxLxBzLrrXmrC3mGzX
	FMoHq22aKd17n9E0tLCzBhpykGgTyt4LDUn5fHLhQ5H1HtaDe64achY9DFGgOVI+U0mM
	HQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JDu6lTMC7kkKMepKnzFHk0DLh1AU6P0kRsRA36Bq+B8=;
	b=arEWSGFNYLSKUEZFrKmzgr1klfMlf7T+WS8IllLA82sZaVW7QWieHqvaNVRJAmlhGu
	Qh5MOh01DdQpIkM+FbUImIvcBcyVEVTQSkyPKcHR4riyySLlYDKbUEnNva9LCCDogO2n
	T84cgqk2+jOks5heqVFfb0AWWoAPSEl5R6xXDJEtbmuvRH4Y+fS3LHvcRddI0Z7eP0CO
	ztm/nyvVx7tV3bWIg/saBlZAj+cP1ncK5ycX0kEhmPPD+4kWwtTpu1HAsvcJjUaBluTG
	9GofEK/1L2KFofmPfEN5DCJNhm1Klesay3nHjyYgIRuqjr+2fogIT9thVTVmM3ltIjZV
	WtLg==
X-Gm-Message-State: AA+aEWbBK4d/Vl28dApqen0tspXPVmqCx55Upbl5stBHPpPtH9oDLFEn
	1BeABmICiinJYOmmeCuJZ7HQcEsLslt2k6HLIlA=
X-Google-Smtp-Source: AFSGD/X12cCmfzW4z/Eg/oumblDwY2BnEAaS5/Lz5YFhnQEuuLDU0bn+3qUMDCvUCwkpe013YZ2y325+I/9HwuqfaRk=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr13110331qtk.253.1543776658602;
	Sun, 02 Dec 2018 10:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
	<CANNYZj_H=i+Oa9JKaXaAVW6_vy-9o5YgDOHE76g1Q9L5=K5Jog@mail.gmail.com>
	<CAMKF1sr7mXJzgwbzer0=UUbUoEYgXM7x=0ZUjTQn6_c-3ZC3Vw@mail.gmail.com>
	<CANNYZj9ug7+q0v-kVVio7_a61BRo1JEBNxFmJ33XgB=CQGd7ow@mail.gmail.com>
In-Reply-To: <CANNYZj9ug7+q0v-kVVio7_a61BRo1JEBNxFmJ33XgB=CQGd7ow@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Dec 2018 10:50:32 -0800
Message-ID: <CAMKF1srRWqu-BwcvPNSvrQD5sRkXBF57Jxm1_Dg=ZBn1icUM0A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/16] gobject-introspection: update to 1.58.1
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
X-List-Received-Date: Sun, 02 Dec 2018 18:50:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 1, 2018 at 2:28 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 27 Nov 2018 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> > > > On Thu, Nov 22, 2018 at 7:42 AM Alexander Kanavin
> > > > <alex.kanavin@gmail.com> wrote:
> > > > >
> > > > > Also, change default meson option to building introspection files
> > > > > (previously they were not built by default).
> > > > >
> > > >
> > > > I wonder if this is causing
> > > >
> > > > http://errors.yoctoproject.org/Errors/Details/202291/
> > > > http://errors.yoctoproject.org/Errors/Details/202280/
> > >
> > > "Could not find GIR file 'Gee-0.8.gir'; check XDG_DATA_DIRS or use --includedir"
> > >
> > > This file is coming from libgee - it has the necessary file, but does
> > > not install it for some reason.
> >
> > I repeated this qemumips build on a different host ( running archlinux
> > ) and it worked there. The host
> > where it fails are centos7 and ubuntu 14.04
>
> I just sent a patch for this to oe-core list - thanks for reporting.
>

thanks I can confirm this is fixed with this patch which is in master-next

> libdazzle crash is a separate issue, I will look into it.
>
> Alex

