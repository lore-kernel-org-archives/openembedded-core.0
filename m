Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id E8C3B60E5D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 09:13:03 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id t26so1385905ioi.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 01:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rw61aJEKVEgAH2mgut0e7gUNr+kX7gnTzg2WoZgJJbs=;
	b=k4mYM5CJsoaSxV/5ngoHx0gU4WwoN8wzuJ9PlDK9v9eE8pr/MpjiKevQR/QM4SS/uT
	1eQ/AIhEZZyk1A1HXJJMnhKmDCrFcjs6VdAoiOCmqAHMW6nAlPUXUnIAaD/riV5i7imG
	YVmullTlIJmli3hHKR8NkL+31pgTe5cLVUp2lNyA1WhKq2U56u6nsu/0sIU2GeNTrPFI
	pdtW1to6+4RH9TVR/hdFbT8AQj/mnc/B69WcC4l7tnbPPqrJ93quL9pBozDWCieH40t8
	CfyTaaHHG7acRGNLynV8WoNJXUCtqIHJT/kGegpikbBojmOkLClLVtd9SlP8ZQcO/gPI
	6JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rw61aJEKVEgAH2mgut0e7gUNr+kX7gnTzg2WoZgJJbs=;
	b=dIazn/CZzrSgi3cok1Km7yujU7cbHLI+Le5f6gRRzJeF2NbTSKUzPJYYcaY6xo5sqE
	w0Sj3exsAXNfuP3xQJYLj45/O+mt+6G/k0nTf8iD2OP0LLWPOnKoiuLfPUTjvVY3Hlxx
	zdI3US9lQ/el0CpW4heqwSWwG3o2+gx470Y+YzPoCMF4D22664S0OjLR4gHqQ7AIcv6U
	kIVCwZq4y93GyjBiSzVqyqhOuD72Q0QnXBFpI76hQKG++EphHsvxF/j6WxCJJFIaDxfH
	WhKZvZ8vKPEFadXlh5/I/Cta5N54OPsDQGne030kIb60/GKEY5hRX7rtSHQm3XjUuLAK
	NgRQ==
X-Gm-Message-State: APjAAAUyiIp9x9+3U0QDpOMpvzWdH5VrFbtTH95C1rXvCQwK6BXf+0MT
	EJaGEw6jLAvgu68R7BnJaNiBK2E9/6IB07zKbBo=
X-Google-Smtp-Source: APXvYqxEZ1/H7cuewMSFh/Zp6grWYE7/RZ/s3sC23JCEyGsRuVZaPNrjJmEa/+INTOh+nN+C50hU1bDf6qwd4K4AKD0=
X-Received: by 2002:a6b:f80a:: with SMTP id o10mr2236218ioh.144.1581066784703; 
	Fri, 07 Feb 2020 01:13:04 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
	<ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
In-Reply-To: <ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 7 Feb 2020 09:12:53 +0000
Message-ID: <CAO5Uq5TB3pNatrFGwSdDt3gx6SARU5S-6M7AHfpOxgcrkUpBOA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cache unihash ... doesn't match BB_UNIHASH ...
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
X-List-Received-Date: Fri, 07 Feb 2020 09:13:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 8:31 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-02-07 at 08:16 +0000, Alex Kiernan wrote:
> > Hi
> >
> > We've got a couple of multiconfig builds with different
> > configurations in one bitbake run (whether it needs to be like this a
> > different question - I suspect we had something that worked and
> > stopped there!)
> >
> > However, for sometime we've been seeing errors like this on master
> > (the recipes vary):
> >
> > ERROR: mc:forensic:ca-certificates-20190110-r0
> > do_deploy_source_date_epoch: Cache unihash
> > 37d2546973a2b7c16fbcb1a8dd4939e4a1bba8c3d6d2dfb6e7204ca08d437ace
> > doesn't match BB_UNIHASH
> > 09baf78bd9316acdd308980c42ea4ed1eacea61bcc0d840c36293d1a5a22db69
>
> This is an internal sanity test. It means the hash that it had in the
> task/worker context didn't match what the server thought the unihash
> should be. There have been changes in this area to try and fix various
> things, I'm wondering if we introduced a bug with multiconfig handling.
>
> There are some patches in master-next related to this area so it would
> be interesting to know if that made things better/worse.
>

I can pull those in, if it'd be useful to test?

> > Coupled with deadlock messages:
> >
> > WARNING: Runqeueue deadlocked on deferred tasks, forcing task
> > mc:factory:virtual:native:/var/lib/jenkins/workspace/nanohub_master/b
> > uild/../poky/meta/recipes-
> > support/sqlite/sqlite3_3.31.1.bb:do_populate_sysroot
>
> This happens if a build has multiple different components with matching
> hashes. It builds the "first" one and defers the others since they
> could become available in sstate after the first one builds.
>
> You should see messages from runqueue.py:
>
> bb.note("Deferring %s after %s" % (tid, sqdata.hashes[h]))
>
> The behaviour should be to therefore prioritise one multiconfig. I
> worry that the sorting isn't quite right and its building bits of
> several multiconfigs and deadlocking?
>
> Do you have the logs with the Deferring XXX after YYY messages in you
> could share? I suspect its a sorting problem.
>

Sure - I'll mail it over separately.

-- 
Alex Kiernan

