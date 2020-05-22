Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web12.7667.1590123446813043103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 21:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t+bD1YMm;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id l20so9480840ilj.10
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 21:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cr1t12ig/k+n2IMk8hPbyTKAwUhN9Yz1tjk+4qL3MqA=;
        b=t+bD1YMmuBOM+uT73g1KYSFYFPICZca6BN1u6fqQVcy13bWZl/N72tlNuaR3st/Oon
         4CYXuZ2Q0ABLiDLgULoDkLMth2MyXz2aZaTETifDYqvweUlGBJHKDlPx8M54md4WK6ka
         mBrJBCUowN/71Tr2vIKfHzDbzLV1CX5PKL6r0c6NZ0Ist2x3VbXDuhO2O+A9vtRbT8eT
         wrdlPjDWfkz5FDGDh3SJR7FVvoe5lRnNgQTl3xRoIAmZ5Obcc/E+3LUDUyuxxzFNaVQA
         ikfqbyaxAyyDFD8e9X2Y/vtXSzuAuEjcjy5lHkznl7u5H3PcN/x3ud03B009nHt6B2ca
         UB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cr1t12ig/k+n2IMk8hPbyTKAwUhN9Yz1tjk+4qL3MqA=;
        b=Rp8LqVKaaVS1bFsaiEDXUBXcVFYm5XHHhaiUM5rL/DrnB61wSc+Rxi3pUUld/dYf6j
         ITaKQua0iOf5xahbjTgAEeOkmyRwhdb2v8ncLMho/9rqcTYZ/oIpQMJ/FDYBBW0hGq+s
         zQd41VePvgweDF0NCvu5fzeseFHOJ0Whf206yUMyDY/qF0F3RUiBNu5YFKQR+pblRE0o
         aeXkly+SVQ5Zj3vyn7JYcTtSYQ28weemRaTeBapw10xbfdNN5gWxah5Y07BUs0iQ/Ebr
         8hw1TtCvqHEUxjZ3ZlYqpxIujUh+uFLcdiCr/hY5n+3fVjX0LMZ6LAWBnyeUdodMgEa9
         W9+Q==
X-Gm-Message-State: AOAM532bVEqNAha4DPPk5zvXFOQe726F9597jv0QuSfa05RFN65aZMcP
	qdxfllE5y8FnaApBsI5MSnzo1LHNMltGnGd9hoc=
X-Google-Smtp-Source: ABdhPJzpnNHco7WijaFsxej8jbWQytpojCvZFThjOjlCgzBPv+uA/X1CaJiEWJzXRMPK74nC7w6zSRiNMET2YsjgVfU=
X-Received: by 2002:a92:485c:: with SMTP id v89mr11143928ila.122.1590123445913;
 Thu, 21 May 2020 21:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200522045132.2185666-1-anuj.mittal@intel.com>
In-Reply-To: <20200522045132.2185666-1-anuj.mittal@intel.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Thu, 21 May 2020 21:57:15 -0700
Message-ID: <CANx9H-BLekaXs1Rk19dwLNrP=3Lf7A8vO=yy677jT7-y4iZtDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace: fix failing ptests
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000248b6105a6357733"

--000000000000248b6105a6357733
Content-Type: text/plain; charset="UTF-8"

Is this for Zeus?

On Thu, May 21, 2020 at 9:51 PM Anuj Mittal <anuj.mittal@intel.com> wrote:

> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> 1. They need to be run under regular user.
> 2. Some tests genuinely need more time than 30 seconds
> 3. The Makefile patch erroneously introduced a test-breaking change.
>
> (From OE-Core rev: 3d6bf58c7080c1cacf3ed1f270ff5acf4858c790)
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit a5e90281ac211e912ec6bfd6873e56152ec8bd4e)
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/recipes-devtools/strace/strace/Makefile-ptest.patch | 2 +-
>  meta/recipes-devtools/strace/strace/run-ptest            | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> index 08fa5c53b8..36e93a2dcf 100644
> --- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> +++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> @@ -44,6 +44,6 @@ index 825c989..4623c48 100644
>  +      done
>  +      for file in $(EXTRA_DIST); do \
>  +              install $(srcdir)/$$file $(DESTDIR)/$(TESTDIR); \
> -+              sed -i -e 's/$${srcdir=.}/./g'
> $(DESTDIR)/$(TESTDIR)/$$file; \
> ++              #sed -i -e 's/$${srcdir=.}/./g'
> $(DESTDIR)/$(TESTDIR)/$$file; \
>  +      done
>  +      for i in net scm_rights-fd rt_sigaction; do sed -i -e
> 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
> diff --git a/meta/recipes-devtools/strace/strace/run-ptest
> b/meta/recipes-devtools/strace/strace/run-ptest
> index 2fed984e90..4660207220 100755
> --- a/meta/recipes-devtools/strace/strace/run-ptest
> +++ b/meta/recipes-devtools/strace/strace/run-ptest
> @@ -1,3 +1,6 @@
>  #!/bin/sh
> -export TIMEOUT_DURATION=30
> -make -B -C tests -k test-suite.log
> +export TIMEOUT_DURATION=120
> +chown nobody tests
> +chown nobody tests/*
> +chown nobody ../ptest
> +su nobody -c "make -B -C tests -k test-suite.log"
> --
> 2.25.4
>
> 
>

--000000000000248b6105a6357733
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Is this for Zeus?</div></div><div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 21, 2020 at =
9:51 PM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mitta=
l@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_b=
lank">alex.kanavin@gmail.com</a>&gt;<br>
<br>
1. They need to be run under regular user.<br>
2. Some tests genuinely need more time than 30 seconds<br>
3. The Makefile patch erroneously introduced a test-breaking change.<br>
<br>
(From OE-Core rev: 3d6bf58c7080c1cacf3ed1f270ff5acf4858c790)<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
(cherry picked from commit a5e90281ac211e912ec6bfd6873e56152ec8bd4e)<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/strace/strace/Makefile-ptest.patch | 2 +-<br>
=C2=A0meta/recipes-devtools/strace/strace/run-ptest=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 7 +++++--<br>
=C2=A02 files changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/me=
ta/recipes-devtools/strace/strace/Makefile-ptest.patch<br>
index 08fa5c53b8..36e93a2dcf 100644<br>
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch<br>
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch<br>
@@ -44,6 +44,6 @@ index 825c989..4623c48 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 for file in $(EXTRA_DIST); do \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $(srcdir)/=
$$file $(DESTDIR)/$(TESTDIR); \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/$${src=
dir=3D.}/./g&#39; $(DESTDIR)/$(TESTDIR)/$$file; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #sed -i -e &#39;s/$${sr=
cdir=3D.}/./g&#39; $(DESTDIR)/$(TESTDIR)/$$file; \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 for i in net scm_rights-fd rt_sigaction; do se=
d -i -e &#39;s/$$srcdir/./g&#39; $(DESTDIR)/$(TESTDIR)/$$i.test; done<br>
diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-=
devtools/strace/strace/run-ptest<br>
index 2fed984e90..4660207220 100755<br>
--- a/meta/recipes-devtools/strace/strace/run-ptest<br>
+++ b/meta/recipes-devtools/strace/strace/run-ptest<br>
@@ -1,3 +1,6 @@<br>
=C2=A0#!/bin/sh<br>
-export TIMEOUT_DURATION=3D30<br>
-make -B -C tests -k test-suite.log<br>
+export TIMEOUT_DURATION=3D120<br>
+chown nobody tests<br>
+chown nobody tests/*<br>
+chown nobody ../ptest<br>
+su nobody -c &quot;make -B -C tests -k test-suite.log&quot;<br>
-- <br>
2.25.4<br>
<br>
<br>
</blockquote></div></div>

--000000000000248b6105a6357733--
