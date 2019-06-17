Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 957377D274
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 14:51:37 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id e8so8577587otl.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ro+QDyWjVN4hCFM+fMC84A3YAPeen6ZBhKVaZahGgcc=;
	b=NmRHPdHNJ1WHqj4Ex2Kn5xkZOvSZ4zmfBF9A3mmk20ymgf0K6w22GQeVAwysBueDr0
	jwNqDN3b2in9oceVq7wLHmaOP3vBnDqi2Hoiu/X/PQLrybrLNBEpk1/nLwMinAh+0goX
	kn2QZ2mDAYijBmZbFe/FwJpFH1zGo4ViLYSnRl8i3psGvDe0Gb5esVFWqxTnvI5vhP99
	aKqPZ5chEH4SddhdrufByx+wh87/wdlYIjAeusVIfDN0q6tVgaTqpVSh66EDkK60vfn1
	exw+j/XY95TiDPAqhIONe9x+0CpbKmJYtjF/E0NvJ0XmBRtgkMlfldD/5QrMc5OhvJPU
	+5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ro+QDyWjVN4hCFM+fMC84A3YAPeen6ZBhKVaZahGgcc=;
	b=SLFDMb2EL6QCgBW/DN3cHrwsF9SmW+du05VeCbir2Ca9ypmXl1JeyHDAqz8Nh+VByJ
	tEETaOJUMVqqydsygqrZeATiXa6eK2YbuD7UqrsrvfNtjuuu+G41R97f2kaHs4VPuyOM
	ImcdIKSA1xovE0+cJl0LSNnMYvhg2CrSXNiY5ZGmxTpmNaecpDw0tK+itOapFVV6uSGh
	YEMBEHY0b8/rXH9xOWIx4ybs85Rnw89Ra0uTj+jiiq1VS6DIemyhnO/vYc1+NlyXfgNM
	ChkE0RD/qksMTTWK8UfT1olBNT7EyeLkOTBa9IPcoenEHYw3U/xwmd3cy3WQStkNZVgY
	qXuQ==
X-Gm-Message-State: APjAAAWgTTsWbITsvMFLNfTa6M6ZBlpCou//2r6iffB6ZAYuDzmQziVf
	+fOaEeQ8+dttL4RPBOPEIbYrfViKrwWCUIKDECA=
X-Google-Smtp-Source: APXvYqyb2EjNSNh4Jv4GJZMFXgtCqweuFmR3poLMafsk9cKzd+aVskgrbPKJtLxbpxIaWMXsXYTxt/NDpfbFQqHQf7s=
X-Received: by 2002:a9d:7dd9:: with SMTP id k25mr50124805otn.350.1560783098582;
	Mon, 17 Jun 2019 07:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9rVD4cZ-AN7rvF=0fuc4d99brU_Tt_wQeRMGm=L83M2w@mail.gmail.com>
	<201906171422.x5HEMKtf012735@dan.rpsys.net>
In-Reply-To: <201906171422.x5HEMKtf012735@dan.rpsys.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jun 2019 16:51:27 +0200
Message-ID: <CANNYZj_vg_jzcMRhfQ35C_2kDnyH-yxVj52pKk2WpfZxfo5iOw@mail.gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>, "Eggleton,
	Paul" <paul.eggleton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] lttng-ust: upgrading to 2.10.4 FAILED
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
X-List-Received-Date: Mon, 17 Jun 2019 14:51:37 -0000
Content-Type: multipart/alternative; boundary="000000000000299bf6058b862261"

--000000000000299bf6058b862261
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Jun 2019 at 16:22, Richard Purdie <rpurdie@rpsys.net> wrote:

> >Yes, it's another one of those recipes which includes a
> >different recipe with its version number (which breaks when
> >devtool upgrades one but not the other).
> >
> >I have a fix queued:
> >
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=00eb5952479370553756dface4cf6c81f51b9e8f
>
> I think what worries me more is the build isn't reset so this is reported
> against lttng-ust. I guess its because its testing the changes together?
>
> Perhaps it should parse test them individually?
>

The build isn't reset because 'devtool upgrade libnewt-python' fails
mid-way and leaves the workspace in an inconsistent state
(workspace/recipes/ has content but workspace/append does not), so 'devtool
reset' isn't able to revert that state.

