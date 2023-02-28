Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6592FC64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 15:00:59 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.25566.1677596455966016049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 07:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=av/hAd8w;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: ernstp@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso5719531oti.8
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 07:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677596455;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iFB3WYBaXDTlIzElP1EgWMpoPeQMz267e2En1Z49xJM=;
        b=av/hAd8wb7g3Ygs0Ne5bu3Oj/bkNQ/L3SIJ41sJP/WOLK++zIULl1IKr4j0fKaMx0P
         lr3LIXoUwue5LdTFn1ibvFiUeldGa2/OaDUo2iW4KjhI449cE1ngx0eJXaQu+iUj8ppF
         HMmhjYmnERnp35eQzpZkocp3S92EsmLTPRZkCSvvZDFTuDZTuzQanGOP3QaAk61hAKFn
         uSMXQdSzWRUFJxqS5KnnIQ9kRlKxTnJzVaQyA6YJ9tsDQBXrNwjvuEHxNEm/937IKySF
         xg4p6bF6Ohvboar2TZ3jjyF1fVN8+8GEV5jKKe5PetIKvEDSGR8TItNLyLaklDZQPsPz
         F7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677596455;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFB3WYBaXDTlIzElP1EgWMpoPeQMz267e2En1Z49xJM=;
        b=R8Zq7ppGOW0rVWJWat8dSLOxqemvVgKuslmMF8Z1yzFgP1oVtjYIGE44Wrai5+3ZDM
         aT1DvZaerrY7rRM2QHj+C8ASUGG2TkDHdxglnKD5Pl2DslH4ZUTw3pS0gR2b6Y/50VsV
         Bz4jgln6ApGoXLLqtD92NGZ335vNtGOZpC3EPF0P44BNqgtk7stw0dDdQxfT/S8H6lMY
         8h7nfWDbHsFxjuSA76K367HiOt9nYtrsSky7V4tSYzUybwOCfwB/ubLwGOz8hQbWpugU
         3ChBZF3RnUdW6YyYuDbCC3jjZKe2amWl9pjWMYw3vZnkmIr9UH66+DnOd8ppN1pq8KNc
         smgw==
X-Gm-Message-State: AO0yUKWF6euvWA0T4Q0WhcZ0fTKVErfNPIH0nbxzDxhkDM7kubmUzARh
	wYptIB34LSNLThsE8tBvCKYP3M4grBIofvMbv/OP9RSm
X-Google-Smtp-Source: AK7set9DPnHG3n6Ig9XvUcAjluCmcXvMOP6sP3hyjMuk469/XJA3uBytVRFhSC+1cMiFWtDM7z0oWodQs5PBHW0OUpA=
X-Received: by 2002:a05:6830:438e:b0:693:bdd8:7b32 with SMTP id
 s14-20020a056830438e00b00693bdd87b32mr1768289otv.3.1677596455151; Tue, 28 Feb
 2023 07:00:55 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Tue, 28 Feb 2023 16:00:43 +0100
Message-ID: <CAD=4a=Xi3cEf9KM-iB3nsLPEEJGupxVJZrMQ7qP9c7aSb3bJQQ@mail.gmail.com>
Subject: PEP 517 and PEP 621 support on Dunfell?
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c92bcd05f5c3dcfd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 15:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177837

--000000000000c92bcd05f5c3dcfd
Content-Type: text/plain; charset="UTF-8"

Hi,

more and more Python projects are removing their setup.py and setup.cfg and
switching to pyproject.toml. That unfortunately means you can't install
those packages on Yocto Dunfell.

Would it be reasonable to backport support for this to Dunfell? I see that
the changes done for this support was actually kindof big, and as usual
updating setuptools will probably cause some old package version to fail to
install instead.

Just throwing out the question to hear what others think about it!

Regards
//Ernst

--000000000000c92bcd05f5c3dcfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif">more and more Python projects =
are removing their setup.py and setup.cfg and switching to pyproject.toml. =
That unfortunately means you can&#39;t install those packages on Yocto Dunf=
ell.</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica=
,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:ar=
ial,helvetica,sans-serif">Would it be reasonable to backport support for th=
is to Dunfell? I see that the changes done for this support was actually ki=
ndof big, and as usual updating setuptools will probably cause some old pac=
kage version to fail to install instead.</div><div class=3D"gmail_default" =
style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gm=
ail_default" style=3D"font-family:arial,helvetica,sans-serif">Just throwing=
 out the question to hear what others think about it!</div><div class=3D"gm=
ail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><di=
v class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=
Regards</div><div class=3D"gmail_default" style=3D"font-family:arial,helvet=
ica,sans-serif">//Ernst<br></div></div>

--000000000000c92bcd05f5c3dcfd--

