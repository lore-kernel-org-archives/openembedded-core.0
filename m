Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.9804.1620889732229214092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 00:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cNMyS8uI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id o127so14074935wmo.4
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CrWnTX0/kIFvH4b4Ln82MBa4eqCgo3KuCM0cD04ptH4=;
        b=cNMyS8uI2tWU3lcOTN1opmVexGqbvYKEehCOOzNGkG7Hwv/Dnzu59qNhek0idrJZ3D
         cdfdrMiLp/U+nnpMPBac2pyYSuEyceir1nvOyMe166A02wvED+L7CDPYnM3q9cnF/h58
         d5Lw6o5WqubITBPM5QZw373kJNOt+sCyFke7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CrWnTX0/kIFvH4b4Ln82MBa4eqCgo3KuCM0cD04ptH4=;
        b=LHi0gZBXXPPfBB6lqQq43nB9LjPF9kMA0R4kz4e3kqmd25rYrPc5AcbEBjzda/j8nx
         QX04PHL2GsWb+uOBSPVxuUQXIyGl4bwU5M9ttVdpLcf2Zre2p3cy0ea3RBGZ7sD6ydmA
         jDDdbYX7Jy0vSw9P8sCQzDtLlWIHfBMT7l6ZulOzHZJvxyUfjPzm9y1tUNJg/sqpqEFz
         DoXhO8sBFd+CxDIybYH3DX4ELmp5wmOAX8zvDZ2+lIJX+F5NpkGDMIoDZYcMvI+r0gUL
         C+q6K59baDtF5OVVub052iD1kAYiGKsnfwjKzZp0CTF8qFmrZFj2PNRm0ZiTIzZRqeYa
         4Bbw==
X-Gm-Message-State: AOAM533bx9K45QovL7yUkjKd7pcMRDWOD0vRMixYTFaQfN9vrVXB9snv
	gQ98l3Qjjy6czP3P0sn0d7eknA==
X-Google-Smtp-Source: ABdhPJyOpSCXFMASKp4tkKqufEvBU+or93BdvRW02fRcmqu6p8aj4nz1fU/hUnfKiLda6D20qOF9bw==
X-Received: by 2002:a05:600c:4242:: with SMTP id r2mr2261893wmm.140.1620889730742;
        Thu, 13 May 2021 00:08:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f649:3481:d239:bb03? ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id h15sm1549097wmq.4.2021.05.13.00.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 00:08:50 -0700 (PDT)
Message-ID: <5ceca668cfce15ebd8874fdaa9c01949fe1d95fc.camel@linuxfoundation.org>
Subject: Re: [OE-core] master/main branch renaming and bitbake
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: Colin Walters <walters@verbum.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 13 May 2021 08:08:46 +0100
In-Reply-To: <CAJ86T=UjJ8J3aUL7YX03oa1fy7zAwPk9vp+=yYxGNfEKsNt6oQ@mail.gmail.com>
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
	 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
	 <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com>
	 <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
	 <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
	 <CAJ86T=UjJ8J3aUL7YX03oa1fy7zAwPk9vp+=yYxGNfEKsNt6oQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-12 at 17:11 -0700, Andre McCurdy wrote:
> On Wed, May 12, 2021 at 2:23 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> > 
> > And by the way, another reason to check that revision is linked to a 
> > branch is when SRCREV is updated - we need some reassurance that the 
> > updated SRCREV comes from the same branch as previous SRCREV, or that
> > if the branch has changed, it's explicitly visible in the diff and explained in the commit message.
> 
> None of the answers given so far seem very convincing...

I had a look at the code to try and remind myself why it is doing this. 
The best answer I found is that it does support filtered fetching of 
remotes, i.e. it can and will only pull the branch it wants/needs rather
than a full repo clone. In the case of a small repo, it doesn't matter
much. For a large repo it can make a significant difference to the speed.
We also don't run "test" commands against the remote repo, we figure out
what we want and then get it with small numbers of commands.

Another reason we have the branch name is so that we can ls-remote the repo
when using AUTOREV for SRCREV. We've tried to make it so that once a url
is established in SRC_URI, you can make it use AUTOREV without changes to 
the url itself. The AUTOREV code path is in parsing which does mean we
need to be efficient about the revision resolution.

> If the git revision that a recipe wants is available on an unexpected
> branch in the upstream repo then it's not really different from a tar
> file being fetched from a mirror rather than whatever is in SRC_URI.
> If we want the fetcher to fail as an indication that an upstream git
> repo has renamed branches then don't we also want it to fail if a tar
> file disappears from an upstream server? It seems odd that one should
> be a fatal error and the other to be something we try to cover up and
> hide from the end user.

The fetcher is consistent. It will fail in both cases unless a source
mirror is available with the sources in. If a source mirror is available,
it should work.

> Anyway, for recipes which don't explicitly specify a branch in SRC_URI
> it would seem quite reasonable for the fetcher to check what the
> default branch is set to in the upstream repo and search for the
> required git revision in that branch (rather than rely on a hardcoded
> default of "master" as we do now). Going forward, there's going to be
> less standardisation on what upstream repos call their default branch,
> so we're either going to have to explicitly specify a branch in more
> and more recipes or teach the fetcher to automatically figure out what
> the default branch in the upstream repo is.

Is explicitly specifying the branch along with the repo url such a big 
problem? We already have to provide the url, it isn't like we guess that
too.

Cheers,

Richard

