Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web10.1266.1593365820653791091
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 10:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tes0L6gH;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id e64so9881987iof.12
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 10:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sbpZLBvDL2wEEqI0mG0pAZz5JOWxSFEi/hVS/tXwPeg=;
        b=Tes0L6gHAIlTEyUPeklWHtqU4qMRTUeR68kpD0dOMynM4PQqcD5C3zYkhK/4LiT98G
         7rkSeRbIsZ8QnKwZqwubtnDTnLuc0pecObytrzohpQTzqn8nkizvuwRTCzTUIBrr+iLb
         w+n89aYnrfEdeTe7/XkaO/VPVYojYZStXCO++KQYko+TqjCnRZOvJHOGTENllfsELpSN
         5OkTRSjaYCupPpmIklCPAi+8D3ygJId3PgRGgJR9N1j5MPQxtnaJRz57/K4gqtYfpxuF
         RlizKHivKYc3q2XkoW+QpRY9CYZVoYpGudpTAFy2ojRHmgfE5LuL7LiPBurPzYf7Pl2i
         urNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sbpZLBvDL2wEEqI0mG0pAZz5JOWxSFEi/hVS/tXwPeg=;
        b=dkdDqGEf1v7MOm8xNuNsdXRrlpKeYFcQBor7Lv+5RD496oFtwdipOun0i2uQxj4zaO
         j/Xku876ac4v0/7yPI9myu/wKE5GxWcyw9OL8j/g3qlc2MGsKc416xigikP4TgwsJftT
         dx2275rxwrMqgOI4TaDix+9Vj8ThmUow5Rz6mvhBJ0Zy5ey1hPivACR3Q8PBntXGPvEu
         gyWJ+Dx1sSa6WnvZIPam0aat0FGS+iiaO6Z+/SEl2yO4Za9IcYoBV/WutK6XZ6xRMJru
         QYzyMPwfYpGJZ9JZlSBzeWPtNsP3k0GiLoQsokwGH32JlwgRMgzKOI39gzhvB5z4qRCb
         kqDw==
X-Gm-Message-State: AOAM532Dlhs1+v/9GE9pvJCUg2v00InFnnIfs5yTBmXMO9e4DokUXnDv
	DhsIGW5vVY7R3axvUfW1CfAqgeTbJGs2bdyh8I8=
X-Google-Smtp-Source: ABdhPJwJRjLoWa1Z+2IpZ3sZBvg9J3hCh96mVsHE7B3RDngLAOc/a9MuTtZN5EDKRg5JtYnnKRrFH+SQmfZMl0/kzNg=
X-Received: by 2002:a05:6638:d52:: with SMTP id d18mr14540040jak.21.1593365820031;
 Sun, 28 Jun 2020 10:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200628133414.3246339-1-schnitzeltony@gmail.com> <AM7PR05MB68817E6C60D5241312FCFC74A8910@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB68817E6C60D5241312FCFC74A8910@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sun, 28 Jun 2020 19:36:48 +0200
Message-ID: <CALbNGRQnjJ-cvmTA-=mZOekLHHwUEt6qBq5F2hVAjO1CkLe2bQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] nfs-utils: upgrade 2.4.3 -> 2.5.1
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2020 at 6:36 PM Konrad Weihmann <kweihmann@outlook.com> wro=
te:
>
> On 28.06.20 15:34, Andreas M=C3=BCller wrote:
> > * cacheio was fixed upstream slightly different
> > * nfsdclnts is a python3 script for printing various nfs client informa=
tion
> >    pack it in ${PN}-stats
> > * replace leading spaces by tabs in shell tasks
>
> Is there a technical reason for this?
> AFAIK http://www.openembedded.org/wiki/Styleguide is still valid.
> If not the document should be reworked I guess
There have been some discussions on this from time to time but as far
as I can remember in oe-core  4 spaces for everything except shell
code - there it is tabs. Don't know the document for that.

Andreas
