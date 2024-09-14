Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADE1FC619E
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 06:42:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.90985.1726296124343870762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 23:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=muXdhOzm;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53568ffc525so3534694e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 23:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726296122; x=1726900922; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRJrtBAm/PagyM9GOscnK4JvWnolZKBoc/I/tYGWhwI=;
        b=muXdhOzmUBM4ZbkqzixK1XkjCbs96fciBBxhJASzt5PGKQAA/1Db/M3HCKwcruV1pf
         uiowGR44Vh012tDhTBYkJnyjiPpLJ9e2IZvxLTRrhFiFgACgit76qhtNuGBQwEpEdcoE
         hWA5ptqNwrBtQTLH/mMq/gUbFL9MpV3PghDYa7c2WNhvdXgoi91CpdaNXq3TMTW5GGoz
         SEPu4UjKZz93V+/pvFsKYbKmSWGvz5Twq6CPzNUWPNXH6i+zFiTvV7qNzbpOH0UJSJx2
         ZeordwG7oGoW1f2eTi+ULqFFlzjZzEG0TG1LsSKwbM6bOueOtHqpQS3Zkv9c3swuZqW3
         YL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726296122; x=1726900922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRJrtBAm/PagyM9GOscnK4JvWnolZKBoc/I/tYGWhwI=;
        b=XYQrTJyYd4Et7a95iwbzPTjQttrW59XPIJc7dOgQSHcvjVxlgUj1YG9Zndes120eLx
         d3XBWwAwypcvuYu+kYjQSvdKd6q/VHdmoBPnrkQK1SFVz1YKQkwUl8JkORpuHPlUOg2A
         DKkS+xuJ7hWrIT6PLNy25kTEAyeH3idzTdBcE0z3RFsSGmpAx0Txb9r0hcwiLRLUXEr4
         eBxskjCvZvJ6d10HslCeREV3fUSmYrYHP/2mRaWwTeO2F1ElvAZlG2QOsLpQZt1D6qAY
         BML5mvxJKoQ7w4ctzomel5pxnYOnQatx38x7X9jhqE1wh0Nx5zLN8CMt8JZsM9Ox+CPG
         35UQ==
X-Gm-Message-State: AOJu0Yz8qonwD8gnGkYPiltbz5jKheLEFOUfSzkAD2X1Ntv3HPnh+CCC
	+HJH5IgfcWFpfgPxHz5TwID+HrI6EXy9HgqcZl7UOmi8E9vug0nFYQemQIS5jx2bgFV+G+1CghZ
	0AWQ2sZS6ZpvdIKILwiOqDGVV9lQ=
X-Google-Smtp-Source: AGHT+IF2AcfjKjYKixqdC1jy3MRKO2A03nvsRlYzvpmaQ2N9T+bsfhHIztDAlQN+rt5WtPZwv6GeMPect+8JU9dhzi4=
X-Received: by 2002:a05:6512:3f0d:b0:52b:bf8e:ffea with SMTP id
 2adb3069b0e04-53678feb0f9mr5766946e87.40.1726296121157; Fri, 13 Sep 2024
 23:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240912131711.243389-1-vanusuri@mvista.com>
In-Reply-To: <20240912131711.243389-1-vanusuri@mvista.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 14 Sep 2024 08:41:49 +0200
Message-ID: <CA+chaQe+jAerWU7PvouvyuQP8nd-qcw2C-9Y=ZA3Pt19mAG0rQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libpcap: upgrade 1.10.1 -> 1.10.5
To: vanusuri@mvista.com, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 06:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204489

This update seems to break nmap build from meta-oe:

nse_nsock.cc:36:3: error: expected identifier before 'int'
   36 |   PCAP_SOCKET =3D lua_upvalueindex(3), /* pcap socket metatable */
      |   ^~~~~~~~~~~
nse_nsock.cc:36:3: error: expected '}' before 'int'
nse_nsock.cc:33:6: note: to match this '{'
   33 | enum {
      |      ^
nse_nsock.cc:36:15: error: expected unqualified-id before '=3D' token
   36 |   PCAP_SOCKET =3D lua_upvalueindex(3), /* pcap socket metatable */
      |               ^
nse_nsock.cc:40:1: error: expected declaration before '}' token
   40 | };
      | ^
nse_nsock.cc: In function 'int socket_lock(lua_State*, int)':
nse_nsock.cc:181:17: error: 'THREAD_SOCKETS' was not declared in this
scope; did you mean 'MAX_SOCKETS'?
  181 |   lua_rawget(L, THREAD_SOCKETS);
      |                 ^~~~~~~~~~~~~~
      |                 MAX_SOCKETS
nse_nsock.cc:203:19: error: 'CONNECT_WAITING' was not declared in this scop=
e
  203 |     lua_rawset(L, CONNECT_WAITING);
      |                   ^~~~~~~~~~~~~~~

I don't think this upgrade from
470 Wednesday, June 9, 2021:
471 Summary for 1.10.1 libpcap release:
to
70 Friday, August 30, 2024 / The Tcpdump Group
71 Summary for 1.10.5 libpcap release

is suitable for stable branch, please cherry-pick just the security fixes.

On Thu, Sep 12, 2024 at 3:17=E2=80=AFPM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Changelog:
> https://git.tcpdump.org/libpcap/blob/HEAD:/CHANGES
>
> Includes Security fixes
> CVE-2023-7256, CVE-2024-8006
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../libpcap/{libpcap_1.10.1.bb =3D> libpcap_1.10.5.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/libpcap/{libpcap_1.10.1.bb =3D> libpcap=
_1.10.5.bb} (92%)
>
> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/meta/r=
ecipes-connectivity/libpcap/libpcap_1.10.5.bb
> similarity index 92%
> rename from meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> rename to meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
> index dbe2fd8157..94b6466722 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
> @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5eb289217c16=
0e2920d2e35bddc36453 \
>                      file://pcap.h;beginline=3D1;endline=3D32;md5=3D39af3=
510e011f34b8872f120b1dc31d2"
>  DEPENDS =3D "flex-native bison-native"
>
> -SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz"
> -SRC_URI[sha256sum] =3D "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c26=
48b7fa45b711bdd4"
> +SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz"
> +SRC_URI[sha256sum] =3D "84fa89ac6d303028c1c5b754abff77224f45eca0a94eb1a3=
4ff0aa9ceece3925"
>
>  inherit autotools binconfig-disabled pkgconfig
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204443): https://lists.openembedded.org/g/openembedde=
d-core/message/204443
> Mute This Topic: https://lists.openembedded.org/mt/108412577/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