AUH could probably clean up the files in this situation, but currently
doesn't - it just assumes that devtool is able to clean up after itself in
any situation (which seems to not be the case, sadly).

Specific traceback from devtool:

Traceback (most recent call last):
  File "/home/alexander/development/poky/scripts/devtool", line 334, in
<module>
    ret = main()
  File "/home/alexander/development/poky/scripts/devtool", line 321, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/alexander/development/poky/scripts/lib/devtool/upgrade.py",
line 551, in upgrade
    rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev,
srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd,
license_diff, new_licenses)
  File "/home/alexander/development/poky/scripts/lib/devtool/upgrade.py",
line 419, in _create_new_recipe
    rd = tinfoil.parse_recipe_file(fullpath, False)
  File "/home/alexander/development/poky/bitbake/lib/bb/tinfoil.py", line
641, in parse_recipe_file
    dscon = self.run_command('parseRecipeFile', fn, appends, appendlist)
  File "/home/alexander/development/poky/bitbake/lib/bb/tinfoil.py", line
466, in run_command
    raise TinfoilCommandFailed(result[1])
bb.tinfoil.TinfoilCommandFailed: Traceback (most recent call last):
  File
"/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py",
line 94, in include_single_file
    bb.parse.handle(fn, data, True)
  File "/home/alexander/development/poky/bitbake/lib/bb/parse/__init__.py",
line 107, in handle
    return h['handle'](fn, data, include)
  File
"/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/BBHandler.py",
line 120, in handle
    abs_fn = resolve_file(fn, d)
  File "/home/alexander/development/poky/bitbake/lib/bb/parse/__init__.py",
line 125, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found in %s" % (fn, bbpath))
FileNotFoundError: [Errno 2] file recipes-extended/newt/libnewt_0.52.21.bb
not found in
/home/alexander/development/poky/build/workspace:/home/alexander/development/poky/meta-poky:/home/alexander/development/poky/build:/home/alexander/development/poky/meta:/home/alexander/development/poky/meta-yocto-bsp:/home/alexander/development/meta-mingw

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/alexander/development/poky/bitbake/lib/bb/command.py", line
74, in runCommand
    result = command_method(self, commandline)
  File "/home/alexander/development/poky/bitbake/lib/bb/command.py", line
562, in parseRecipeFile
    envdata = parser.loadDataFull(fn, appendfiles)
  File "/home/alexander/development/poky/bitbake/lib/bb/cache.py", line
327, in loadDataFull
    bb_data = self.load_bbfile(virtualfn, appends, virtonly=True)
  File "/home/alexander/development/poky/bitbake/lib/bb/cache.py", line
340, in load_bbfile
    datastores = parse_recipe(bb_data, bbfile, appends, mc)
  File "/home/alexander/development/poky/bitbake/lib/bb/cache.py", line
303, in parse_recipe
    bb_data = bb.parse.handle(bbfile, bb_data)
  File "/home/alexander/development/poky/bitbake/lib/bb/parse/__init__.py",
line 107, in handle
    return h['handle'](fn, data, include)
  File
"/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/BBHandler.py",
line 130, in handle
    statements.eval(d)
  File "/home/alexander/development/poky/bitbake/lib/bb/parse/ast.py", line
23, in eval
    statement.eval(data)
  File "/home/alexander/development/poky/bitbake/lib/bb/parse/ast.py", line
45, in eval
    bb.parse.ConfHandler.include(self.filename, s, self.lineno, data,
"include required")
  File
"/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py",
line 71, in include
    include_single_file(parentfn, fn, lineno, data, error_out)
  File
"/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py",
line 98, in include_single_file
    raise ParseError("Could not %s file %s" % (error_out, fn), parentfn,
lineno)
bb.parse.ParseError: ParseError at
/home/alexander/development/poky/build/workspace/recipes/libnewt-python/
libnewt-python_0.52.21.bb:1: Could not include required file
recipes-extended/newt/libnewt_0.52.21.bb

Alex

