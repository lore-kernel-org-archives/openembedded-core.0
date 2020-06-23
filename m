Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.2256.1592954632412910958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 16:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SdZBK1sz;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id h4so143618ior.5
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 16:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5BxAwxJX14aKqKFO36W8kwNvxp+BkibunViptjkvM+s=;
        b=SdZBK1szy0mPn4ZUHRYLfijOa1oyKyWst8WrlbdehvwFItrnfWKwOkU/s/dK7BPQ9Y
         rpkmWC0gt68ddfxFCZXPWaX5aOl4xz5AHhvJqmmghBZ/Eigwg4bddh50stKT+Hw6+y0n
         LBlhfe3oClo/YvAS84mHGOlVJVMcRBTCBxsnL9+9nXpwsi6dxZ5JP6ol7P6VN0S8QzyZ
         FD7qIW1x+EIRyV+wAQH1PigRvcgStVuoQ8HK7w8hSIVsy9AZxwcGXp9AfO1jmwXouhrd
         AUAs276154ecfYaKc7AMWz8XyMnlNj+dlUZyFip1l3NFuEEbHQ+4/TNr4/s7XyUFoLSt
         5UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5BxAwxJX14aKqKFO36W8kwNvxp+BkibunViptjkvM+s=;
        b=t0dd5c6cKYOo8i4zp/3JzOYM8Rs752cFBnPft/QiwvYm1t7I+YVMOyFGCMYBqbgg5D
         nU+uJlnLWx+Z5cCpWsYfTJhw7FdfogACodiQU8lKaMmE0IvUqtlAOiqj6NJu/+eDcdlr
         QsiT4s/cQoDbWzZOguyGTnFt7ok8bh1kcTIVC5q5itPCc8Y2iKM761TX7a2XfFg5/dVn
         2noi9w1jIe0a55s9eJ1ECKrf8qfBtkSVCpq6+pa3sCMI0ikcv3LdocB5xVuXDNiC9tkx
         B6FCeNBBH96TwG5F4tc8PjMqo5m0VR4bg2EGScww7J4pYofYB6CpRuGzqv32i1GrePVm
         YDLg==
X-Gm-Message-State: AOAM530r3xS6d51MmqNPmdGyjS1XudWT0CC4xFtCuugeppdYg0vHgURr
	5846ZMnKYr2eYG5hCNENwb4U0c1Sr/C2PceX8EQ=
X-Google-Smtp-Source: ABdhPJxo9NQnelgD6S2V25aWjtw3JQahHtVs2HCnvG/0bA6rlnxEHdSchL03N5WMnw35qg7rx+ksplK1HntPPazTTUo=
X-Received: by 2002:a6b:740b:: with SMTP id s11mr28349107iog.10.1592954631664;
 Tue, 23 Jun 2020 16:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200623232051.6294-1-trevor.gamblin@windriver.com> <20200623232051.6294-2-trevor.gamblin@windriver.com>
In-Reply-To: <20200623232051.6294-2-trevor.gamblin@windriver.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Tue, 23 Jun 2020 16:23:40 -0700
Message-ID: <CANx9H-DLRxzzKePeQCNgH8zJSu0Dn4ofVra55ngc+XZhan-rqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3-setuptools: patch entrypoints for faster initialization
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f6b8c905a8c8a6aa"

--000000000000f6b8c905a8c8a6aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 4:20 PM Trevor Gamblin <trevor.gamblin@windriver.co=
m>
wrote:

> v2 adds the missing Upstream-Status notice in the patch file.
>

This belongs below the triple-dash line, as it doesn=E2=80=99t make sense =
in
permanent git history out of context


