Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 760E0745BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 14:14:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id e8so2514524wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 07:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kCgbqx0mDTSo/y0VMN7S+oBvocr13n9LAKPU9sW407M=;
	b=Yww3RLK0Gfh3MNDaqKOnAdoBz7WRftR/QzClagaIYDs8cU8S4Ve9dy0IJW3MiTyqkQ
	0lsJX7Qx5weKjamneNacTWwLiX5n/jC6fl+8Tn2eUy/2CNCY5soBDmvgRIJ7kZEk4ltG
	Cgo2IX878Gkhmvi42Md4Sv3EX1A0jQgmUhVRrQh5dAJ4ZJexvWn/IcwUzn3uw9hPgWCC
	OhGzGa2WM1EUie5CUKN7wa7QFtDOkBan1Oq7fPmaGJl/engCh0tRVmNNuQpOlPlYJUNv
	jtgaHYEuXXGG2NCkwOxZMQ+6ObA2weDlobl+tfu5IdiARgmfFV0Zcha2zOGCZNNJJQtB
	qmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kCgbqx0mDTSo/y0VMN7S+oBvocr13n9LAKPU9sW407M=;
	b=fQE3Y6xeAIKZ4lFNsUePFQRwOj2bltRfwb9ViOGgYz1XhZTDCl2ornZwh2vrVwWoOs
	kYKxn53ZF8Dxji5+i/Bq/3dpIVQyLb4t53xG0Ui0CBSWgnNb4YBuQvd4S10LIXZlpx/e
	8xE79EjxfTnEqbAtvNunS0Yptz+3AbOR6DcxARzIKeIZsFM3nJpikhDw40mNklqS/pSL
	GWHqX6Ckngtki8Do6MO1SBVP0InhQ6zqdxqg+qv7lNphWVoxn1qHFHV0YVdexGF4KNht
	KDekHSZMGmcgLJMJ55YpUaCMkpgtkH6yNDxrOGXkJtoTYhwQV2xBmRcNLZhirGwogDHD
	JR3g==
X-Gm-Message-State: APjAAAVKzZ7Rrndon1+m4PkcnF6rWgr24l75RZ+DlSBiW0UqbbVTV2DW
	K6ckutCsSUJKT596LUhFAB+is3NmAKsN3d93VuY=
X-Google-Smtp-Source: APXvYqw/tjlQElmr3dHjtb3rPUafz8azNLhmklkHzMkFMjWMuTHXcVr1fGKLJaeUdwK1LdjJbPTYArKoUdBACQVxfms=
X-Received: by 2002:a1c:18a:: with SMTP id 132mr224376wmb.15.1566310467049;
	Tue, 20 Aug 2019 07:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190820090442.20-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190820090442.20-1-Martin.Jansa@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 20 Aug 2019 07:14:14 -0700
Message-ID: <CAJdd5Gb9L8KQnzGzJT0Dt_O6iU-PXfKJ-BEh_OMYOZ5gqrUm-A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][PATCH 1/3] icecc.bbclass: catch subprocess.CalledProcessError
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
X-List-Received-Date: Tue, 20 Aug 2019 14:14:27 -0000
Content-Type: multipart/alternative; boundary="000000000000ff1e2e05908d123a"

--000000000000ff1e2e05908d123a
Content-Type: text/plain; charset="UTF-8"

Looks like "readlink -f" is failing. Can you try to capture the output and
figure out why?

