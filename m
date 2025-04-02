Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C62C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:57:18 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.2674.1743580630193123680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XX6YUWL+;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f6970326so58853476d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743580629; x=1744185429; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0byl/9IQTgpAkS43EZYqwOrW//pWNgE7bQl30CNhvW4=;
        b=XX6YUWL+3auYfeMIpb4e73S+me8dpYtzXr7OeDmv55HpGfWjX+LTS4lM3fTB1jKh7r
         CJ88lbYtgtbPn+cPRi8GT8YaOOZeN56dqoLGHZYgfyRIlGNSkJj29jbTBPgIhWl4o1W1
         WazPHuioFmgnBSPwjZFJEhFLzWlDvwrM+R+OJzTurUqJQQjjr43yaDvnSYmUOchZPBe8
         fnDEE+e1eQOr4MJDOQ1Yo9cG2Fs0jhrK24ivdouwF8iGbj+z55EAUbpWryVO5WJS0VPu
         jcE/UQkXNzUr1qCbbIbzNITi6pUzUdnDyv6ezaRxDNnE0VyMjgXQXeBg66IEjbQ90kT1
         3ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580629; x=1744185429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0byl/9IQTgpAkS43EZYqwOrW//pWNgE7bQl30CNhvW4=;
        b=YeEWAFE6nFp+e03d8W/DgK8F+Le5sajajZ20bkw3ysXCWVzaqjH8pqO5b3F1wW72v/
         cNjNqJOtkuWs/98/cWZFrTQmRCUOKJKKKjvwn8bAqWQD2x6YRF7jFKyVWnzSdWSaxo6V
         MeqvrE6Jb8MDoUZxU/RqZeKxywwwNgyWvl7fkR6YUmCRyZFm9CXs5CTH+/V5J1yEDlWS
         M7aTZwPKgfIn3xI9tMglb0KdKmWROL2KrOGTXcCy/vRwn/t+9yXOUtfh/qL/YmRsIZdI
         8ni34NlQHykHmHNb2w7MWFZ8We9hgeMb4XEK7zm6VhwZcv6fBpEydg50pS8Nk5WPhXXN
         1IHw==
X-Forwarded-Encrypted: i=1; AJvYcCX2kuyCgUXPiH3qpPfo6pBaDURvVRdobBIvIyZYYvMSBKcW713y7Of8HyVLocnurjuRn40R6ttsI/qSz2rezhTf0A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYSTjEY8/0EjBQhio9NdSbfJ6Qe9uaCDtpcVhsuXtK1kzwk+tG
	0+JQrqdjilCrXeHmUl5A5QLBx2sDVfN1csEifg5eGSZE7JHr7nUgnDiIIfWHVEy8KolltkJPFeN
	fm7nEUgVZ85Jl/GpGBn5YSO/p7HM=
X-Gm-Gg: ASbGnctISrxyrbltAlA19YkgNRpnn4WwRgoc73PVTxsS0DsKm4QU2NhrJrLyqqZLxmP
	ZnlF7ug5pbILcssgXhwMFcGdEUqGnZQnPwpumfIqb9s0P2NQzyXA2W1eczF4anYG/BMznc90R3n
	DUwMHn8NHYURfne5xUmmgi9phyWzhD3DkAjTc8JzHp0DVXwc9m1iJrzYSu6dfG
X-Google-Smtp-Source: AGHT+IHUcQPyStZQymF0yZzsbb2FYL1Hk3unIveVOMKMr0yM3xgnLUFQ88nCerkjSOQ4Wonk8e8VpbcRRA6euS4iZ5E=
X-Received: by 2002:a05:6214:2a49:b0:6eb:2fd4:30a7 with SMTP id
 6a1803df08f44-6ef02d0d8a0mr21742896d6.33.1743580629170; Wed, 02 Apr 2025
 00:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
 <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com> <8d4b0884-985f-4e81-a3d3-03a1abb91e73@oss.qualcomm.com>
 <CANNYZj_aEritSc0Te9hWR+OZVQ1DDFY0b4A0Q0H148L5YjEKcw@mail.gmail.com>
 <0926082a-b09e-4d8d-8199-671823db87bd@oss.qualcomm.com> <D8VYG3D9S5MK.1G3JUTQ3QIFF2@bootlin.com>
In-Reply-To: <D8VYG3D9S5MK.1G3JUTQ3QIFF2@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Apr 2025 09:56:58 +0200
X-Gm-Features: AQ5f1JrBzeZGyRUSCJMWqKhjw6hA1E21rI6sXUbVPHybx4OvMfmKOmuQXKVpWVQ
Message-ID: <CANNYZj8WSiADaBNgiZuO3f1XxxNb_nyCfoPe1O3y7x3CF37UNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/9] mesa: upgrade to 25.0.2
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214228

On Wed, 2 Apr 2025 at 08:55, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
 >
> > It's really strange as my build host is Debian 12. And it's even more
> > strange as mesa-clc was built few lines above (16406).
>
> Ok, I will try to play a bit with it today, let's see if I can reproduce
> easily.

I took v4, and ran 'bitbake mesa-native' on the exact build host
(debian-12-vk-1) where it happened, and it built without issues.
mesa_clc is built and used in build logs.

If this happens again, we should take care to preserve the failing
build directory, so it can be inspected post-mortem. 'Not found' error
can be misleading: it may mean there's a problem with one of the
libraries, or the executable is somehow in an incorrect format, etc.

Alex

