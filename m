Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 123C27E8CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 19:20:56 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a14so23269750edv.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 12:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sq7eIZRsrlv2Pu88EH4rMDWTQdS5QadXekSIBNVLgmc=;
	b=NMgjCEPpcb+UUTa3jKjyILkVD/cdem4yt/5xfRbfIukEdLjpoTcT9MstF7lhCWU+X8
	IxuGo+pxuFjEsd6LeH9rcOYhfOoFnz12yQ6drbGwfsLz6INyYLxZc77/yCjMVoa5NvzG
	R2esFM1CSVvS69BkpCOmguqdQJWJGpVaLzUXjNkE5pzXuaChB6hmW/KCJNJhGPiU3duV
	NSxJYzqZkPj/ee2ygRSA+1CFjr5skjf7T/Re4mhcNcYav59PF1QM3v4KwGLV4eS604Xx
	9NUllQeZ/FH6WTN3yl9kFeK+L70KxQ22FsPb638KZC+8gq5Rvt1RmNWbub8EnFnpzTK3
	63zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sq7eIZRsrlv2Pu88EH4rMDWTQdS5QadXekSIBNVLgmc=;
	b=f3Si3zmN7WiwQAjnkio2BmyZp2LMLfOW6X6/RX2vCy1FxiEUARxC2Xvr9lBsfJ9hfQ
	4GAfeTXizwxmskaNAEmU7PAnt+cO1oqHoBSOWtCHb3O9QEybN6ism/6b2ylf/XFhF9/s
	2DCC8Iv6XpJc6+UfEF1uRkK0Jk8SygvI7t+i1PGMv5WMhCYmruj5Binn0Nd+OFuJS2h8
	1aY5zY7RUy2g5pdMr0SKiFpBwPuWA5SmVjdbN2aE/+0hSRwJfQPOFJRk7cIFcEo+U46+
	WzTmmd3GK3rCXxaqM3nxT1tvgzi39XAeV9X+9vkv+/5SyFS6jVoJv4t1dVbOn//iQzjX
	W1xg==
X-Gm-Message-State: APjAAAVq8KjS/uHTVxFT0XN4wieFnMKyu2fVF4U/dE1qBG+uLfY0zsz9
	w5JaSz8StF+EknmW1QD6TEqUxLVyECHWHaH9PxI=
X-Google-Smtp-Source: APXvYqw7v2FhGoOkYwelP/gbjbMV/0/IM9dAcQqjQeb1MTMrESSyOAMq5GyHR7uT3U1iLSJdPpljt09mdK7KEKRkbxQ=
X-Received: by 2002:a50:95d3:: with SMTP id x19mr82737728eda.98.1560885657830; 
	Tue, 18 Jun 2019 12:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQdcXs=oCRTQ-jycu6WTVWxmQOUVMdnJ9ihFLCMGvCHiUw@mail.gmail.com>
	<20190618190928.14232-1-Martin.Jansa@gmail.com>
	<CAMKF1sp8ihQ+=9a24TvcHgh395QoBpdL5Q2PG8-LzKkf9MK3sw@mail.gmail.com>
In-Reply-To: <CAMKF1sp8ihQ+=9a24TvcHgh395QoBpdL5Q2PG8-LzKkf9MK3sw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Jun 2019 21:20:53 +0200
Message-ID: <CA+chaQdOBZsnue25Z52KZit+9bn9gELKv_A8SzJ6zwD7g99jmQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] serf: stop scons trying to create directories in hosts rootfs
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
X-List-Received-Date: Tue, 18 Jun 2019 19:20:57 -0000
Content-Type: multipart/alternative; boundary="0000000000002b8a3b058b9e0354"

--0000000000002b8a3b058b9e0354
Content-Type: text/plain; charset="UTF-8"

oe-core likes to mix them :)

