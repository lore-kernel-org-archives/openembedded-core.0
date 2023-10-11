Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1156CD98FE
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:13:49 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.11922.1697012029322759258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 01:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aW7pXtui;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-503065c4b25so8773145e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 01:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697012027; x=1697616827; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VoBh37sS+2RpLPE5YqcrmNpqQw3/1vl8mO512q+Zey8=;
        b=aW7pXtuiWk5fx+szJLd1q/mYk6lhzXT/TrBWaEM6oXYpiggJYay1e5rEGEvrlw7bdb
         od52h3IRrSZNbywJXCvy9jv+BDQoc31r4pt4LFLD3xGixC5bOaWHuRdUUXRow+/e7TRO
         ZUjgvpMWyCP6M8M4S4E/7SYdJh5sqQExMopabn8Nuykf0gc9R0TcMsZT08hTAFRophSA
         641iwki4PdQT7DTEf/jZ8Ic2V41Fr7L6/wK2E0c93KU88zu2ne4kBgYjK6gL1cTRlLy/
         8SSRcyrp2VJDy3fn8hUWBVJSeAGvSHPtmBhb27I8MIyGBUDURVxZBlvrNf4tSl2dph1U
         gsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697012027; x=1697616827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoBh37sS+2RpLPE5YqcrmNpqQw3/1vl8mO512q+Zey8=;
        b=UjkxdcM59EtyANq6aH3h7jEGnDLv+Srjf8Tps+B3Ocao3L/1kgw50pLWlNs1McCNSX
         jLxYnh45+DIdQVy3TLmQ/AhoNWhZWfgVO054AvyLj5bLZKMlUmr49AFcPatBavOF02oE
         Qpnf0/968o1Pj/NggzGuukghN7WG8OPv5kblQwMKK/FAG2kYtazhtJQhoemDXupmzED3
         OyHGri1nX6wejHDzIXcbjQfcivYPFiKGcmGY2QD1w/h2eK60RPRd8aW3kGFpSMQNT8WB
         P3P/mw3du3wWHdqjEjvqYcSVEpqL8NXFjtEhM5+2LuTMHcjm1X4Ze+PLDH802QfCb+lR
         Qo6A==
X-Gm-Message-State: AOJu0YwocyuG/xhwbo5b/JC9XZWagYdcZTanAUAs8smIMv1a5MvMQBbS
	QIxtsrAqP83W+FGuCb0i+/gPMl9Gy+vxg05TDQQ=
X-Google-Smtp-Source: AGHT+IH79wxW1ww9J8pweWapiBA4nUw3eKY16cgWNW8fpZQxmwarfa/bxlEo8wzxiSBM8JMjRvvzL24AGQg80CutyOc=
X-Received: by 2002:a19:9153:0:b0:503:2089:d3b8 with SMTP id
 y19-20020a199153000000b005032089d3b8mr15618838lfj.8.1697012027121; Wed, 11
 Oct 2023 01:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_pwdWWzVZH-1ORfH3OmzP8uJMfWxd+jsgT=doiYwsTog@mail.gmail.com>
 <3631.1697011454132955691@lists.openembedded.org>
In-Reply-To: <3631.1697011454132955691@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Oct 2023 10:13:36 +0200
Message-ID: <CANNYZj8OjuNY1KngcsvBJmVc2idgKz-oatrXByR8QasMQ1-fKw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] openssl: Upgrade 1.1.1v -> 1.1.1w
To: ranjitsinh.rathod@kpit.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 08:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188947

Absolutely, yes. It's a proper upstream release.
But the EOL notice with the link should be in the commit message.
Perhaps you can send a v2?

Alex

On Wed, 11 Oct 2023 at 10:04, Ranjitsinh Rathod via
lists.openembedded.org
<ranjitsinh.rathod=kpit.com@lists.openembedded.org> wrote:
>
> On Wed, Oct 11, 2023 at 01:21 PM, Alexander Kanavin wrote:
>
> Note that with this release, openssl 1.1.1 reaches end of life:
>
> Yes, but this we can take in the dunfell, right?
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188945): https://lists.openembedded.org/g/openembedded-core/message/188945
> Mute This Topic: https://lists.openembedded.org/mt/101796386/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