> setuptools' pkg_resources module has major performance issues with how
> it loads entry points (e.g. the console_script entry point, which sets
> up a module as a command-line executable), leading even the simplest
> "hello world" scripts to take on the order of 150ms to run if
> pkg_resources is incorporated. This is prohibitive for code that needs
> to run quickly, and so we patch setuptools to reduce this time. As of
> Python 3.7, importlib.resources is available and intended to replace
> much of the functionality that causes this sluggishness, but since
> many projects still utilize the legacy setuptools modules, a patch is
> still required. Note that python3-fastentrypoints (which is available
> in the meta-virtualization layer) is also intended to help alleviate
> the problem, but since it must be added to existing projects it has
> the same disadvantage as resorting to importlib.resources, requiring
> manual additions to existing code to see the performance gains.
>
> The intent here is to patch easy_install to load module entry points
> directly with the installed setuptools, rather than importing
> pkg_resources and having it search out the entry points itself. This
> leads to a drastic performance improvement - the changes in this patch
> have been shown to result in load time ~6-8x lower, depending on the
> complexity of the code it is tested with. A simple "hello world"
> example on core-image-full-cmdline gave these results with and without
> the patch:
>
> core-image-full-cmdline, without setuptools ScriptWriter patch:
>
> root@qemux86-64:~# time /usr/bin/minimal
> hello world
>
> real    0m0.198s
> user    0m0.174s
> sys     0m0.023s
>
> core-image-full-cmdline, with setuptools ScriptWriter patch:
>
> root@qemux86-64:~# time /usr/bin/minimal
> hello world
>
> real    0m0.034s
> user    0m0.024s
> sys     0m0.010s
>
> More details on the pkg_resources issue are available at:
> https://github.com/pypa/setuptools/issues/510
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---


Put v2 changes here. It allows for review, but keeps it out of permanent
git history

