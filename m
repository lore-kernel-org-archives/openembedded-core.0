Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
	[209.85.222.43])
	by mail.openembedded.org (Postfix) with ESMTP id CD8C37F362
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 11:35:59 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id o42so8433480uad.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 03:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zc+RHf1qCw8/Cd1DlfbicGqwxQMzKRFDKgHPqe9Ml1I=;
	b=Pt0sjT7y79YbbapwYOBIFi9w3Phg5PWRH3jsxHDPlP1wlActeSSMVQa6cnAujJcgbO
	elSMouhblLkOyKq8akCJRQk2ovzPExib7uXQaQOqI3J50Wc0d0BIJoTk/egqOxo6b7yY
	ll3TjsvzLaqHXINCl0eIAbRSzrDuNOPBp05Fy8TYAXq4d52GGKrCQq7k4H4I6XlD0m4U
	CnaD9zpdYKQJRk6a0lBuPLOGesmxFYepfX1Fw6+QtuRq7Twl1F6Zq62YDrFskTuW7Lwa
	yg409SkCVPY6uEy92osDU7OtUTTbHbHOo43oX++HhhkbzMcUFkehDXkbinwFZsg73whT
	tdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zc+RHf1qCw8/Cd1DlfbicGqwxQMzKRFDKgHPqe9Ml1I=;
	b=td/U10dRcbGt9W4i8t0/m8cMVwpAdh0DwqPRf5jlayBg3Gxn0sk6amLppf0TU+FZgN
	AdcuQ8Rpztnwz0EVv+BNYn3ILWmq8VgffvPnwYyXq2t7sRY78UseDMCn+Y9WRlmvRDHO
	Hex6iZQUdLPl3+b5wqpMmZ+hi3JxU4yuSkIPjFzSqSIANvyO+QZxhm6TnjZE2Dw9WQdc
	DdcUknLlmKGvwFhgwuoNEGcclwzJWVvLhIEQIH5Ltsi0nsHYTEx6kwRkZ3tX5m9CTHDu
	HSvaXQkDYB0fJwlEQw2yzJwdOamEw7+7qLRHjYEzmOA7uIfMalenqVGCB58BUq4CpzMx
	3NSg==
X-Gm-Message-State: APjAAAUV6e+kSd2fj8L6XNZMPc68xiAewrtKzh0VRUBpB86orvDy81WT
	dGTNHITHYyBajxUYM0lTriGqw60N6MTJb6LHF2rNOQ==
X-Google-Smtp-Source: APXvYqzYp6bGRnGxDFQaNcELMK0TeDEuJa3NA3mZduJRJgOdo3OpL3vauBHeazZLtuz8DfLe8gYB+GE89x6eYLanQhs=
X-Received: by 2002:ab0:6894:: with SMTP id t20mr11402340uar.100.1575286560488;
	Mon, 02 Dec 2019 03:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20191202060311.17061-1-Qi.Chen@windriver.com>
	<20191202060311.17061-2-Qi.Chen@windriver.com>
In-Reply-To: <20191202060311.17061-2-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Dec 2019 12:35:48 +0100
Message-ID: <CANNYZj_kRj795Pr7vy9AwRZJz_mxdjEB5Q_xVnA3wQc5w8gwAg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] devtool: add option to remove backported patch automatically during upgrade
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
X-List-Received-Date: Mon, 02 Dec 2019 11:36:00 -0000
Content-Type: multipart/alternative; boundary="000000000000db83150598b6fb2b"

--000000000000db83150598b6fb2b
Content-Type: text/plain; charset="UTF-8"

I would say this is a dangerous option, and I wouldn't want to have or use
it. Backported patches may not actually be present in the newer version if
they were taken from a development branch that has not yet been released.

Also, 'devtool upgrade' is using 'git rebase' to rebase all patches onto
the newer code base, and most backports are dropped automatically at that
step. If they aren't there's usually a merge conflict, where you can easily
issue 'git rebase --skip' to remove the backport, or resolve conflicts if
the backport needs to stay.

What prompted you to implement this?

Alex

On Mon, 2 Dec 2019 at 07:03, Chen Qi <Qi.Chen@windriver.com> wrote:

