Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id D1C9F6E650
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 23:19:31 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id z11so11498617pfk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 16:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zSkxCqMi4pLUFdzHQueNGBcfjIwKWTxQcnx9afgJpSA=;
	b=k4X19uoYRV+j8h480plrH1yAwB5SiLpT5IrnsGoaVWH9YC4CGBc/VUCb+OPm4jWivy
	7NnC8pf3nuE+/MWqEL2zZjoGHDfy7OR3gIbI+xO9KaTHst3aQlL24G/gdMQsl9Bg0IuN
	5av9f9SAIw2l0BNLPVjeF4hcVE2+BR41zWd0T6zw4bHUaY6OVYiYX3qhRdrg6SdrjfrK
	VDwEu0h6xFSCzt0bcnZb12sniF1j4DUMQypWjjZzDs7OjfWAmmK8mQ0XmxUZnFj3pN1P
	rGre+Bnqtl+V9uvptWxgxAjuy3mNbkj04uny5w29YNwu5hHu9hiLXAETPE8nA/U3uq5y
	JKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zSkxCqMi4pLUFdzHQueNGBcfjIwKWTxQcnx9afgJpSA=;
	b=Jmrk7TSpPVz4LQPmpz7d9Jf9w0Rw4gvSIpdSJcPGoCNtUJsQk3+x1mCMrnQWeFEK60
	QxbX+Jky7WrP/i9PGrmS9sEjsduErNAXPMAURr0aXtcw11cqPF8sW9rgcRbeiqATzLlq
	15n+1oHKpyQqTLb2PTZEVT/hcEq//E1act2GGNBNZ+SRImu+o3/hJGHobxavDwVfKklp
	eb42Rp7G6/eK+wnfCyPBDrKhff3/+PfBtwkO9YI1IPiZzPSPlNjYl3a4m9bTOuJn5epz
	g/Js6AEvka5544XRjL/PmKZqA5ud5HAtPXr62J6dEvFbULGcqa5D3g5hKMV0qgpu+ubE
	d+rA==
X-Gm-Message-State: AMCzsaX+N9vai6ntGv3LxD8o0Xg8+MGScX2gDU1y7xYlhxjmvA1MNmzt
	OwHFjB7PRJeCxX8KD72ykT3QiHS3WjkPEVeLqFs=
X-Google-Smtp-Source: AOwi7QCCrltoEqkiRs+eKtUrepJdY5o+3FcWiA8I1cwJK+V56LSWTNSMQcBF6BehRExjNprcVIHfUzy6ymH7kEK+5ck=
X-Received: by 10.84.177.129 with SMTP id x1mr2711778plb.161.1507936773015;
	Fri, 13 Oct 2017 16:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <1507922643-81187-1-git-send-email-juro.bystricky@intel.com>
In-Reply-To: <1507922643-81187-1-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2017 23:19:22 +0000
Message-ID: <CAMKF1sq-CjSGt36V=B5yjg+diaAMFkH8h-N29t4uMuXNV8_qyA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH] nettle-ptest: fix a failing test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2017 23:19:31 -0000
Content-Type: multipart/alternative; boundary="94eb2c11a09ab30f5c055b75e354"

--94eb2c11a09ab30f5c055b75e354
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 13, 2017 at 12:24 PM Juro Bystricky <juro.bystricky@intel.com>
wrote:

> This patch changes the result of the nettle dlopen-test
> from FAIL to PASS. The test used to fail because the test could not
> find and load libnettle.so.
> This patch fixes this by using absolute path instead of relative.
>
> This was the only test out of 88 that used to fail.
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  .../nettle/nettle-3.3/dlopen-test.patch              | 20
> ++++++++++++++++++++
>  meta/recipes-support/nettle/nettle_3.3.bb            |  4 ++++
>  2 files changed, 24 insertions(+)
>  create mode 100644
> meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch
>
> diff --git a/meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch
> b/meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch
> new file mode 100644
> index 0000000..c4f0b7e
> --- /dev/null
> +++ b/meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch
> @@ -0,0 +1,20 @@
> +Replace relative path of libnettle.so with absolute path so the test
> +program can find it.
> +Relative paths are not suitable, as the folder strucure for ptest
> +is different from the one expected by the nettle testsuite.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +
> +--- a/testsuite/dlopen-test.c  2016-10-01 00:28:38.000000000 -0700
> ++++ b/testsuite/dlopen-test.c  2017-10-13 11:08:57.227572860 -0700
> +@@ -9,7 +9,7 @@
> + main (int argc UNUSED, char **argv UNUSED)
> + {
> + #if HAVE_LIBDL
> +-  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
> ++  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);


