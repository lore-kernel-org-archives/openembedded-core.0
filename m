Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D88C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 14:31:31 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.35702.1744295488718350578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 07:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XXiUTknk;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso7771926d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744295488; x=1744900288; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mLAiylM1fWiYJ8HdwP6e7TugVLpU0gUS3AAPaWxvAZw=;
        b=XXiUTknkMWQBclGKnqA9q+RVKxDMz2FBlZ8EdH7FtoQ9G+SKK4Koym6uVpSPlmAX+8
         HuXsC6wilTrsJAVJjuuF5GbnC4qXpz2gNxz3ConIfiwRqyv8T/b8w93OLBUaJbYDpB3T
         jSUWClgqOevYQXMnv1t0VISNodvrI16bn0O4a3D6UleIe74nXKb+HOwL9SRV5vXf/2cQ
         /Cf8d9DOwqq77LspgWvAr/TMZn2P3pHtNIHjHeJ1eRQul1389/bKnpyYtpHO9nUmK/XY
         ChN4b9SqiGl9M6YjIBSrzMUT700ccaj7NG3nUv2SsiW+2GYszvDzE+GpiqgRlOPKrLi+
         mocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744295488; x=1744900288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLAiylM1fWiYJ8HdwP6e7TugVLpU0gUS3AAPaWxvAZw=;
        b=bvyffjVzF7DVPMR4TC7BtWVPCIu2H9GeGgoZi4R1Gzc2lqEOt4WpSD5rtyEYz7dSiE
         WhZnkFE4WNhM84cd84W/xACNr5+7LTG1/ryu7ieSSFBMv/TBHs+A3go+5xoTUxTe8NlJ
         sBghp6jz1SB2TAtxRQzghBtQW/VrW9wFUgmyQ82YtzLlFi6M2tD9BMtf+auOhFsMQNcX
         Jy2V/oc1A557CPEqKGeTK5VBvht3nx9+foP9t0qTCZliZ6+oB6Xlrhq10SN+UvdEO4Cz
         AQFSZzBcjSa/HRAfQugGqDYtKMGPGFfzUmAoEoILSnW+Wws+GxfpSNhlH7oa9kIHQfQ8
         X1kg==
X-Gm-Message-State: AOJu0Yyo50GkkAYY7RpGqZYHMatcTmrQbzXI0GR4BuPTBAQWjG/APZ9X
	82QvOLdu7RlidJ2yjmUMpjZNpUuAvw1Rev1MYDzbvIGrtxagt0pMQ+93qRTb6Bb+O2Omjg7svL7
	t0D1MIKO0rLlf6s4By5qh66GG+v1/vw==
X-Gm-Gg: ASbGncv7gF4rDgp8RfALv6uBJ4OL1gaM8SnaBbhLMiC5HRroJnJtGpTYfLEo5mkRuA/
	rBhwjFaM+0TkxrKbuZQ2PNy7RO6e4aSowalGVE/wODMEdweykW2fQexm1GRu6JfQcBX83B1L9W5
	cyN6FpuvhgP4QGH0wkqrRse24f2gJcudlSLt0yErjiCw+leKeIp9O6xWR0
X-Google-Smtp-Source: AGHT+IGgRyW3MmLFHfISjR02W/3EdQ2qFtWhsJkJI3Wx3cBe+G2Dt3XQN2bSXNYT0mwYFsQ9gFp7aBYq1nAm2h76oDk=
X-Received: by 2002:ad4:4ea1:0:b0:6eb:2f7a:45b0 with SMTP id
 6a1803df08f44-6f0e77de3f7mr30056576d6.38.1744295487666; Thu, 10 Apr 2025
 07:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9r9D7PzkGm-5tPQVTyU_MkyQngS+RbZii6+4YToGNLVg@mail.gmail.com>
 <31851.1744290321098835072@lists.openembedded.org>
In-Reply-To: <31851.1744290321098835072@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 16:31:16 +0200
X-Gm-Features: ATxdqUFdpTvDIbL6K6X33dBUbisMUFaWsWqhrqAGn4UbnXywcEJD9s5DBj4Y_0M
Message-ID: <CANNYZj8JQf8tzC2g7k__TM0B967-szdV=4gt_-tBcNjXL65mXw@mail.gmail.com>
Subject: Re: [OE-core] python3: Allow to specify which pyc files to keep
To: lw@hqv.ch
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 14:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214677

On Thu, 10 Apr 2025 at 15:05, Lukas Woodtli via lists.openembedded.org
<lw=hqv.ch@lists.openembedded.org> wrote:
> The reason to use these features of the Python interpreter is that we develop for
> resource restricted devices. The target device should not need to compile the Python
> files to byte-code at runtime (which happens regardless of the optimization level).
> We can do this work at build time. Moreover, Embedded devices usually
> have restricted storage size. So using the optimization level 2 for pyc files is sensible.
> Most embedded devices don't need the docstrings in the Python files (simmilar to
> not needing the man pages). So we can get rid of them (that is what optimization
> level 2 does, apart from disabling asserts).

Most embedded devices also need to be robust. Lest you forget, python
and its extensions are written in C, and asserts prevent what is
over-generously termed 'undefined behavior', with a loud crash. Which
is a feature some people find useful. Can you demonstrate speedups?

Docstrings argument as well needs to be substantiated with numbers.
How much space is actually being saved?

Is there anything else to these optimizations? Is it documented
anywhere? How can we know if it changes over time, with new python
releases? I feel like this needs to be considered far more carefully
than you have so far.

Alex

