Return-Path: <tomasz.dziendzielski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13DBC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 12:44:05 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.12406.1635425044722951115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 05:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NP7suPr9;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id u130so2916437vku.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 05:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t90D/m6mFgQIOYEtzf/RylyWBnVoT2D7+WmE8CGHINk=;
        b=NP7suPr9Z5ZzPm1Fd15y1E9kZB7uHLNxnjFCLpPLfK6DI8Qkp0ZdfGheYR0S8mLLtd
         d8gsUiYzd7pk36/szx338gkdSEVNhdeHOAcYIXBgtjUJaZWp0Zv7xOx0UtPfBoWfnMvG
         j6uRvj6COhk3BJ6exs7jAwYU09xI2u9j9CeVXIIPQlvakdY2mDHTKLUdVDeiPIKe8297
         /MQVnAJD9H3OdUJ1pAek3hOWh5WctoBXCzNc4868K6ljw1QI/+kKCOk66vHccAtH858z
         AhGHDSRK5ZZi4L/W+8iQkUx89DjZ6RlYfm6nN+Q81ZK/eY+SlU2eVCdJph43b/yA467J
         kXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t90D/m6mFgQIOYEtzf/RylyWBnVoT2D7+WmE8CGHINk=;
        b=edJL/YfxtzAG2vdb66USCL6ch7FdZhksJ1iNfTOWjVZN4FuY0J0+wqdAyKjjF7hMjq
         MeYDVnARangupRmfNH2QxTkbhKLR1E/+7qXV9jvL3aGfCxom2cNk1SXp7c54BOxj0IsA
         WYEDRcI2+6gc8KCPUa06s4xLiX9BW6QQdyro3kMxIBm4ciV2cTi6zx+FQ1MVQriLX+RB
         /vhL8O4ETIWPavNCeIYb22Pq80HDADzLa+InF/0cRjdooh1fK5F6ouXrDJpcIyArwTVw
         rDmsZ2hfBCUTeJZ3CsHsD2H8g9Z+aPK1YFeakWw1OeWmWDm3nU07nF0DbQ8GZ69lHi0W
         vJog==
X-Gm-Message-State: AOAM533RPGALeTE6ybkWuKHDt+VE3Q9yKQu/fxoF7Asc4eRXEpUQlJmS
	rGQde4RTNxrDAL3vNQtCODEA7AzrwkChqPlvDV0=
X-Google-Smtp-Source: 
 ABdhPJy2Wj5PLLp+063UlXLERun/7ZXI48g5EK70cB9as7be73GZv6moaaDC8AeKqtzQb44Jt9Z6uF9hvZQuTFFULsQ=
X-Received: by 2002:a1f:324d:: with SMTP id y74mr3933593vky.20.1635425043591;
 Thu, 28 Oct 2021 05:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211026073249.3424-1-tomasz.dziendzielski@gmail.com>
 <e72e9ae071bc25c6d14749c1604fb9b4b890a0ae.camel@linuxfoundation.org>
 <16B1D493AACBF55D.19566@lists.openembedded.org>
In-Reply-To: <16B1D493AACBF55D.19566@lists.openembedded.org>
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Thu, 28 Oct 2021 14:45:46 +0200
Message-ID: 
 <CAJkqNs38_N1zvpDu0UhObo_KMjYQO-GTCgboVXyMA4dJdwmoCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] license_image: Prevent do_populate_lic_deploy
 from using image recipes' recipeinfo
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Jan Brzezanski <jan.brzezanski@gmail.com>,
 Ricardo Rodrigues <rrodrigues80@gmail.com>,
	Szymon Czarnuch <szymek125.14@gmail.com>, Kamil Kwiek <kamil.kwiek@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c7b4db05cf69103e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 12:44:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157596

--000000000000c7b4db05cf69103e
Content-Type: text/plain; charset="UTF-8"

Unfortunately from what I just checked we cannot merge license manifests
because new manifest creation would require additional package sstate-cache
manifests (to get package contents) or to use package manager to get FILES
contect. That's also not really correct, since in license.manifest we don't
collect package data. Also current way license manifest creation does not
really care about RDEPENDS, for example it does not the real content of
packagegroups or kernel-modules packages that are under main kernel-modules
package. I don't find this correct and in my opinion this should be changed
in the future.

Having all that in mind I think the most reasonable way to keep the just
copy the manifests from intermediate image target to the final target, e.g.
copy foo-<machine>/image_license.manifest to
bar-<machine>/foo-<machine>-image_license.manifest. That way we will have
full knowledge about where the packages came from. I'll send a patch in a
moment.

Best regards,
Tomasz Dziendzielski

--000000000000c7b4db05cf69103e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Unfortunately from what I just checked we=
 cannot merge license manifests because new manifest creation would require=
 additional package sstate-cache manifests (to get package contents) or to =
use package manager to get FILES contect. That&#39;s also not really correc=
t, since in license.manifest we don&#39;t collect package data. Also curren=
t way license manifest creation does not really care about RDEPENDS, for ex=
ample it does not the real content of packagegroups or kernel-modules packa=
ges that are under main kernel-modules package. I don&#39;t find this corre=
ct and in my opinion this should be changed in the future.<br></div><div di=
r=3D"ltr"><br></div><div>Having all that in mind I think the most reasonabl=
e way to keep the just copy the manifests from intermediate image target to=
 the final target, e.g. copy foo-&lt;machine&gt;/image_license.manifest to =
bar-&lt;machine&gt;/foo-&lt;machine&gt;-image_license.manifest. That way we=
 will have full knowledge about where the packages came from. I&#39;ll send=
 a patch in a moment.</div><div><br></div><div>Best regards,</div><div>Toma=
sz Dziendzielski<br></div><div dir=3D"ltr"><br></div><br></div>

--000000000000c7b4db05cf69103e--

