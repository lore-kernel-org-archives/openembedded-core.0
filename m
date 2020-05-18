Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.1494.1589840516458810213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 15:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q6WhgRUu;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id i68so9567482qtb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 15:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=C2LIXcpwG+TYGqUsdwEVOC23uyPziNTyeSBwUAc7Thk=;
        b=q6WhgRUut7RiPtC+e0rFQf6t2ZzbiN2ZQy0ZJ7lb3jRxJYxpAjoDnDY1yZwnD79RjC
         nmuQpQvxJbn1UyyJzijEfGDekH4fP33QIV8rBlqhFnF/3CTWEpQCt3R2kp0RNGmahKlH
         qiw88QIIhaysCfMk1KkjSw+2iEDk+ZTgRSBJPvey7nJ4K0VD5CwC9yQWSzzv3Y1Z4uZD
         /KvpE4yvSytNyIYEmDxIs6YL5FKX3ufzXvV1dfq0rE46MjxUAqj3SZPM3AOXoU0wDe+I
         CBwb2Vkdze/nXyeTnQR54eAjyqfkmPCKBzmo9Ikb4jADhN3Zf8O+YilJhdltN29FnnxJ
         vgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=C2LIXcpwG+TYGqUsdwEVOC23uyPziNTyeSBwUAc7Thk=;
        b=JW6cMJE4HJ7cszDiblHmT8kcA0LHZSPkNjPhPfGQyqN87w8NeaRoqfHdt783BtigSC
         xmzzAWCQY/pCsUxXfjuNhSqx0pSUpdP8+rfbRag/tgafGeb7CSS4ANpnoMIaVxP+Hd45
         SAnD6iUKPhAI7b3UlypNtcDp0KWAe+nezMYeQMA3kKYcfhmjFo1eN5PxqO12UewyV8co
         jXo1Wj1ph//hNnPmxiAPBaJHYLk8jWczCuXBnsTw1i/m66R/gSaZsipMlGh0rsdKg6/S
         Uv56joeFAwP404BpZWp7+yC31BFCNL9nzQMv828f7ZXKe5mYNZv8JnQNlbeHVWqeCaww
         8uhA==
X-Gm-Message-State: AOAM533t/KxR08pyPnHDSLGMlGLrPPcf37mU6ev2ct4fmcpcRB3Jm+qe
	mg3wUa/z9vXfnH2WvnHlhr4B5tR8yTLgtXK5LnE=
X-Google-Smtp-Source: ABdhPJyRPbsIbvP3LIwahRU5oJ93DO2a/b9bjZDim7HFAPyH6D9GsFD6JH98Bw1CEJ4V+wLMqNZf+2mv6X1KtnRPdRQ=
X-Received: by 2002:ac8:478f:: with SMTP id k15mr4169054qtq.285.1589840515406;
 Mon, 18 May 2020 15:21:55 -0700 (PDT)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 18 May 2020 15:21:29 -0700
Message-ID: <CAMKF1sqLxWZD6U1YHrr3Ngb1Vh8JpjCvUXRD7ybarit9wz5KfA@mail.gmail.com>
Subject: Dunfell backport request
To: Steve Sakoman <sakoman@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Steve

I would like to request backporting following master commits into dunfell

https://git.openembedded.org/openembedded-core/commit/?id=fd4a454b5a357c7a26792bf486212957c698839c
https://git.openembedded.org/openembedded-core/commit/?id=882df891e13ce5c64718c364efb9ef2bf189eabf
https://git.openembedded.org/openembedded-core/commit/?id=2c7e0e0bf32eb1ed0b7d8acddb16c0d1e93f2aa1
https://git.openembedded.org/openembedded-core/commit/?id=48b6f7e31ff042a4900307e830f9ed9375a8041a
https://git.openembedded.org/openembedded-core/commit/?id=ce6c50ea68c34e02b487d54fdd9288e04833cdef
https://git.openembedded.org/openembedded-core/commit/?id=886333c5d1c336da99300d24fb3c15ab0b37d1cb
https://git.openembedded.org/openembedded-core/commit/?id=03b04fcfa5549a54fe6f335df14433934a7d5128
https://git.openembedded.org/openembedded-core/commit/?id=e114c670d1e670397c1c04292688b7550f54027c
https://git.openembedded.org/openembedded-core/commit/?id=030cd9021ef50d71482f6acf0e05fe425038c822
https://git.openembedded.org/openembedded-core/commit/?id=a5331c5a8bbe63c6c2e56ebec496b28968d4663d

Thanks
-Khem
