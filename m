Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9BF7CE21
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 17:01:54 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id r12so15201852edo.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 10:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CQab11zhKkPGXtXzDUK1SzWIf/NchLe1y3yF7nYx8gE=;
	b=n9ge6QWekG35WeYN6+JaAgrSj/4XBVM+x4dieKAufNR9Fny9lve+NGNYIANrrVyR2g
	5SFZw6KFk0dfQIsAeW9HR1Uv5kLngnom4zUsWQ5vleSYh8I6Sepe6UIdKc9Pz0ryfIDG
	Iw0N5S5MAs4eN1Ys0lc2ygZgp2UIQT7A9ANfsPursSUTaz6hxW4hYfPfg7tPKTJZSO22
	+sCI/xUSvDcuSySbuNWGlQMP8YiOMGJ7tIN33Yvl1uaMmu466zGOr4081n2xlCsyKLtT
	NfBTx7SOYUdjSR/PwoJ5f8FippqZdOyRukc2iQWPXv41YVu63I0Us4fR1+kCTAK9YjTC
	XZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CQab11zhKkPGXtXzDUK1SzWIf/NchLe1y3yF7nYx8gE=;
	b=ebGImidgoEsflJhiE1nUonY7bf1VmoF9K3YNnauPkwbIZwsmff79jwMsPUg4F4tw8l
	sIbN2zni+BEqfsneXIkIdXLZgJ/eS05dFC6ktWmZNDOYN0lcHQhJRAoKaxnHK12q/3Aq
	B5+rSAxbavOgrmbFqfOkOOdXOKjuppB13P351pe6KRz2KWl2yELyMM0uOO7ACIl4hsFS
	lz0pg5cZA1bqUppOJAKjZn8A8wTo884VKMJnPTbwwDsqTVCUlmAvuG5qll9u4n8+qD6Z
	QJQNls3z/6CbOeUjAXlI8Um08F/+iqUccuHpeUUuQnm4X8Cy3L6B8L/W7tBpK7jZHqec
	lY6w==
X-Gm-Message-State: APjAAAVODyCOM4VU1gUEaQVGqoJs2MumqmiWXfBpUf/WfG270xx2Ok5G
	udC6NQWVEoTYp6tPaFg1j3JXuoYVXbbnCDxD12Q=
X-Google-Smtp-Source: APXvYqwJGkuj0x/bveNoV9PlaIUwViLuxGcTnJ2jkxSN6ekD94LRqzww3EAAI3FS/jBW0lmRNUxNSHMgbOXJDFizzGk=
X-Received: by 2002:a50:b155:: with SMTP id l21mr20526015edd.186.1562605314804;
	Mon, 08 Jul 2019 10:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190708100535.937-1-Martin.Jansa@gmail.com>
	<f084f105-c51c-0d45-ee30-2f1ae394057a@gmail.com>
In-Reply-To: <f084f105-c51c-0d45-ee30-2f1ae394057a@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Jul 2019 19:01:43 +0200
Message-ID: <CA+chaQeeGj0gr7ZiR-6At2U2wM00AmBs86h24tNGTjZUtB-8Nw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] icecc.bbclass: catch subprocess.CalledProcessError
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
X-List-Received-Date: Mon, 08 Jul 2019 17:01:54 -0000
Content-Type: multipart/alternative; boundary="000000000000b68e4a058d2e66a7"

--000000000000b68e4a058d2e66a7
Content-Type: text/plain; charset="UTF-8"

Yes, I'm seeing it with thud, warrior and master.

