Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.8163.1611636886020541589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 20:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QDswY9cS;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: idadelm@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id gx5so21203394ejb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 20:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=cT/FfREJmZaP5kfGTe5v1Si7nkdXEPHKDgwLs7G9tWc=;
        b=QDswY9cSmaauizAFoYn1ORyB5iXUfM3yFcWU0Bve8l5nCN7qVulyblS1xldF5Rth4Y
         2dd9j8bolskUnXXrsB6+6UaKZcAaNq5tCsOTQCz23YNeZoZD0YmJQR5bFgjUHtxPXEF1
         imVSZ9SL9Ts9h1ZmiBjFxVCcpjvtP5L4KRgVv3vWwhD1PtGNF+VrJy9wK8PlgbJED6Ia
         qdpAXp95DMAT/tnMHH98ZvN+DCPWs+Flmz31r53+kCkiMdTF35/DCuqG1jdTHO+k3r18
         r0pQdjdpHKFL/Sb8/g0OwSouWBMpHadIJy5PP4JiLJrwSmIMdkbDS0QCtGIKw1VscKGx
         Rpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=cT/FfREJmZaP5kfGTe5v1Si7nkdXEPHKDgwLs7G9tWc=;
        b=Zc+/R2lKhWMpbHgdm0irZoeOKys3h7fEjh6mTuX9FYlCrzPmnEx5EAkjrL10+XE5D4
         PGeR+L3AdxMwvNH3kCiXTfRmy56i8B9hQeKKvWyhqhjF1DOkGVa4sqQ6YL7TB30iQVnj
         3JTd7+H4x55meEpZB1XG+HUuf4V+szQvYtzSis1ISifbAPBd36QWfuhZayfrCCqGI0sj
         NzyDpXK3Dd53Qey78bGuVu+XO4gbm5++G160oAArfRQs40azoOmUYZ5bt2CkpYZNlHgN
         jP/x1ykLteATUnKAHJ1656oidOQPoQ3whN5kZsXIEeBtw/4zwDeSE5R7YDMBj4p5qW4g
         jRYg==
X-Gm-Message-State: AOAM5321UrjRc1f5XHFckCNbQg52fVOnfcN73dAQA/o1zs4QkNxGPb1t
	Z5ORt2H6gVZeHsuT4W+O+nFBecdlKa0ctfo5W08i7enSpIQ=
X-Google-Smtp-Source: ABdhPJzWsKq2ifZ5UQB3WcotnDa7r5UwaS/eHoLofQSthZGNGXGUawhSUqm8Q9yEgqIPtbxz7kV+GUZ6RC0JhfqPrcM=
X-Received: by 2002:a17:906:9747:: with SMTP id o7mr2279153ejy.107.1611636884152;
 Mon, 25 Jan 2021 20:54:44 -0800 (PST)
MIME-Version: 1.0
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
Date: Tue, 26 Jan 2021 05:54:33 +0100
Message-ID: <CAN7sTguiWFuDzFbynGfZUO02Lh3X-bTVVSYezgBxZ75fGX0K6Q@mail.gmail.com>
Subject: World build doesn't include any recipes other than the core recipes
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fca5ce05b9c67393"

--000000000000fca5ce05b9c67393
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,
I added meta-oe, meta-python and meta-networking layers before running my
world build but from my output I get, none of the recipes of these layers
are included or taken into consideration. It's almost like they weren't
added. Please what could be going on?

Cheers,
Ida.

--000000000000fca5ce05b9c67393
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Everyone,</div><div>I added meta-oe, meta-python a=
nd meta-networking layers before running my world build but from my output =
I get, none of the recipes of these layers are included or taken into consi=
deration. It&#39;s almost like they weren&#39;t added. Please what could be=
 going on?</div><div><br></div><div>Cheers,</div><div>Ida.<br></div></div>

--000000000000fca5ce05b9c67393--
