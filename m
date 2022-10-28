Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E99ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 09:35:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.4329.1666949747874541204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 02:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sr2YCQRm;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id b20-20020a05600c4e1400b003cc28585e2fso3311855wmq.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xcC/IFUAfxCH43e7aXSYEh2Kk+lGry1KmyQz1DWR84Y=;
        b=Sr2YCQRm+av256Ug6VXIDb6/JZLlZQuqn14m4wnQryRVhqJTNK0effL9iWwJ+oKNCu
         IG7vTnTB7u4horN8QuL9qmS581jU4wHat2IlF8HmK1AN8UXV8rdylSVTkp5TvoEWBvCI
         wI9Phn4VXWHUC+hVwE1D7ImhBslePvgyieS8ejuKbn/th+uzIPVgPPdGbbLxd78+xX4R
         tvLsuI1HSsDbTzgYWsYa2VgE6p7vPQGznSSu1+Q3zCYx6lkcffMwHRC8xJS08G/jhyd4
         LUMxlyTRR4xgVOaSoe/UkPA79/IMlxk6fiURZBcFU4IuSSLSxscIZ4ENnqo4CJrxvUoq
         6wfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcC/IFUAfxCH43e7aXSYEh2Kk+lGry1KmyQz1DWR84Y=;
        b=bm+NBnvA/adJzA3rDy8tzQWD9C4F1oQKuLFqPqyT45dhuTnezLJFcjotmRWod+nBxM
         u7goSyd0FocpBkJSFX65eGcwf0cPjmep8x0IGLNb1HufypgUdsY+j7qqZlJ+pUnQdsxl
         TmW4iE/+PPGjtuV0Snjau4B3omWdUGCB6LE32jX9YupCL+4N/ro4Kr//ydGNRjvu0CEN
         Bk1EZIwlenGM6sbk/fXL914OMt7ELRpA+dOx2gmeZN3vVrDcg6Cv2PqkoBJsIFv5sLcQ
         KsoFeYOkaLtYWE3YuT0Oo31QYtpq9TgihXrrdWK2eBniiZlTm9+UP7xS+qmpGWGNglXP
         C7lQ==
X-Gm-Message-State: ACrzQf2nfogEtDZM3xRQWGiDuDYpofs7+2AekgnbCAz72qr9IHEsSMbz
	YJFPPAQ2q3n6fCoX23liSJPUEgL3cRybMMV7/b0=
X-Google-Smtp-Source: AMsMyM6JKYjsIsD4VVGzIPy3CChOXYV/bIfFf+WdrKe+XLK7/zt9Xnwk/F4n33ODVEiuOlFjxzzw8Kc3t6roB8wN1ZM=
X-Received: by 2002:adf:f8c3:0:b0:236:9c97:6f6b with SMTP id
 f3-20020adff8c3000000b002369c976f6bmr3189166wrq.548.1666949746011; Fri, 28
 Oct 2022 02:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221028085823.1971805-1-Martin.Jansa@gmail.com> <7da31600351db0da8ccabe7b4ad490dbe4a1902c.camel@linuxfoundation.org>
In-Reply-To: <7da31600351db0da8ccabe7b4ad490dbe4a1902c.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Oct 2022 11:35:33 +0200
Message-ID: <CA+chaQdEYCM8J3-RAojUgP_mX9Q4kW_E1qTx93VfUevUf9PmCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo.bbclass: avoid calling which ${RUSTC}
 with undefined ${RUSTC}
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007835a105ec14fbe1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 09:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172241

--0000000000007835a105ec14fbe1
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 28, 2022 at 11:19 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I've wondered about this. Lets just get rid of that "which RUSTC" call
> in cargo.bbclass instead?
>

Fine with me, v2 coming soon.

FWIW: the rustc dependency seems to be there (it was showing the expected
path to rustc after this).

--0000000000007835a105ec14fbe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Oct 28, 2022 at 11:19 AM Richard =
Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:</div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
I&#39;ve wondered about this. Lets just get rid of that &quot;which RUSTC&q=
uot; call<br>
in cargo.bbclass instead?<br></blockquote><div><br></div><div>Fine with me,=
 v2 coming soon.</div><div><br></div><div>FWIW: the rustc dependency seems =
to be there (it was showing the expected path to rustc after this).</div></=
div></div>

--0000000000007835a105ec14fbe1--

