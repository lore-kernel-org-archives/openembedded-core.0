Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.8223.1612447317223649744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 06:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XFnIwTRO;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id y19so3300693iov.2;
        Thu, 04 Feb 2021 06:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5rl7c8Z6QgwE2/gYpDA6WH/KCLBdifKos5q9pLZux2Y=;
        b=XFnIwTROx6wOTIIKEg6wYBg2oK85N81mHDChePaM7lFfWEnXhwfcCSmaLJ+u/gdXS7
         Pfo6v8b2zK/khP/gKwu6IKBeMO+esgSC/BUC4DauNh9g/+b1EzXRhtVXYifExlmVJ5zy
         f4vBZBZbKonkLduaxxXOB01+KeJsO1r41+/sJh3eJwdB6wx1LGTGrPLvL+S3sUDOI8+z
         uVk2J4cgWqdQqbWWEK5i4KsBkUyxXpLKBqqqMgkyFRKosCJBQSibiS9MPIdeqvQKqCit
         yGn9HU6UVoWl5bYuPsTd+a8iBf5j1IP/FfKeO7wu4R+rVQQYOEdQSu1ZVTQQWFl5KdCh
         7jzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5rl7c8Z6QgwE2/gYpDA6WH/KCLBdifKos5q9pLZux2Y=;
        b=st2F/tKq1lCv8H3+gVBLMCSqJUIWSLtDiqFxqIJQQ01NQBrk7N/RR3HynF5r7pY+XV
         8VGZrxFc/Jh6xWsx+b31BmZO43bsfEITYix80/pYvNd9CDiOXmX1glNIMHLUUEaKeOsv
         GvMZjFDrDoubVYXo4YxRRLpLjrnQjaaFOGF3rfI2C77BD8b+5ie26cxLjMAcO1ueIl3q
         dW59HB2RKyNRf4hUNJw+2d+agC8kBtI4Ds/qLOYdTph7/aZ3G253R7KoxkCZFSGGW8Jw
         Qwn1g3ZJ/2d9mlWw0flOwSsQ2kzO9IGu0r6YsGKRGVBPliSoxXne4moMXKBw0jvRSp8j
         eROQ==
X-Gm-Message-State: AOAM5335vvWgrIGzOoVQeaDhrFOlwB7A2Py3lPAd6whu4Iq85GZTIvAr
	lzkSy4HU6qXBwISGS5cKPJUJ4q4Ek9cRwaOwbV58Y2oLfFc=
X-Google-Smtp-Source: ABdhPJzi6XxCWfMke6jzDWd9heFR/KCcOiJLveyK/a6vZjoQy0M3fEbeNkgdgrcFmEmbTeoPIxMCRPTfLkMslAdBdoQ=
X-Received: by 2002:a5d:8704:: with SMTP id u4mr6690728iom.3.1612447316593;
 Thu, 04 Feb 2021 06:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com>
 <16608F6140EB97FE.10090@lists.openembedded.org> <7FACD4B0-6B67-4213-AEC3-5C3AE446B034@bmw.de>
In-Reply-To: <7FACD4B0-6B67-4213-AEC3-5C3AE446B034@bmw.de>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Thu, 4 Feb 2021 15:03:17 +0100
Message-ID: <CAJkqNs2xTY84ZWqccoLfxNYT5CMyG_JcT66N4BXXSvbtxMzw=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] license_image: Introduce SKIP_LICENSE_MANIFEST_RECIPES variable to prevent from trying to use license recipeinfo file from image recipes
To: Michael.Ho@bmw.de
Cc: bounce+67612+147659+4454854+8786752@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000864f9a05ba832570"

--000000000000864f9a05ba832570
Content-Type: text/plain; charset="UTF-8"

 >I guess I mean should my change (not dep[0] == pn) be removed and yours
>take its place as yours should cover that case.

Hi Michael,
I would say we should keep both. Your change would be enough for most cases
and most developers wouldn't even need to care about that problem.  I think
image recipes depending on other image recipes are less common scenarios
and only in these cases my change would be needed. If we remove "(not
dep[0] == pn)" we would require all developers to adapt their builds with
SKIP_LICENSE_MANIFEST_RECIPES variable.

Best regards,
Tomasz Dziendzielski

--000000000000864f9a05ba832570
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
&gt;I guess I mean should my change (not dep[0] =3D=3D pn) be removed and y=
ours<br><div>
&gt;take its place as yours should cover that case.</div><div><br></div><di=
v>Hi Michael,<br>I would say we should keep both. Your change would be enou=
gh for most cases and most developers wouldn&#39;t even need to care about =
that problem.=C2=A0 I think image recipes depending on other image recipes =
are less common scenarios and only in these cases my change would be needed=
. If we remove &quot;(not dep[0] =3D=3D pn)&quot; we would require all deve=
lopers to adapt their builds with SKIP_LICENSE_MANIFEST_RECIPES variable.</=
div><div><br></div><div>Best regards,</div><div>Tomasz Dziendzielski<br></d=
iv></div>

--000000000000864f9a05ba832570--
