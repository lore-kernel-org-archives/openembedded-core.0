Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web08.28656.1629139245880740879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 11:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ek1JgZvW;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id b26so5723747uam.13
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 11:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7VA4r3TLGcBffQvOQUR5X3EqrYeoUg7S+mzDke++9WY=;
        b=Ek1JgZvWVKIko1hV+L2OGQy1VzMFl99lehYC/PTfXHqnebp+p4dOUmlyRZBtlKXi38
         Y7ACWq30vWSWpH1lPLcCaC1OQ3WpRx+koDbKtU6HWWrR6VhyovzEd9CnkCDXv121kIII
         4xeL1hvyiuCdb7YoQwKOgHzzeTBwejvfvICVmm9d3azbjcyMG9gpG4MShkyv5bM+VEeu
         OT9hU7d3oE6FNVufdoz3uIqZr5ZJw21Z69BAQiboE5aXy7gmd3I68XQF3exV/z4HtOQA
         XzrWC/ge3Hbie+2LMDD1amnZbQEotLBhlAPljYehAiLbuukO2jlT1nXF53a0liVUPdfa
         xqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7VA4r3TLGcBffQvOQUR5X3EqrYeoUg7S+mzDke++9WY=;
        b=HgH/yjyjJhBAabE/lnxGw5iifFOPBom/DuT3YxSFCVGktPD6aQoZvuLJBS5OaHbTNz
         uRhs+pkBh5WJ13FufbM01LiSikwk0G0OO3VPJqi9Fj8DByUqE4j+vdxrOA0REMY0IoBo
         d+/81Y1r4/bgFad/n+wuoiaLcckyNVBzz1zSM2q6a84lyHCtdU8QIhIM8C9eFCsouD0j
         2sw0s66MwHyD2SchKdViQ+hDEQlA/E2aI85pNkTaN1IWMYIe20n1BuK62Ug5rrV7bYST
         Egn9d5CpBdbYGz8cmgE+AQ4vRv8xfihMZV+8gftRbpCqZLg/X8wFu9g6kxDE1KKJp+Hn
         373Q==
X-Gm-Message-State: AOAM532ISYBOs6pv0QY6lrX1SgRtiswozLq0kEfwnww42aR/ycnvpNHa
	gfZ/vk22rWEfLIAMyIip4ZZPhoNTyMT1dH5VDK9WTnDW
X-Google-Smtp-Source: ABdhPJzjyNt/vCAoJ0I0HN5KQ6EQJkWYJcbPVbgxMr7nr1/F/+7FszMTBYvbVgELxcNvuDtEht8AEnLsM6AwBAxv+mI=
X-Received: by 2002:ab0:2381:: with SMTP id b1mr89047uan.93.1629139244976;
 Mon, 16 Aug 2021 11:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210816182012.26458-1-joe.slater@windriver.com>
In-Reply-To: <20210816182012.26458-1-joe.slater@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 16 Aug 2021 20:40:33 +0200
Message-ID: <CANNYZj9xLN5vDQ5vgHk1S7k8PfX_zM1+ThzfVF+Yw+Y4aQrpMA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] blktrace: change shebangs
To: Joe Slater <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000fc8cf205c9b189d3"

--000000000000fc8cf205c9b189d3
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Aug 2021 at 20:20, Joe Slater <joe.slater@windriver.com> wrote:

> +blktrace can use either python2 or python3, but we really want
> +python3, so modify the shebangs.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com.
>

Please submit upstream first. Signed-off-by is incorrectly written, needs
to be added by git preferably. 'Pending' needs to be capitalized (but
please submit upstream first).

Alex

--000000000000fc8cf205c9b189d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 16 Aug 2021 at 20:20, Joe Slater &lt;<a href=3D"mailto:joe.s=
later@windriver.com">joe.slater@windriver.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">+blktrace can use either pytho=
n2 or python3, but we really want<br>
+python3, so modify the shebangs.<br>
+<br>
+Upstream-Status: pending<br>
+<br>
+Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" =
target=3D"_blank">joe.slater@windriver.com</a>.<br></blockquote><div><br></=
div><div>Please submit upstream first. Signed-off-by is incorrectly written=
, needs to be added by git preferably. &#39;Pending&#39; needs to be capita=
lized (but please submit upstream first).<br></div><div><br></div><div>Alex=
<br></div><div>=C2=A0</div></div></div>

--000000000000fc8cf205c9b189d3--
