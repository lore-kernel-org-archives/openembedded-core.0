Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id B5E4674583
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 16:38:18 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id f23so17595948edb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2018 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Rbuk6s4JXOSAcMceQFD3tYDK7l3pcM0roFNuZssR7LY=;
	b=QIZzG19AvOJiXOdS2yVGAexcYDRFthTWmAwVHLpkMF2ukfM/RbgLvQ2HnfHxI8D8e9
	9fKMny6MQmUn7ks+8sgXZHu5qk4X2QI6CkigbwRSlV+c2hzwO6Zw7Q9IOsWLYJwBAFdz
	6k4aOpt+ZVbBtjYdkg+TdMFVI9fxWi8RChM1oAiZyk/STnofQP3w3Bnb/wAIC+ckZuxP
	Uc5O5GTpEdx/p42TLcZrlphtzygClobelOBf4G1vsQRDpaUd8N0DSvPHxchEHrwarjEx
	4GLHUXgEBrnPS4uEDCVeKLfCBR+gerYaeKy6HuitKAIL1ZjKI7LxqngnjKb59ljVlOjR
	UReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Rbuk6s4JXOSAcMceQFD3tYDK7l3pcM0roFNuZssR7LY=;
	b=K8+3ZJ7jJKvEZMk/JDvyOd8w3ZFohtkeXRQQCAFCf3LbAnguoz1xdkVO37yrGuD7Ks
	pgh6dOaMAmceAx16PK6sZFdA17xMs362j0Iw/D0qZybThquBCH9BTlb1/QqfYIVgY2nC
	rF6FPw5U+K/FGAYveVKv4X5hvF8b3U42AetdV04XzeWOgPiOhA+f4h536KDLKuZ0vKQP
	LSaHbuVk15uj460nh3j4jAYZb+cVT5rWmD+IDIQmevIGdrgDBpmChVdvbGJ/ZqfCGbgH
	HlXumSfWkZE4fc5Guf8EZtbbpVN3ZO1i0VNZ4Ke6nkHbjjt6hVd5A0IrQEvRYD0db+iC
	Ec/A==
X-Gm-Message-State: AA+aEWZmslrc3Gs5ur4q5a6ZNeYIlssWGtHEE1Xsz6PNUryWGeAyOcfc
	XvvUgPrx5wOGHp9E2sufqnA2XHwHwvrWFMKlATU=
X-Google-Smtp-Source: AFSGD/VE4dciaFhZaivRpOdxxsdenpiFm9ihgcPyBb/qQ/mHHOGhAEt5RsrEvLJ328RKO87GSTYQwbUo+MVlLEw5Nlo=
X-Received: by 2002:a50:af25:: with SMTP id g34mr22398511edd.221.1544027899319;
	Wed, 05 Dec 2018 08:38:19 -0800 (PST)
MIME-Version: 1.0
References: <1543953282-1856-1-git-send-email-chandana.kalluri@xilinx.com>
	<1543953282-1856-4-git-send-email-chandana.kalluri@xilinx.com>
In-Reply-To: <1543953282-1856-4-git-send-email-chandana.kalluri@xilinx.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 5 Dec 2018 08:38:07 -0800
Message-ID: <CAFNP8Ous2ZkGuxWQ=z3FyCOG39AGX4KGZF7FzUcztyKoCaNCoA@mail.gmail.com>
To: chandana.kalluri@xilinx.com
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] devtool: provide support for devtool menuconfig command.
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
X-List-Received-Date: Wed, 05 Dec 2018 16:38:19 -0000
Content-Type: multipart/alternative; boundary="0000000000007658bc057c4902bc"

--0000000000007658bc057c4902bc
Content-Type: text/plain; charset="UTF-8"

Hi,

This probably has documentation ramifications yes?  See
https://yoctoproject.org/docs/2.6/mega-manual/mega-manual.html#ref-devtool-reference
.

Thanks,
Scott

On Wed, Dec 5, 2018 at 8:27 AM Sai Hari Chandana Kalluri <
chandana.kalluri@xilinx.com> wrote:

