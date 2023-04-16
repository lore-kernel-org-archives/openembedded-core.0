Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DE1C77B61
	for <webhook@archiver.kernel.org>; Sun, 16 Apr 2023 14:12:26 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.30748.1681654341125805010
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 07:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LvRmks0C;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id xi5so57603258ejb.13
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Apr 2023 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681654339; x=1684246339;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qYf/pSMYHXVNYpslKRRX1+jVjbZkEfXR/bFbsKx5MBo=;
        b=LvRmks0CWvX0fASw64AbiVxVFFFTpk5UvEMX2J5agy/OTVhlqDxyDhdk8eyh8az3Iw
         pm6d8oc7PZZ1PTPxRaiQeiC44hI5hY0L7q0PotraoD9hEBd29AZvg4PZr3yNy0gEz1W7
         RPFCKHSTQWgipndnD1DXjfM7e8i8gVEBku5MUYkTaQZX/hmWwUfzVG05BGzPIrioz83Z
         uNrA6VpDG5+T+SXbD/cAl9YqnWsFoYhgGXFS9ne+f/ADjn1PIJ9kPofXBTfXdD6NSBwL
         x9ATKS/gAqBJuidENx2GkpAhB0gL8DaarnQoO3QOjYCvKbljYiEkJvbON2UyJDOTZayn
         zboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681654339; x=1684246339;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYf/pSMYHXVNYpslKRRX1+jVjbZkEfXR/bFbsKx5MBo=;
        b=LUnCDVzwNQhESSQainC/b+MQJcol95eC8BTFhhmw6+VGoxTKeIuOC+dvbKeGJhp8O9
         P712FaOoF0NsySsMkMfk/Fa02eSY3F1jz2AG+HyHwCDDvu10WOxffc/if5523WfoG6hk
         oskucZEFkXkWz91CC39YuNUsaY3SgQ1PJh0CDffuIiKtuWSYMcKtqTozzao3lnIQs3Gv
         5Bezs0IJ/d1H6hR8tliOMymeZTJ5xtbq2CAtT39jkT13UzZRqF0hGTN8/241acRHnXRk
         juhQ8ECv1ysLALjoMlihssSZGIz8OioyQT8hkAgKkACmlmxG7fPXyLVDzGjHfjlebaXA
         mTDQ==
X-Gm-Message-State: AAQBX9c6TEd4VtiwpUim5n2O4gUk40rwamdmAIXqcv2dS9qaZRcd3Poe
	bQq9iHnZxMKEIyRNeNBZYg5so93N/HFAlrAA3xGtopR+w6ygbWSp
X-Google-Smtp-Source: AKy350bHsycJf21Br5Yqs74Rqijm6yzWYFiLY1y/h6fMKhANbO7L+LfOClYa7GiHp2l/28HJ5d13HfEOwhNKm6Qz4Dk=
X-Received: by 2002:a17:906:f57:b0:931:3a19:d835 with SMTP id
 h23-20020a1709060f5700b009313a19d835mr2290342ejj.3.1681654339092; Sun, 16 Apr
 2023 07:12:19 -0700 (PDT)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 16 Apr 2023 04:12:08 -1000
Message-ID: <CAOSpxdbty_hyGCoMs0ZMyutYiZtCH1U3qx5XhahdfrtKqKShTQ@mail.gmail.com>
Subject: No weekly CVE report today
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Apr 2023 14:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180114

Unfortunately a system update to the machine that generates these
reports broke the CVE reporting script.

I won't have time to investigate the issue today, but will work on
this first thing tomorrow.

Steve

