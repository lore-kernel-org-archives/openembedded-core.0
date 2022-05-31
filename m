Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E00BC433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 08:51:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.46979.1653987076340644196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 01:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QEuiQYpL;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d22so12255693plr.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=nxa8MT0HjzNGiTtKqZUi0Z3PGJPbn2WLT3Jr9iOc+Yk=;
        b=QEuiQYpLvT3WNehrxBUF7zcs5LqDUno+rTSHQRnzbfNOkw04Nmw0mny+/4CU9ca9i4
         2XjBS7aQlm4zYXdPEAFO3FThOl1ZeirV6EMBFDeoHz/Obfn/vRkZr1S7dVv8g+zSNec7
         bLMcaztXhOkgjXOLMBKRD9wrPdDx5BK165NbC/xKtF3QFL31CO5B8ue3tCoM4QbzGtV+
         wXZsNOUrtD8DL6eQAbf01AE/TpoE5r9jDYf2uJpMpo8lbPNjhQh0piDRl5xKkA3gsqYF
         AzHUsTfkRILRUxC79gGXeXkBOTyQUNuaaT7R/97O8iJBoULQUufJsqee0wsaED3d4KWK
         UmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=nxa8MT0HjzNGiTtKqZUi0Z3PGJPbn2WLT3Jr9iOc+Yk=;
        b=qDTXBF/Y41FR0eS1iFus0QN25ik6u4SLF18vSZLHpM2byPFSRtW6Fp1LSPOT2qXlmx
         ybxsoYpS0B7OUegRalGwjnbNcsWkNnh5JVSQEFZkz9hZIx2K6Cf0Q++cLVGR/AQ6D8u2
         Q2ANwNs5a/PysiBlhUMcKd8yLMM93JOs0JOIceMR0XWZKU8DUkkYOymRdNSYZPmV7JWF
         F0zvQ9lS9xcTrC7N9za/Mor1AepPW1geLtx9vGZiykG3YoEilCIHvwwgElqsvvtNCrub
         Mu3pFL1RdFsb7mCb8Zoq9lSEXR6fz0SXtnbwgdCnxlplImxEPis+Wg7/4t+Auf9GK7QR
         QYpA==
X-Gm-Message-State: AOAM530eB/4xxaChqwJLKSdGhzadQ8eAXgB8Qal1sKePikhS++wor7gy
	F5m5JMOOXFAPVd0qXNEfH1dDt12JPiGyeAR0eRY=
X-Google-Smtp-Source: 
 ABdhPJwPExrPjMGPK8e2w9x07vXDxxK+s++KivtiUk7k1Q/1x9vq7JGDBGr6uoEBssP99YZuh7GGQ+AwlSyfviy21HI=
X-Received: by 2002:a17:902:d491:b0:163:771a:55e7 with SMTP id
 c17-20020a170902d49100b00163771a55e7mr25891344plg.77.1653987075752; Tue, 31
 May 2022 01:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220531082603.11954-1-davide.gardenal@huawei.com>
 <8694.1653985795705658654@lists.openembedded.org>
In-Reply-To: <8694.1653985795705658654@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 31 May 2022 10:51:04 +0200
Message-ID: 
 <CAApg2=Rw9xTR+gDrznVbFq+urypKb6ZhXgjgmiQujchoEo5kSQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v2] libpcre2: upgrade 10.39 -> 10.40
To: Davide Gardenal <davidegarde2000@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 08:51:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166307

On Tue, May 31, 2022 at 10:29 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> After a bit of research I found out that the commit that fixes CVE-2022-1=
587 (https://github.com/PCRE2Project/pcre2/commit/03654e751e7f0700693526b67=
dfcadda6b42c9d0) is not directly applicable to .39, it needs a compiler upd=
ate (https://github.com/PCRE2Project/pcre2/commit/dea56d2df94546c23021a42d9=
395f2333589f01e), this is a very substantial update. Looking at Fedora and =
Debian they updated the .40 too.
>

I've have had a look at the JIT update, the commit list for .40. The
JIT update contains something that looks like fixes around types and
their sizes, among other things. Because of that I would suggest to
bump the version here to stay on the safe side.

Regards,
Marta