--000000000000299bf6058b862261
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 17 Jun 2019 at 16:22, Richard Pur=
die &lt;<a href=3D"mailto:rpurdie@rpsys.net" target=3D"_blank">rpurdie@rpsy=
s.net</a>&gt; wrote:<br></div><div dir=3D"ltr"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div>&gt;Yes, it&#39;s ano=
ther one of those recipes which includes a=C2=A0<div dir=3D"ltr"><div>&gt;d=
ifferent recipe with its version number (which breaks when=C2=A0</div><div>=
&gt;devtool upgrades one but not the other).</div><div>&gt;</div><div>&gt;I=
 have a fix queued:</div><div>&gt;<a href=3D"http://git.yoctoproject.org/cg=
it.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-updates&amp;id=3D0=
0eb5952479370553756dface4cf6c81f51b9e8f" target=3D"_blank">http://git.yocto=
project.org/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-upda=
tes&amp;id=3D00eb5952479370553756dface4cf6c81f51b9e8f</a></div><div><br></d=
iv><div>I think what worries me more is the build isn&#39;t reset so this i=
s reported against lttng-ust. I guess its because its testing the changes t=
ogether?</div><div><br></div><div>Perhaps it should parse test them individ=
ually?</div></div></div></blockquote><div><br></div><div>The build isn&#39;=
t reset because &#39;devtool upgrade libnewt-python&#39; fails mid-way and =
leaves the workspace in an inconsistent state (workspace/recipes/ has conte=
nt but workspace/append does not), so &#39;devtool reset&#39; isn&#39;t abl=
e to revert that state.</div><div><br></div><div>AUH could probably clean u=
p the files in this situation, but currently doesn&#39;t - it just assumes =
that devtool is able to clean up after itself in any situation (which seems=
 to not be the case, sadly).</div><div><br></div><div>Specific traceback fr=
