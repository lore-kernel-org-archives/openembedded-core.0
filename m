Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 06249771B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 19:54:17 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id g13-v6so3298286qki.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=htXS8vnhOeAzXdOn3l8hTZ0XDeJRpIfbqeYTr3a64Ss=;
	b=eCikC2C1UciKawDH+B7eiWyKz+Mjhfn5cRUFMPMgPp6mx5tisWV548dQQQ9OmxmDpf
	VCrvfZrh1ZPypFVv0dgUfSkFydOHZVxGPcuo60CnrhYtNDVxwRaHipsUFVY1gAV6R/W3
	IWRmLS2vqNPGNF2cXp2Yd08xQPOS4n9y/AAbDfQs5cpadCRq6kaYsBs0Fm4HND/NDEvY
	i8jRxpY6rdbkXDaKcthVNd4MlzWM2iKRe3vIZ4FhKsDeGxPZE87GkXQ6TTZIEQRJ10d0
	wnxcTMDfl3HPTtqX1BLUJTa+G+PJ1jdU8wij62SrSQxB7heQQUPvtWV3+4dOUF2t+qY4
	02pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=htXS8vnhOeAzXdOn3l8hTZ0XDeJRpIfbqeYTr3a64Ss=;
	b=d7OmPWLMRcfft6CXFSoZynIIoAjRjeUYY/lPGn+ICSMoVmmhRSjrhQlki3AI2XQhqe
	U7Th1rA446ofMtnadQiOztBR+clFsfOH8t0Vsmaz7SeYkix2yeNLLIV60uKbU88vl5XR
	cmruT4B9MghVKhuWM/rLNroyFL//Ybrkjxi0B2NlStr/ZdTCn87mIp0zUKrvxsx2pz7s
	CPGM0ck9uvM/uoeFYRpR/XNZXBI7UHfjKH42Mle4WYEkSlk41+R6dF4hK6sgC7eFV35j
	424X8s+FjzRNX0POzmdEqhToD2MWitkdEWk1jCdL6S4yMW7XtcnU5EAJAt08u5/aZyPB
	WkHg==
X-Gm-Message-State: APzg51BWz8yUh+1AC59oFeDukImSerLZ4Iu+b73+y41O62r3J3z5UNTv
	uGWVa+RnDLOSJJrYCOSTaqCRH9vs29vjqdTDcPc=
X-Google-Smtp-Source: ANB0Vda+v1gfFfBr7bFRih/BBjEODum4oiKOPMhRAwQeqK7rSwIzhBVPvj5EGxUrby1ApfNVm7DOTwqz89/j9gehBps=
X-Received: by 2002:a37:2169:: with SMTP id
	h102-v6mr12329923qkh.7.1536090858395; 
	Tue, 04 Sep 2018 12:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180904190027.1410-1-raj.khem@gmail.com>
	<20180904190027.1410-2-raj.khem@gmail.com>
	<CAJ86T=UuKyknCjZw2rHu7=e0tG1u2uwvasX-muVzrN8B=QmO=g@mail.gmail.com>
In-Reply-To: <CAJ86T=UuKyknCjZw2rHu7=e0tG1u2uwvasX-muVzrN8B=QmO=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 12:53:51 -0700
Message-ID: <CAMKF1sptzigqGk=RRu0sxu-JfDauX69UhEm-JBX-7r3hXSjPQA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] musl: Update latest on master
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
X-List-Received-Date: Tue, 04 Sep 2018 19:54:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 12:44 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Sep 4, 2018 at 12:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > hopefully last bump before 1.1.20 is released
>
> 1.1.20 has been released.
>

indeed right in time, I will update the commit message. its actually
same commit with a release commit on top.

> > ChangeLog
> >
> > https://git.musl-libc.org/cgit/musl/log/?qt=range&q=767f7a1091af3a3dcee2f7a49d0713359a81961c..64466094ede4162ddd4049cea5da09feb9abfaa6
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> > index f4f156042a..997eb14959 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -3,7 +3,7 @@
> >
> >  require musl.inc
> >
> > -SRCREV = "767f7a1091af3a3dcee2f7a49d0713359a81961c"
> > +SRCREV = "64466094ede4162ddd4049cea5da09feb9abfaa6"
> >
> >  PV = "1.1.19+git${SRCPV}"
> >
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

