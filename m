Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 93F416C124
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 19:00:16 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n21so22992394qtl.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 11:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GVeYEVEzRs0vStZ6CtssCZV/esP6LTlnMp+Q7E9B3aQ=;
	b=TY0hlO+uxtq3LlioT4af1v9vA+XhYE3WsG+e99EAjI98b68AbdiFSSxQ81EPeL9ATg
	C4W+Ql8ca+/BhxGjA8k7eZcPhvIVzxl7y3Dqr92bLLyFezKne7EJWx5nv0Pq11ZM1b+a
	+j77hhXlJfMBJ/eoKFhHCcUMUg90EPyGGqK8LQgmmJxtQ7V3ZcHSwtwHLry4ckJkD9sK
	RT/QM8raQ8gyFyt6B1+8wC/2BmgjZ0RItSSm0+fOK31DzQ+/8mg2qVruH5w2K/LKm76E
	8m47pFMEIIO+QOHOQ2A2Xh07FXbw6BgGUsGP2WA5Awe1fUrnr36uIQHxnKyw38sOP0Eo
	COyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GVeYEVEzRs0vStZ6CtssCZV/esP6LTlnMp+Q7E9B3aQ=;
	b=KQLP6083zfMoyex/bLzHjNrLGfczQVeTl1pO8zIwTDgrBaW455tvzYtNQULI4Jk3Uh
	AzLbNYTMV5t4pytKtCsbppI6p5JfeMMl0iheP1U+nl+6NfImtNXzu+NGsHHM8qmJcf3G
	DYzruCF0rxWZNAJZYGYNq+1NjrA75K8rH+hZAd5GUhUqGFG4OdCfcQ1UUyRhaDDw5NS3
	+zJ+l/Px8caa6xwODshkJlnwc8DWfl/Tv2l0flOBhrF31PScj4nNW0dACEX3ZWiz7Pbt
	CGqyq8weJEPQmv+l9Dn4OFEEvrgbN4IKgFhMBvPHEa2R3Juq3/j6+fTwD58fcwZnNC0O
	JEFg==
X-Gm-Message-State: AGRZ1gJhzplOy3hFvZgN4j9ZujrXxcnxfGYyOgA9n5MmDr2c+I1qIfrK
	EMioHkgJgRDJ4n1KwgAAMgTZ9aMnPXZ7WJ/yxeU=
X-Google-Smtp-Source: AJdET5dE24FB0xuuL1YGigBDqzaRL7eMX8NmunDhCqBV3aCV6//YOByGVwL/6nIPLTX0ehjRnGSOJJhlSwYCpZsSz1I=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr32105533qtf.196.1543345217122;
	Tue, 27 Nov 2018 11:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
	<CANNYZj_H=i+Oa9JKaXaAVW6_vy-9o5YgDOHE76g1Q9L5=K5Jog@mail.gmail.com>
	<CAMKF1sr7mXJzgwbzer0=UUbUoEYgXM7x=0ZUjTQn6_c-3ZC3Vw@mail.gmail.com>
In-Reply-To: <CAMKF1sr7mXJzgwbzer0=UUbUoEYgXM7x=0ZUjTQn6_c-3ZC3Vw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 10:59:51 -0800
Message-ID: <CAMKF1spTysVajGbSQrSAafq1zomuK+WbPwJZCmjFr1x9sO3Rig@mail.gmail.com>
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
X-List-Received-Date: Tue, 27 Nov 2018 19:00:18 -0000
Content-Type: text/plain; charset="UTF-8"

and here is another qemu crash on qemumips seen lately after these updates.

http://errors.yoctoproject.org/Errors/Details/202380/

look for "Segmentation fault"

These two are relatively new regressions. which started to happen in
last two weeks.
On Tue, Nov 27, 2018 at 9:58 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Nov 27, 2018 at 12:48 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Mon, 26 Nov 2018 at 23:29, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Thu, Nov 22, 2018 at 7:42 AM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Also, change default meson option to building introspection files
> > > > (previously they were not built by default).
> > > >
> > >
> > > I wonder if this is causing
> > >
> > > http://errors.yoctoproject.org/Errors/Details/202291/
> > > http://errors.yoctoproject.org/Errors/Details/202280/
> >
> > "Could not find GIR file 'Gee-0.8.gir'; check XDG_DATA_DIRS or use --includedir"
> >
> > This file is coming from libgee - it has the necessary file, but does
> > not install it for some reason.
>
> I repeated this qemumips build on a different host ( running archlinux
> ) and it worked there. The host
> where it fails are centos7 and ubuntu 14.04
>
> >
> > Alex

