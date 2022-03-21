Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B69C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 10:57:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.28908.1647860219024681180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 03:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O2v+vyt0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id r13so5070190wrr.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xzrJQgXG2I1AH7egku/sLoNdH+Vh0ouZ123exqMjq6c=;
        b=O2v+vyt0b98a1ZKO0gfpmI9AG436kdACPf8nthC0E49mAqe4cPC9qTykE+0bqi7wnp
         QhbeJkOn6mLbO6YdyeYKfFVARCnKcTz9QAc2XiudZQZmaZ47WKorgcTJJ016C98MX8Ji
         ygzdDphn4ei21lHBLvs7bEt9SFLgfY3Okg5l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xzrJQgXG2I1AH7egku/sLoNdH+Vh0ouZ123exqMjq6c=;
        b=SKHfUbUxvF6b1C87HQz9ETq85XTfmKX1BLudOPYLgcbvcpABTovwLl8D3tQVaDmN2x
         LzLB9brZYC8sKXs8xyXR4T+qQMyTVAkpQSQMVx2XO/RDdrLjDxYS/nd8R6EZtEVsMUbL
         n1yG7VzIXzgbqMCV2zLf2M6YJg5omf59VM96yrk4cHXITUxejBFF2moVdbFs/wdq5E7r
         8d7QihUNjjUZSAJ29WmTj0QLvJfataQKQnqQgHz6VcJJDisvR59u30L9fi9z+BIwGB94
         FNlmFFGoASNaoZt0UwVEEk5klC3HNjj3B48LOW0A920FJdwsbRRyklsQKTIgWatxEktg
         CLlw==
X-Gm-Message-State: AOAM531yO7zC3Knt7gVNkYjd1WrfgC21pJf8sicc3OeT80Rgru2ctdDu
	YHPxWsvS6XMWtl0iVjZY0JcZNQ==
X-Google-Smtp-Source: 
 ABdhPJxgGrZmTWT+12/ayE9HGawFHcBq400Zfjbw3SO/fID8mkikO5xtfrKUpd4F+1thle3PzN1N8Q==
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr18010690wrm.521.1647860217343;
        Mon, 21 Mar 2022 03:56:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7422:13d5:6a39:d39?
 ([2001:8b0:aba:5f3c:7422:13d5:6a39:d39])
        by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4f07000000b00203db8f13c6sm12933658wru.75.2022.03.21.03.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 03:56:56 -0700 (PDT)
Message-ID: 
 <7712ff4a2b5054303f127fd23d363cdfd10c47bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] kernel: Add kernel-cve-tool support to
 help monitor kernel CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
	paul.gortmaker@windriver.com
Date: Mon, 21 Mar 2022 10:56:55 +0000
In-Reply-To: <YjhW7Krf3WZmBbQK@korppu>
References: <20220319192555.1118739-1-richard.purdie@linuxfoundation.org>
	 <Yjgtzy+HeQfaEOqQ@korppu>
	 <3de447ee8439264e9164d5f9eded0ea0a6891500.camel@linuxfoundation.org>
	 <YjhW7Krf3WZmBbQK@korppu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 10:57:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163498

