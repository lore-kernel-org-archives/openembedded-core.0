Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8271FE936F8
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 10:47:18 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.9797.1696589234985631111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 03:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=YQEaz5sz;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.208.44, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-536071e79deso4385389a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 03:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1696589233; x=1697194033; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ngfKxBEXoiskTwAdGBX656fsvQqERPyEa/RZcYySVYI=;
        b=YQEaz5szZEhAuTxAac+43H44mTKdeqvN2CEypaMTCnM5lpDSWCsAX8KEjSgLkcaa8Y
         oJy1n05nz031YF+YdXkPbGKCWChG40nLOl911tiLSxFpK7A2zXed6iNs/sUKPi5+wOIo
         /BhHmXZe3yFce1uKhpZxeSQdJN9oAIgcqyuGV+KcWy1LUeFd6VfOwwzFkwqjs8sN+RU5
         SH5oo+y+DgokmLO7a9dgrBiaXLal3oNuxwf0uuQWb8CKy9mChEFmKSs7VK/KQ+QuuAZ6
         onL8vTrfyYSnRMFldJyQwjKJgM2Qjas8JbNNEjZAydPEHd//kIQEuS203dN5wjOMMD4U
         NgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696589233; x=1697194033;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngfKxBEXoiskTwAdGBX656fsvQqERPyEa/RZcYySVYI=;
        b=qWNYxNzL4YtKlVevHi43r7e4K14Zja1SvpQigTU9e+5XzfdEmzCBICQDp5o8tU/Olu
         fQf58U+rxlAQG/8Wp6vZBDEE5AEHmve8+g3/GRe6dJayVrTJ2JvN5R8gGERchRSlXDqn
         WUYjAs9+kCQCLf+O77olsoZvn1AktLHGFJbusD5xMlyavAFH+MUksfmnQ/eFFSpK8BWY
         crtmL4iQXAJz877nw8hyycAST9icMM1KDmzUGr+tFYqQ7YLxhLwNEUoTJyQGZeVt6/vv
         Js/OR1g//X6cHXRHu/WW/pxRrOgW4dfc9Eij/T+xiOi34LCa3CxKRHri6zCU9RUKB8zF
         hc3A==
X-Gm-Message-State: AOJu0YxHV6JiiD23mzisHf1HtneAdAysanTlBKQOpouOCYLmlJ3mECZi
	5gWVJvXYlPZCA6UNqh5eEeCnunPO4aN+mnqfrL77AQ==
X-Google-Smtp-Source: AGHT+IEsXoUdU8CdKHtI2KDPbfDAiwBrCqKg8QzN2IpjCqvzxfl/P1ghQjSpqYADz+g8LbYAP8vr9tk2p+2drBDHrO0=
X-Received: by 2002:a05:6402:1e8e:b0:533:5d3d:7efe with SMTP id
 f14-20020a0564021e8e00b005335d3d7efemr3189656edf.6.1696589232690; Fri, 06 Oct
 2023 03:47:12 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Fri, 6 Oct 2023 12:46:46 +0200
Message-ID: <CAEt6Nwo_atjLsw7xn-CD0yB2u-wmoL7gPD-M=Wo8H30wnTAyyA@mail.gmail.com>
Subject: Yocto Project Summit 2023.11 registrations are open now!
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000008b899f060709f69d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 10:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188752

--0000000000008b899f060709f69d
Content-Type: text/plain; charset="UTF-8"

Registration are open now! Join us for the Yocto Project Summit 2023.11 to
not only hear about the latest and greatest, but also challenges and
solutions from the whole community.

https://summit.yoctoproject.org/yocto-project-summit-2023-11/

Josef,
on behalf of the organization committee

--0000000000008b899f060709f69d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Registration are open now! Join us for the Yocto Project S=
ummit 2023.11 to not only hear about the latest and greatest, but also chal=
lenges and solutions from the whole community.<br><div><br></div><div><a hr=
ef=3D"https://summit.yoctoproject.org/yocto-project-summit-2023-11/">https:=
//summit.yoctoproject.org/yocto-project-summit-2023-11/</a><br></div><div><=
br></div><div>Josef,</div><div>on behalf of the organization committee</div=
></div>

--0000000000008b899f060709f69d--