On Mon, Jul 8, 2019 at 6:02 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 7/8/19 3:05 AM, Martin Jansa wrote:
> > * this might be related to:
> >   commit d2fcaeb153fdc3f8d7143ea823139f1537055ff1
> >   Author: Douglas Royds <douglas.royds@taitradio.com>
> >   Date:   Thu Dec 20 11:59:47 2018 +1300
> >
> >     icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time
> >
> > * it's still a bit unclear when and why this happends, but I'm seeing
> >   random tasks sometimes failing with:
>
> this commit goes back to thud.  Have you seen this on a stable branch?
>
> - armin
> >
> > WARNING: Exception during build_dependencies for set_icecc_env
> > WARNING: Error during finalise of
> /build/meta-oe/meta-python/recipes-devtools/python/
> python-markupsafe_1.0.bb
> > ERROR: Traceback (most recent call last):
> >   File "/build/bitbake/lib/bb/data_smart.py", line 411, in expandWithRefs
> >     s = __expand_python_regexp__.sub(varparse.python_sub, s)
> >   File "/build/bitbake/lib/bb/data_smart.py", line 136, in python_sub
> >     value = utils.better_eval(codeobj, DataContext(self.d), {'d' :
> self.d})
> >   File "/build/bitbake/lib/bb/utils.py", line 421, in better_eval
> >     return eval(source, ctx, locals)
> >   File "Var <set_icecc_env>", line 1, in <module>
> >   File "/build/oe-core/meta/classes/icecc.bbclass", line 287, in
> icecc_get_and_check_tool
> >     link_path = icecc_get_tool_link(t, d)
> >   File "/build/oe-core/meta/classes/icecc.bbclass", line 246, in
> icecc_get_tool_link
> >     return subprocess.check_output("readlink -f %s" % tool,
> shell=True).decode("utf-8")[:-1]
> >   File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
> >     **kwargs).stdout
> >   File "/usr/lib/python3.6/subprocess.py", line 418, in run
> >     output=stdout, stderr=stderr)
> > subprocess.CalledProcessError: Command 'readlink -f
> /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++'
> returned non-zero exit status 1.
> >
> > The above exception was the direct cause of the following exception:
> >
> > Traceback (most recent call last):
> >   File "/build/bitbake/bin/bitbake-worker", line 239, in child
> >     the_data = bb_cache.loadDataFull(fn, appends)
> >   File "/build/bitbake/lib/bb/cache.py", line 327, in loadDataFull
> >     bb_data = self.load_bbfile(virtualfn, appends, virtonly=True)
> >   File "/build/bitbake/lib/bb/cache.py", line 340, in load_bbfile
> >     datastores = parse_recipe(bb_data, bbfile, appends, mc)
> >   File "/build/bitbake/lib/bb/cache.py", line 303, in parse_recipe
> >     bb_data = bb.parse.handle(bbfile, bb_data)
> >   File "/build/bitbake/lib/bb/parse/__init__.py", line 107, in handle
> >     return h['handle'](fn, data, include)
> >   File "/build/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 142, in
> handle
> >     return ast.multi_finalize(fn, d)
> >   File "/build/bitbake/lib/bb/parse/ast.py", line 386, in multi_finalize
> >     finalize(fn, d)
> >   File "/build/bitbake/lib/bb/parse/ast.py", line 351, in finalize
> >     bb.parse.siggen.finalise(fn, d, variant)
> >   File "/build/bitbake/lib/bb/siggen.py", line 147, in finalise
> >     taskdeps = self._build_data(fn, d)
> >   File "/build/bitbake/lib/bb/siggen.py", line 118, in _build_data
> >     tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)
> >   File "/build/bitbake/lib/bb/data.py", line 388, in
> generate_dependencies
> >     deps[dep], values[dep] = build_dependencies(dep, keys, shelldeps,
> varflagsexcl, d)
> >   File "/build/bitbake/lib/bb/data.py", line 317, in build_dependencies
> >     value, parsedvar = d.getVarFlag(key, "_content", False,
> retparser=True)
> >   File "/build/bitbake/lib/bb/data_smart.py", line 802, in getVarFlag
> >     parser = self.expandWithRefs(value, cachename)
> >   File "/build/bitbake/lib/bb/data_smart.py", line 424, in expandWithRefs
> >     raise ExpansionError(varname, s, exc).with_traceback(tb) from exc
> >   File "/build/bitbake/lib/bb/data_smart.py", line 411, in expandWithRefs
> >     s = __expand_python_regexp__.sub(varparse.python_sub, s)
> >   File "/build/bitbake/lib/bb/data_smart.py", line 136, in python_sub
> >     value = utils.better_eval(codeobj, DataContext(self.d), {'d' :
> self.d})
> >   File "/build/bitbake/lib/bb/utils.py", line 421, in better_eval
> >     return eval(source, ctx, locals)
> >   File "Var <set_icecc_env>", line 1, in <module>
> >   File "/build/oe-core/meta/classes/icecc.bbclass", line 287, in
> icecc_get_and_check_tool
> >     link_path = icecc_get_tool_link(t, d)
> >   File "/build/oe-core/meta/classes/icecc.bbclass", line 246, in
> icecc_get_tool_link
> >     return subprocess.check_output("readlink -f %s" % tool,
> shell=True).decode("utf-8")[:-1]
> >   File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
> >     **kwargs).stdout
> >   File "/usr/lib/python3.6/subprocess.py", line 418, in run
> >     output=stdout, stderr=stderr)
> > bb.data_smart.ExpansionError: Failure expanding variable set_icecc_env,
> expression was     if [ "${@use_icecc(bb, d)}" = "no" ]
> >     then
> >         return
> >     fi
> >     ICECC_VERSION="${@icecc_version(bb, d)}"
> >     if [ "x${ICECC_VERSION}" = "x" ]
> >     then
> >         bbwarn "Cannot use icecc: could not get ICECC_VERSION"
> >         return
> >     fi
> >
> >     ICE_PATH="${@icecc_path(bb, d)}"
> >     if [ "x${ICE_PATH}" = "x" ]
> >     then
> >         bbwarn "Cannot use icecc: could not get ICE_PATH"
> >         return
> >     fi
> >
> >     ICECC_BIN="${@get_icecc(d)}"
> >     if [ -z "${ICECC_BIN}" ]; then
> >         bbwarn "Cannot use icecc: icecc binary not found"
> >         return
> >     fi
> >     if [ -z "$(which patchelf patchelf-uninative)" ]; then
> >         bbwarn "Cannot use icecc: patchelf not found"
> >         return
> >     fi
> >
> >     # Create symlinks to icecc in the recipe-sysroot directory
> >     mkdir -p ${ICE_PATH}
> >     if [ -n "${KERNEL_CC}" ]; then
> >         compilers="${@get_cross_kernel_cc(bb,d)}"
> >     else
> >         compilers="x86_64-oe-linux-gcc x86_64-oe-linux-g++"
> >     fi
> >     for compiler in $compilers; do
> >         ln -sf ${ICECC_BIN} ${ICE_PATH}/$compiler
> >     done
> >
> >     ICECC_CC="${@icecc_get_and_check_tool(bb, d, "gcc")}"
> >     ICECC_CXX="${@icecc_get_and_check_tool(bb, d, "g++")}"
> >     # cannot use icecc_get_and_check_tool here because it assumes as
> without target_sys prefix
> >     ICECC_WHICH_AS="${@bb.utils.which(os.getenv('PATH'), 'as')}"
> >     if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
> >     then
> >         bbwarn "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
> >         return
> >     fi
> >
> >     ICE_VERSION=`$ICECC_CC -dumpversion`
> >     ICECC_VERSION=`echo ${ICECC_VERSION} | sed -e "s/@VERSION@
> /$ICE_VERSION/g"`
> >     if [ ! -x
> "/build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env"
> ]
> >     then
> >         bbwarn "Cannot use icecc: invalid ICECC_ENV_EXEC"
> >         return
> >     fi
> >
> >     ICECC_AS="`${ICECC_CC} -print-prog-name=as`"
> >     # for target recipes should return something like:
> >     #
> /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as
> >     # and just "as" for native, if it returns "as" in current directory
> (for whatever reason) use "as" from PATH
> >     if [ "`dirname "${ICECC_AS}"`" = "." ]
> >     then
> >         ICECC_AS="${ICECC_WHICH_AS}"
> >     fi
> >
> >     if [ ! -f "${ICECC_VERSION}.done" ]
> >     then
> >         mkdir -p "`dirname "${ICECC_VERSION}"`"
> >
> >         # the ICECC_VERSION generation step must be locked by a mutex
> >         # in order to prevent race conditions
> >         if flock -n "${ICECC_VERSION}.lock" \
> >
>  /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env
> "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
> >         then
> >             touch "${ICECC_VERSION}.done"
> >         elif ! wait_for_file "${ICECC_VERSION}.done" 30
> >         then
> >             # locking failed so wait for ${ICECC_VERSION}.done to appear
> >             bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
> >             return
> >         fi
> >     fi
> >
> >     # Don't let ccache find the icecream compiler links that have been
> created, otherwise
> >     # it can end up invoking icecream recursively.
> >     export CCACHE_PATH="$PATH"
> >     export CCACHE_DISABLE="1"
> >
> >     export ICECC_VERSION ICECC_CC ICECC_CXX
> >     export PATH="$ICE_PATH:$PATH"
> >
> >     bbnote "Using icecc path: $ICE_PATH"
> >     bbnote "Using icecc tarball: $ICECC_VERSION"
> >  which triggered exception CalledProcessError: Command 'readlink -f
> /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++'
> returned non-zero exit status 1.
> >
> > ERROR: Task
> (virtual:multilib:lib32:/build/meta-oe/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb:do_patch)
> failed with exit code '1'
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/icecc.bbclass | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > index edb0e10434..63d8b4dfee 100644
> > --- a/meta/classes/icecc.bbclass
> > +++ b/meta/classes/icecc.bbclass
> > @@ -243,7 +243,11 @@ def icecc_get_external_tool(bb, d, tool):
> >
> >  def icecc_get_tool_link(tool, d):
> >      import subprocess
> > -    return subprocess.check_output("readlink -f %s" % tool,
> shell=True).decode("utf-8")[:-1]
> > +    try:
> > +        return subprocess.check_output("readlink -f %s" % tool,
> shell=True).decode("utf-8")[:-1]
> > +    except subprocess.CalledProcessError as e:
> > +        bb.note("icecc: one of the tools probably disappeared during
> recipe parsing, cmd readlink -f %s returned %d:\n%s" % (tool, e.returncode,
> e.output.decode("utf-8")))
> > +        return tool
> >
> >  def icecc_get_path_tool(tool, d):
> >      # This is a little ugly, but we want to make sure we add an actual
>
>

