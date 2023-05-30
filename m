Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0919AC7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 12:54:42 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.9015.1685451277418708046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 05:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XiGgVAL/;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f4bd608cf4so4979750e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 05:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685451275; x=1688043275;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2CuM8I+8frEx7J+Ycpka3I24+7sC07VBo6hxDs4m2+4=;
        b=XiGgVAL/eUaHBl1WI5OmaG6Wp+MK/jCTFaNndaOdDwRFBEXRqMDaOXagJ0q9afuS+4
         W8tPP4ZDA7T5y92ev1odpQuQpxo6CRI14oHDoePCImdk7o9Y2rqLbR/hiCSpIXblr8uD
         NrSpn0ODz56UFFAvNBCzzPPCVnXCkFuiupZG7rbVm8YQeWn/LhdmJ2F2LXMubbfCHrwf
         SnKc2I4kHQo8/Gx21/PFcdccZYAJobKJj8TY3kA3Ny2owLBN2T6yhXIT+o5IHTFEZNGU
         W35arOds+hgeWv98MRyZulDXcWXLqSO2TTC0jBmRXYMi6hebL4btcJmVzSYZ9JWTviFO
         /wWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685451275; x=1688043275;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CuM8I+8frEx7J+Ycpka3I24+7sC07VBo6hxDs4m2+4=;
        b=j7JOLX6M/cxRkZ4FBt6dYZYpoMSwJOxbDBCRuVUOYzlFbGLQohPNWs2mx5n+a3WSg2
         iTeBYkDajKBOu/pZIFcnyUgOWOujOMNywHrjyMwvXCRGMu6eygmMJEcs479ZnfQiZidB
         DGVTz22JQW22K8Tw3emNrsE3ioD5117ZW1SUCgFTkCYliz/EiM5TcM2wjBtmsg2hq3Jb
         oc41LO/BDEH4g42rZANwHlWizE4Ld+nRpxTCKuxlwFaknvLN61AfvYMOJdeCNT9PulBj
         g2WHPjUNc29GlVlh7f6WgCWt9WRkiLw/maYiTewMqK3KIo7MVlB1Ff1Bz25C55ZljiU3
         fUqw==
X-Gm-Message-State: AC+VfDzHNQisrI/fywvn/EF/AMMOJp6wAf57vCWZnsF9+GdJygLij8Xx
	HZXgZNW8wxFlPl3xzGMzhcBKsTILCAF2UjRo/9HNdDq2
X-Google-Smtp-Source: ACHHUZ4G02BYszZlpcJR//vDPiIyXoxlBFzGwLdU7/HCIMKQ0efCvs1iYvhdTrHLcRKR4dUE3yYn1xZlU56hxoSP4Io=
X-Received: by 2002:a2e:c52:0:b0:2a7:7b8e:5888 with SMTP id
 o18-20020a2e0c52000000b002a77b8e5888mr745131ljd.27.1685451274468; Tue, 30 May
 2023 05:54:34 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 30 May 2023 14:54:22 +0200
Message-ID: <CAApg2=RkJ-G+NgT32=RM-OwhOH3a2zJk=VChHa_jy9jO6PFsCQ@mail.gmail.com>
Subject: Cve database updates status
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	Yoann Congal <yoann.congal@smile.fr>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="0000000000008041ba05fce8b4c2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 12:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181921

--0000000000008041ba05fce8b4c2
Content-Type: text/plain; charset="UTF-8"

Hello all,
A short heads-up on the situation with CVE updates.

1. In the new CVE database, each fix needs to be made by the CNA that
created the entry. For the kernel ones there are several. Will try a test
fix (at random) to see what the reaction could be.

2. I do not have an answer from NVD yet, but I missed the fact that we have
a US holiday in the process. I'm sending another request today, with a
different format and let's wait till the end of the week (I would like to
have the clarification on their import from the new CVE data).

Kind regards,
Marta

--0000000000008041ba05fce8b4c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>A short heads-up on the situatio=
n with CVE updates.</div><div><br></div><div>1. In the new CVE database, ea=
ch fix needs to be made by the CNA that created the entry. For the kernel o=
nes there are several. Will try a test fix (at random) to see what the reac=
tion could be.</div><div><br></div><div>2. I do not have an answer from NVD=
 yet, but I missed the fact that we have a US holiday in the process. I&#39=
;m sending another request today, with a different format and let&#39;s wai=
t till the end of the week (I would like to have the clarification on their=
 import from the new CVE data).</div><div><br></div><div>Kind regards,</div=
><div>Marta<br></div><div dir=3D"auto"></div>
</div>

--0000000000008041ba05fce8b4c2--