On Tue, Jun 18, 2019 at 9:14 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jun 18, 2019 at 12:09 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > * since 1522f09a4d serf: cleanup recipe
> >   serf.do_install fails in builds with multilib enabled (with
> >   libdir=/usr/lib64 on host where /usr/lib64 doesn't exist)
> >
> > DEBUG: Executing shell function do_install
> > scons: Reading SConscript files ...
> > PermissionError: [Errno 13] Permission denied: '/usr/lib64':
> >   File
> "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct",
> line 158:
> >     ENV = os.environ,
> >   File
> "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Environment.py",
> line 965:
> >     variables.Update(self)
> >   File
> "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/__init__.py",
> line 227:
> >     option.validator(option.key, env.subst('${%s}'%option.key), env)
> >   File
> "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct",
> line 60:
> >     return PathVariable.PathIsDirCreate(key, val, env)
> >   File
> "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/PathVariable.py",
> line 101:
> >     os.makedirs(val)
> >   File
> "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/lib/python3.7/os.py",
> line 221:
> >     mkdir(name, mode)
> > ERROR: scons install execution failed.
> >
> > * I don't know how exactly --install-sandbox is supposed to work but
> >   in this case it's trying to mkdir /usr/lib64 on the host rootfs
> >   which is clearly wrong and if I set LIBDIR together with
> >   --install-sandbox then the install paths are prefixed with $D twice
> >   in some cases (not for includedir and empty libdir at the end).
> >   So in the end I think it was an issue caused by the custom path
> >   validator in serf's SConstruct, removing that stops touching host
> >   and the installed paths (including the paths inside libserf*.pc)
> >   look correct
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  ...ories.without.sandbox-install.prefix.patch | 34 +++++++++++++++++++
> >  meta/recipes-support/serf/serf_1.3.9.bb       |  1 +
> >  2 files changed, 35 insertions(+)
> >  create mode 100644
> meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> >
> > diff --git
> a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> > new file mode 100644
> > index 0000000000..bfb2f5a2aa
> > --- /dev/null
> > +++
> b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> > @@ -0,0 +1,34 @@
> > +--- ../1.3.9-r0-bad-double/serf-1.3.9/SConstruct       2019-06-18
> 15:49:19.968961108 +0000
> > ++++ serf-1.3.9/SConstruct      2019-06-18 18:53:21.412337151 +0000
> > +@@ -51,17 +51,6 @@
> > +     """
> > +     return (key, '%s' % (help), default, None, lambda val:
> _converter(val))
> > +
> > +-# Custom path validator, creates directory when a specified option is
> set.
> > +-# To be used to ensure a PREFIX directory is only created when
> installing.
> > +-def createPathIsDirCreateWithTarget(target):
> > +-  def my_validator(key, val, env):
> > +-    build_targets = (map(str, BUILD_TARGETS))
> > +-    if target in build_targets:
> > +-      return PathVariable.PathIsDirCreate(key, val, env)
> > +-    else:
> > +-      return PathVariable.PathAccept(key, val, env)
> > +-  return my_validator
> > +-
> > + # default directories
> > + if sys.platform == 'win32':
> > +   default_incdir='..'
> > +@@ -77,11 +66,11 @@
> > +   PathVariable('PREFIX',
> > +                'Directory to install under',
> > +                default_prefix,
> > +-               createPathIsDirCreateWithTarget('install')),
> > ++               PathVariable.PathAccept),
> > +   PathVariable('LIBDIR',
> > +                'Directory to install architecture dependent libraries
> under',
> > +                default_libdir,
> > +-               createPathIsDirCreateWithTarget('install')),
> > ++               PathVariable.PathAccept),
> > +   PathVariable('APR',
> > +                "Path to apr-1-config, or to APR's install area",
> > +                default_incdir,
> > diff --git a/meta/recipes-support/serf/serf_1.3.9.bb
> b/meta/recipes-support/serf/serf_1.3.9.bb
> > index 92cd5ca061..25ccd79e00 100644
> > --- a/meta/recipes-support/serf/serf_1.3.9.bb
> > +++ b/meta/recipes-support/serf/serf_1.3.9.bb
> > @@ -6,6 +6,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
> >
>  file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patch \
> >             file://0003-gen_def.patch \
> >
>  file://0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch \
> > +
> file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> \
>
> tabs or spaces mismatch I guess ?
>
> >             "
> >
> >  SRC_URI[md5sum] = "370a6340ff20366ab088012cd13f2b57"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002b8a3b058b9e0354
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">oe-core likes to mix them :)</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 18, 2019 at 9:14 P=
M Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
ue, Jun 18, 2019 at 12:09 PM Martin Jansa &lt;<a href=3D"mailto:martin.jans=
a@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * since 1522f09a4d serf: cleanup recipe<br>
&gt;=C2=A0 =C2=A0serf.do_install fails in builds with multilib enabled (wit=
h<br>
&gt;=C2=A0 =C2=A0libdir=3D/usr/lib64 on host where /usr/lib64 doesn&#39;t e=
xist)<br>
&gt;<br>
&gt; DEBUG: Executing shell function do_install<br>
&gt; scons: Reading SConscript files ...<br>
&gt; PermissionError: [Errno 13] Permission denied: &#39;/usr/lib64&#39;:<b=
r>
&gt;=C2=A0 =C2=A0File &quot;TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.=
3.9-r0/serf-1.3.9/SConstruct&quot;, line 158:<br>
&gt;=C2=A0 =C2=A0 =C2=A0ENV =3D os.environ,<br>
&gt;=C2=A0 =C2=A0File &quot;/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1=
.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages=
/SCons/Environment.py&quot;, line 965:<br>
&gt;=C2=A0 =C2=A0 =C2=A0variables.Update(self)<br>
&gt;=C2=A0 =C2=A0File &quot;/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1=
.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages=
/SCons/Variables/__init__.py&quot;, line 227:<br>
&gt;=C2=A0 =C2=A0 =C2=A0option.validator(option.key, env.subst(&#39;${%s}&#=
39;%option.key), env)<br>
&gt;=C2=A0 =C2=A0File &quot;TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.=
3.9-r0/serf-1.3.9/SConstruct&quot;, line 60:<br>
&gt;=C2=A0 =C2=A0 =C2=A0return PathVariable.PathIsDirCreate(key, val, env)<=
br>
&gt;=C2=A0 =C2=A0File &quot;/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1=
.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages=
/SCons/Variables/PathVariable.py&quot;, line 101:<br>
&gt;=C2=A0 =C2=A0 =C2=A0os.makedirs(val)<br>
&gt;=C2=A0 =C2=A0File &quot;TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.=
3.9-r0/recipe-sysroot-native/usr/lib/python3.7/os.py&quot;, line 221:<br>
&gt;=C2=A0 =C2=A0 =C2=A0mkdir(name, mode)<br>
&gt; ERROR: scons install execution failed.<br>
&gt;<br>
&gt; * I don&#39;t know how exactly --install-sandbox is supposed to work b=
ut<br>
&gt;=C2=A0 =C2=A0in this case it&#39;s trying to mkdir /usr/lib64 on the ho=
st rootfs<br>
&gt;=C2=A0 =C2=A0which is clearly wrong and if I set LIBDIR together with<b=
r>
&gt;=C2=A0 =C2=A0--install-sandbox then the install paths are prefixed with=
 $D twice<br>
&gt;=C2=A0 =C2=A0in some cases (not for includedir and empty libdir at the =
end).<br>
&gt;=C2=A0 =C2=A0So in the end I think it was an issue caused by the custom=
 path<br>
&gt;=C2=A0 =C2=A0validator in serf&#39;s SConstruct, removing that stops to=
uching host<br>
&gt;=C2=A0 =C2=A0and the installed paths (including the paths inside libser=
f*.pc)<br>
&gt;=C2=A0 =C2=A0look correct<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ories.without.sandbox-install.prefix.patch | 34 +++++++++++++=
++++++<br>
&gt;=C2=A0 meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb" rel=
=3D"noreferrer" target=3D"_blank">serf_1.3.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 35 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/serf/serf/SConstruct.sto=
p.creating.directories.without.sandbox-install.prefix.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.d=
irectories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf=
/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.p=
atch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..bfb2f5a2aa<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.director=
ies.without.sandbox-install.prefix.patch<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +--- ../1.3.9-r0-bad-double/serf-1.3.9/SConstruct=C2=A0 =C2=A0 =C2=A0 =
=C2=A02019-06-18 15:49:19.968961108 +0000<br>
&gt; ++++ serf-1.3.9/SConstruct=C2=A0 =C2=A0 =C2=A0 2019-06-18 18:53:21.412=
337151 +0000<br>
&gt; +@@ -51,17 +51,6 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return (key, &#39;%s&#39; % (help), default, None=
, lambda val: _converter(val))<br>
&gt; +<br>
&gt; +-# Custom path validator, creates directory when a specified option i=
s set.<br>
&gt; +-# To be used to ensure a PREFIX directory is only created when insta=
lling.<br>
&gt; +-def createPathIsDirCreateWithTarget(target):<br>
&gt; +-=C2=A0 def my_validator(key, val, env):<br>
&gt; +-=C2=A0 =C2=A0 build_targets =3D (map(str, BUILD_TARGETS))<br>
&gt; +-=C2=A0 =C2=A0 if target in build_targets:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return PathVariable.PathIsDirCreate(key, val, e=
nv)<br>
&gt; +-=C2=A0 =C2=A0 else:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return PathVariable.PathAccept(key, val, env)<b=
r>
&gt; +-=C2=A0 return my_validator<br>
&gt; +-<br>
&gt; + # default directories<br>
&gt; + if sys.platform =3D=3D &#39;win32&#39;:<br>
&gt; +=C2=A0 =C2=A0default_incdir=3D&#39;..&#39;<br>
&gt; +@@ -77,11 +66,11 @@<br>
&gt; +=C2=A0 =C2=A0PathVariable(&#39;PREFIX&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Director=
y to install under&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_prefi=
x,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0createPathIsD=
irCreateWithTarget(&#39;install&#39;)),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PathVariable.=
PathAccept),<br>
&gt; +=C2=A0 =C2=A0PathVariable(&#39;LIBDIR&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Director=
y to install architecture dependent libraries under&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_libdi=
r,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0createPathIsD=
irCreateWithTarget(&#39;install&#39;)),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PathVariable.=
PathAccept),<br>
&gt; +=C2=A0 =C2=A0PathVariable(&#39;APR&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Path to=
 apr-1-config, or to APR&#39;s install area&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_incdi=
r,<br>
&gt; diff --git a/meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb=
" rel=3D"noreferrer" target=3D"_blank">serf_1.3.9.bb</a> b/meta/recipes-sup=
port/serf/<a href=3D"http://serf_1.3.9.bb" rel=3D"noreferrer" target=3D"_bl=
ank">serf_1.3.9.bb</a><br>
&gt; index 92cd5ca061..25ccd79e00 100644<br>
&gt; --- a/meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb" rel=
=3D"noreferrer" target=3D"_blank">serf_1.3.9.bb</a><br>
&gt; +++ b/meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb" rel=
=3D"noreferrer" target=3D"_blank">serf_1.3.9.bb</a><br>
&gt; @@ -6,6 +6,7 @@ SRC_URI =3D &quot;${APACHE_MIRROR}/${BPN}/${BPN}-${PV}=
.tar.bz2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-SConstruct-=
Fix-path-quoting-for-.def-generator.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-gen_def.pat=
ch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Follow-up-t=
o-r1811083-fix-building-with-scons-3.0.0-.patch \<br>
&gt; +=C2=A0 =C2=A0 file://SConstruct.stop.creating.directories.without.san=
dbox-install.prefix.patch \<br>
<br>
tabs or spaces mismatch I guess ?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;370a6340ff20366ab088012cd13f2b57&quot;=
<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000002b8a3b058b9e0354--
