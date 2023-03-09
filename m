Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCCFC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:26:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9229.1678353967955163336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DiWqPjnP;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id bw19so1142850wrb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 01:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678353966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ6FiCh3Y0GOMB7B1WgCnFRKrdH+t0xBJFxpzbdRvpE=;
        b=DiWqPjnPBUkVNxtzXja044Rxkb7Zlc3dECqcWBXMqH9UeFNj2YLIa9Wl3UB0G02Ht9
         favuOIdo3dTL+AeHZlMwdfuJNSc/vmrE0WqfHQ5VaCE2cS3w9gekNHLILrn85iMmpfxC
         qwT+/n4Hjws3P8hVIJRIbcMtzbWuIIQxkVkIJHQaKl+79/wLZt45HTdhgXNoMdkaXeIF
         V1uWqusZizkJs2lNV0PaXto4/b9EYgezh2acna8HvDivBJ90nwlX/JfX5sXHq0AOnHWk
         QqVpRynazyqXlem7E2Q7tNi8vMlzPaMKKm5K9hCsRKAIhxPV0iZufMQi/jK1Q7qdDf8h
         Y46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678353966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZ6FiCh3Y0GOMB7B1WgCnFRKrdH+t0xBJFxpzbdRvpE=;
        b=GB85sJmzLe43MBo0Ugmb+McDbR1lr/EhEKikBghC7hLqATfgVBphxQ3f0OjGacZ9Gv
         UC0R6sKvDzWaUNKlUvthGgZzi5Npjgebj4ArqBhYSEVux3THGWA+sMD7JgD88mPR6FZT
         d4/1o5xKWf3U56bEdPaDgushmVGsfrAqcicCpNud9tT+aZmQkTHTNGrn5s4XJgcIm4kT
         W6zvxwGJCZ6CvtcioAIIaV+3poboDe1wChpB04uhmvLCD2pw/DS/59toFuDInaV9hQZq
         cNstxft1OLtD2NtJzxRYkscP3A75XDKeyDfUdMQR5EF2S+FYnEWXNxtjyRvGWtOWYvFV
         he9g==
X-Gm-Message-State: AO0yUKU+jg+im88ipeFqpApEZOgGM+iNhImJYPLzyN+LBa11+MSDjrOO
	6LdR36vaMZeGOqlA2CbISs2pBwlPLg3t7yvpZNE=
X-Google-Smtp-Source: AK7set/rKRleH2l2jM2OUTuZcprFtnI7GnNXlJGbWn+xqtAysJhdak/LxrlwKBjM4vYLgqFYe4Jv4mKFBZwAgN0jzaI=
X-Received: by 2002:adf:f645:0:b0:2ca:5314:a1cc with SMTP id
 x5-20020adff645000000b002ca5314a1ccmr3988339wrp.1.1678353966191; Thu, 09 Mar
 2023 01:26:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1678242326.git.steve@sakoman.com>
In-Reply-To: <cover.1678242326.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Mar 2023 10:25:50 +0100
Message-ID: <CA+chaQeo7WCfbp_EAGbpc-9zVyaYeqVo7uSwZ0iPH5ez+Vh27w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/28] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f65a9205f6743b0d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 09:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178213

--000000000000f65a9205f6743b0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2023 at 3:27=E2=80=AFAM Steve Sakoman <steve@sakoman.com> wr=
ote:

> The following changes since commit
> b20e2134daec33fbb8ce358d984751d887752bd5:
>
>   build-appliance-image: Update to kirkstone head revision (2023-02-27
> 23:39:05 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/kirkstone-next
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/ki=
rkstone-next


Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--000000000000f65a9205f6743b0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Wed, Mar 8, 2023 at 3:27=E2=80=AFAM Steve Sakoman =
&lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The following changes since commit b20e2134daec33fbb8ce358d98475=
1d887752bd5:<br>
<br>
=C2=A0 build-appliance-image: Update to kirkstone head revision (2023-02-27=
 23:39:05 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/kirkstone-next<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/kirkstone-next" rel=3D"noreferrer" target=3D"_blank">http://c=
git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/kirkstone-ne=
xt</a></blockquote><div><br></div><div>Acked-by:=C2=A0Martin Jansa &lt;<a h=
ref=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;</div><=
/div></div>

--000000000000f65a9205f6743b0d--

