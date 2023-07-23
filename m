Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C356C001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 14:29:25 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.26900.1690122562716023644
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 07:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=J0IPqhQB;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: sakoman@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4435fa903f2so847865137.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 07:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690122561; x=1690727361;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+iHGtqdRY079jQMEbarmUQ5vtBmppEWeUlDvzNf6tac=;
        b=J0IPqhQBHgyPPsTwXK0HdMvQcFOD6eedVuwD78CAZZCyBOPYIEM+jTs8h1cFIAbb1p
         2722zC2PiK3YIK92of8WlUY4eHcbnqeRR3N5KXDFMu2snijeDkzcNpSuyBzKUi8Ekufa
         xTAMixu4gcp80sejpz9XS/e9E1NwyaeShrOOc404G5b/vx6vbOuTLEQzipi8OUmnF3Fu
         Q95zNp2dbQG+x+hDJTNfMpkBVErzgQyVo4n19QzqU5E+yqqmgJQQWMzeqed2ZLvrEJX6
         8f332Tss6YT0irL8zTkSauf5plRBCI0BfewLcBLHbqHLa1ZU5Qp9me7J7vuNzCqo3H7P
         K0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690122561; x=1690727361;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+iHGtqdRY079jQMEbarmUQ5vtBmppEWeUlDvzNf6tac=;
        b=VQxUveebkXFhfW3KUlWVgXtkSLxVOi6G1vzgGc/qSLcXx6ADJw2eShn2lcmkoce6e9
         Q08gyEGgy2KNuffr93KmzqxficLlk9gu2oHzuvhJr66HgLWEvVwH7Y0pFqLIdCtY06e8
         9TLoGI6didNDE88VWekFg+mt+ft7xjzA3O6dlTXEpmsGFsChbC+yV84DGzPBKirAqnyo
         jwSJwGTiUK97WRkbF8iSixIdb9PbfFtaZ1vZGlcta9YLmO+g8CogUugWXOSmFTcjt15v
         bwf4kSJ6ODrFzU8FyiNXk0YyMm5zRVR79DqN4mHjZlQXm6yNASXIjxKbKCNqGaB0OB/E
         lVNQ==
X-Gm-Message-State: ABy/qLY5slLJ/6lqaJO3xKkfzxtHrSKx6EH6BzG6vSMAKOBaHsbZgkCL
	y9ppDnVl9MSdRNtekzb+Pez8n1pcDjp0kE72WSemojtLr9c=
X-Google-Smtp-Source: APBJJlHJEb7NdDlvu90cCM54JjsoAhkyeuAvROAcTzoeSXhe10j6wQNx9j0DAQbli5MusTBKoF6Ds3xHHwAxNKhoUis=
X-Received: by 2002:a67:e294:0:b0:42c:9d63:47ea with SMTP id
 g20-20020a67e294000000b0042c9d6347eamr1455624vsf.0.1690122561531; Sun, 23 Jul
 2023 07:29:21 -0700 (PDT)
MIME-Version: 1.0
From: Steve Sakoman <sakoman@gmail.com>
Date: Sun, 23 Jul 2023 04:29:10 -1000
Message-ID: <CAGDS+nmXrjBwCKXoO0GgC6poO-sxFNpK6iJ16_sUptDV9eFPig@mail.gmail.com>
Subject: [OE-core] OE-core CVE metrics for master on Sun 23 Jul 2023
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 14:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184754

CVE check script failed this week with the following error:

ERROR: Unable to parse
/home/steve/builds/cve/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py
Traceback (most recent call last):
  File "/home/steve/builds/cve/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py",
line 200, in feeder(lineno=125, s='CVE_STATUS[CVE-2020-18974] =
"upstream-wontfix: It is a fuzzing related buffer overflow. It is of
low impact since most devices',
fn='conf/distro/include/cve-extra-exclusions.inc', statements=[<bb.pa>

    >    raise ParseError("unparsed line: '%s'" % s, fn, lineno);

bb.parse.ParseError: ParseError at
conf/distro/include/cve-extra-exclusions.inc:125: unparsed line:
'CVE_STATUS[CVE-2020-18974] = "upstream-wontfix: It is a fuzzing
related buffer overflow. It is of low impact since most devices'

This seems to be due to the lack of terminating "\" characters on the
multiline entry for this CVE in the following commit:

https://git.openembedded.org/openembedded-core/commit/?id=1634ed4048cf56788cd5c2c1bdc979b70afcdcd7