> All packages that support the menuconfig task will be able to run devtool
> menuconfig command. This would allow the user to modify the current
> configure options and create a config fragment which can be added to a
> recipe using devtool finish.
>
> 1. The patch checks if devtool menuconfig command is called for a valid
> package.
> 2. It checks for oe-local-files dir within source and creates one
> if needed, this directory is needed to store the final generated config
> fragment so that devtool finish can update the recipe.
> 3. Menuconfig command is called for users to make necessary changes. After
> saving the changes, diffconfig command is run to generate the fragment.
>
> Syntax:
>         devtool menuconfig <package name>
>          Ex: devtool menuconfig linux-yocto
>
> The config fragment is saved as devtool-fragment.cfg within
> oe-local-files dir.
>
>         Ex:
> <workspace_path>/sources/linux-yocto/oe-local-files/devtool-fragment.cfg
>
> Run devtool finish to update the recipe by appending the config fragment
> to SRC_URI and place a copy of the fragment within the layer where the
> recipe resides.
>         Ex: devtool finish linux-yocto meta
>
> [YOCTO #10416]
>
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
> ---
>  scripts/lib/devtool/menuconfig.py | 80
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 scripts/lib/devtool/menuconfig.py
>
> diff --git a/scripts/lib/devtool/menuconfig.py
> b/scripts/lib/devtool/menuconfig.py
> new file mode 100644
> index 0000000..38133db
> --- /dev/null
> +++ b/scripts/lib/devtool/menuconfig.py
> @@ -0,0 +1,80 @@
> +# OpenEmbedded Development tool - menuconfig command plugin
> +#
> +# Copyright (C) 2018 Xilinx
> +# Written by: Chandana Kalluri <ckalluri@xilinx.com>
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +
> +"""Devtool menuconfig plugin"""
> +
> +import os
> +import bb
> +import logging
> +import argparse
> +import re
> +import glob
> +from devtool import setup_tinfoil, parse_recipe, DevtoolError, standard,
> exec_build_env_command
> +
> +logger = logging.getLogger('devtool')
> +
> +def menuconfig(args, config, basepath, workspace):
> +    """Entry point for the devtool 'menuconfig' subcommand"""
> +
> +    rd = ""
> +    kconfigpath = ""
> +    pn_src = ""
> +    localfilesdir = ""
> +    workspace_dir = ""
> +    tinfoil = setup_tinfoil(basepath=basepath)
> +    try:
> +      rd = parse_recipe(config, tinfoil, args.component, appends=True,
> filter_workspace=False)
> +      if not rd:
> +         return 1
> +
> +      pn =  rd.getVar('PN', True)
> +      if pn not in workspace:
> +         raise DevtoolError("Run devtool modify before calling menuconfig
> for %s" %pn)
> +
> +      if not rd.getVarFlag('do_menuconfig','task'):
> +         raise DevtoolError("This package does not support menuconfig
> option")
> +
> +      workspace_dir = os.path.join(basepath,'workspace/sources')
> +      kconfigpath = rd.getVar('B')
> +      pn_src = os.path.join(workspace_dir,pn)
> +
> +      #add check to see if oe_local_files exists or not
> +      localfilesdir = os.path.join(pn_src,'oe-local-files')
> +      if not os.path.exists(localfilesdir):
> +          bb.utils.mkdirhier(localfilesdir)
> +          #Add gitignore to ensure source tree is clean
> +          gitignorefile = os.path.join(localfilesdir,'.gitignore')
> +          with open(gitignorefile, 'w') as f:
> +                  f.write('# Ignore local files, by default. Remove this
> file if you want to commit the directory to Git\n')
> +                  f.write('*\n')
> +
> +    finally:
> +      tinfoil.shutdown()
> +
> +    logger.info('Launching menuconfig')
> +    exec_build_env_command(config.init_path, basepath, 'bitbake -c
> menuconfig %s' % pn, watch=True)
> +    fragment = os.path.join(localfilesdir, 'devtool-fragment.cfg')
> +    res = standard._create_kconfig_diff(pn_src,rd,fragment)
> +
> +    return 0
> +
> +def register_commands(subparsers, context):
> +    """register devtool subcommands from this plugin"""
> +    parser_menuconfig = subparsers.add_parser('menuconfig',help='allows
> altering the system component configuration', description='launches the
> make menuconfig command, allows user to make changes to configuration.
> creates a config fragment', group='advanced')
> +    parser_menuconfig.add_argument('component', help='compenent to alter
> config')
> +
> parser_menuconfig.set_defaults(func=menuconfig,fixed_setup=context.fixed_setup)
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007658bc057c4902bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi, <br></div><div><br></div><div>Th=
is probably has documentation ramifications yes?=C2=A0 See <a href=3D"https=
://yoctoproject.org/docs/2.6/mega-manual/mega-manual.html#ref-devtool-refer=
ence">https://yoctoproject.org/docs/2.6/mega-manual/mega-manual.html#ref-de=
vtool-reference</a>.</div><div><br></div><div>Thanks, <br></div><div>Scott<=
br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed=
, Dec 5, 2018 at 8:27 AM Sai Hari Chandana Kalluri &lt;<a href=3D"mailto:ch=
andana.kalluri@xilinx.com">chandana.kalluri@xilinx.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">All packages that support the menuconfig=
 task will be able to run devtool<br>
menuconfig command. This would allow the user to modify the current<br>
configure options and create a config fragment which can be added to a<br>
recipe using devtool finish.<br>
<br>
1. The patch checks if devtool menuconfig command is called for a valid<br>
package.<br>
2. It checks for oe-local-files dir within source and creates one<br>
if needed, this directory is needed to store the final generated config<br>
fragment so that devtool finish can update the recipe.<br>
3. Menuconfig command is called for users to make necessary changes. After<=
br>
saving the changes, diffconfig command is run to generate the fragment.<br>
<br>
Syntax:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 devtool menuconfig &lt;package name&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ex: devtool menuconfig linux-yocto<br>
<br>
The config fragment is saved as devtool-fragment.cfg within<br>
oe-local-files dir.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ex: &lt;workspace_path&gt;/sources/linux-yocto/=
oe-local-files/devtool-fragment.cfg<br>
<br>
Run devtool finish to update the recipe by appending the config fragment<br=
>
to SRC_URI and place a copy of the fragment within the layer where the<br>
recipe resides.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ex: devtool finish linux-yocto meta<br>
<br>
[YOCTO #10416]<br>
<br>
Signed-off-by: Sai Hari Chandana Kalluri &lt;<a href=3D"mailto:chandana.kal=
luri@xilinx.com" target=3D"_blank">chandana.kalluri@xilinx.com</a>&gt;<br>
Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailto:=
alejandr@xilinx.com" target=3D"_blank">alejandr@xilinx.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/devtool/menuconfig.py | 80 ++++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A01 file changed, 80 insertions(+)<br>
=C2=A0create mode 100644 scripts/lib/devtool/menuconfig.py<br>
<br>
diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuco=
nfig.py<br>
new file mode 100644<br>
index 0000000..38133db<br>
--- /dev/null<br>
+++ b/scripts/lib/devtool/menuconfig.py<br>
@@ -0,0 +1,80 @@<br>
+# OpenEmbedded Development tool - menuconfig command plugin<br>
+#<br>
+# Copyright (C) 2018 Xilinx<br>
+# Written by: Chandana Kalluri &lt;<a href=3D"mailto:ckalluri@xilinx.com" =
target=3D"_blank">ckalluri@xilinx.com</a>&gt;<br>
+#<br>
+# This program is free software; you can redistribute it and/or modify<br>
+# it under the terms of the GNU General Public License version 2 as<br>
+# published by the Free Software Foundation.<br>
+#<br>
+# This program is distributed in the hope that it will be useful,<br>
+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+# GNU General Public License for more details.<br>
+#<br>
+# You should have received a copy of the GNU General Public License along<=
br>
+# with this program; if not, write to the Free Software Foundation, Inc.,<=
br>
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.<br>
+<br>
+&quot;&quot;&quot;Devtool menuconfig plugin&quot;&quot;&quot;<br>
+<br>
+import os<br>
+import bb<br>
+import logging<br>
+import argparse<br>
+import re<br>
+import glob<br>
+from devtool import setup_tinfoil, parse_recipe, DevtoolError, standard, e=
xec_build_env_command<br>
+<br>
+logger =3D logging.getLogger(&#39;devtool&#39;)<br>
+<br>
+def menuconfig(args, config, basepath, workspace):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Entry point for the devtool &#39;menuconfi=
g&#39; subcommand&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 rd =3D &quot;&quot; <br>
+=C2=A0 =C2=A0 kconfigpath =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 pn_src =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 localfilesdir =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 workspace_dir =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 tinfoil =3D setup_tinfoil(basepath=3Dbasepath)<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 rd =3D parse_recipe(config, tinfoil, args.component, =
appends=3DTrue, filter_workspace=3DFalse)<br>
+=C2=A0 =C2=A0 =C2=A0 if not rd:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 pn =3D=C2=A0 rd.getVar(&#39;PN&#39;, True)<br>
+=C2=A0 =C2=A0 =C2=A0 if pn not in workspace:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DevtoolError(&quot;Run devtool mod=
ify before calling menuconfig for %s&quot; %pn)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 if not rd.getVarFlag(&#39;do_menuconfig&#39;,&#39;tas=
k&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DevtoolError(&quot;This package do=
es not support menuconfig option&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 workspace_dir =3D os.path.join(basepath,&#39;workspac=
e/sources&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 kconfigpath =3D rd.getVar(&#39;B&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 pn_src =3D os.path.join(workspace_dir,pn)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 #add check to see if oe_local_files exists or not<br>
+=C2=A0 =C2=A0 =C2=A0 localfilesdir =3D os.path.join(pn_src,&#39;oe-local-f=
iles&#39;) <br>
+=C2=A0 =C2=A0 =C2=A0 if not os.path.exists(localfilesdir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(localfilesdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #Add gitignore to ensure source tree is=
 clean<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gitignorefile =3D os.path.join(localfil=
esdir,&#39;.gitignore&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(gitignorefile, &#39;w&#39;) a=
s f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#3=
9;# Ignore local files, by default. Remove this file if you want to commit =
the directory to Git\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#3=
9;*\n&#39;)<br>
+<br>
+=C2=A0 =C2=A0 finally:<br>
+=C2=A0 =C2=A0 =C2=A0 tinfoil.shutdown()<br>
+<br>
+=C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" target=3D"=
_blank">logger.info</a>(&#39;Launching menuconfig&#39;)<br>
+=C2=A0 =C2=A0 exec_build_env_command(config.init_path, basepath, &#39;bitb=
ake -c menuconfig %s&#39; % pn, watch=3DTrue) <br>
+=C2=A0 =C2=A0 fragment =3D os.path.join(localfilesdir, &#39;devtool-fragme=
nt.cfg&#39;)<br>
+=C2=A0 =C2=A0 res =3D standard._create_kconfig_diff(pn_src,rd,fragment)<br=
>
+<br>
+=C2=A0 =C2=A0 return 0<br>
+<br>
+def register_commands(subparsers, context):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;register devtool subcommands from this plu=
gin&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 parser_menuconfig =3D subparsers.add_parser(&#39;menuconfig&=
#39;,help=3D&#39;allows altering the system component configuration&#39;, d=
escription=3D&#39;launches the make menuconfig command, allows user to make=
 changes to configuration. creates a config fragment&#39;, group=3D&#39;adv=
anced&#39;) <br>
+=C2=A0 =C2=A0 parser_menuconfig.add_argument(&#39;component&#39;, help=3D&=
#39;compenent to alter config&#39;)<br>
+=C2=A0 =C2=A0 parser_menuconfig.set_defaults(func=3Dmenuconfig,fixed_setup=
=3Dcontext.fixed_setup)<br>
-- <br>
2.7.4<br>
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

--0000000000007658bc057c4902bc--