> When upgrading a package, most likely the backported patches are not
> needed any more, so add an option to `devtool upgrade' to handle such
> situation.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/lib/devtool/standard.py | 14 +++++++++++++-
>  scripts/lib/devtool/upgrade.py  |  3 ++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index 1c0cd8ab51..5fe848b6b8 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -487,7 +487,7 @@ def symlink_oelocal_files_srctree(rd,srctree):
>              bb.process.run('git %s commit -m "Committing local file
> symlinks\n\n%s"' % (' '.join(useroptions),
> oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
>
>
> -def _extract_source(srctree, keep_temp, devbranch, sync, config,
> basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False):
> +def _extract_source(srctree, keep_temp, devbranch, sync, config,
> basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False,
> no_backported=False):
>      """Extract sources of a recipe"""
>      import oe.recipeutils
>      import oe.patch
> @@ -555,6 +555,14 @@ def _extract_source(srctree, keep_temp, devbranch,
> sync, config, basepath, works
>      tempbasedir = d.getVar('WORKDIR')
>      bb.utils.mkdirhier(tempbasedir)
>      tempdir = tempfile.mkdtemp(prefix='devtooltmp-', dir=tempbasedir)
> +    patches = oe.recipeutils.get_recipe_patches(d)
> +    backported_patches = []
> +    for patch in patches:
> +        with open(patch, 'r') as pf:
> +            for line in pf.readlines():
> +                if 'Upstream-Status: Backport' in line:
> +                    backported_patches.append(os.path.basename(patch))
> +                    break
>      try:
>          tinfoil.logger.setLevel(logging.WARNING)
>
> @@ -579,6 +587,10 @@ def _extract_source(srctree, keep_temp, devbranch,
> sync, config, basepath, works
>                  f.write('DEVTOOL_EXTRA_OVERRIDES = "%s"\n' %
> ':'.join(extra_overrides))
>              f.write('inherit devtool-source\n')
>              f.write('###--- _extract_source\n')
> +            # deal with backported patches
> +            if no_backported and len(backported_patches) > 0:
> +                for patch_name in backported_patches:
> +                    f.write('SRC_URI_remove = "file://%s"' % patch_name)
>
>          update_unlockedsigs(basepath, workspace, fixed_setup, [pn])
>
> diff --git a/scripts/lib/devtool/upgrade.py
> b/scripts/lib/devtool/upgrade.py
> index cb6dce378a..d5e04ecdc5 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -549,7 +549,7 @@ def upgrade(args, config, basepath, workspace):
>          license_diff = None
>          try:
>              logger.info('Extracting current version source...')
> -            rev1, srcsubdir1 = standard._extract_source(srctree, False,
> 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd,
> tinfoil, no_overrides=args.no_overrides)
> +            rev1, srcsubdir1 = standard._extract_source(srctree, False,
> 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd,
> tinfoil, no_overrides=args.no_overrides, no_backported=args.no_backported)
>              old_licenses = _extract_licenses(srctree,
> rd.getVar('LIC_FILES_CHKSUM'))
>              logger.info('Extracting upgraded version source...')
>              rev2, md5, sha256, srcbranch, srcsubdir2 =
> _extract_new_source(args.version, srctree, args.no_patch,
> @@ -628,6 +628,7 @@ def register_commands(subparsers, context):
>      parser_upgrade.add_argument('--branch', '-b', default="devtool",
> help='Name for new development branch to checkout (default "%(default)s")')
>      parser_upgrade.add_argument('--no-patch', action="store_true",
> help='Do not apply patches from the recipe to the new source code')
>      parser_upgrade.add_argument('--no-overrides', '-O',
> action="store_true", help='Do not create branches for other override
> configurations')
> +    parser_upgrade.add_argument('--no-backported', action="store_true",
> help='Do not apply backported patches to the new source code')
>      group = parser_upgrade.add_mutually_exclusive_group()
>      group.add_argument('--same-dir', '-s', help='Build in same directory
> as source', action="store_true")
>      group.add_argument('--no-same-dir', help='Force build in a separate
> build directory', action="store_true")
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000db83150598b6fb2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I would say this is a dangerous option, and I wouldn&=
#39;t want to have or use it. Backported patches may not actually be presen=
t in the newer version if they were taken from a development branch that ha=
s not yet been released.</div><div><br></div><div>Also, &#39;devtool upgrad=
e&#39; is using &#39;git rebase&#39; to rebase all patches onto the newer c=
ode base, and most backports are dropped automatically at that step. If the=
y aren&#39;t there&#39;s usually a merge conflict, where you can easily iss=
ue &#39;git rebase --skip&#39; to remove the backport, or resolve conflicts=
 if the backport needs to stay.</div><div><br></div><div>What prompted you =
to implement this?<br></div><div><br></div><div>Alex<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 2 Dec=
 2019 at 07:03, Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">When upgrading a package, most likely the backported patches=
 are not<br>
needed any more, so add an option to `devtool upgrade&#39; to handle such<b=
r>
situation.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/devtool/standard.py | 14 +++++++++++++-<br>
=C2=A0scripts/lib/devtool/upgrade.py=C2=A0 |=C2=A0 3 ++-<br>
=C2=A02 files changed, 15 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py<br>
index 1c0cd8ab51..5fe848b6b8 100644<br>
--- a/scripts/lib/devtool/standard.py<br>
+++ b/scripts/lib/devtool/standard.py<br>
@@ -487,7 +487,7 @@ def symlink_oelocal_files_srctree(rd,srctree):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.process.run(&#39;git %s =
commit -m &quot;Committing local file symlinks\n\n%s&quot;&#39; % (&#39; &#=
39;.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=3Ds=
rctree)<br>
<br>
<br>
-def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath,=
 workspace, fixed_setup, d, tinfoil, no_overrides=3DFalse):<br>