--000000000000b68e4a058d2e66a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, I&#39;m seeing it with thud, warrior and master.</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Jul 8, 2019 at 6:02 PM akuster808 &lt;<a href=3D"mailto:akuster808@gmail=
.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
<br>
On 7/8/19 3:05 AM, Martin Jansa wrote:<br>
&gt; * this might be related to:<br>
&gt;=C2=A0 =C2=A0commit d2fcaeb153fdc3f8d7143ea823139f1537055ff1<br>
&gt;=C2=A0 =C2=A0Author: Douglas Royds &lt;<a href=3D"mailto:douglas.royds@=
taitradio.com" target=3D"_blank">douglas.royds@taitradio.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date:=C2=A0 =C2=A0Thu Dec 20 11:59:47 2018 +1300<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0icecc: Don&#39;t generate recipe-sysroot symlinks a=
t recipe-parsing time<br>
&gt;<br>
&gt; * it&#39;s still a bit unclear when and why this happends, but I&#39;m=
 seeing<br>
&gt;=C2=A0 =C2=A0random tasks sometimes failing with:<br>
<br>
this commit goes back to thud.=C2=A0 Have you seen this on a stable branch?=
<br>
<br>
- armin<br>
&gt;<br>
&gt; WARNING: Exception during build_dependencies for set_icecc_env<br>
&gt; WARNING: Error during finalise of /build/meta-oe/meta-python/recipes-d=
evtools/python/<a href=3D"http://python-markupsafe_1.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python-markupsafe_1.0.bb</a><br>
&gt; ERROR: Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line=
 411, in expandWithRefs<br>
