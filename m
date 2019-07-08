Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 12F047997D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 16:02:11 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b3so5196244plr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RU4WOmnE1kVQdu0HRZ9CszgXZRjW7xCPLAMVNHHlvGY=;
	b=GRqkh0pHB8lEQWXcMrX6AKP2ADtXVgcE2+FT9dFb7dUoHx5AhgjH31uAfatGN4Laoh
	bV5oopLkfcKqfHKOCMXslFn56uV9xUSxypDYWQ3M9rbAcXGlYdizHblmEf5CZPXQqjZ8
	NQRcbA/dSdU/YyJ4ydNM7KUYth54U1Gy0bmosLPvrOLj1SI75tWDXhvtZSMX9neurrVt
	ouiU3KsBjnD9gRXkRYYvBcIVCsaluncjUC2FkLUjI7Q0aYyH2VXGWYihP8s172smsKa2
	5juQhlQsKu6Eqn8BWpW4LZqsesPOunB+GTVyTtDG+8/72iNwxiD6pHcLFWO57wP21eyH
	492A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=RU4WOmnE1kVQdu0HRZ9CszgXZRjW7xCPLAMVNHHlvGY=;
	b=SQ4FDxAwL+CHKkbGKRxUP92zKn6/tgpNuqdSNeSh9xEHg9DQsuiiGjlPekw4TbYilI
	j88Mj/tnWM6RKb1ZL8gv1p2FJ35pmglglWeBYz20iSikgPAvegpvh099p19Fv6E6tqP6
	scubYsMspdsHNcwMjpzuXMe7QmRsD4eGGriBRwTLBWanLvn0Fdlb0x5Z2v8y5E6k7ARZ
	yI3Znx6a+UoqtsMomYefE+hdcL5D+UgLzqiDEVgSPoh+DZ0fogP+Y1GDMoMxnohE0UaU
	WIeNM/A7vgimrKH3pB3SvpEgSjYLAkDK0+SKmD/YoIBOClyzXcELdAflHSlHRZnJcNLf
	9fWQ==
X-Gm-Message-State: APjAAAXcNflNYoF7ufGciarSSvf2cpw4uELBWARw1FCGfikgATmWxYzr
	u2XuUsbaBp6gCnvhGRDUo4BbVVvb9j4=
X-Google-Smtp-Source: APXvYqyRwLz3kajeGPhBsQib3vIOl1m4qWfo+NdXMJU3iE6HceGBZfMHsj7DLNZ31QKwKIXR9jgVOA==
X-Received: by 2002:a17:902:a60d:: with SMTP id
	u13mr26130193plq.144.1562601732859; 
	Mon, 08 Jul 2019 09:02:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:693b:41d3:261b:3345?
	([2601:202:4180:c33:693b:41d3:261b:3345])
	by smtp.gmail.com with ESMTPSA id
	g2sm14202430pfq.88.2019.07.08.09.02.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jul 2019 09:02:12 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190708100535.937-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f084f105-c51c-0d45-ee30-2f1ae394057a@gmail.com>
Date: Mon, 8 Jul 2019 09:02:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708100535.937-1-Martin.Jansa@gmail.com>
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
X-List-Received-Date: Mon, 08 Jul 2019 16:02:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/8/19 3:05 AM, Martin Jansa wrote:
> * this might be related to:
>   commit d2fcaeb153fdc3f8d7143ea823139f1537055ff1
>   Author: Douglas Royds <douglas.royds@taitradio.com>
>   Date:   Thu Dec 20 11:59:47 2018 +1300
>
>     icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time
>
> * it's still a bit unclear when and why this happends, but I'm seeing
>   random tasks sometimes failing with:

this commit goes back to thud.  Have you seen this on a stable branch?

