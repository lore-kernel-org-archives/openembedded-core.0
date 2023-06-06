Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DCBC77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 05:57:59 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.2483.1686031078331647418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 22:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JOrYPHeT;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b1a66e71f9so66288211fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 22:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686031076; x=1688623076;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H0vTxzR79cx8UTgGhF0SCz60qTsp79PI1uWVXjejfQs=;
        b=JOrYPHeTleq8FhpwS5tgO6qsLIEEcKUYT2ixjwXKRtPduI3qFpiO+KOenhsz8QE83F
         cCYqcx4iIGXM/4D52fOEKR67EZjmiAuu9MPnDj9IzwLhoOOBTx/nr++eJBlLxrhBntP5
         YWyy1jUIcZenLqvRR/c02VwmG+KdDDzhf4JjrSewUuAFtM4+BzE+fGwFCcWalX/6NdsR
         tbiPQBKVbDv0eaDmA3/m7N/QgBM6P17I8t3A3JiEOm7gL4EIKH7hBKEMGHbBhmH8mJ5n
         s3aedNNDOBS4enDS+b6X7mopHGpaOXrX+98RbmdobNUOqdFl6tgpo/G5thzXoF27XdOu
         RZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686031076; x=1688623076;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0vTxzR79cx8UTgGhF0SCz60qTsp79PI1uWVXjejfQs=;
        b=k6wuR1gMXmQoZSXdCA4IUFdY/xgErxZaGX6Y6huvnZ5w8xsgPi8G2p6aE9ll2qcWjs
         XBqiSfo1E/uDLgh1z0BoXXBGszCg5NFBgjtU0itdLt08JUZR5T8D6BrcnGaLlr9op51r
         fX6byAtFnrnQOFCTnRjBEPZC4/UdaQvJAYFdSHjeevYQgB7ZPOCDMCwuYSxWihyuQ8Ph
         f11v8vRnBdxElFm1IjamNW/wWGFO6oYvfblbh1n15uy8FsNv3iK4wgj1ll31Y6Fyw1J/
         SP75TZZdRwlam56CnpDUX1Z1xFaX/9ebn4x11chtBqGLT3S4Pxm2C6Sxr3WWFixd6sA3
         NwUQ==
X-Gm-Message-State: AC+VfDzO8OkCPKGN7swnVgEQyv5hKC5szOxj2+0BRJ8XZqtxAhOMYc12
	IFfRF1wetKbEba2JgJmSnM5hG0iiabj4manoGbw=
X-Google-Smtp-Source: ACHHUZ7wfFyH1UYB5X04IR3fJHiJNvekJOEkKoH6kaoqJtx1+5m+OLCH6IXoRbBvHVI00Cavxda4gI54kaTDDY1BzY0=
X-Received: by 2002:a2e:380b:0:b0:2b1:b4e9:4c3 with SMTP id
 f11-20020a2e380b000000b002b1b4e904c3mr867893lja.2.1686031076246; Mon, 05 Jun
 2023 22:57:56 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 6 Jun 2023 07:57:43 +0200
Message-ID: <CAApg2=S9UFXCCtL2ByH7Y3_pYVvLmJUO945=RuFNqNg=nXyo9w@mail.gmail.com>
Subject: Drafting a fetcher for kernelcves
To: Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Yoann Congal <yoann.congal@smile.fr>, 
	Geoffrey GIRY <geoffrey.giry@smile.fr>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000061483e05fd6fb31b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 05:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182413

--00000000000061483e05fd6fb31b
Content-Type: text/plain; charset="UTF-8"

Hello all,
I'm drafting a fetcher for kernelcves  (
https://github.com/nluedtke/linux_kernel_cves/) and the data conflicts in a
certain way with cve-extra-exclusions.inc. With multiple fetchers we'll
need to have a way to say which data set has priority.

For now I can see examples of two cases (in all cases we go for a specific
kernel version):

Case one:
NVD says unfixed
linux_kernel_cves says unknown
cve-extra-exclusions.inc says IGNORE

Case two:
NVD says unfixed
linux_kernel_cves says fixed
cve-extra-exclusions says IGNORE

In the first case, the solutions is IGNORE (some old CVEs), in the second
one it's PATCHED.

The questions I have: Should cve-extra-exclusions always have priority?
Should we allow the user to set priority of fetchers?

What I'm going to test is use the kernel_cves fetcher for all kernel CVEs
and NVD for all  the rest. Should it be an option?

I'd like to avoid adding too many options that make cause mistakes...

Ideas? Comments?

Kind regards,
Marta

--00000000000061483e05fd6fb31b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>I&#39;m drafting a fetcher for <=
span class=3D"ng" style=3D"background:rgba(0,0,0,0) none repeat scroll 0% 0=
%!important">kernelcves</span>=C2=A0 (<a href=3D"https://github.com/nluedtk=
e/linux_kernel_cves/">https://github.com/nluedtke/linux_kernel_cves/</a>) a=
nd the data conflicts in a certain way with cve-extra-exclusions.inc. With =
multiple fetchers we&#39;ll need to have a way to say which data set has pr=
iority.</div><div><br></div><div>For now I can see examples of two cases (i=
n all cases we go for a specific kernel version):</div><div><br></div><div>=
Case one:<br></div><div>NVD says unfixed</div><div>linux_kernel_cves says u=
nknown</div><div>cve-extra-exclusions.inc says IGNORE<br></div><div><br></d=
iv><div>Case two:</div><div>NVD says unfixed</div><div>linux_kernel_cves sa=
ys fixed</div><div>cve-extra-exclusions says IGNORE</div><div><br></div><di=
v>In the first case, the <span class=3D"ng" style=3D"background:rgba(0,0,0,=
0) none repeat scroll 0% 0%!important">solutions</span> is IGNORE (some old=
 CVEs), in the second one it&#39;s PATCHED.<br></div><div><br></div><div>Th=
e questions I have: Should cve-extra-exclusions always have priority? Shoul=
d we allow the user to <span class=3D"ng" style=3D"background:rgba(0,0,0,0)=
 none repeat scroll 0% 0%!important">set priority</span> of fetchers?</div>=
<div><br></div><div>What I&#39;m going to test <span class=3D"ng" style=3D"=
background:rgba(0,0,0,0) none repeat scroll 0% 0%!important">is use</span> =
the kernel_cves fetcher for all kernel CVEs and NVD for all=C2=A0 the rest.=
 Should it be an option?</div><div><br></div><div>I&#39;d like to avoid add=
ing too many options <span class=3D"ng" style=3D"background:rgba(0,0,0,0) n=
one repeat scroll 0% 0%!important">that make cause</span> mistakes...</div>=
<div><br></div><div>Ideas? Comments?</div><div><br></div><div>Kind regards,=
</div><div>Marta<br></div></div>

--00000000000061483e05fd6fb31b--