On Mon, 2022-03-21 at 10:43 +0000, Mikko.Rapeli@bmw.de wrote:
> On Mon, Mar 21, 2022 at 10:37:17AM +0000, Richard Purdie wrote:
> > On Mon, 2022-03-21 at 07:48 +0000, Mikko.Rapeli@bmw.de wrote:
> > > Hi,
> > > 
> > > Thanks for the interesting patch!
> > > 
> > > On Sat, Mar 19, 2022 at 07:25:55PM +0000, Richard Purdie wrote:
> > > > This adds support for a random kernel CVE monitoring tool which can be
> > > > run as a specific task against a kernel:
> > > > 
> > > > $ bitbake linux-yocto -c checkcves
> > > > [...]
> > > > Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 135 (100% match, 100% complete)
> > > > NOTE: Executing Tasks
> > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for be80a1d3f9dbe5aee79a325964f7037fe2d92f30:CVE-2021-4204 (NOT FOR THIS VERSION)
> > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 20b2aff4bc15bda809f994761d5719827d66c0b4:CVE-2022-0500 (NOT FOR THIS VERSION)
> > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 55749769fe608fa3f4a075e42e89d237c8e37637:CVE-2021-4095 (NOT FOR THIS VERSION)
> > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 4fbcc1a4cb20fe26ad0225679c536c80f1648221:CVE-2022-26490 (NOT FOR THIS VERSION)
> > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for dbbf2d1e4077bab0c65ece2765d3fc69cf7d610f:CVE-2019-15239 (NOT FOR THIS VERSION)
> > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 89f3594d0de58e8a57d92d497dea9fee3d4b9cda:CVE-2022-24958 (NOT FOR THIS VERSION)
> > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 1bfba2f4270c64c912756fc76621bbce959ddf2e:CVE-2020-25220 (NOT FOR THIS VERSION)
> > > > NOTE: Tasks Summary: Attempted 627 tasks of which 626 didn't need to be rerun and all succeeded.
> > > > 
> > > > Posted as an RFC to see what people think of this. I make no claims
> > > > on how useful it is/isn't but wanted to show integration isn't difficult
> > > > and provide some inspiration for ideas.
> > > > 
> > > > Details on the tool in question: https://github.com/madisongh/kernel-cve-tool
> > > > 
> > > > I've ignored the NO-FIXES-AVILABLE and PATCHED-CVES files.
> > > > 
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > ---
> > > >  meta/classes/kernel.bbclass                   | 10 ++++++++++
> > > >  .../kernel-cve-tool/kernel-cve-tool_git.bb    | 20 +++++++++++++++++++
> > > >  2 files changed, 30 insertions(+)
> > > >  create mode 100644 meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb
> > > > 
> > > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > > index 4f304eb9c7a..a842747b9d9 100644
> > > > --- a/meta/classes/kernel.bbclass
> > > > +++ b/meta/classes/kernel.bbclass
> > > > @@ -753,6 +753,16 @@ addtask sizecheck before do_install after do_strip
> > > >  
> > > >  inherit kernel-artifact-names
> > > >  
> > > > +do_checkcves () {
> > > > +	cd ${S}
> > > > +	kernel-cve-tool -P ${STAGING_DATADIR_NATIVE}/kernel-cvedb
> > > > +	while read -r line; do 
> > > > +		bbwarn "Should consider cherry-pick for $line"; 
> > > 
> > > cherry-picking isn't recommended. Instead, stable releases should be merged
> > > fully into product trees to fix CVE and other critical bugs.
> > > 
> > > cherry-picking will miss bugs which don't yet have CVEs or exploits.
> > > cherry-picking will also miss non-obvious patch dependencies.
> > > 
> > > Kernel community including Android documentation strongly recommends
> > > stable tree merges.
> > 
> > If you have a stable tree available!
> 
> As a git remote you always will. If you get a BSP Linux kernel without
> git version history, well you and your vendors are doing it all wrong.
> 
> It is always possible to merge stable tree releases into vendor trees.
> 
> The amount of hacks in vendor trees can make this hard, e.g. merge conflicts, but
> it is still the best practice which will be better in the long term instead of
> cherry-picking only CVE fixes.

My point was that those stable trees only have a certain lifetime though. What
do you do once you're past that?

I appreciate the correct answer is upgrade. I suspect that isn't always an
option and having some idea of the security issues in your tree is probably
better than no idea.


> 
> > > https://source.android.com/devices/architecture/kernel/releases#keeping-a-
> > > secure-system
> > > 
> > > "When deploying a device that uses Linux, it is strongly recommended that all
> > > LTS kernel updates be taken by the manufacturer and pushed out to their users
> > > after proper testing shows the update works well"
> > > 
> > > http://kroah.com/log/blog/2018/02/05/linux-kernel-release-model/
> > > 
> > > "When deploying a device that uses Linux, it is strongly recommended that all
> > > LTS kernel updates be taken by the manufacturer and pushed out to their users
> > > after proper testing shows the update works well. As was described above, it
> > > is not wise to try to pick and choose various patches from the LTS
> > > releases..."
> > > 
> > > I think the cherry-pick status is not useful, but the list of CVEs and patches
> > > to various subsystems is useful to users. IMO the tool should ask for a point
> > > release merge from upstream instead.
> > 
> > I think a lot depends on the scenario you're using this in. The different ouputs
> > are useful in different scenarios...
> 
> I'm sorry but really, there isn't anything else which will work in the long run.
> If anyone proposes cherry-picking Linux kernel CVE patches, they are doing it wrong.

Perhaps the message should say "potential CVE commit missing?" and cherry-pick
was a poor choice based upon the upstream tool.

Th data I didn't show may also be much more useful depending on the scenario but
as I mentioned, it really was a patch just showing what could be possible rather
than saying it was the right thing.

Cheers,

Richard





