Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92079C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 05:58:00 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.2991.1659419869815278905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 22:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IzSXg8Kf;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id f20so13242356lfc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 22:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=tfe4L5QKd2VI4lPSjQmVRmKoPsYuCvf31k6vE3EcZrU=;
        b=IzSXg8Kf0+jb+cF+q9XFR7xnjhh/4E9GH0KN1b0dRJ9hWRAquZoGzclPHtzGhBgX1M
         Gg51dGzRrhR+JEUDcaTXNVvphsQBmTgDlgaNKNtT9AbyXIRB/u+0aKgpvFVfYk0W/ehx
         Rfx4tdNffJx3/sQ3vBKdH/QV1Zh8WRE2gq6ZCpiyU4U+8uZfUs8aGI1ULE0Msc1qCIWc
         KXNboTn3jTZIHq464LkSaoy4WqmNtfU8jB224JoeWSw8UUdVwLzurGH3jbUvUvRzoUMr
         89J5KL/CnNsr89YshE1gxWwQCXAJCBXV15cx8qQHKMpRwoED8hMrELevf8bL0VHOnY6/
         RHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tfe4L5QKd2VI4lPSjQmVRmKoPsYuCvf31k6vE3EcZrU=;
        b=5P5ebs0EI7YbRPVsPK9SpmmNLo3wYJAIxyNT/95IiT5Z2ajXx98VbnR4r7nidiDnt6
         ELE5Pdpoa1cpn+DUclf1zWc3Z6JhPpf5XzQDhk6dVsXdzHak58GrWdqtEXOemhwRWXUM
         +YAQ4R6zkCSHmvoUSoqs+8ND5S9/6AsFUwSv1dkDIs6/t1C+JBVle153j/14uGrJYV1Z
         48bNPTY4xFrcyYJD3knIApkWIdn129d1Hke57lF0Kso2vm7wFFCS8flBD472/0LeJuw9
         9F+eDPi8M4rs57nrq6+hlI1nJQWRwfP/uMHdeB/oS2zSa2K/Rom73kWfFYkHzsgC6dn1
         4juA==
X-Gm-Message-State: AJIora8Fx46NXJj+UaGGqnhrVwYHl76ZzO3osCUM3Z8v2KfC/ig4Aacm
	bLTbF6xZN6NOBqjtg2IvTHoTzMgHaQVxCn80D46vR+/G
X-Google-Smtp-Source: 
 AGRyM1vPSQ/qIQpDuYP5Glf10gxgQZuuManHiyECv4zLM/BY7uVgaHnOT0zDImd2ZU7mD2Af8luL6qtSQiuNBWc7J+w=
X-Received: by 2002:a05:6512:c02:b0:48a:80f:b92d with SMTP id
 z2-20020a0565120c0200b0048a080fb92dmr7154333lfu.675.1659419867982; Mon, 01
 Aug 2022 22:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659105705.git.steve@sakoman.com>
 <75503a13cb2a2266f311477a605389bbac7676e2.1659105705.git.steve@sakoman.com>
 <CAApg2=Ssr1jO61mMOg4_QnT=4EFeu21N9sASB1esde0yYwUiJA@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Ssr1jO61mMOg4_QnT=4EFeu21N9sASB1esde0yYwUiJA@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 2 Aug 2022 07:57:35 +0200
Message-ID: 
 <CAApg2=S2rNKCKv0gAvVwwraO9-1jL_cAmJ2uf87V8hpYkn8jxQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 11/29] xserver-xorg: update 21.1.3 -> 21.1.4
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 05:58:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168767

On Tue, Aug 2, 2022 at 7:56 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> On Fri, Jul 29, 2022 at 4:47 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > Security update
> >
>
> With this update we're getting:
>
> Parsing recipes...WARNING:
> /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb:
> Exception during build_dependencies for AUTOREV
> WARNING: /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb:
> Error during finalise of
> /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> ERROR: ExpansionError during parsing
> /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> Traceback (most recent call last):
> File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/git.py", line
> 249, in Git.urldata_init(ud=<bb.fetch2.FetchData object at
> 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at
> 0x7fc0cafbd0d0>):
> > ud.setup_revisions(d)
> File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> line 1347, in FetchData.setup_revisions(d=<bb.data_smart.DataSmart
> object at 0x7fc0cafbd0d0>):
> for name in self.names:
> > self.revisions[name] = srcrev_internal_helper(self, d, name)
> File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> line 1212, in srcrev_internal_helper(ud=<bb.fetch2.FetchData object at
> 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> name='default'):
> if srcrev == "AUTOINC":
> > srcrev = ud.method.latest_revision(ud, d, name)
> File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> line 1624, in Git.latest_revision(ud=<bb.fetch2.FetchData object at
> 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> name='default'):
> except KeyError:
> > revs[key] = rev = self._latest_revision(ud, d, name)
> return rev
> File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/git.py", line
> 752, in Git._latest_revision(ud=<bb.fetch2.FetchData object at
> 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> name='default'):
> return sha1
> > raise bb.fetch2.FetchError("Unable to resolve '%s' in upstream git repository in git ls-remote output for %s" % \
> (ud.unresolvedrev[name], ud.host+ud.path))
> bb.data_smart.ExpansionError: Failure expanding variable SRCPV,
> expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
> FetchError: Fetcher failure: Unable to resolve '21.1.4_2022_05_23' in
> upstream git repository in git ls-remote output for
> github.com/JeffyCN/xorg-xserver
> The variable dependency chain for the failure is: SRCPV -> AUTOREV[vardepvalue]
>
Additional information: it happens on zephyr and freertos builds.

Regards,
Marta

