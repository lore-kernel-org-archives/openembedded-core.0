Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id CE70E60053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 16:55:11 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so21287684igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 09:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=+K/pmRTCS33RiApTqxGVuvUo7bhN9XFtZSyYB4/u4KU=;
	b=RkTtDRKP/fhvbzNgyM2BNWE8REX2pyr5kjnICbl06n4Vqbqw83OLR2oxxNQbx2NJbN
	yRVJpLnJlP+zM98Bj42UU92W59/R3w/G/MAjqVNxtGUJwsaMBL9F9z/aD/C7RRf0sas9
	dvS+CRwNYqD47jJz1snLbJMrPKENApyLFJODA7TSppaGU/bt2LfnrDnzNtWz68nnygBX
	shIKuh34XPrI250xz5PIidoR9dhQM7Kbk3aG//9HFcHOlpdoKSBIynYz2XsrYoxOFYTB
	fQkjs3B08WgDzVEXwPhH3coA28qMTSytB9Dy+eEGtfnOnIftDS5OkXiBIU5JMrzCoD9D
	1UTw==
X-Gm-Message-State: ALoCoQlLhiA9+om7S0vWduhO26AE/cV2WLAo/2eLGKMuh0qttv+2h1/XRKnP19y/Q+DO3biehMHA
X-Received: by 10.50.79.229 with SMTP id m5mr7872473igx.1.1441904111591;
	Thu, 10 Sep 2015 09:55:11 -0700 (PDT)
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com.
	[209.85.213.176])
	by smtp.gmail.com with ESMTPSA id 12sm7436294ioe.40.2015.09.10.09.55.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 09:55:10 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so24926471igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 09:55:09 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.225.66 with SMTP id ri2mr8347416igc.5.1441904109632; Thu,
	10 Sep 2015 09:55:09 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 10 Sep 2015 09:55:09 -0700 (PDT)
In-Reply-To: <20150910153928.GB2387@jama>
References: <CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
	<255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
	<CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
	<1441177787.24871.33.camel@linuxfoundation.org>
	<55EF2670.6040101@gmail.com>
	<CAMKF1sogs9sRR_07nOxZrvvOxXj_=ioqNr=_vN+hr+VFf2BO6A@mail.gmail.com>
	<20150908210642.GG2381@jama>
	<CANFkWp=w7Lj_M4hPdBjNya+EHd_9oMJ9QM-ewGO2AAsxJs-9uA@mail.gmail.com>
	<20150910141812.GA2387@jama>
	<CANFkWp=0itcR3EOSnYS2Mjttg3kCxEHqCygAyigvkVE9kuNkaA@mail.gmail.com>
	<20150910153928.GB2387@jama>
Date: Thu, 10 Sep 2015 13:55:09 -0300
Message-ID: <CAP9ODKrNmvbj7L21PbSbt5Wo9JDTc82wxJ2-pV3T0yK497Frag@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Thu, 10 Sep 2015 16:55:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 10, 2015 at 12:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Sep 10, 2015 at 06:23:07PM +0300, Alexander Kanevskiy wrote:
...
>> might be. I haven't checked latest versions 2.10+, but versions below were
>> not up to the shape compared to e.g. pull-request workflow in GitHub.
>
> GitHub's pull-request workflow model is even worse than e-mail reviews
> on ML.
>
> It doesn't even support doing inline comments, because as soon as the
> "source" branch is rebased or just amended to address the review
> comments from v1, it will loose reference to all these comments, because
> the commits will look "new" (different git SHA).
>
> That's completely useless for good review, I want to compare different
> revisions of the same patch, to see what comments I had before and how
> they were addressed in new version. Github doesn't support anything like
> that, people are using different work-arounds like opening new
> pull-request for each revision (which means you need to always push to
> new branch) or listing the commit SHAs inside the global "comments"
> section, so that very patient reviewer can open the older revisions and
> do manual diff (by switching between 2 browser tabs back and forth
> trying to spot the differences or whatever).
>
> Atlassian Stash has exactly the same problem, ReviewBoard the same, they
> all think that to address review comments you just add another commit on
> top of your branch to fix the issues you introduced in submitted commits
> - but that's useless for code quality, bisect-ability etc. We don't want
> 10 garbage changes with incorrect commit messages and 11th change on top
> which fixes the issues, we're doing review so that each change is
> meaningful, build-able, test-able and properly documented in commit
> message - that's all I want to ensure by using code review tool and only
> Gerrit allows to do it efficiently.
>
> Gerrit shows all revisions of the same patch (as long as Change-Id is
> the same) in the same UI, allows you to see diff between any 2
> revisions including comments on them etc).
>
> Only people who never got used to do detailed reviews in Gerrit can say
> that Github's pull-request are "review-tool".
>
> You can see similar discussion e.g. lately in systemd ML after they
> moved to github "for better reviews".

I fully support Gerrit for it. It does has improved how our team work
internally and we don't regret of moving to it.

I like GitHub but for serious review it does a bad job; as community it is nice.

>> GitHub's model is to fork repository, do any amount of modification in your
>> own copy and then open "pull-request" for review where you just specify
>> source/destination repositories and branches with set of changes.
>>
>> Gitlab comment was practically to have similar to GitHub workflow, but
>> instead of public's GitHub service to have instance on openembedded.org
>> infrastructure, and thus requiring users to register accounts there.
>
> But we want to depend on well-maintained external service like we depend
> on github.com to mirror our repositories and we ask our users to use
> github mirrors instead of git.openembedded.org.
>
> Similarly we can depend on http://gerrithub.io/ to host our gerrit
> instance to save some maintenance for people with access to
> openembedded.org infrastructure.

If desired we can host it in one of our machine and provide an
exclusive VM for OpenEmbedded to use.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