On Tue, Aug 20, 2019, 2:04 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> * this might be related to:
>   commit d2fcaeb153fdc3f8d7143ea823139f1537055ff1
>   Author: Douglas Royds <douglas.royds@taitradio.com>
>   Date:   Thu Dec 20 11:59:47 2018 +1300
>
>     icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time
>
> * it's still a bit unclear when and why this happends, but I'm seeing
>   random tasks sometimes failing with:
>
> WARNING: Exception during build_dependencies for set_icecc_env
> WARNING: Error during finalise of
> /build/meta-oe/meta-python/recipes-devtools/python/
> python-markupsafe_1.0.bb
> ERROR: Traceback (most recent call last):
>   File "/build/bitbake/lib/bb/data_smart.py", line 411, in expandWithRefs
>     s = __expand_python_regexp__.sub(varparse.python_sub, s)
>   File "/build/bitbake/lib/bb/data_smart.py", line 136, in python_sub
>     value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
>   File "/build/bitbake/lib/bb/utils.py", line 421, in better_eval
>     return eval(source, ctx, locals)
>   File "Var <set_icecc_env>", line 1, in <module>
>   File "/build/oe-core/meta/classes/icecc.bbclass", line 287, in
> icecc_get_and_check_tool
>     link_path = icecc_get_tool_link(t, d)
>   File "/build/oe-core/meta/classes/icecc.bbclass", line 246, in
> icecc_get_tool_link
>     return subprocess.check_output("readlink -f %s" % tool,
> shell=True).decode("utf-8")[:-1]
>   File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
>     **kwargs).stdout
>   File "/usr/lib/python3.6/subprocess.py", line 418, in run
>     output=stdout, stderr=stderr)
> subprocess.CalledProcessError: Command 'readlink -f
> /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++'
> returned non-zero exit status 1.
>
> The above exception was the direct cause of the following exception:
>
> Traceback (most recent call last):
>   File "/build/bitbake/bin/bitbake-worker", line 239, in child
>     the_data = bb_cache.loadDataFull(fn, appends)
>   File "/build/bitbake/lib/bb/cache.py", line 327, in loadDataFull
>     bb_data = self.load_bbfile(virtualfn, appends, virtonly=True)
>   File "/build/bitbake/lib/bb/cache.py", line 340, in load_bbfile
>     datastores = parse_recipe(bb_data, bbfile, appends, mc)
>   File "/build/bitbake/lib/bb/cache.py", line 303, in parse_recipe
>     bb_data = bb.parse.handle(bbfile, bb_data)
>   File "/build/bitbake/lib/bb/parse/__init__.py", line 107, in handle
>     return h['handle'](fn, data, include)
>   File "/build/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 142, in
> handle
>     return ast.multi_finalize(fn, d)
>   File "/build/bitbake/lib/bb/parse/ast.py", line 386, in multi_finalize
>     finalize(fn, d)
>   File "/build/bitbake/lib/bb/parse/ast.py", line 351, in finalize
>     bb.parse.siggen.finalise(fn, d, variant)
>   File "/build/bitbake/lib/bb/siggen.py", line 147, in finalise
>     taskdeps = self._build_data(fn, d)
>   File "/build/bitbake/lib/bb/siggen.py", line 118, in _build_data
>     tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)
>   File "/build/bitbake/lib/bb/data.py", line 388, in generate_dependencies
>     deps[dep], values[dep] = build_dependencies(dep, keys, shelldeps,
> varflagsexcl, d)
>   File "/build/bitbake/lib/bb/data.py", line 317, in build_dependencies
>     value, parsedvar = d.getVarFlag(key, "_content", False, retparser=True)
>   File "/build/bitbake/lib/bb/data_smart.py", line 802, in getVarFlag
>     parser = self.expandWithRefs(value, cachename)
>   File "/build/bitbake/lib/bb/data_smart.py", line 424, in expandWithRefs
>     raise ExpansionError(varname, s, exc).with_traceback(tb) from exc
>   File "/build/bitbake/lib/bb/data_smart.py", line 411, in expandWithRefs
>     s = __expand_python_regexp__.sub(varparse.python_sub, s)
>   File "/build/bitbake/lib/bb/data_smart.py", line 136, in python_sub
>     value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
>   File "/build/bitbake/lib/bb/utils.py", line 421, in better_eval
>     return eval(source, ctx, locals)
>   File "Var <set_icecc_env>", line 1, in <module>
>   File "/build/oe-core/meta/classes/icecc.bbclass", line 287, in
> icecc_get_and_check_tool
>     link_path = icecc_get_tool_link(t, d)
>   File "/build/oe-core/meta/classes/icecc.bbclass", line 246, in
> icecc_get_tool_link
>     return subprocess.check_output("readlink -f %s" % tool,
> shell=True).decode("utf-8")[:-1]
>   File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
>     **kwargs).stdout
>   File "/usr/lib/python3.6/subprocess.py", line 418, in run
>     output=stdout, stderr=stderr)
> bb.data_smart.ExpansionError: Failure expanding variable set_icecc_env,
> expression was     if [ "${@use_icecc(bb, d)}" = "no" ]
>     then
>         return
>     fi
>     ICECC_VERSION="${@icecc_version(bb, d)}"
>     if [ "x${ICECC_VERSION}" = "x" ]
>     then
>         bbwarn "Cannot use icecc: could not get ICECC_VERSION"
>         return
>     fi
>
>     ICE_PATH="${@icecc_path(bb, d)}"
>     if [ "x${ICE_PATH}" = "x" ]
>     then
>         bbwarn "Cannot use icecc: could not get ICE_PATH"
>         return
>     fi
>
>     ICECC_BIN="${@get_icecc(d)}"
>     if [ -z "${ICECC_BIN}" ]; then
>         bbwarn "Cannot use icecc: icecc binary not found"
>         return
>     fi
>     if [ -z "$(which patchelf patchelf-uninative)" ]; then
>         bbwarn "Cannot use icecc: patchelf not found"
>         return
>     fi
>
>     # Create symlinks to icecc in the recipe-sysroot directory
>     mkdir -p ${ICE_PATH}
>     if [ -n "${KERNEL_CC}" ]; then
>         compilers="${@get_cross_kernel_cc(bb,d)}"
>     else
>         compilers="x86_64-oe-linux-gcc x86_64-oe-linux-g++"
>     fi
>     for compiler in $compilers; do
>         ln -sf ${ICECC_BIN} ${ICE_PATH}/$compiler
>     done
>
>     ICECC_CC="${@icecc_get_and_check_tool(bb, d, "gcc")}"
>     ICECC_CXX="${@icecc_get_and_check_tool(bb, d, "g++")}"
>     # cannot use icecc_get_and_check_tool here because it assumes as
> without target_sys prefix
>     ICECC_WHICH_AS="${@bb.utils.which(os.getenv('PATH'), 'as')}"
>     if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
>     then
>         bbwarn "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
>         return
>     fi
>
>     ICE_VERSION=`$ICECC_CC -dumpversion`
>     ICECC_VERSION=`echo ${ICECC_VERSION} | sed -e "s/@VERSION@
> /$ICE_VERSION/g"`
>     if [ ! -x
> "/build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env"
> ]
>     then
>         bbwarn "Cannot use icecc: invalid ICECC_ENV_EXEC"
>         return
>     fi
>
>     ICECC_AS="`${ICECC_CC} -print-prog-name=as`"
>     # for target recipes should return something like:
>     #
> /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as
>     # and just "as" for native, if it returns "as" in current directory
> (for whatever reason) use "as" from PATH
>     if [ "`dirname "${ICECC_AS}"`" = "." ]
>     then
>         ICECC_AS="${ICECC_WHICH_AS}"
>     fi
>
>     if [ ! -f "${ICECC_VERSION}.done" ]
>     then
>         mkdir -p "`dirname "${ICECC_VERSION}"`"
>
>         # the ICECC_VERSION generation step must be locked by a mutex
>         # in order to prevent race conditions
>         if flock -n "${ICECC_VERSION}.lock" \
>
> /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env
> "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
>         then
>             touch "${ICECC_VERSION}.done"
>         elif ! wait_for_file "${ICECC_VERSION}.done" 30
>         then
>             # locking failed so wait for ${ICECC_VERSION}.done to appear
>             bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
>             return
>         fi
>     fi
>
>     # Don't let ccache find the icecream compiler links that have been
> created, otherwise
>     # it can end up invoking icecream recursively.
>     export CCACHE_PATH="$PATH"
>     export CCACHE_DISABLE="1"
>
>     export ICECC_VERSION ICECC_CC ICECC_CXX
>     export PATH="$ICE_PATH:$PATH"
>
>     bbnote "Using icecc path: $ICE_PATH"
>     bbnote "Using icecc tarball: $ICECC_VERSION"
>  which triggered exception CalledProcessError: Command 'readlink -f
> /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++'
> returned non-zero exit status 1.
>
> ERROR: Task
> (virtual:multilib:lib32:/build/meta-oe/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb:do_patch)
> failed with exit code '1'
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/icecc.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index edb0e10434..63d8b4dfee 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -243,7 +243,11 @@ def icecc_get_external_tool(bb, d, tool):
>
>  def icecc_get_tool_link(tool, d):
>      import subprocess
> -    return subprocess.check_output("readlink -f %s" % tool,
> shell=True).decode("utf-8")[:-1]
> +    try:
> +        return subprocess.check_output("readlink -f %s" % tool,
> shell=True).decode("utf-8")[:-1]
> +    except subprocess.CalledProcessError as e:
> +        bb.note("icecc: one of the tools probably disappeared during
> recipe parsing, cmd readlink -f %s returned %d:\n%s" % (tool, e.returncode,
> e.output.decode("utf-8")))
> +        return tool
>
>  def icecc_get_path_tool(tool, d):
>      # This is a little ugly, but we want to make sure we add an actual
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ff1e2e05908d123a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Looks like &quot;readlink -f&quot; is failing. Can you tr=
y to capture the output and figure out why?</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 20, 2019, 2:04 AM Ma=
rtin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* this might be=
 related to:<br>
