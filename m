Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web09.3248.1625088009551580526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jun 2021 14:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zv7IJ/Kv;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id g3so3059167ilq.10
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 14:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/uH8myo1j/NRAPfexaAAlHbhEpoOXRKG1sf7mu0wzIs=;
        b=Zv7IJ/KvUNbMhc+6ckRfpmC126beL5BVEUYlgXUXhNghX8GjMEnRDlQDAM2R/h1NHX
         qZJho90VEVsKCfDqn7MlMVZLbgrc3KEGUjGO/AB+Jw+M3OhNUu3e3EXVMT7bKyGhc0T+
         dFZC7d2x6q1fpbS8dONcvg+bG0FCjEYB1h6dW0vhSfnj6P+NUnyryuRKgovnw6DMVoxD
         1oUhyQtEKp4CsdsrEuei0h0vrmW51lVg3wpjXx3gZ0VpLqzTbfZjFYwhrt8+LKdzjrgJ
         VLE2ftj/0jAiJzn2+SWyUXQh5uHjE9eqDAn0hyVolipMHWxgTxd/+F3ZVOhvm8S5sJMR
         r+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/uH8myo1j/NRAPfexaAAlHbhEpoOXRKG1sf7mu0wzIs=;
        b=QFfrQWyHO0K2Ud7CD2fixbbDUVzJFMK71VZyMPIKkmum288fmxWGMVv4eUqDDrWeQi
         nPYa+UGzSd6yZWfniETv6IwmYM0L/lEgRhhSyLq4etHca0fo9/2BPcN33JGSBMBFLiXa
         qgMk2iTwrx9p/OdasIIykhRJjaUIXKMXKhc8AvpMS81mF8UFOggR7/80dd89V44ler67
         MRSOdk+matVuexZDvw898+DCHFr6uA9tQDnWX5ELu7aqgszsAZvSvJY6xEfVdh/bYsWw
         UfiqsrFAi7AFXtTXx39o5rKClMxC4S9N+RK+cFuhiFcECI17s0fwmLsMeU4s5jluVHKS
         qSHQ==
X-Gm-Message-State: AOAM531rv6PxjcZw6khbn2QEnUv1sglIc19O/V2kXLULJrrhC43ooB+v
	VVptL1VIO8aWfzM+Az2uOhyRJ5C5vB4O7CI1lH4=
X-Google-Smtp-Source: ABdhPJz+jJpZest1isQXqigxs4xH2zXQlvFyarbF1VqezXo2lVyz2aqsqVJD3+t3KB0PRW0Fy84mP+nVwRRPa+TPaqI=
X-Received: by 2002:a05:6e02:1d8e:: with SMTP id h14mr639929ila.47.1625088008936;
 Wed, 30 Jun 2021 14:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210630205233.23046-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20210630205233.23046-1-rasmus.villemoes@prevas.dk>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 30 Jun 2021 23:19:57 +0200
Message-ID: <CANNYZj_BzozcbaQ27aD2WsJ0e_cCmNCzBzzmT=8yvWVXJJyyhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: vdsotest: new recipe
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000080626705c602499e"

--00000000000080626705c602499e
Content-Type: text/plain; charset="UTF-8"

Should this be in meta-oe rather than oe-core?

Alex

On Wed, 30 Jun 2021 at 22:52, Rasmus Villemoes via lists.openembedded.org
<rasmus.villemoes=prevas.dk@lists.openembedded.org> wrote:

> vdsotest is a handy tool for testing and benchmarking the vDSO,
> e.g. to measure the overhead of clock_gettime() done via the vDSO
> compared to an actual system call.
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
> Resending because the list rejected the first attempt, sent from a
> wrong email address. Apologies to anyone receiving this again.
>
>  meta/recipes-kernel/vdsotest/vdsotest_0.3.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta/recipes-kernel/vdsotest/vdsotest_0.3.bb
>
> diff --git a/meta/recipes-kernel/vdsotest/vdsotest_0.3.bb
> b/meta/recipes-kernel/vdsotest/vdsotest_0.3.bb
> new file mode 100644
> index 0000000000..5f94909102
> --- /dev/null
> +++ b/meta/recipes-kernel/vdsotest/vdsotest_0.3.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "vdsotest is a utility for testing and benchmarking a Linux
> VDSO"
> +HOMEPAGE = "https://github.com/nlynch-mentor/vdsotest"
> +LICENSE = "GPL-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://github.com/nlynch-mentor/vdsotest.git"
> +SRCREV = "4ad733fb25364e4afaf4060e57c2429a93b686c5"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> --
> 2.31.1
>
>
> 
>
>

--00000000000080626705c602499e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Should this be in meta-oe rather than oe-core?</div><=
div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, 30 Jun 2021 at 22:52, Rasmus Ville=
moes via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;rasmus.villemoes=3D<a href=3D"mailto:prevas.dk@lists.openembedded.or=
g">prevas.dk@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">vdsotest is a handy tool for testing and=
 benchmarking the vDSO,<br>
e.g. to measure the overhead of clock_gettime() done via the vDSO<br>
compared to an actual system call.<br>
<br>
Signed-off-by: Rasmus Villemoes &lt;<a href=3D"mailto:rasmus.villemoes@pre=
vas.dk" target=3D"_blank">rasmus.villemoes@prevas.dk</a>&gt;<br>
---<br>
Resending because the list rejected the first attempt, sent from a<br>
wrong email address. Apologies to anyone receiving this again.<br>
<br>
=C2=A0meta/recipes-kernel/vdsotest/<a href=3D"http://vdsotest_0.3.bb" rel=
=3D"noreferrer" target=3D"_blank">vdsotest_0.3.bb</a> | 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/vdsotest/<a href=3D"http://vd=
sotest_0.3.bb" rel=3D"noreferrer" target=3D"_blank">vdsotest_0.3.bb</a><br>
<br>
diff --git a/meta/recipes-kernel/vdsotest/<a href=3D"http://vdsotest_0.3.b=
b" rel=3D"noreferrer" target=3D"_blank">vdsotest_0.3.bb</a> b/meta/recipes-=
kernel/vdsotest/<a href=3D"http://vdsotest_0.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">vdsotest_0.3.bb</a><br>
new file mode 100644<br>
index 0000000000..5f94909102<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/vdsotest/<a href=3D"http://vdsotest_0.3.bb" rel=
=3D"noreferrer" target=3D"_blank">vdsotest_0.3.bb</a><br>
@@ -0,0 +1,11 @@<br>
+SUMMARY =3D &quot;vdsotest is a utility for testing and benchmarking a Li=
nux VDSO&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/nlynch-mentor/vdsotest" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/nlynch-mentor/vdsot=
est</a>&quot;<br>
+LICENSE =3D &quot;GPL-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/nlynch-mentor/vdsote=
st.git" rel=3D"noreferrer" target=3D"_blank">github.com/nlynch-mentor/vdsot=
est.git</a>&quot;<br>
+SRCREV =3D &quot;4ad733fb25364e4afaf4060e57c2429a93b686c5&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000080626705c602499e--