+def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath,=
 workspace, fixed_setup, d, tinfoil, no_overrides=3DFalse, no_backported=3D=
False):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Extract sources of a recipe&quot;&quo=
t;&quot;<br>
=C2=A0 =C2=A0 =C2=A0import oe.recipeutils<br>
=C2=A0 =C2=A0 =C2=A0import oe.patch<br>
@@ -555,6 +555,14 @@ def _extract_source(srctree, keep_temp, devbranch, syn=
c, config, basepath, works<br>
=C2=A0 =C2=A0 =C2=A0tempbasedir =3D d.getVar(&#39;WORKDIR&#39;)<br>
=C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(tempbasedir)<br>
=C2=A0 =C2=A0 =C2=A0tempdir =3D tempfile.mkdtemp(prefix=3D&#39;devtooltmp-&=
#39;, dir=3Dtempbasedir)<br>
+=C2=A0 =C2=A0 patches =3D oe.recipeutils.get_recipe_patches(d)<br>
+=C2=A0 =C2=A0 backported_patches =3D []<br>
+=C2=A0 =C2=A0 for patch in patches:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(patch, &#39;r&#39;) as pf:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in pf.readlines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;Upstream-S=
tatus: Backport&#39; in line:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 back=
ported_patches.append(os.path.basename(patch))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tinfoil.logger.setLevel(logging.WARNING)<=
br>
<br>
@@ -579,6 +587,10 @@ def _extract_source(srctree, keep_temp, devbranch, syn=
c, config, basepath, works<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
DEVTOOL_EXTRA_OVERRIDES =3D &quot;%s&quot;\n&#39; % &#39;:&#39;.join(extra_=
overrides))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;inherit devtoo=
l-source\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;###--- _extrac=
t_source\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # deal with backported patches<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if no_backported and len(backpor=
ted_patches) &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for patch_name in =
backported_patches:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.wr=
ite(&#39;SRC_URI_remove =3D &quot;file://%s&quot;&#39; % patch_name)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_unlockedsigs(basepath, workspace, =
fixed_setup, [pn])<br>
<br>
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y<br>
index cb6dce378a..d5e04ecdc5 100644<br>
--- a/scripts/lib/devtool/upgrade.py<br>
+++ b/scripts/lib/devtool/upgrade.py<br>
@@ -549,7 +549,7 @@ def upgrade(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0license_diff =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.in=
fo" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Extracting cu=
rrent version source...&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev1, srcsubdir1 =3D standard._e=
xtract_source(srctree, False, &#39;devtool-orig&#39;, False, config, basepa=
th, workspace, args.fixed_setup, rd, tinfoil, no_overrides=3Dargs.no_overri=
des)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev1, srcsubdir1 =3D standard._e=
xtract_source(srctree, False, &#39;devtool-orig&#39;, False, config, basepa=
th, workspace, args.fixed_setup, rd, tinfoil, no_overrides=3Dargs.no_overri=
des, no_backported=3Dargs.no_backported)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_licenses =3D _extract_l=
icenses(srctree, rd.getVar(&#39;LIC_FILES_CHKSUM&#39;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.in=
fo" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Extracting up=
graded version source...&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rev2, md5, sha256, srcbranc=
h, srcsubdir2 =3D _extract_new_source(args.version, srctree, args.no_patch,=
<br>
@@ -628,6 +628,7 @@ def register_commands(subparsers, context):<br>
=C2=A0 =C2=A0 =C2=A0parser_upgrade.add_argument(&#39;--branch&#39;, &#39;-b=
&#39;, default=3D&quot;devtool&quot;, help=3D&#39;Name for new development =
branch to checkout (default &quot;%(default)s&quot;)&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_upgrade.add_argument(&#39;--no-patch&#39;, actio=
n=3D&quot;store_true&quot;, help=3D&#39;Do not apply patches from the recip=
e to the new source code&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_upgrade.add_argument(&#39;--no-overrides&#39;, &=
#39;-O&#39;, action=3D&quot;store_true&quot;, help=3D&#39;Do not create bra=
nches for other override configurations&#39;)<br>
+=C2=A0 =C2=A0 parser_upgrade.add_argument(&#39;--no-backported&#39;, actio=
n=3D&quot;store_true&quot;, help=3D&#39;Do not apply backported patches to =
the new source code&#39;)<br>
=C2=A0 =C2=A0 =C2=A0group =3D parser_upgrade.add_mutually_exclusive_group()=
<br>
=C2=A0 =C2=A0 =C2=A0group.add_argument(&#39;--same-dir&#39;, &#39;-s&#39;, =
help=3D&#39;Build in same directory as source&#39;, action=3D&quot;store_tr=
ue&quot;)<br>
=C2=A0 =C2=A0 =C2=A0group.add_argument(&#39;--no-same-dir&#39;, help=3D&#39=
;Force build in a separate build directory&#39;, action=3D&quot;store_true&=
quot;)<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000db83150598b6fb2b--