I think it would be preferred if you could use LD_LIBRARY_PATH to search
for it

>
> +   int (*get_version)(void);
> +   if (!handle)
> +     {
> diff --git a/meta/recipes-support/nettle/nettle_3.3.bb
> b/meta/recipes-support/nettle/nettle_3.3.bb
> index b76babf..3951678 100644
> --- a/meta/recipes-support/nettle/nettle_3.3.bb
> +++ b/meta/recipes-support/nettle/nettle_3.3.bb
> @@ -11,5 +11,9 @@ SRC_URI += "\
>              file://check-header-files-of-openssl-only-if-enable_.patch \
>              "
>
> +SRC_URI_append_class-target = "\
> +            file://dlopen-test.patch \
> +            "
> +
>  SRC_URI[md5sum] = "10f969f78a463704ae73529978148dbe"
>  SRC_URI[sha256sum] =
> "46942627d5d0ca11720fec18d81fc38f7ef837ea4197c1f630e71ce0d470b11e"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c11a09ab30f5c055b75e354
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, Oct 13, 2017 =
at 12:24 PM Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com">=
juro.bystricky@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">This patch changes the result of the nettle dlopen-test<br>
from FAIL to PASS. The test used to fail because the test could not<br>
find and load libnettle.so.<br>
This patch fixes this by using absolute path instead of relative.<br>
<br>
This was the only test out of 88 that used to fail.<br>
<br>
Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.co=
m" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
---<br>
=C2=A0.../nettle/nettle-3.3/dlopen-test.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 20 ++++++++++++++++++++<br>
=C2=A0meta/recipes-support/nettle/<a href=3D"http://nettle_3.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">nettle_3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
=C2=A02 files changed, 24 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/nettle/nettle-3.3/dlopen-test=
.patch<br>
<br>
diff --git a/meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch b/met=
a/recipes-support/nettle/nettle-3.3/dlopen-test.patch<br>
new file mode 100644<br>
index 0000000..c4f0b7e<br>
--- /dev/null<br>
+++ b/meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch<br>
@@ -0,0 +1,20 @@<br>
+Replace relative path of libnettle.so with absolute path so the test<br>
+program can find it.<br>
+Relative paths are not suitable, as the folder strucure for ptest<br>
+is different from the one expected by the nettle testsuite.<br>
+<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.c=
om" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
+<br>
+--- a/testsuite/dlopen-test.c=C2=A0 2016-10-01 00:28:38.000000000 -0700<br=
>
++++ b/testsuite/dlopen-test.c=C2=A0 2017-10-13 11:08:57.227572860 -0700<br=
>
+@@ -9,7 +9,7 @@<br>
+ main (int argc UNUSED, char **argv UNUSED)<br>
+ {<br>
+ #if HAVE_LIBDL<br>
+-=C2=A0 void *handle =3D dlopen (&quot;../libnettle.so&quot;, RTLD_NOW);<b=
r>
++=C2=A0 void *handle =3D dlopen (&quot;/usr/lib/libnettle.so&quot;, RTLD_N=
OW);</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think it w=
ould be preferred if you could use LD_LIBRARY_PATH to search for it</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
+=C2=A0 =C2=A0int (*get_version)(void);<br>
+=C2=A0 =C2=A0if (!handle)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
diff --git a/meta/recipes-support/nettle/<a href=3D"http://nettle_3.3.bb" r=
el=3D"noreferrer" target=3D"_blank">nettle_3.3.bb</a> b/meta/recipes-suppor=
t/nettle/<a href=3D"http://nettle_3.3.bb" rel=3D"noreferrer" target=3D"_bla=
nk">nettle_3.3.bb</a><br>
index b76babf..3951678 100644<br>
--- a/meta/recipes-support/nettle/<a href=3D"http://nettle_3.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">nettle_3.3.bb</a><br>
+++ b/meta/recipes-support/nettle/<a href=3D"http://nettle_3.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">nettle_3.3.bb</a><br>
@@ -11,5 +11,9 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://check-header-files-o=
f-openssl-only-if-enable_.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+SRC_URI_append_class-target =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dlopen-test.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;10f969f78a463704ae73529978148dbe&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;46942627d5d0ca11720fec18d81fc38f7ef837ea=
4197c1f630e71ce0d470b11e&quot;<br>
--<br>
2.7.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c11a09ab30f5c055b75e354--