om devtool:</div><div><br></div><div>Traceback (most recent call last):<br>=
=C2=A0 File &quot;/home/alexander/development/poky/scripts/devtool&quot;, l=
ine 334, in &lt;module&gt;<br>=C2=A0 =C2=A0 ret =3D main()<br>=C2=A0 File &=
quot;/home/alexander/development/poky/scripts/devtool&quot;, line 321, in m=
ain<br>=C2=A0 =C2=A0 ret =3D args.func(args, config, basepath, workspace)<b=
r>=C2=A0 File &quot;/home/alexander/development/poky/scripts/lib/devtool/up=
grade.py&quot;, line 551, in upgrade<br>=C2=A0 =C2=A0 rf, copied =3D _creat=
e_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1,=
 srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses=
)<br>=C2=A0 File &quot;/home/alexander/development/poky/scripts/lib/devtool=
/upgrade.py&quot;, line 419, in _create_new_recipe<br>=C2=A0 =C2=A0 rd =3D =
tinfoil.parse_recipe_file(fullpath, False)<br>=C2=A0 File &quot;/home/alexa=
nder/development/poky/bitbake/lib/bb/tinfoil.py&quot;, line 641, in parse_r=
ecipe_file<br>=C2=A0 =C2=A0 dscon =3D self.run_command(&#39;parseRecipeFile=
&#39;, fn, appends, appendlist)<br>=C2=A0 File &quot;/home/alexander/develo=
pment/poky/bitbake/lib/bb/tinfoil.py&quot;, line 466, in run_command<br>=C2=
=A0 =C2=A0 raise TinfoilCommandFailed(result[1])<br>bb.tinfoil.TinfoilComma=
ndFailed: Traceback (most recent call last):<br>=C2=A0 File &quot;/home/ale=
xander/development/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py&quot;,=
 line 94, in include_single_file<br>=C2=A0 =C2=A0 bb.parse.handle(fn, data,=
 True)<br>=C2=A0 File &quot;/home/alexander/development/poky/bitbake/lib/bb=
/parse/__init__.py&quot;, line 107, in handle<br>=C2=A0 =C2=A0 return h[&#3=
9;handle&#39;](fn, data, include)<br>=C2=A0 File &quot;/home/alexander/deve=
lopment/poky/bitbake/lib/bb/parse/parse_py/BBHandler.py&quot;, line 120, in=
 handle<br>=C2=A0 =C2=A0 abs_fn =3D resolve_file(fn, d)<br>=C2=A0 File &quo=
t;/home/alexander/development/poky/bitbake/lib/bb/parse/__init__.py&quot;, =
line 125, in resolve_file<br>=C2=A0 =C2=A0 raise IOError(errno.ENOENT, &quo=
t;file %s not found in %s&quot; % (fn, bbpath))<br>FileNotFoundError: [Errn=
o 2] file recipes-extended/newt/<a href=3D"http://libnewt_0.52.21.bb">libne=
wt_0.52.21.bb</a> not found in /home/alexander/development/poky/build/works=
pace:/home/alexander/development/poky/meta-poky:/home/alexander/development=
/poky/build:/home/alexander/development/poky/meta:/home/alexander/developme=
nt/poky/meta-yocto-bsp:/home/alexander/development/meta-mingw<br><br>During=
 handling of the above exception, another exception occurred:<br><br>Traceb=
ack (most recent call last):<br>=C2=A0 File &quot;/home/alexander/developme=
nt/poky/bitbake/lib/bb/command.py&quot;, line 74, in runCommand<br>=C2=A0 =
=C2=A0 result =3D command_method(self, commandline)<br>=C2=A0 File &quot;/h=
ome/alexander/development/poky/bitbake/lib/bb/command.py&quot;, line 562, i=
n parseRecipeFile<br>=C2=A0 =C2=A0 envdata =3D parser.loadDataFull(fn, appe=
ndfiles)<br>=C2=A0 File &quot;/home/alexander/development/poky/bitbake/lib/=
bb/cache.py&quot;, line 327, in loadDataFull<br>=C2=A0 =C2=A0 bb_data =3D s=
elf.load_bbfile(virtualfn, appends, virtonly=3DTrue)<br>=C2=A0 File &quot;/=
home/alexander/development/poky/bitbake/lib/bb/cache.py&quot;, line 340, in=
 load_bbfile<br>=C2=A0 =C2=A0 datastores =3D parse_recipe(bb_data, bbfile, =
appends, mc)<br>=C2=A0 File &quot;/home/alexander/development/poky/bitbake/=
lib/bb/cache.py&quot;, line 303, in parse_recipe<br>=C2=A0 =C2=A0 bb_data =
=3D bb.parse.handle(bbfile, bb_data)<br>=C2=A0 File &quot;/home/alexander/d=
evelopment/poky/bitbake/lib/bb/parse/__init__.py&quot;, line 107, in handle=
<br>=C2=A0 =C2=A0 return h[&#39;handle&#39;](fn, data, include)<br>=C2=A0 F=
ile &quot;/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/BB=
Handler.py&quot;, line 130, in handle<br>=C2=A0 =C2=A0 statements.eval(d)<b=
r>=C2=A0 File &quot;/home/alexander/development/poky/bitbake/lib/bb/parse/a=
st.py&quot;, line 23, in eval<br>=C2=A0 =C2=A0 statement.eval(data)<br>=C2=
=A0 File &quot;/home/alexander/development/poky/bitbake/lib/bb/parse/ast.py=
&quot;, line 45, in eval<br>=C2=A0 =C2=A0 bb.parse.ConfHandler.include(self=
.filename, s, self.lineno, data, &quot;include required&quot;)<br>=C2=A0 Fi=
le &quot;/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/Con=
fHandler.py&quot;, line 71, in include<br>=C2=A0 =C2=A0 include_single_file=
(parentfn, fn, lineno, data, error_out)<br>=C2=A0 File &quot;/home/alexande=
r/development/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py&quot;, line=
 98, in include_single_file<br>=C2=A0 =C2=A0 raise ParseError(&quot;Could n=
ot %s file %s&quot; % (error_out, fn), parentfn, lineno)<br>bb.parse.ParseE=
rror: ParseError at /home/alexander/development/poky/build/workspace/recipe=
s/libnewt-python/<a href=3D"http://libnewt-python_0.52.21.bb:1">libnewt-pyt=
hon_0.52.21.bb:1</a>: Could not include required file recipes-extended/newt=
/<a href=3D"http://libnewt_0.52.21.bb">libnewt_0.52.21.bb</a><br></div><div=
><br></div><div>Alex<br></div><div>=C2=A0</div></div></div>
</div>

--000000000000299bf6058b862261--