&gt;=C2=A0 =C2=A0 =C2=A0s =3D __expand_python_regexp__.sub(varparse.python_=
sub, s)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line=
 136, in python_sub<br>
&gt;=C2=A0 =C2=A0 =C2=A0value =3D utils.better_eval(codeobj, DataContext(se=
lf.d), {&#39;d&#39; : self.d})<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/utils.py&quot;, line 421,=
 in better_eval<br>
&gt;=C2=A0 =C2=A0 =C2=A0return eval(source, ctx, locals)<br>
&gt;=C2=A0 =C2=A0File &quot;Var &lt;set_icecc_env&gt;&quot;, line 1, in &lt=
;module&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/build/oe-core/meta/classes/icecc.bbclass&quot;=
, line 287, in icecc_get_and_check_tool<br>
&gt;=C2=A0 =C2=A0 =C2=A0link_path =3D icecc_get_tool_link(t, d)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/oe-core/meta/classes/icecc.bbclass&quot;=
, line 246, in icecc_get_tool_link<br>
&gt;=C2=A0 =C2=A0 =C2=A0return subprocess.check_output(&quot;readlink -f %s=
&quot; % tool, shell=3DTrue).decode(&quot;utf-8&quot;)[:-1]<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.6/subprocess.py&quot;, line 33=
6, in check_output<br>
&gt;=C2=A0 =C2=A0 =C2=A0**kwargs).stdout<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.6/subprocess.py&quot;, line 41=
8, in run<br>
&gt;=C2=A0 =C2=A0 =C2=A0output=3Dstdout, stderr=3Dstderr)<br>
&gt; subprocess.CalledProcessError: Command &#39;readlink -f /build/BUILD/w=
ork/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin=
/x86_64-oe-linux/x86_64-oe-linux-g++&#39; returned non-zero exit status 1.<=
br>
&gt;<br>
&gt; The above exception was the direct cause of the following exception:<b=
r>
&gt;<br>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/bin/bitbake-worker&quot;, line 2=
39, in child<br>
&gt;=C2=A0 =C2=A0 =C2=A0the_data =3D bb_cache.loadDataFull(fn, appends)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/cache.py&quot;, line 327,=
 in loadDataFull<br>
