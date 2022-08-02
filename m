Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBCEC19F28
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 05:56:40 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.3010.1659419791492250011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 22:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TUZ2f8n9;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id c17so1966313lfb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 22:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=RFA+Hk6erQ3C2eRgJ5Dbhpm7WbV7v+irFB7Ji7s2K6I=;
        b=TUZ2f8n9ITHszXH5D4xEtSbERznszxexfJ98eBBdFlx2Vt2qsTGrK0H5O8fV4INP03
         2a2vyXIuTgp7uNdBGYpTuCgXR8M/3Vs0IUS4v8WBZfBn9vC7uHP17U3JtOfqpdiTFWeC
         By7OKnH3MWXnxVGWM3SGBxKOw6kM7NOLwaFcK6I2SVyEWxJtxg2mepyaaxCe+3lGpq2t
         81iWliWnpeGGTPDY7TapRUSG15vA7LpPV3lm5bZOdk1QFTvWXKiy+dO5o+z+Dg0+xN56
         H+KdjNs89pOzk7ZJomMaz0O4k+yPWSUgAUA5NQ3enqkV4puFpnr2IiLV5PlAIRQ+0/Ji
         +EDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=RFA+Hk6erQ3C2eRgJ5Dbhpm7WbV7v+irFB7Ji7s2K6I=;
        b=jX7zP93s6gw+FGseBUwoux0q0EW67OYG8qrzQ3WKTQMYGkhnJHy+M+2/ZDrzxSIB0t
         sJd9NgfHPY5dt2C+5GFeJmfpJ71Fx69kprxL37zFpXwan5Hr4yrf6Cx7a8ghHk/fdLMB
         UJnNYU5JXL44M3pobjE8ZeqqsoOE5Jnrbc2PtQExDIHTMLy/tu9bq9oPodvrv8oy7nZ9
         LU0jLK0ztMWC+QE0TpCVVw7pU3Lxi/rE7LAGbyNBysYiCtShTgxkJHF16JqcPwZ6sszm
         YMFUfQo8XFtVxnI8ICw5CudzNPpOXNSS7KWxfLFNZEYheALEPCTcX4VTYQKM57OMsEJA
         3OEg==
X-Gm-Message-State: ACgBeo2eG1qhs+LTo9nbSvk7oTV+jRPpuFXoySxwzd1BSDJTSOz84P/2
	9oH0Wi3dsVhMlGnlAjJRSp8W7uyLOxR8Qbp9HQs=
X-Google-Smtp-Source: 
 AA6agR50C8WLtVeboGH4F5HhDvw9egq4hMKN437WZ+yWGM7xawzEdUZjQeeCQsKn5zsYNfzvKnBTiT2yEcUTtM8BNog=
X-Received: by 2002:a05:6512:3e06:b0:48a:fea8:9252 with SMTP id
 i6-20020a0565123e0600b0048afea89252mr2245354lfv.327.1659419789072; Mon, 01
 Aug 2022 22:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659105705.git.steve@sakoman.com>
 <75503a13cb2a2266f311477a605389bbac7676e2.1659105705.git.steve@sakoman.com>
In-Reply-To: 
 <75503a13cb2a2266f311477a605389bbac7676e2.1659105705.git.steve@sakoman.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 2 Aug 2022 07:56:17 +0200
Message-ID: 
 <CAApg2=Ssr1jO61mMOg4_QnT=4EFeu21N9sASB1esde0yYwUiJA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 11/29] xserver-xorg: update 21.1.3 -> 21.1.4
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 05:56:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168766

On Fri, Jul 29, 2022 at 4:47 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Security update
>

With this update we're getting:

Parsing recipes...WARNING:
/tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb:
Exception during build_dependencies for AUTOREV
WARNING: /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb:
Error during finalise of
/tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
ERROR: ExpansionError during parsing
/tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
Traceback (most recent call last):
File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/git.py", line
249, in Git.urldata_init(ud=<bb.fetch2.FetchData object at
0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at
0x7fc0cafbd0d0>):
> ud.setup_revisions(d)
File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
line 1347, in FetchData.setup_revisions(d=<bb.data_smart.DataSmart
object at 0x7fc0cafbd0d0>):
for name in self.names:
> self.revisions[name] = srcrev_internal_helper(self, d, name)
File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
line 1212, in srcrev_internal_helper(ud=<bb.fetch2.FetchData object at
0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
name='default'):
if srcrev == "AUTOINC":
> srcrev = ud.method.latest_revision(ud, d, name)
File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
line 1624, in Git.latest_revision(ud=<bb.fetch2.FetchData object at
0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
name='default'):
except KeyError:
> revs[key] = rev = self._latest_revision(ud, d, name)
return rev
File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/git.py", line
752, in Git._latest_revision(ud=<bb.fetch2.FetchData object at
0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
name='default'):
return sha1
> raise bb.fetch2.FetchError("Unable to resolve '%s' in upstream git repository in git ls-remote output for %s" % \
(ud.unresolvedrev[name], ud.host+ud.path))
bb.data_smart.ExpansionError: Failure expanding variable SRCPV,
expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
FetchError: Fetcher failure: Unable to resolve '21.1.4_2022_05_23' in
upstream git repository in git ls-remote output for
github.com/JeffyCN/xorg-xserver
The variable dependency chain for the failure is: SRCPV -> AUTOREV[vardepvalue]

Kind regards,
Marta

