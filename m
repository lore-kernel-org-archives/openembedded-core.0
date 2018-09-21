Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 53C9474561
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:43:27 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id j9-v6so12717562otl.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 04:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pYZ4xGUcd2BQxc/qNOKPB08a9g3Q4ksQeQmJKgpF+Nc=;
	b=X6zPWU1zgDrCPW8wjTjfjTWmNJlbdyR5/2Kr9KDD7tHWs23x1/fSV2oizxvYsfXyec
	GgA2zeNBqULuyVJrzzfrPkWSKMijrZjHOT7Pj8TmlOA6ZT4ylmA9WlyfpC8iCuiLvrek
	o7fU9dSlXjQE7ICOYyvApaSG5A7qFnJDgrzE9Yj5NKOLyjhLkzPYBrPJUgR6ZslAdNPE
	dN7TgPX7oCh1u1XwT3Sk3/hg57jS1NBV5k7bleC6aBH2/0XwXN2qhe16CVXK7MC/9HAp
	3ge0RPulGRMkvflMCI8IxDRLzrm8wUgdUyN4js8R+Gp9HFLJEtppfStiYPpONxCDbJ/K
	MAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pYZ4xGUcd2BQxc/qNOKPB08a9g3Q4ksQeQmJKgpF+Nc=;
	b=MdXEENHF+QAFYkc44pxh2U6X60eCSqAEtsFGzRxHg9bsfvsK1H68wZwKgfkZl4fpcb
	euta5yq0u/+h9frSkkD4e9I/t9stJUEyNgDCQcCYo6yq88iHdqsNgFagcc+gwEHwsTbo
	ZlXp4gCOksFpezIXdlp9ya6YxtaGx9V1NaAir59KkXrn4JNX9nDPtgKU4zriT+lfwn0S
	8gGWxzc2VckuiPD7YAMKcxrp9WF+TygIfTuhWmZeAnHZ7vSChPBSIqFoxV/Ub8ItPA8t
	L4qog2ADn5X3wI0EIjzK5zYJA8irMFm2Ly5rhbLxrmDB4c4he8795DfG16INyJcZL3kB
	HpRw==
X-Gm-Message-State: ABuFfojaxarfnn3NMwMS2azv3b6S4Rj0/poVCxq4OH4XLHiGRkcdQF4E
	fJuXCZ56+tzujyGJNQNcLReSKbdL2UYpbo9JX+z/4w==
X-Google-Smtp-Source: ACcGV63RG1/nk4iFQ0rWjgzHMH6vQHlbtzLgxvVOgsfJJpEj37EDLECb/yLWcRRECygtIA5K/u4oxU2kRApLwBx5nGA=
X-Received: by 2002:a9d:48dc:: with SMTP id a28-v6mr9654otj.343.1537530208311; 
	Fri, 21 Sep 2018 04:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180920204232.10583-1-abrodkin@synopsys.com>
	<20180920204232.10583-9-abrodkin@synopsys.com>
	<CAJTo0Lb9HFXbXVNDHoMyx8eF06kd0710B0+KXuiCAocvGLevfw@mail.gmail.com>
	<a370dc1964172f81c3c8fec7a3165d0657ad6042.camel@synopsys.com>
In-Reply-To: <a370dc1964172f81c3c8fec7a3165d0657ad6042.camel@synopsys.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Sep 2018 12:43:16 +0100
Message-ID: <CAJTo0LbYoWHzOko6QhqzGdKJN=Gavav8ooVSTWLQxb9zq6ctgQ@mail.gmail.com>
To: Alexey.Brodkin@synopsys.com
Cc: linux-snps-arc@lists.infradead.org,
	OE-core <openembedded-core@lists.openembedded.org>,
	Claudiu.Zissulescu@synopsys.com
Subject: Re: [PATCH v2 8/9] binutils: Fix Glibc building for ARC
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
X-List-Received-Date: Fri, 21 Sep 2018 11:43:27 -0000
Content-Type: text/plain; charset="UTF-8"

That's good to know, thanks.

Ross
On Fri, 21 Sep 2018 at 12:41, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Ross,
>
> On Fri, 2018-09-21 at 11:55 +0100, Burton, Ross wrote:
> > I don't like accumulating pending patches for something as key as
> > binutils, are these actually working their way upstream now?
>
> Sure they are!
>
> Our team development is very upstream targeted, i.e. we try to
> submit all our changes upstream. But with Binutils we're lagging
> behind upstream a bit because recently we made some significant reworks
> and now catching up with upstream.
>
> What's more my colleague Claudiu Zissulescu recently became
> official Binutils maintainer for ARC, see
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=02d7a79e1b93240729a52246432d9a84583bcf82
> so I expect less and less patches for ARC will be "pending".
>
> Not sure though if that makes much sense.
>
> -Alexey