>
>  .../python/python-setuptools.inc              |  4 +-
>  ...nt-usr-bin-wrappers-signoff-included.patch | 62 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create=
-more-efficient-usr-bin-wrappers-signoff-included.patch
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> b/meta/recipes-devtools/python/python-setuptools.inc
> index 9322ca9a05..3222de7079 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -10,7 +10,9 @@ inherit pypi
>
>  SRC_URI_append_class-native =3D "
> file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
>
> -SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
> +SRC_URI +=3D "file://0001-change-shebang-to-python3.patch \
> +
> file://0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-=
included.patch
> \
> +            "
>
>  SRC_URI[md5sum] =3D "6e9de90b242fdd60ef59f497424ce13a"
>  SRC_URI[sha256sum] =3D
> "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74"
> diff --git
> a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-crea=
te-more-efficient-usr-bin-wrappers-signoff-included.patch
> b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-crea=
te-more-efficient-usr-bin-wrappers-signoff-included.patch
> new file mode 100644
> index 0000000000..7e931c845c
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-crea=
te-more-efficient-usr-bin-wrappers-signoff-included.patch
> @@ -0,0 +1,62 @@
> +From aae8cd3de3f289cea3db01212579913c925191e8 Mon Sep 17 00:00:00 2001
> +From: Lauri Tirkkonen <lauri.tirkkonen.ext@nokia.com>
> +Date: Thu, 26 Mar 2020 14:24:25 +0000
> +Subject: [PATCH] ScriptWriter: create more efficient /usr/bin wrappers
> +
> +Upstream setuptools writes scripts to /usr/bin that do insanely much
> +stuff at runtime. https://github.com/pypa/setuptools/issues/510
> +
> +Since the script entry points are already known at build time, we can
> +just write those directly into the /usr/bin wrapper, avoiding the
> +expensive 'pkg_resources' import at runtime. The idea is from
> +https://github.com/ninjaaron/fast-entry_points but patched directly int=
o
> +the native build of setuptools here, so that all Python modules under
> +bitbake automatically use it without needing additional build time
> +dependencies.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Lauri Tirkkonen <lauri.tirkkonen.ext@nokia.com>
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +---
> + setuptools/command/easy_install.py | 14 ++++++--------
> + 1 file changed, 6 insertions(+), 8 deletions(-)
> +
> +diff --git a/setuptools/command/easy_install.py
> b/setuptools/command/easy_install.py
> +index 8fba7b41..03a72714 100755
> +--- a/setuptools/command/easy_install.py
> ++++ b/setuptools/command/easy_install.py
> +@@ -2023,17 +2023,12 @@ class ScriptWriter(object):
> +     """
> +
> +     template =3D textwrap.dedent(r"""
> +-        # EASY-INSTALL-ENTRY-SCRIPT: %(spec)r,%(group)r,%(name)r
> +-        __requires__ =3D %(spec)r
> +-        import re
> +         import sys
> +-        from pkg_resources import load_entry_point
> ++
> ++        from %(module)s import %(ep0)s
> +
> +         if __name__ =3D=3D '__main__':
> +-            sys.argv[0] =3D re.sub(r'(-script\.pyw?|\.exe)?$', '',
> sys.argv[0])
> +-            sys.exit(
> +-                load_entry_point(%(spec)r, %(group)r, %(name)r)()
> +-            )
> ++            sys.exit(%(entrypoint)s())
> +     """).lstrip()
> +
> +     command_spec_class =3D CommandSpec
> +@@ -2068,6 +2063,9 @@ class ScriptWriter(object):
> +         for type_ in 'console', 'gui':
> +             group =3D type_ + '_scripts'
> +             for name, ep in dist.get_entry_map(group).items():
> ++                module =3D ep.module_name
> ++                ep0 =3D ep.attrs[0]
> ++                entrypoint =3D '.'.join(ep.attrs)
> +                 cls._ensure_safe_name(name)
> +                 script_text =3D cls.template % locals()
> +                 args =3D cls._get_script_args(type_, name, header,
> script_text)
> +--
> +2.24.1
> +
> --
> 2.26.2
>
>=20
>

--000000000000f6b8c905a8c8a6aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 23, 2020 at 4:20 PM Trevor Gamblin &lt;<a href=
=
=3D"mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">v2 adds the missing Upst=
ream-Status notice in the patch file.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This belongs be=
low the triple-dash line, as it doesn=E2=80=99t make sense in permanent git=
 history out of context</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
setuptools&#39; pkg_resources module has major performance issues with how=
<br>
it loads entry points (e.g. the console_script entry point, which sets<br>
up a module as a command-line executable), leading even the simplest<br>
&quot;hello world&quot; scripts to take on the order of 150ms to run if<br=
>
pkg_resources is incorporated. This is prohibitive for code that needs<br>
to run quickly, and so we patch setuptools to reduce this time. As of<br>
Python 3.7, importlib.resources is available and intended to replace<br>
much of the functionality that causes this sluggishness, but since<br>
many projects still utilize the legacy setuptools modules, a patch is<br>
still required. Note that python3-fastentrypoints (which is available<br>
in the meta-virtualization layer) is also intended to help alleviate<br>
the problem, but since it must be added to existing projects it has<br>
the same disadvantage as resorting to importlib.resources, requiring<br>
manual additions to existing code to see the performance gains.<br>
<br>
The intent here is to patch easy_install to load module entry points<br>
directly with the installed setuptools, rather than importing<br>
pkg_resources and having it search out the entry points itself. This<br>
leads to a drastic performance improvement - the changes in this patch<br>
have been shown to result in load time ~6-8x lower, depending on the<br>
complexity of the code it is tested with. A simple &quot;hello world&quot;=
<br>
example on core-image-full-cmdline gave these results with and without<br>
the patch:<br>
<br>
core-image-full-cmdline, without setuptools ScriptWriter patch:<br>
<br>
root@qemux86-64:~# time /usr/bin/minimal<br>
hello world<br>
<br>
real=C2=A0 =C2=A0 0m0.198s<br>
user=C2=A0 =C2=A0 0m0.174s<br>
sys=C2=A0 =C2=A0 =C2=A00m0.023s<br>
<br>
core-image-full-cmdline, with setuptools ScriptWriter patch:<br>
<br>
root@qemux86-64:~# time /usr/bin/minimal<br>
hello world<br>
<br>
real=C2=A0 =C2=A0 0m0.034s<br>
user=C2=A0 =C2=A0 0m0.024s<br>
sys=C2=A0 =C2=A0 =C2=A00m0.010s<br>
<br>
More details on the pkg_resources issue are available at:<br>
<a href=3D"https://github.com/pypa/setuptools/issues/510" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/pypa/setuptools/issues/510</a><br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriv=
er.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
---</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Put v2 chang=
es here. It allows for review, but keeps it out of permanent git history=C2=
=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0.../python/python-setuptools.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A0...nt-usr-bin-wrappers-signoff-included.patch | 62 +++++++++++++++++=
++<br>
=C2=A02 files changed, 65 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-setuptools/0=
001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.pa=
tch<br>
<br>
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/rec=
ipes-devtools/python/python-setuptools.inc<br>
index 9322ca9a05..3222de7079 100644<br>
--- a/meta/recipes-devtools/python/python-setuptools.inc<br>
+++ b/meta/recipes-devtools/python/python-setuptools.inc<br>
@@ -10,7 +10,9 @@ inherit pypi<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot; file://0001-conditionally-do-=
not-fetch-code-by-easy_install.patch&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-change-shebang-to-python3.patch&quot;<br>
+SRC_URI +=3D &quot;file://0001-change-shebang-to-python3.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ScriptWriter-create=
-more-efficient-usr-bin-wrappers-signoff-included.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;6e9de90b242fdd60ef59f497424ce13a&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f=
758b7cd674af09a92736aff74&quot;<br>
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWr=
iter-create-more-efficient-usr-bin-wrappers-signoff-included.patch b/meta/r=
ecipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-eff=
icient-usr-bin-wrappers-signoff-included.patch<br>
new file mode 100644<br>
index 0000000000..7e931c845c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-cr=
eate-more-efficient-usr-bin-wrappers-signoff-included.patch<br>
@@ -0,0 +1,62 @@<br>
+From aae8cd3de3f289cea3db01212579913c925191e8 Mon Sep 17 00:00:00 2001<br=
>
+From: Lauri Tirkkonen &lt;<a href=3D"mailto:lauri.tirkkonen.ext@nokia.com=
" target=3D"_blank">lauri.tirkkonen.ext@nokia.com</a>&gt;<br>
+Date: Thu, 26 Mar 2020 14:24:25 +0000<br>
+Subject: [PATCH] ScriptWriter: create more efficient /usr/bin wrappers<br=
>
+<br>
+Upstream setuptools writes scripts to /usr/bin that do insanely much<br>
+stuff at runtime. <a href=3D"https://github.com/pypa/setuptools/issues/51=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/pypa/setuptools/=
issues/510</a><br>
+<br>
+Since the script entry points are already known at build time, we can<br>
+just write those directly into the /usr/bin wrapper, avoiding the<br>
+expensive &#39;pkg_resources&#39; import at runtime. The idea is from<br>
+<a href=3D"https://github.com/ninjaaron/fast-entry_points" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/ninjaaron/fast-entry_points</a> b=
ut patched directly into<br>
+the native build of setuptools here, so that all Python modules under<br>
+bitbake automatically use it without needing additional build time<br>
+dependencies.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Lauri Tirkkonen &lt;<a href=3D"mailto:lauri.tirkkonen.ext@=
nokia.com" target=3D"_blank">lauri.tirkkonen.ext@nokia.com</a>&gt;<br>
+Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windri=
ver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
+---<br>
+ setuptools/command/easy_install.py | 14 ++++++--------<br>
+ 1 file changed, 6 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy=
_install.py<br>
+index 8fba7b41..03a72714 100755<br>
+--- a/setuptools/command/easy_install.py<br>
++++ b/setuptools/command/easy_install.py<br>
+@@ -2023,17 +2023,12 @@ class ScriptWriter(object):<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0template =3D textwrap.dedent(r&quot;&quot;&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # EASY-INSTALL-ENTRY-SCRIPT: %(spec)r,%(grou=
p)r,%(name)r<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __requires__ =3D %(spec)r<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import sys<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 from pkg_resources import load_entry_point<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 from %(module)s import %(ep0)s<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if __name__ =3D=3D &#39;__main__&#39;:<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.argv[0] =3D re.sub(r&#39;(=
-script\.pyw?|\.exe)?$&#39;, &#39;&#39;, sys.argv[0])<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 load_entry_point=
(%(spec)r, %(group)r, %(name)r)()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(%(entrypoint)s())<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;).lstrip()<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0command_spec_class =3D CommandSpec<br>
+@@ -2068,6 +2063,9 @@ class ScriptWriter(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type_ in &#39;console&#39;, &#39;gu=
i&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0group =3D type_ + &#39;_s=
cripts&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for name, ep in dist.get_=
entry_map(group).items():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module =3D ep.mo=
dule_name<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ep0 =3D ep.attrs=
[0]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entrypoint =3D &=
#39;.&#39;.join(ep.attrs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cls._ensure=
_safe_name(name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0script_text=
 =3D cls.template % locals()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args =3D cl=
s._get_script_args(type_, name, header, script_text)<br>
+-- <br>
+2.24.1<br>
+<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000f6b8c905a8c8a6aa--
