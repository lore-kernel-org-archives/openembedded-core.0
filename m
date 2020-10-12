Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web11.1145.1602516712844379909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 08:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hNhA1Uf0;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id v23so6761476vsp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9EElOaQqm4+/R8iUPrCoQMvSthqCP+U6pjEKbV0RoeA=;
        b=hNhA1Uf0mULIXzqpRw6LOzEjeGmGIun6iZEddFHciuUILvUYKIkRFnB0CCQd2S7K5z
         Wehs+e0eNHOk9glVx55XeDcrVIu95CV37Dchk6Ns2D078SgCaaF/bga7oJc6oKO8cYQY
         Ytgl+hdH8ZWe1+Tx1lfFJ8drkfKw9i4PLTAplRQEAmaBE9m6EJjMyxZ5HaGkWVgzdr/B
         YV250jbhOsDzQLQUihkmgM7J5iMz8JdhzitTmsPkg60lMJjY4wqyT7cq79pjp8HZ54YS
         1fPH8o5kN5R7Hg6aoBYN1D9mJwkBxqZHi+U5XC/y7nRcfNgm4EzwvYZ4AfUqaOrg/XGj
         +l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9EElOaQqm4+/R8iUPrCoQMvSthqCP+U6pjEKbV0RoeA=;
        b=P+7fJIeLqahEzHOVGlhJBAR29eOJ6Xa94oJrkosWyQSY/tBa5vWzqAnA0esVyYNPmr
         cPrI8ZIstvsP+nktitKPA95QaEY6JfG34qDCtpQnv4dDBObxdQIiaoG7n5ljqOBgp7gQ
         D9JZo/vAchym+qJxvB9imMQNlzGuAT8O46aonzVwc/LIwScA8nSEimv3gVW1hTIe4sKd
         cmb71AI0h42gP14o+3m8hb/OUufi6zA7JsNBrVLja7wlyTpZhL8r50gxYNqk7KODZ3li
         9Crn2D0p2pUXjiqv7hVHdPEdje9VkdpSRKdHNoQemtCHVXgt8eZwMySlJU6yqZmXfh5+
         OuCA==
X-Gm-Message-State: AOAM5328+AuTDUlUFtV2UaHB+DzaoWz6HLf2yzGHYgwRF8YOGJU4yQRX
	Gup4GUMxesce9jrxo7WFugPKyKEwRKcPN+cpvvg=
X-Google-Smtp-Source: ABdhPJx9AaJ2ZCo4pvwNUk23giE6eMGK5YrANhCG5Hx1U4zsi3uCdyubXOLuZk2WRc2HauM38BEwVl5FgCpVAdFDNK8=
X-Received: by 2002:a67:504:: with SMTP id 4mr13153516vsf.20.1602516711888;
 Mon, 12 Oct 2020 08:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com> <20201012123620.2095778-3-quaresma.jose@gmail.com>
In-Reply-To: <20201012123620.2095778-3-quaresma.jose@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 12 Oct 2020 17:31:40 +0200
Message-ID: <CANNYZj85PCVxp-8_rEWLw1rU2w=v_=tR-dFHSohfcyT=ndbfvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/13] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005bdd1105b17aff24"

--0000000000005bdd1105b17aff24
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2020 at 14:36, Jose Quaresma <quaresma.jose@gmail.com> wrote:

> +
> +%% original patch:
> 0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
>

These additions are all over your patchset - please remove them all.
(I guess you used 'devtool upgrade'? That should be followed by 'devtool
finish')

Alex

--0000000000005bdd1105b17aff24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 12 Oct 2020 at 14:36, Jose Quares=
ma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">+<br>
+%% original patch: 0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstg=
lf.patch<br></blockquote><div><br></div><div>These additions are all over y=
our patchset - please remove them all. <br></div><div>(I guess you used &#3=
9;devtool upgrade&#39;? That should be followed by &#39;devtool finish&#39;=
)</div><div><br></div><div>Alex<br></div></div></div>

--0000000000005bdd1105b17aff24--