&gt;=C2=A0 =C2=A0 =C2=A0bb_data =3D self.load_bbfile(virtualfn, appends, vi=
rtonly=3DTrue)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/cache.py&quot;, line 340,=
 in load_bbfile<br>
&gt;=C2=A0 =C2=A0 =C2=A0datastores =3D parse_recipe(bb_data, bbfile, append=
s, mc)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/cache.py&quot;, line 303,=
 in parse_recipe<br>
&gt;=C2=A0 =C2=A0 =C2=A0bb_data =3D bb.parse.handle(bbfile, bb_data)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/parse/__init__.py&quot;, =
line 107, in handle<br>
&gt;=C2=A0 =C2=A0 =C2=A0return h[&#39;handle&#39;](fn, data, include)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/parse/parse_py/BBHandler.=
py&quot;, line 142, in handle<br>
&gt;=C2=A0 =C2=A0 =C2=A0return ast.multi_finalize(fn, d)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/parse/ast.py&quot;, line =
386, in multi_finalize<br>
&gt;=C2=A0 =C2=A0 =C2=A0finalize(fn, d)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/parse/ast.py&quot;, line =
351, in finalize<br>
&gt;=C2=A0 =C2=A0 =C2=A0bb.parse.siggen.finalise(fn, d, variant)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/siggen.py&quot;, line 147=
, in finalise<br>
&gt;=C2=A0 =C2=A0 =C2=A0taskdeps =3D self._build_data(fn, d)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/siggen.py&quot;, line 118=
, in _build_data<br>
&gt;=C2=A0 =C2=A0 =C2=A0tasklist, gendeps, lookupcache =3D bb.data.generate=
_dependencies(d)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/data.py&quot;, line 388, =
in generate_dependencies<br>
&gt;=C2=A0 =C2=A0 =C2=A0deps[dep], values[dep] =3D build_dependencies(dep, =
keys, shelldeps, varflagsexcl, d)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/data.py&quot;, line 317, =
in build_dependencies<br>
&gt;=C2=A0 =C2=A0 =C2=A0value, parsedvar =3D d.getVarFlag(key, &quot;_conte=
nt&quot;, False, retparser=3DTrue)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line=
 802, in getVarFlag<br>
&gt;=C2=A0 =C2=A0 =C2=A0parser =3D self.expandWithRefs(value, cachename)<br=
>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line=
 424, in expandWithRefs<br>
&gt;=C2=A0 =C2=A0 =C2=A0raise ExpansionError(varname, s, exc).with_tracebac=
k(tb) from exc<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line=
 411, in expandWithRefs<br>
&gt;=C2=A0 =C2=A0 =C2=A0s =3D __expand_python_regexp__.sub(varparse.python_=
sub, s)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/data_smart.py&quot;, line=
 136, in python_sub<br>
&gt;=C2=A0 =C2=A0 =C2=A0value =3D utils.better_eval(codeobj, DataContext(se=
lf.d), {&#39;d&#39; : self.d})<br>
&gt;=C2=A0 =C2=A0File &quot;/build/bitbake/lib/bb/utils.py&quot;, line 421,=
 in better_eval<br>
&gt;=C2=A0 =C2=A0 =C2=A0return eval(source, ctx, locals)<br>
&gt;=C2=A0 =C2=A0File &quot;Var &lt;set_icecc_env&gt;&quot;, line 1, in &lt=
;module&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/build/oe-core/meta/classes/icecc.bbclass&quot;=
, line 287, in icecc_get_and_check_tool<br>
&gt;=C2=A0 =C2=A0 =C2=A0link_path =3D icecc_get_tool_link(t, d)<br>
&gt;=C2=A0 =C2=A0File &quot;/build/oe-core/meta/classes/icecc.bbclass&quot;=
, line 246, in icecc_get_tool_link<br>
&gt;=C2=A0 =C2=A0 =C2=A0return subprocess.check_output(&quot;readlink -f %s=
&quot; % tool, shell=3DTrue).decode(&quot;utf-8&quot;)[:-1]<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.6/subprocess.py&quot;, line 33=
6, in check_output<br>
&gt;=C2=A0 =C2=A0 =C2=A0**kwargs).stdout<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.6/subprocess.py&quot;, line 41=
8, in run<br>
&gt;=C2=A0 =C2=A0 =C2=A0output=3Dstdout, stderr=3Dstderr)<br>
&gt; bb.data_smart.ExpansionError: Failure expanding variable set_icecc_env=
, expression was=C2=A0 =C2=A0 =C2=A0if [ &quot;${@use_icecc(bb, d)}&quot; =
=3D &quot;no&quot; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0ICECC_VERSION=3D&quot;${@icecc_version(bb, d)}&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if [ &quot;x${ICECC_VERSION}&quot; =3D &quot;x&quot=
; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Cannot use icecc: could =
not get ICECC_VERSION&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ICE_PATH=3D&quot;${@icecc_path(bb, d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if [ &quot;x${ICE_PATH}&quot; =3D &quot;x&quot; ]<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Cannot use icecc: could =
not get ICE_PATH&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ICECC_BIN=3D&quot;${@get_icecc(d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if [ -z &quot;${ICECC_BIN}&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Cannot use icecc: icecc =
binary not found&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0if [ -z &quot;$(which patchelf patchelf-uninative)&=
quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Cannot use icecc: patche=
lf not found&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0# Create symlinks to icecc in the recipe-sysroot di=
rectory<br>
&gt;=C2=A0 =C2=A0 =C2=A0mkdir -p ${ICE_PATH}<br>
&gt;=C2=A0 =C2=A0 =C2=A0if [ -n &quot;${KERNEL_CC}&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compilers=3D&quot;${@get_cross_kernel=
_cc(bb,d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compilers=3D&quot;x86_64-oe-linux-gcc=
 x86_64-oe-linux-g++&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0for compiler in $compilers; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${ICECC_BIN} ${ICE_PATH}/$comp=
iler<br>
&gt;=C2=A0 =C2=A0 =C2=A0done<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ICECC_CC=3D&quot;${@icecc_get_and_check_tool(bb, d,=
 &quot;gcc&quot;)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ICECC_CXX=3D&quot;${@icecc_get_and_check_tool(bb, d=
, &quot;g++&quot;)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0# cannot use icecc_get_and_check_tool here because =
it assumes as without target_sys prefix<br>
&gt;=C2=A0 =C2=A0 =C2=A0ICECC_WHICH_AS=3D&quot;${@bb.utils.which(os.getenv(=
&#39;PATH&#39;), &#39;as&#39;)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if [ ! -x &quot;${ICECC_CC}&quot; -o ! -x &quot;${I=
CECC_CXX}&quot; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Cannot use icecc: could =
not get ICECC_CC or ICECC_CXX&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ICE_VERSION=3D`$ICECC_CC -dumpversion`<br>
&gt;=C2=A0 =C2=A0 =C2=A0ICECC_VERSION=3D`echo ${ICECC_VERSION} | sed -e &qu=
ot;s/@VERSION@/$ICE_VERSION/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0if [ ! -x &quot;/build/BUILD/work/qemux86-oe-linux/=
python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env&quo=
t; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Cannot use icecc: invali=
d ICECC_ENV_EXEC&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ICECC_AS=3D&quot;`${ICECC_CC} -print-prog-name=3Das=
`&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0# for target recipes should return something like:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0# /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/=
arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as<br>
&gt;=C2=A0 =C2=A0 =C2=A0# and just &quot;as&quot; for native, if it returns=
 &quot;as&quot; in current directory (for whatever reason) use &quot;as&quo=
t; from PATH<br>
&gt;=C2=A0 =C2=A0 =C2=A0if [ &quot;`dirname &quot;${ICECC_AS}&quot;`&quot; =
=3D &quot;.&quot; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ICECC_AS=3D&quot;${ICECC_WHICH_AS}&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if [ ! -f &quot;${ICECC_VERSION}.done&quot; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;`dirname &quot;${ICECC=
_VERSION}&quot;`&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# the ICECC_VERSION generation step m=
ust be locked by a mutex<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# in order to prevent race conditions=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if flock -n &quot;${ICECC_VERSION}.lo=
ck&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/build/BUILD/work/qemux=
86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-cr=
eate-env=C2=A0 &quot;${ICECC_CC}&quot; &quot;${ICECC_CXX}&quot; &quot;${ICE=
CC_AS}&quot; &quot;${ICECC_VERSION}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch &quot;${ICECC_VER=
SION}.done&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif ! wait_for_file &quot;${ICECC_VE=
RSION}.done&quot; 30<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# locking failed so wai=
t for ${ICECC_VERSION}.done to appear<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Timeout wa=
iting for ${ICECC_VERSION}.done&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0# Don&#39;t let ccache find the icecream compiler l=
inks that have been created, otherwise<br>
&gt;=C2=A0 =C2=A0 =C2=A0# it can end up invoking icecream recursively.<br>
&gt;=C2=A0 =C2=A0 =C2=A0export CCACHE_PATH=3D&quot;$PATH&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0export CCACHE_DISABLE=3D&quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0export ICECC_VERSION ICECC_CC ICECC_CXX<br>
&gt;=C2=A0 =C2=A0 =C2=A0export PATH=3D&quot;$ICE_PATH:$PATH&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0bbnote &quot;Using icecc path: $ICE_PATH&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0bbnote &quot;Using icecc tarball: $ICECC_VERSION&qu=
ot;<br>
&gt;=C2=A0 which triggered exception CalledProcessError: Command &#39;readl=
ink -f /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-s=
ysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++&#39; returned non=
-zero exit status 1.<br>
&gt;<br>
&gt; ERROR: Task (virtual:multilib:lib32:/build/meta-oe/meta-python/recipes=
-devtools/python/python-markupsafe_1.0.bb:do_patch) failed with exit code &=
#39;1&#39;<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/icecc.bbclass | 6 +++++-<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass<b=
r>
&gt; index edb0e10434..63d8b4dfee 100644<br>
&gt; --- a/meta/classes/icecc.bbclass<br>
&gt; +++ b/meta/classes/icecc.bbclass<br>
&gt; @@ -243,7 +243,11 @@ def icecc_get_external_tool(bb, d, tool):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def icecc_get_tool_link(tool, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import subprocess<br>
&gt; -=C2=A0 =C2=A0 return subprocess.check_output(&quot;readlink -f %s&quo=
t; % tool, shell=3DTrue).decode(&quot;utf-8&quot;)[:-1]<br>
&gt; +=C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return subprocess.check_output(&quot;read=
link -f %s&quot; % tool, shell=3DTrue).decode(&quot;utf-8&quot;)[:-1]<br>
&gt; +=C2=A0 =C2=A0 except subprocess.CalledProcessError as e:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;icecc: one of the tools pro=
bably disappeared during recipe parsing, cmd readlink -f %s returned %d:\n%=
s&quot; % (tool, e.returncode, e.output.decode(&quot;utf-8&quot;)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return tool<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def icecc_get_path_tool(tool, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # This is a little ugly, but we want to make sure =
we add an actual<br>
<br>
</blockquote></div>

--000000000000b68e4a058d2e66a7--