=C2=A0 commit d2fcaeb153fdc3f8d7143ea823139f1537055ff1<br>
=C2=A0 Author: Douglas Royds &lt;<a href=3D"mailto:douglas.royds@taitradio.=
com" target=3D"_blank" rel=3D"noreferrer">douglas.royds@taitradio.com</a>&g=
t;<br>
=C2=A0 Date:=C2=A0 =C2=A0Thu Dec 20 11:59:47 2018 +1300<br>
<br>
=C2=A0 =C2=A0 icecc: Don&#39;t generate recipe-sysroot symlinks at recipe-p=
arsing time<br>
<br>
* it&#39;s still a bit unclear when and why this happends, but I&#39;m seei=
ng<br>
=C2=A0 random tasks sometimes failing with:<br>
<br>
WARNING: Exception during build_dependencies for set_icecc_env<br>
WARNING: Error during finalise of /build/meta-oe/meta-python/recipes-devtoo=
ls/python/<a href=3D"http://python-markupsafe_1.0.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">python-markupsafe_1.0.bb</a><br>
ERROR: Traceback (most recent call last):<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line 411, in e=
xpandWithRefs<br>
=C2=A0 =C2=A0 s =3D __expand_python_regexp__.sub(varparse.python_sub, s)<br=
>
=C2=A0 File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line 136, in p=
ython_sub<br>
=C2=A0 =C2=A0 value =3D utils.better_eval(codeobj, DataContext(self.d), {&#=
39;d&#39; : self.d})<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/utils.py&quot;, line 421, in better=
_eval<br>
=C2=A0 =C2=A0 return eval(source, ctx, locals)<br>
=C2=A0 File &quot;Var &lt;set_icecc_env&gt;&quot;, line 1, in &lt;module&gt=
;<br>
=C2=A0 File &quot;/build/oe-core/meta/classes/icecc.bbclass&quot;, line 287=
, in icecc_get_and_check_tool<br>
=C2=A0 =C2=A0 link_path =3D icecc_get_tool_link(t, d)<br>
=C2=A0 File &quot;/build/oe-core/meta/classes/icecc.bbclass&quot;, line 246=
, in icecc_get_tool_link<br>
=C2=A0 =C2=A0 return subprocess.check_output(&quot;readlink -f %s&quot; % t=
ool, shell=3DTrue).decode(&quot;utf-8&quot;)[:-1]<br>
=C2=A0 File &quot;/usr/lib/python3.6/subprocess.py&quot;, line 336, in chec=
k_output<br>
=C2=A0 =C2=A0 **kwargs).stdout<br>
=C2=A0 File &quot;/usr/lib/python3.6/subprocess.py&quot;, line 418, in run<=
br>
=C2=A0 =C2=A0 output=3Dstdout, stderr=3Dstderr)<br>
subprocess.CalledProcessError: Command &#39;readlink -f /build/BUILD/work/q=
emux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_=
64-oe-linux/x86_64-oe-linux-g++&#39; returned non-zero exit status 1.<br>
<br>
The above exception was the direct cause of the following exception:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/build/bitbake/bin/bitbake-worker&quot;, line 239, in chi=
ld<br>
=C2=A0 =C2=A0 the_data =3D bb_cache.loadDataFull(fn, appends)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/cache.py&quot;, line 327, in loadDa=
taFull<br>
=C2=A0 =C2=A0 bb_data =3D self.load_bbfile(virtualfn, appends, virtonly=3DT=
rue)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/cache.py&quot;, line 340, in load_b=
bfile<br>
=C2=A0 =C2=A0 datastores =3D parse_recipe(bb_data, bbfile, appends, mc)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/cache.py&quot;, line 303, in parse_=
recipe<br>
=C2=A0 =C2=A0 bb_data =3D bb.parse.handle(bbfile, bb_data)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/parse/__init__.py&quot;, line 107, =
in handle<br>
=C2=A0 =C2=A0 return h[&#39;handle&#39;](fn, data, include)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/parse/parse_py/BBHandler.py&quot;, =
line 142, in handle<br>
=C2=A0 =C2=A0 return ast.multi_finalize(fn, d)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/parse/ast.py&quot;, line 386, in mu=
lti_finalize<br>
=C2=A0 =C2=A0 finalize(fn, d)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/parse/ast.py&quot;, line 351, in fi=
nalize<br>
=C2=A0 =C2=A0 bb.parse.siggen.finalise(fn, d, variant)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/siggen.py&quot;, line 147, in final=
ise<br>
=C2=A0 =C2=A0 taskdeps =3D self._build_data(fn, d)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/siggen.py&quot;, line 118, in _buil=
d_data<br>
=C2=A0 =C2=A0 tasklist, gendeps, lookupcache =3D bb.data.generate_dependenc=
ies(d)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/data.py&quot;, line 388, in generat=
e_dependencies<br>
=C2=A0 =C2=A0 deps[dep], values[dep] =3D build_dependencies(dep, keys, shel=
ldeps, varflagsexcl, d)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/data.py&quot;, line 317, in build_d=
ependencies<br>
=C2=A0 =C2=A0 value, parsedvar =3D d.getVarFlag(key, &quot;_content&quot;, =
False, retparser=3DTrue)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line 802, in g=
etVarFlag<br>
=C2=A0 =C2=A0 parser =3D self.expandWithRefs(value, cachename)<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line 424, in e=
xpandWithRefs<br>
=C2=A0 =C2=A0 raise ExpansionError(varname, s, exc).with_traceback(tb) from=
 exc<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line 411, in e=
xpandWithRefs<br>
=C2=A0 =C2=A0 s =3D __expand_python_regexp__.sub(varparse.python_sub, s)<br=
>
=C2=A0 File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line 136, in p=
ython_sub<br>
=C2=A0 =C2=A0 value =3D utils.better_eval(codeobj, DataContext(self.d), {&#=
39;d&#39; : self.d})<br>
=C2=A0 File &quot;/build/bitbake/lib/bb/utils.py&quot;, line 421, in better=
_eval<br>
=C2=A0 =C2=A0 return eval(source, ctx, locals)<br>
=C2=A0 File &quot;Var &lt;set_icecc_env&gt;&quot;, line 1, in &lt;module&gt=
;<br>
=C2=A0 File &quot;/build/oe-core/meta/classes/icecc.bbclass&quot;, line 287=
, in icecc_get_and_check_tool<br>
=C2=A0 =C2=A0 link_path =3D icecc_get_tool_link(t, d)<br>
=C2=A0 File &quot;/build/oe-core/meta/classes/icecc.bbclass&quot;, line 246=
, in icecc_get_tool_link<br>
=C2=A0 =C2=A0 return subprocess.check_output(&quot;readlink -f %s&quot; % t=
ool, shell=3DTrue).decode(&quot;utf-8&quot;)[:-1]<br>
=C2=A0 File &quot;/usr/lib/python3.6/subprocess.py&quot;, line 336, in chec=
k_output<br>
=C2=A0 =C2=A0 **kwargs).stdout<br>
=C2=A0 File &quot;/usr/lib/python3.6/subprocess.py&quot;, line 418, in run<=
br>
=C2=A0 =C2=A0 output=3Dstdout, stderr=3Dstderr)<br>
bb.data_smart.ExpansionError: Failure expanding variable set_icecc_env, exp=
ression was=C2=A0 =C2=A0 =C2=A0if [ &quot;${@use_icecc(bb, d)}&quot; =3D &q=
uot;no&quot; ]<br>
=C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 ICECC_VERSION=3D&quot;${@icecc_version(bb, d)}&quot;<br>
=C2=A0 =C2=A0 if [ &quot;x${ICECC_VERSION}&quot; =3D &quot;x&quot; ]<br>
=C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Cannot use icecc: could not get IC=
ECC_VERSION&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 ICE_PATH=3D&quot;${@icecc_path(bb, d)}&quot;<br>
=C2=A0 =C2=A0 if [ &quot;x${ICE_PATH}&quot; =3D &quot;x&quot; ]<br>
=C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Cannot use icecc: could not get IC=
E_PATH&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 ICECC_BIN=3D&quot;${@get_icecc(d)}&quot;<br>
=C2=A0 =C2=A0 if [ -z &quot;${ICECC_BIN}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Cannot use icecc: icecc binary not=
 found&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 if [ -z &quot;$(which patchelf patchelf-uninative)&quot; ]; t=
hen<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Cannot use icecc: patchelf not fou=
nd&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 # Create symlinks to icecc in the recipe-sysroot directory<br=
>
=C2=A0 =C2=A0 mkdir -p ${ICE_PATH}<br>
=C2=A0 =C2=A0 if [ -n &quot;${KERNEL_CC}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compilers=3D&quot;${@get_cross_kernel_cc(bb,d)}=
&quot;<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compilers=3D&quot;x86_64-oe-linux-gcc x86_64-oe=
-linux-g++&quot;<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 for compiler in $compilers; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${ICECC_BIN} ${ICE_PATH}/$compiler<br>
=C2=A0 =C2=A0 done<br>
<br>
=C2=A0 =C2=A0 ICECC_CC=3D&quot;${@icecc_get_and_check_tool(bb, d, &quot;gcc=
&quot;)}&quot;<br>
=C2=A0 =C2=A0 ICECC_CXX=3D&quot;${@icecc_get_and_check_tool(bb, d, &quot;g+=
+&quot;)}&quot;<br>
=C2=A0 =C2=A0 # cannot use icecc_get_and_check_tool here because it assumes=
 as without target_sys prefix<br>
=C2=A0 =C2=A0 ICECC_WHICH_AS=3D&quot;${@bb.utils.which(os.getenv(&#39;PATH&=
#39;), &#39;as&#39;)}&quot;<br>
=C2=A0 =C2=A0 if [ ! -x &quot;${ICECC_CC}&quot; -o ! -x &quot;${ICECC_CXX}&=
quot; ]<br>
=C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Cannot use icecc: could not get IC=
ECC_CC or ICECC_CXX&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 ICE_VERSION=3D`$ICECC_CC -dumpversion`<br>
=C2=A0 =C2=A0 ICECC_VERSION=3D`echo ${ICECC_VERSION} | sed -e &quot;s/@VERS=
ION@/$ICE_VERSION/g&quot;`<br>
=C2=A0 =C2=A0 if [ ! -x &quot;/build/BUILD/work/qemux86-oe-linux/python-mar=
kupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env&quot; ]<br>
=C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Cannot use icecc: invalid ICECC_EN=
V_EXEC&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 ICECC_AS=3D&quot;`${ICECC_CC} -print-prog-name=3Das`&quot;<br=
>
=C2=A0 =C2=A0 # for target recipes should return something like:<br>
=C2=A0 =C2=A0 # /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-o=
e-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as<br>
=C2=A0 =C2=A0 # and just &quot;as&quot; for native, if it returns &quot;as&=
quot; in current directory (for whatever reason) use &quot;as&quot; from PA=
TH<br>
=C2=A0 =C2=A0 if [ &quot;`dirname &quot;${ICECC_AS}&quot;`&quot; =3D &quot;=
.&quot; ]<br>
=C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ICECC_AS=3D&quot;${ICECC_WHICH_AS}&quot;<br>
=C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 if [ ! -f &quot;${ICECC_VERSION}.done&quot; ]<br>
=C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p &quot;`dirname &quot;${ICECC_VERSION}&=
quot;`&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the ICECC_VERSION generation step must be loc=
ked by a mutex<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # in order to prevent race conditions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if flock -n &quot;${ICECC_VERSION}.lock&quot; \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /build/BUILD/work/qemux86-oe-linu=
x/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env=
=C2=A0 &quot;${ICECC_CC}&quot; &quot;${ICECC_CXX}&quot; &quot;${ICECC_AS}&q=
uot; &quot;${ICECC_VERSION}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 touch &quot;${ICECC_VERSION}.done=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif ! wait_for_file &quot;${ICECC_VERSION}.don=
e&quot; 30<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # locking failed so wait for ${IC=
ECC_VERSION}.done to appear<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Timeout waiting for =
${ICECC_VERSION}.done&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 # Don&#39;t let ccache find the icecream compiler links that =
have been created, otherwise<br>
=C2=A0 =C2=A0 # it can end up invoking icecream recursively.<br>
=C2=A0 =C2=A0 export CCACHE_PATH=3D&quot;$PATH&quot;<br>
=C2=A0 =C2=A0 export CCACHE_DISABLE=3D&quot;1&quot;<br>
<br>
=C2=A0 =C2=A0 export ICECC_VERSION ICECC_CC ICECC_CXX<br>
=C2=A0 =C2=A0 export PATH=3D&quot;$ICE_PATH:$PATH&quot;<br>
<br>
=C2=A0 =C2=A0 bbnote &quot;Using icecc path: $ICE_PATH&quot;<br>
=C2=A0 =C2=A0 bbnote &quot;Using icecc tarball: $ICECC_VERSION&quot;<br>
=C2=A0which triggered exception CalledProcessError: Command &#39;readlink -=
f /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroo=
t-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++&#39; returned non-zero=
 exit status 1.<br>
<br>
ERROR: Task (virtual:multilib:lib32:/build/meta-oe/meta-python/recipes-devt=
ools/python/python-markupsafe_1.0.bb:do_patch) failed with exit code &#39;1=
&#39;<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/icecc.bbclass | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass<br>
index edb0e10434..63d8b4dfee 100644<br>
--- a/meta/classes/icecc.bbclass<br>
+++ b/meta/classes/icecc.bbclass<br>
@@ -243,7 +243,11 @@ def icecc_get_external_tool(bb, d, tool):<br>
<br>
=C2=A0def icecc_get_tool_link(tool, d):<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
-=C2=A0 =C2=A0 return subprocess.check_output(&quot;readlink -f %s&quot; % =
tool, shell=3DTrue).decode(&quot;utf-8&quot;)[:-1]<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return subprocess.check_output(&quot;readlink =
-f %s&quot; % tool, shell=3DTrue).decode(&quot;utf-8&quot;)[:-1]<br>
+=C2=A0 =C2=A0 except subprocess.CalledProcessError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;icecc: one of the tools probably=
 disappeared during recipe parsing, cmd readlink -f %s returned %d:\n%s&quo=
t; % (tool, e.returncode, e.output.decode(&quot;utf-8&quot;)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return tool<br>
<br>
=C2=A0def icecc_get_path_tool(tool, d):<br>
=C2=A0 =C2=A0 =C2=A0# This is a little ugly, but we want to make sure we ad=
d an actual<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ff1e2e05908d123a--
