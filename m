Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F05C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:21:07 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web08.5466.1650975659878808601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 05:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WhekpkaE;
 spf=pass (domain: gmail.com, ip: 209.85.166.45,
 mailfrom: rybczynska@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id n134so19301193iod.5;
        Tue, 26 Apr 2022 05:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=K6Zc1L4fqPTotPNqyWtGvlT/fFYH8v9nGanP5sra5NY=;
        b=WhekpkaElPBzhlLj4noRjW8KchZTs0bsETvjekTMZstRb/Nh5Qi+vkK2rcIMnJaJTt
         TVwOq/VWcHFclYwwRuwyb7jQopMpqDy9WfyMnj5GJ6Ew1dnKwIB2aHDre4/k6odWX/DL
         nckRXAxwFfmr5Yz7g5gqKKZh4D1QddB8MaqNYIGCiAQkbq9abJcCGkh5gBvgxHvYkafd
         DPA2Yo/vlXvSKQd6BBMDcsHZOBJZ0p1l9NEuO9fzUR7PNAq8o4cTHQLW4HpSRvwBqiF4
         KzI0YLDYc2VgQHDNO/AkRBYO9qaF3cDK6bZTxDlXkVxup4k10g08f4Ud6Cuo/GAwJkXi
         Yzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=K6Zc1L4fqPTotPNqyWtGvlT/fFYH8v9nGanP5sra5NY=;
        b=az3l6bGltibPK3xTS6eKwbrjjrHTOBIpd+lym24iDCKsFDW0Op9APpglfKQgDHSKMm
         I7ynIScdTDR5ImJSwYC++2vbQlkpvCjRD6bMuqz6afZCFRKhuHeY2uMcscGkGDymII99
         ENiXjl3YLQYz6BSjXKGrE8FnKJGUJ1Z1UasMWAEq1PKdXIAJp5HVPTA/uTTGC02xaWoX
         GRfuBfcCmdZJPHwvuLpCFTlkGsMM+vFSFuF9Tyneq7+X6se096MCDQjzbUcj+WM+OGYu
         Ec23MmXRx+gcG1u2AhFPKKy44JdfBUHfdsl+uaN92Palhcq33Z/5ECjMmZ4rGWg3pGRC
         woDQ==
X-Gm-Message-State: AOAM530ewq2TjYhdFcyb2exJ4qLkMtkueDhCMc7bR+DI0UCefE1Oa1Dn
	/ene+O39Hpvkkd78CrLI6U6AF7/zK6NVkvBGWiNtfcAX
X-Google-Smtp-Source: 
 ABdhPJwG/zwgXi8DZ2Vz0f+MwYMj2tbjm9YC1g0QWz0AChnD6f8vwboFKtJZ6VJy28jWPd1ROY5TqrVHNvoGi3CS0nU=
X-Received: by 2002:a05:6602:2408:b0:657:9a8e:4c76 with SMTP id
 s8-20020a056602240800b006579a8e4c76mr2195222ioa.190.1650975659147; Tue, 26
 Apr 2022 05:20:59 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAApg2=Q9DOoYVHNSCR_=pEN-x7EQuRw2yhwqWhEG2zaMTONt8w@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Q9DOoYVHNSCR_=pEN-x7EQuRw2yhwqWhEG2zaMTONt8w@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 26 Apr 2022 14:20:47 +0200
Message-ID: 
 <CAApg2=TjNwub9WsLfh1ZAA8hfMVDPgTYVCELotUfGRGpO9gu8Q@mail.gmail.com>
Subject: Re: CVE-check failing on world with meta-openembedded: diff.gz file
To: OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 raj.khem@gmail.com
Content-Type: multipart/alternative; boundary="000000000000b2455f05dd8db9bf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 12:21:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164870

--000000000000b2455f05dd8db9bf
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 11:07 AM Marta Rybczynska <rybczynska@gmail.com>
wrote:

> Dear all,
> We're running cve-check on a world build containing oe-core, meta-oe and
> more. We have an issue with the lockdev recipe
> (meta-openembedded/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb),
> which causes a fail like below:
>
> $ bitbake world --runonly=do_cve_check
> ERROR: lockdev-1_1.0.3-r0 do_cve_check: File Not found:
> <path>lockdev/1_1.0.3-r0/lockdev_1.0.3-1.6.diff
> ERROR: lockdev-1_1.0.3-r0 do_cve_check: Failure in searching patches
> ERROR: Logfile of failure stored in:
> <path>/lockdev/1_1.0.3-r0/temp/log.do_cve_check.8709
> ERROR: Task
> (<path>/meta-openembedded/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb:do_cve_check)
> failed with exit code '1'
>
> The issue is caused by the fact that lockdev_1.0.3-1.6.diff is missing.
> When we look into the recipe, it is downloading lockdev_1.0.3-1.6.diff.gz
> file Please note the additional extension.
>
> Stripping the extension comes from oe-core/meta/oe/patch.py, from the
> patch_path function, which is figuring out if a file is a patch, and
> returning the local path if it is so. However, at the moment when we
> do_cve_check, the .gz file is not uncompressed.
>
> I'm wondering how to solve it.
> 1. Add a dependency to make sure eventual patch files are decompressed
> first?
> 2. Do not consider this as a patch file in the scope of cve-check ? (this
> is more a part of the source then an actual patch that might be fixing a
> CVE)
>
> This is the only case like that we have in the build. Please note that
> removing ".diff" from the extension list in patch_path() is solving the
> issue.
>
> Any comments or suggestions?
>
>
Khem,
Any feedback about this? From the history it looks like it was you who
changed the recipe to use the .diff.gz file.

Thanks in advance,
Marta

--000000000000b2455f05dd8db9bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 22, 2022 at 11:07 AM Mart=
a Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div>Dear all,</div><div>We&#39;re running cve-check on =
a world build containing oe-core, meta-oe and more. We have an issue with t=
he lockdev recipe (meta-openembedded/meta-oe/recipes-support/lockdev/<a hre=
f=3D"http://lockdev_1.0.3.bb" target=3D"_blank">lockdev_1.0.3.bb</a>), whic=
h causes a fail like below:</div><div><br></div><div>$ bitbake world --runo=
nly=3Ddo_cve_check</div><div>ERROR: lockdev-1_1.0.3-r0 do_cve_check: File N=
ot found: &lt;path&gt;lockdev/1_1.0.3-r0/lockdev_1.0.3-1.6.diff<br>ERROR: l=
ockdev-1_1.0.3-r0 do_cve_check: Failure in searching patches<br>ERROR: Logf=
ile of failure stored in: &lt;path&gt;/lockdev/1_1.0.3-r0/temp/log.do_cve_c=
heck.8709<br>ERROR: Task (&lt;path&gt;/meta-openembedded/meta-oe/recipes-su=
pport/lockdev/lockdev_1.0.3.bb:do_cve_check) failed with exit code &#39;1&#=
39;</div><div><br></div><div>The issue is caused by the fact that lockdev_1=
.0.3-1.6.diff is missing. When we look into the recipe, it is downloading l=
ockdev_1.0.3-1.6.diff.gz file Please note the additional extension.<br></di=
v><div><br></div><div>Stripping the extension comes from oe-core/meta/oe/pa=
tch.py, from the patch_path function, which is figuring out if a file is a =
patch, and returning the local path if it is so. However, at the moment whe=
n we do_cve_check, the .gz file is not uncompressed.</div><div><br></div><d=
iv></div><div>I&#39;m wondering how to solve it.<br></div><div>1. Add a dep=
endency to make sure eventual patch files are decompressed first?</div><div=
>2. Do not consider this as a patch file in the scope of cve-check ? (this =
is more a part of the source then an actual patch that might be fixing a CV=
E)<br></div><div><br></div><div>This is the only case like that we have in =
the build. Please note that removing &quot;.diff&quot; from the extension l=
ist in patch_path() is solving the issue.</div><div><br></div><div>Any comm=
ents or suggestions?</div><br></div></blockquote><div><br></div><div>Khem,<=
/div><div>Any feedback about this? From the history it looks like it was yo=
u who changed the recipe to use the .diff.gz file.</div><div><br></div><div=
>Thanks in advance,</div><div>Marta<br></div></div></div>

--000000000000b2455f05dd8db9bf--

