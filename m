Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 021696117D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 09:45:49 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v4so6136760wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 01:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=xXyCjrESaOxKZYSbl0jwThTeuLZy4ss3j9Ngfnr7BFg=;
	b=NIcjg+VUPqqkRXZXV0A1FrWlFAblaiUaBkcU9uQdtH6gvWuomezQKXd61TR1aVztU3
	YCYUvtxhlCMSttJg1fvU7p0u5SArvbCzCOd9bql0cxZOwYRIbVCOQBbeJdf/EU6jo0jd
	PXXdrHSC/wcaeP4fogJUqDi8XISFcVxjWry3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=xXyCjrESaOxKZYSbl0jwThTeuLZy4ss3j9Ngfnr7BFg=;
	b=ompbVIbUyqpWtcGk0IZiTBPzVNBOxjW6hd8Pgqn5oQqbOUIUDjqR9p3LgIYpboeTS/
	JKIGlZXB4D7vcP5CubYx8US/6+4IlMXiw97/kuKxNby+5v2EctYbYcw5Rtn2vqgltSDF
	uh5lYKk3Ls6gCZcD3sZjVmT7zwLOioYjFDBxtFbg+sHstgrv4pQrkuFY15KA1LEFSsjD
	iMhqAtPbSYpO3uRZK354ecRirVuXBEo86z6Y7I6/nH0RqSJK9AF/5a42AWaniF1JXUW9
	7m5IhbmZqL5B5HrF+Tzg7Pda/MNjLrwMKbJil8rSzdK0P+fnbWgXwJEBQ34QppZPf0ou
	pHdg==
X-Gm-Message-State: ANhLgQ3RRZV5f1/JhbHtf/9cYs2UKTRMqpFPGHpZcUUfoU1tTTXRItfC
	FP/rRdFnM72xSJdFmcDtxSwZcw==
X-Google-Smtp-Source: ADFU+vvH5hZAMe98b7JWyQPi6OgIBGkRMzkRgP3BS5AqZWYvaRwrqs9W1FlTioyZepEAPc4auM99CQ==
X-Received: by 2002:a5d:526a:: with SMTP id l10mr6853514wrc.164.1583401550646; 
	Thu, 05 Mar 2020 01:45:50 -0800 (PST)
Received: from ub1910 ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id q3sm8002224wmj.38.2020.03.05.01.45.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 01:45:50 -0800 (PST)
Date: Thu, 5 Mar 2020 09:42:09 +0000
From: Paul Barker <pbarker@konsulko.com>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Message-ID: <20200305094209.3704f549@ub1910>
In-Reply-To: <cdda8416d63d0a7cdec45eefc8d93b1f74f175ec.camel@siemens.com>
References: <84e64ccddc46261a59bb1e281ef3294e08119abc.camel@siemens.com>
	<20200304095944.792423a0@ub1910>
	<cdda8416d63d0a7cdec45eefc8d93b1f74f175ec.camel@siemens.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: gitsm: download submodules
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
X-List-Received-Date: Thu, 05 Mar 2020 09:45:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Mar 2020 12:30:10 +0000
"Freihofer, Adrian" <adrian.freihofer@siemens.com> wrote:

> -----Original Message-----
> From: Paul Barker <pbarker@konsulko.com>
> To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
> Cc: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] bitbake: gitsm: download submodules
> Date: Wed, 04 Mar 2020 09:59:44 +0000
> 
> On Wed, 4 Mar 2020 08:12:27 +0000
> "Freihofer, Adrian" <adrian.freihofer@siemens.com> wrote:
> 
> > The unpack function failed because the submodules were not
> > downloaded.
> > Calling download before unpack for each submodule solves this issue.
> > 
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> >  bitbake/lib/bb/fetch2/gitsm.py | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/bitbake/lib/bb/fetch2/gitsm.py
> > b/bitbake/lib/bb/fetch2/gitsm.py
> > index c622771d21..3715e9824f 100644
> > --- a/bitbake/lib/bb/fetch2/gitsm.py
> > +++ b/bitbake/lib/bb/fetch2/gitsm.py
> > @@ -184,6 +184,7 @@ class GitSM(Git):
> >  
> >              try:
> >                  newfetch = Fetch([url], d, cache=False)
> > +                newfetch.download()
> >                  newfetch.unpack(root=os.path.dirname(os.path.join(re
> > po
> > _conf, 'modules', module)))
> >              except Exception as e:
> >                  logger.error('gitsm: submodule unpack failed: %s %s'
> > %
> > (type(e).__name__, str(e)))  
> 
> You shouldn't be trying to download submodules in the do_unpack step.
> If
> they're missing at this stage it probably indicates a fetch issue.
> 
> Basically true, but the information about which submodules need to be
> downloaded is not available before the top level repo has been
> unpacked. I guess the solution must be something like:
> 
> fetch top-level
> unpack top-level
> foreach submodule:
>   fetch submodule
>   unpack submodule
> 
> What's the exact error that you're seeing?
> 
> Don't remeber exactly. But when I debugged the flow, it became obvious,
> that the submodules are not downloaded.
> 
> This could be related to the issue I saw when the fetcher uses git
> shallow
> tarballs from a mirror - if that's the case I'm planning to get that
> fixed
> this weekend.
> 
> Yes, the problem occurs with git shallows. The patch solves it with and
> without shallows for us.
> 
> Also, your email client seems to have chewed the patch up. It's best to
> send
> patches using `git send-email` only.
> 
> Sorry, we switched to a new e-mail solution. I have to adapt my setup.

The problem with your patch is that it would require network access during
do_unpack which then breaks our ability to do offline builds.

Do you only see this issue when fetching from git shallow mirror tarballs? If
so, the mirror tarballs need to be extracted during do_fetch but not placed
in the usual 'git2' directory (as future fetches can't cope with shallow
clones in that directory).

Fixing this also has some impact on archiver.bbclass as that also needs to be
able to walk the tree of submodules correctly.

-- 
Paul Barker
Konsulko Group

