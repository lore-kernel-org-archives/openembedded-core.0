Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.106.1594833829646120275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 10:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MegN0nEv;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id x13so1494856vsx.13
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAe9y/T3L5CCl+j6HB7u/hZFsR4iglMztep/Z3LCSpI=;
        b=MegN0nEv2R19G0jntxBDa/B7QgZy2lvBmTHs79FRbbXp4fDUsf9RSIYwrEd6YA6xfP
         V3kBTqHXxDg4XlMHrfE0xiXvyt99DwhDuRFEV+nlmKbkM/R8NDycVk+dYQ8CCvTLhlRA
         4UJXwr+H0kAu51hDaHuJw80cyBuASrNUovJ1b2jmnvZDVRP2MJ5pEcSr+zK/x1krN7tx
         2axqSfN4alYa6p/yb0VtqsHvLYasl/C5UR7loahnbytVN7Ub5bhvnJiQpEdhKYJhTBJi
         XcUtymL7jO7vVmkBohgIe6ZsA/zk+M+/kp8I+97NyfzqzugnBrVI04iJ2E4XMVg0dUGt
         2uPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAe9y/T3L5CCl+j6HB7u/hZFsR4iglMztep/Z3LCSpI=;
        b=moAN+8OjVeXBI80OU0OKscb8Nf5lRuqh+6vUfYpfa/PqOzu1Fd8uFTEXoGUbgDDkJQ
         V5Q+1YgMA8LniaS5h/4MhuudMnktGIjAbxe/hJp8rBQkGherkwHvPt29SAg5U3knCqU5
         3ThL+NW5zo9XnpCjpnZYZnJf8nEiBq4J797oN4t8arsoqYHOA67eLOaFU70U/HN6hs29
         UkHfuacp92Sf32yztl6pMlS4tCYaArByH7LtSG2E+lFQkkRuHBWYLwJl/xOYmHTB0pxw
         TGZGluZQ5DADnhvAzcVbltJGgHf8Jynl7NfDU7zjoIfkPGXrl1dljCllwbQ/VY5b267P
         1uqw==
X-Gm-Message-State: AOAM532g6Z7v5gSjvN4CFvvoS3camgdbDHlrIK2Si4L1tHZH5KxfM4Ht
	S3UPQYOQM2L2/uP4wVQTwaU/i7QvAdtXR7/UK5s=
X-Google-Smtp-Source: ABdhPJza5VvDqYBtQh1OyFGtA2L8637oVIEe5pRptMekYjUBXRSBCjev8VDuGVSgKk8R4XDCTsaMTL9BC2DbYl0d49o=
X-Received: by 2002:a67:cf88:: with SMTP id g8mr197660vsm.25.1594833828803;
 Wed, 15 Jul 2020 10:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <fb3b732ab791369a2287a3b89e0d125c78f228ca.camel@cisco.com>
 <20200712213551.2206605-1-takondra@cisco.com> <CANNYZj8QBo7X5qoq3yse8rO3qh47_zTWkm6hkRUng2hHmj+c_w@mail.gmail.com>
 <0cef3914ade47872815423de749d0885759d24e8.camel@cisco.com>
In-Reply-To: <0cef3914ade47872815423de749d0885759d24e8.camel@cisco.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 15 Jul 2020 19:23:36 +0200
Message-ID: <CANNYZj-5OJTK7OZ0MHvdiHuWdEAykbG0SKbkxaQjYQpqkgQzqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: use host pkg-config only when host provides sdl
To: "Taras Kondratiuk (takondra)" <takondra@cisco.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="000000000000d7761805aa7e2fc4"

--000000000000d7761805aa7e2fc4
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2020 at 19:09, Taras Kondratiuk (takondra) <
takondra@cisco.com> wrote:

> This specific xkbcommon issue was hit on Zeus branch. You are right, on
> Dunfell and master the commit 3f1fd15cf0df ("qemu-system-native:
> disable options not included in extended tarball") will hide this
> issue. But the issue is still there. One will have to keep adding
> PACKAGECONFIG options for each configuration that can be out of sync
> between host and buildtools tarball.
>

But that means we have a non-determinism problem: if qemu is picking up
things from the host without being explicitly told to do so, then the right
fix is indeed to add the missing PACKAGECONFIGs so those things are either
explicitly enabled or explicitly disabled.  This patch seems to be working
around the non-determinism, rather than addressing it.

Alex

--000000000000d7761805aa7e2fc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 15 Jul 2020 at 19:09, Taras Kondr=
atiuk (takondra) &lt;<a href=3D"mailto:takondra@cisco.com">takondra@cisco.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">This specific xkbcommon issue was hit on Zeus =
branch. You are right, on<br>
Dunfell and master the commit 3f1fd15cf0df (&quot;qemu-system-native:<br>
disable options not included in extended tarball&quot;) will hide this<br>
issue. But the issue is still there. One will have to keep adding<br>
PACKAGECONFIG options for each configuration that can be out of sync<br>
between host and buildtools tarball.<br></blockquote><div><br></div><div>Bu=
t that means we have a non-determinism problem: if qemu is picking up thing=
s from the host without being explicitly told to do so, then the right fix =
is indeed to add the missing PACKAGECONFIGs so those things are either expl=
icitly enabled or explicitly disabled.=C2=A0 This patch seems to be working=
 around the non-determinism, rather than addressing it.</div><div><br></div=
><div>Alex<br></div></div></div>

--000000000000d7761805aa7e2fc4--
