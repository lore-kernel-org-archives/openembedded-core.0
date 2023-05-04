Return-Path: <ndec13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA38C7EE26
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 14:40:57 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.52029.1683211251941424252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 07:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Tswa5H2N;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: ndec13@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3316e3e7f32so4220775ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683211251; x=1685803251;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=86v5+5Fomxwy7eIT4YQ5ppVZp2mha1x8IKQiMzrH4lo=;
        b=Tswa5H2N49Hr2iINaATIPbcm7FMc/9ksIyVX/cUYqt2xFikTyIxvr99yCvT0ZQo41K
         PEI9twjGx/fUcGVoHjgBnBuvt7XQhL72lClDt8ZLzzgyN2zIeXUPIhoJybhFgXYlZxwk
         gNjMwPZBVZm3wSJMqdHbzOaIFg2ka1Mf33cTiyBoCpWiLftZHmLS2Hc8J2YgMe1zMus0
         oI3OQunXWVnBmsUsec9d7Jnkr8YNOgIJhKixpsvWIBgbGNCUQwDo9xFwz1GdRwvK5nU/
         NKpPKkVs3Ud/XpSk94uVekPPVTm1qT8xGIiQ794Pgu5VX4P+kAiZBb/5Hd0KHoo5Yd1H
         chNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683211251; x=1685803251;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86v5+5Fomxwy7eIT4YQ5ppVZp2mha1x8IKQiMzrH4lo=;
        b=TE4jcyBxAOmQkPikZPjGBy+U2+2IquvFshwr1WgoumoGb0FV/ptVc6tqJP7iwE5wBx
         uA8Zr+ATsICYMnx8L5y0nxwPi5GOvbtfWH2aNAKJi4E9IMw6BlzfHXKKgyAY8Spd9WUN
         SYoEKW4C04OYVHd2+QBFne0BOqzv8/gpK+NEJDLuDQAr3ru6CncryT/MPXO6ng+DCsjs
         L5jptFIXv26MONBN72dgFmbvBBNUrxEwmaeXcmgS05c0Jf/Mczo1RRrVya+v3Q3Opnfs
         I12RMVuSrVx1nJDiRAHQU7kl+MTGflxlqndXzGqpA9kA68SWu+jwirPGvjxPRd6hbcTi
         V60g==
X-Gm-Message-State: AC+VfDyn0zzRmPyuGwMH2GjUSa7u51zvs947WA0yslIj/bib6BYMGg58
	rdIEWybymYkfklyp44at2woHNGKlla4mq6oZUsg=
X-Google-Smtp-Source: ACHHUZ4zvbajkC8niQjoCIyIb97GMrcWMHM8OWbSoSKjRRnWT3TqdR0F0kQ2orqSPbzIHqeB7RYrvjVtZe1QUmu9ITg=
X-Received: by 2002:a92:c90e:0:b0:325:eb13:1045 with SMTP id
 t14-20020a92c90e000000b00325eb131045mr150732ilp.2.1683211251159; Thu, 04 May
 2023 07:40:51 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 4 May 2023 16:40:39 +0200
Message-ID: <CAOT3mi+DorC4uSqCwO7HmmFVuXX3BLFWJNp_o-NH4OmqP=6ZSg@mail.gmail.com>
Subject: Yocto Project Community Manager updates
To: yocto@lists.yoctoproject.org, yocto-advocacy@lists.yoctoproject.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Josef Holzmayr <jester@theyoctojester.info>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000b51a0f05fadf284f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 14:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180877

--000000000000b51a0f05fadf284f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

After five years, I have decided to resign from my position as the Yocto
Project Community Manager. I joined the OpenEmbedded community around 2008.
I have fond memories of my early days, and still remember some of my first
interactions on IRC and mailing lists! This is a very welcoming community,
always helping new people with patience and kindness. Serving the project
during the last five years is something I am very proud of, and I will be
forever grateful to all of you for accepting me!

During these years, we have gone through a lot together, the pandemic gave
us an opportunity to rethink how our community should come together.
Setting up our Virtual Summits has been a lot of work (and stress!) for a
group of few people, but the never ending success of these events has been
very rewarding! Our online presence in social media has dramatically
improved, and allows us to reach out to and interact with our community
faster than ever before!

On the side of all the technical changes, and releases, we have also
established the Yocto LTS process which was a recurring request from the
community and has become a strength of the project! We also revamped the
project documentation to make it easier to maintain and contribute. The
Yocto Project documentation is such a great resource for our community! I
have spent so many hours on these PDFs in my early days!

Anyway, let=E2=80=99s not focus on the past! The future looks bright and I =
am
really excited to announce that Josef Holzmayr has accepted to take over
the Community Manager role. Josef needs no introduction, he has been a key
member of this community for so many years. Thanks to Josef's relentless
efforts, we have grown our social media presence on Youtube, Twitter,
LinkedIn and Mastodon! His energy will be a great source of inspiration for
this community! I wish Josef and Yocto the best for the years to come, and
I am convinced this community is in good hands and that Josef will be a
great community leader!

Many thanks!
Nico

--000000000000b51a0f05fadf284f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear all,<br><br>After five years, I have decided to resig=
n from my position as the Yocto Project Community Manager. I joined the Ope=
nEmbedded community around 2008. I have fond memories of my early days, and=
 still remember some of my first interactions on IRC and mailing lists! Thi=
s is a very welcoming community, always helping new people with patience an=
d kindness. Serving the project during the last five years is something I a=
m very proud of, and I will be forever grateful to all of you for accepting=
 me!<br><br>During these years, we have gone through a lot together, the pa=
ndemic gave us an opportunity to rethink how our community should come toge=
ther. Setting up our Virtual Summits has been a lot of work (and stress!) f=
or a group of few people, but the never ending success of these events has =
been very rewarding! Our online presence in social media has dramatically i=
mproved, and allows us to reach out to and interact with our community fast=
er than ever before!<br><br>On the side of all the technical changes, and r=
eleases, we have also established the Yocto LTS process which was a recurri=
ng request from the community and has become a strength of the project! We =
also revamped the project documentation to make it easier to maintain and c=
ontribute. The Yocto Project documentation is such a great resource for our=
 community! I have spent so many hours on these PDFs in my early days!<br><=
br>Anyway, let=E2=80=99s not focus on the past! The future looks bright and=
 I am really excited to announce that Josef Holzmayr has accepted to take o=
ver the Community Manager role. Josef needs no introduction, he has been a =
key member of this community for so many years. Thanks to Josef&#39;s relen=
tless efforts, we have grown our social media presence on Youtube, Twitter,=
 LinkedIn and Mastodon! His energy will be a great source of inspiration fo=
r this community! I wish Josef and Yocto the best for the years to come, an=
d I am convinced this community is in good hands and that Josef will be a g=
reat community leader!<br><br>Many thanks!<br>Nico<br></div>

--000000000000b51a0f05fadf284f--

