Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8F2DC78A20
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 10:03:47 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id l189-v6so4543674vke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kdpcJ+bsvPfTd+ncHHXWF6pvMH9xR1yrwvq98s8AxPs=;
	b=f2lIDivOHgBEsI/69rZm1XiSsi09atkC8ApK6dWUXfjAZf6ojZxWqBoN6poxWrkWL7
	GWuQFe5/ohYOgfAnnwkMf5vAb/v8RxljBcsIAWGB1Vz63zwCY8Brrs5Hudlyxqa27XaQ
	EXf2I8/Kj+y/5PofqJxexCQZ9eIY5r286SGOaBDaQchsKO9IvrACQwOz8ah3CAagRsMG
	z5opBSZ//RRtmn1kLvJAE2CYSvMfGtPu3Z5gwvuxOs5G4TGcfVIYIFDtqEjtSoibrNkV
	S/flN/QWbbwYgIyjhzsGvr/m4f8M2ldDdV2+kJ4woo1nzlD2x4lWYv+Ifu/RXYIpwPct
	AzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kdpcJ+bsvPfTd+ncHHXWF6pvMH9xR1yrwvq98s8AxPs=;
	b=Mb+TVy0KfvxUVjyO8UMRzRKXx4++pAk9XUqgo3v7nJB1K6kNbV7c+g0uE4mXpSeB4c
	rqo7yx8xPYXWKG9Xknaq5wxIjmy1jq41MpEzEAmiPy6Tvp1ZQNzQlWpNbITVTa/G5aSG
	EW6O2QMximkT+/+IzTIHTDXToUsWuLsaLgNvleCQ7dgOLerFJ4XuRDhNEnJY5ui+ldVi
	nlREcPudZCI2Qkl+bGXOidg7tYkpQa60Om9lYiEcjGCplqN+SDK3UNDvKlQsjE9Qn+k+
	qyLKtqieMTbwXEQGOQ0bPBmCk2CVloKcDSQS8vCKChPKx6gTN9hzGaA/66ge2d9xFLuS
	Ti8Q==
X-Gm-Message-State: APt69E1JEd8a8hGTWg1TTDA0VfwvuY1/nJZ0JUpNyJrnuaGSI8g1ka35
	uVhoRFPifkOj1Qv7wuKpvPvz/hnIRv2G/+RLmEf3mg==
X-Google-Smtp-Source: AAOMgpcruWylAhuslp9OcSZCE87QwmyMz3bflpzaPqWE7djYxj7Zrci9j0pgXEDOqgA2EP6QiyHRyfDvd1is8/UARXI=
X-Received: by 2002:a1f:320:: with SMTP id 32-v6mr2919933vkd.13.1530785028284; 
	Thu, 05 Jul 2018 03:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <1530621453-19618-1-git-send-email-alex.kiernan@gmail.com>
	<87af19446a0ae84f556b5da5d209245da12f89c3.camel@linuxfoundation.org>
In-Reply-To: <87af19446a0ae84f556b5da5d209245da12f89c3.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 5 Jul 2018 11:03:37 +0100
Message-ID: <CAO5Uq5QyYNYzT0bcD_M79WuTx2gSN5OYO-tSA8sWnHxEV47Mxw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] openssh: Add dependency on ssh for sftp
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
X-List-Received-Date: Thu, 05 Jul 2018 10:03:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 5, 2018 at 10:32 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2018-07-03 at 12:37 +0000, Alex Kiernan wrote:
> > Add missing dependency on the ssh binary for the sftp client to avoid
> > failure at runtime if it's not been installed through another
> > dependency
> > chain.
> >
> > This introduces a note if PREFERRED_RPROVIDER_ssh is not set and it
> > can be satisfied by multiple providers (e.g. openssh and dropbear).
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> > Changes in v2:
> > - Depend on ssh not ${PN}-ssh so it can be satisfied by openssh or
> > dropbear
> >
> >  meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 1 +
> >  1 file changed, 1 insertion(+)
>
> Won't this patch still introduce build time warnings?
>

Yes, sorry, I intended to tag it as RFC, but clearly didn't.

> I have to agree with Mike's comments, I'm very worried this change is
> going to introduce problems for a lot of people...
>

Yeah :(

-- 
Alex Kiernan