- armin
>
> WARNING: Exception during build_dependencies for set_icecc_env
> WARNING: Error during finalise of /build/meta-oe/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
> ERROR: Traceback (most recent call last):
>   File "/build/bitbake/lib/bb/data_smart.py", line 411, in expandWithRefs
>     s = __expand_python_regexp__.sub(varparse.python_sub, s)
>   File "/build/bitbake/lib/bb/data_smart.py", line 136, in python_sub
>     value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
>   File "/build/bitbake/lib/bb/utils.py", line 421, in better_eval
>     return eval(source, ctx, locals)
>   File "Var <set_icecc_env>", line 1, in <module>
>   File "/build/oe-core/meta/classes/icecc.bbclass", line 287, in icecc_get_and_check_tool
>     link_path = icecc_get_tool_link(t, d)
>   File "/build/oe-core/meta/classes/icecc.bbclass", line 246, in icecc_get_tool_link
>     return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
>   File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
>     **kwargs).stdout
>   File "/usr/lib/python3.6/subprocess.py", line 418, in run
>     output=stdout, stderr=stderr)
> subprocess.CalledProcessError: Command 'readlink -f /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++' returned non-zero exit status 1.
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
>   File "/build/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 142, in handle
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
>     deps[dep], values[dep] = build_dependencies(dep, keys, shelldeps, varflagsexcl, d)
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
>   File "/build/oe-core/meta/classes/icecc.bbclass", line 287, in icecc_get_and_check_tool
>     link_path = icecc_get_tool_link(t, d)
>   File "/build/oe-core/meta/classes/icecc.bbclass", line 246, in icecc_get_tool_link
>     return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
>   File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
>     **kwargs).stdout
>   File "/usr/lib/python3.6/subprocess.py", line 418, in run
>     output=stdout, stderr=stderr)
> bb.data_smart.ExpansionError: Failure expanding variable set_icecc_env, expression was     if [ "${@use_icecc(bb, d)}" = "no" ]
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
>     # cannot use icecc_get_and_check_tool here because it assumes as without target_sys prefix
>     ICECC_WHICH_AS="${@bb.utils.which(os.getenv('PATH'), 'as')}"
>     if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
>     then
>         bbwarn "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
>         return
>     fi
>
>     ICE_VERSION=`$ICECC_CC -dumpversion`
>     ICECC_VERSION=`echo ${ICECC_VERSION} | sed -e "s/@VERSION@/$ICE_VERSION/g"`
>     if [ ! -x "/build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env" ]
>     then
>         bbwarn "Cannot use icecc: invalid ICECC_ENV_EXEC"
>         return
>     fi
>
>     ICECC_AS="`${ICECC_CC} -print-prog-name=as`"
>     # for target recipes should return something like:
>     # /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as
>     # and just "as" for native, if it returns "as" in current directory (for whatever reason) use "as" from PATH
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
>             /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env  "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
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
>     # Don't let ccache find the icecream compiler links that have been created, otherwise
>     # it can end up invoking icecream recursively.
>     export CCACHE_PATH="$PATH"
>     export CCACHE_DISABLE="1"
>
>     export ICECC_VERSION ICECC_CC ICECC_CXX
>     export PATH="$ICE_PATH:$PATH"
>
>     bbnote "Using icecc path: $ICE_PATH"
>     bbnote "Using icecc tarball: $ICECC_VERSION"
>  which triggered exception CalledProcessError: Command 'readlink -f /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++' returned non-zero exit status 1.
>
> ERROR: Task (virtual:multilib:lib32:/build/meta-oe/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb:do_patch) failed with exit code '1'
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
> -    return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
> +    try:
> +        return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
> +    except subprocess.CalledProcessError as e:
> +        bb.note("icecc: one of the tools probably disappeared during recipe parsing, cmd readlink -f %s returned %d:\n%s" % (tool, e.returncode, e.output.decode("utf-8")))
> +        return tool
>  
>  def icecc_get_path_tool(tool, d):
>      # This is a little ugly, but we want to make sure we add an actual


