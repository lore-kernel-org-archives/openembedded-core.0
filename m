Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10AEC3A5A3
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web12.6428.1650618441626057522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CYOra791;
 spf=pass (domain: gmail.com, ip: 209.85.166.49,
 mailfrom: rybczynska@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id h83so7952131iof.8;
        Fri, 22 Apr 2022 02:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=MH94ousu1M8QjpxS3JaF8Qnk+PEGqZFxN/qt2Phy72w=;
        b=CYOra791mqZIBHCsSEfbR0aAGaHIchorDeTrxGfh0gqyE4M7n+PfRLzeCBgfJaGFUo
         ehEIodTcJCCdJ69j/JyYdg2agpYJ80j7zGH+Y4NKeIpxvRCoSM5CNwUc3Hq7bVzgHcT0
         dPZXPbftEstlI1W2d7Kr5veQGX70Zl3Qv6e5RrixggFjNW2HYhkZngjRaXSlRYO2vYnl
         gAzn7I6yq5H3gBqmCP+Q+jTTHLnNJMkcfn3bUpihLuH2JMZZKvfOr5/YcVaw/3Q1C2nH
         E4RU4kZ7+lnxc3IRZwmYZHYtB6UVKW9E4Z/p9KRDmz7lEnSQ0tAX5IFDc/mDg0/bbNar
         UHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=MH94ousu1M8QjpxS3JaF8Qnk+PEGqZFxN/qt2Phy72w=;
        b=mHgsAJnWox5dCvbgwXZMrhYJb9YnQRG2lupvAzNE8NvV/zWERirJf7nEpwUcSmYm2H
         eEjERjUx2k10wdB6EHwAlrx15/iGIYznlDern2i9Umu+xldRRuAaGUUeuqLSIWupcZ71
         yM3rBmLDKRL9AMC1IUI44uvewmbq0Axw6cC64kCWalNiInqx6LycjLKMHyaFx89Dzsa8
         pQWGnn3QiFJPLHD+lJAQfmrg0pfBQQfKqrvl5/2UGbZu3ECz5iH9HYwrcdpy9LIWVHgN
         9YIhgjHbz2jpuLCAb0bnbltpIwDgxRrS4BgPkFpG05YCV6xwVuLsjjur5NIEUIzpur91
         //zA==
X-Gm-Message-State: AOAM532l7Teq61O/zBkhbLIBFXu6P9Jf2bX3aP/h0DJhTtZF8dLg4r6o
	jErAgibtUQ6z7Z3SXg7xUiG5yIpCV0lh/RY20IaPgr+wvvc=
X-Google-Smtp-Source: 
 ABdhPJzt/Eldr3KK70EakY6nivgtIC71NZQDfBbciXiEbjS8L3ftGA+5uZ8zql4ElWMYuyZ7hHcOFvZ14kWlLzvPGJU=
X-Received: by 2002:a05:6638:218e:b0:32a:b468:5f36 with SMTP id
 s14-20020a056638218e00b0032ab4685f36mr756922jaj.169.1650618440305; Fri, 22
 Apr 2022 02:07:20 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 22 Apr 2022 11:07:09 +0200
Message-ID: 
 <CAApg2=Q9DOoYVHNSCR_=pEN-x7EQuRw2yhwqWhEG2zaMTONt8w@mail.gmail.com>
Subject: CVE-check failing on world with meta-openembedded: diff.gz file
To: OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cb4d5605dd3a8df2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164780

--000000000000cb4d5605dd3a8df2
Content-Type: text/plain; charset="UTF-8"

Dear all,
We're running cve-check on a world build containing oe-core, meta-oe and
more. We have an issue with the lockdev recipe
(meta-openembedded/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb), which
causes a fail like below:

$ bitbake world --runonly=do_cve_check
ERROR: lockdev-1_1.0.3-r0 do_cve_check: File Not found:
<path>lockdev/1_1.0.3-r0/lockdev_1.0.3-1.6.diff
ERROR: lockdev-1_1.0.3-r0 do_cve_check: Failure in searching patches
ERROR: Logfile of failure stored in:
<path>/lockdev/1_1.0.3-r0/temp/log.do_cve_check.8709
ERROR: Task
(<path>/meta-openembedded/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb:do_cve_check)
failed with exit code '1'

The issue is caused by the fact that lockdev_1.0.3-1.6.diff is missing.
When we look into the recipe, it is downloading lockdev_1.0.3-1.6.diff.gz
file Please note the additional extension.

Stripping the extension comes from oe-core/meta/oe/patch.py, from the
patch_path function, which is figuring out if a file is a patch, and
returning the local path if it is so. However, at the moment when we
do_cve_check, the .gz file is not uncompressed.

I'm wondering how to solve it.
1. Add a dependency to make sure eventual patch files are decompressed
first?
2. Do not consider this as a patch file in the scope of cve-check ? (this
is more a part of the source then an actual patch that might be fixing a
CVE)

This is the only case like that we have in the build. Please note that
removing ".diff" from the extension list in patch_path() is solving the
issue.

Any comments or suggestions?

Kind regards,
Marta

--000000000000cb4d5605dd3a8df2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear all,</div><div>We&#39;re running cve-check on a =
world build containing oe-core, meta-oe and more. We have an issue with the=
 lockdev recipe (meta-openembedded/meta-oe/recipes-support/lockdev/<a href=
=3D"http://lockdev_1.0.3.bb">lockdev_1.0.3.bb</a>), which causes a fail lik=
e below:</div><div><br></div><div>$ bitbake world --runonly=3Ddo_cve_check<=
/div><div>ERROR: lockdev-1_1.0.3-r0 do_cve_check: File Not found: &lt;path&=
gt;lockdev/1_1.0.3-r0/lockdev_1.0.3-1.6.diff<br>ERROR: lockdev-1_1.0.3-r0 d=
o_cve_check: Failure in searching patches<br>ERROR: Logfile of failure stor=
ed in: &lt;path&gt;/lockdev/1_1.0.3-r0/temp/log.do_cve_check.8709<br>ERROR:=
 Task (&lt;path&gt;/meta-openembedded/meta-oe/recipes-support/lockdev/lockd=
ev_1.0.3.bb:do_cve_check) failed with exit code &#39;1&#39;</div><div><br><=
/div><div>The issue is caused by the fact that lockdev_1.0.3-1.6.diff is mi=
ssing. When we look into the recipe, it is downloading lockdev_1.0.3-1.6.di=
ff.gz file Please note the additional extension.<br></div><div><br></div><d=
iv>Stripping the extension comes from oe-core/meta/oe/patch.py, from the pa=
tch_path function, which is figuring out if a file is a patch, and returnin=
g the local path if it is so. However, at the moment when we do_cve_check, =
the .gz file is not uncompressed.</div><div><br></div><div></div><div>I&#39=
;m wondering how to solve it.<br></div><div>1. Add a dependency to make sur=
e eventual patch files are decompressed first?</div><div>2. Do not consider=
 this as a patch file in the scope of cve-check ? (this is more a part of t=
he source then an actual patch that might be fixing a CVE)<br></div><div><b=
r></div><div>This is the only case like that we have in the build. Please n=
ote that removing &quot;.diff&quot; from the extension list in patch_path()=
 is solving the issue.</div><div><br></div><div>Any comments or suggestions=
?</div><div><br></div><div>Kind regards,</div><div>Marta<br></div><div><br>=
</div></div>

--000000000000cb4d5605dd3a8df2--

