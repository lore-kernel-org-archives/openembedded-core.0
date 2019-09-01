Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id BEE7F7F49D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:52 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id v12so7370980pfn.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ms7ZLmcoJhg77w8VzvLGHlAkkgZUab688X+vV3LHlnU=;
	b=d7a7vSvhckOveOVFI1p4rK2UlLDqdQlT1a3zgSM1JXTGeaFpPLCwr6n5Gcuh8OrkBa
	rBRH7GujryOQvzTOim/4eorqzUmHOMRyI5d3RFR6H47J66t/b4Ud7YtP6yePHMjZZ+jq
	Ee9uV9OotIr+bs4WU/DqcMMwwyhmLjzYoi6myqlW6gW3vvhnYvt7osm2XTxRn15a9IHE
	jlZot8o+30ktdIC0FhVpEThdvWl0s0kqGQ7U+BUCmeqyGu8WGYI1O3efCA29z88hKa/L
	JVboW03MFRmMAdfGwL/36OXS9d4h3W5ITSaZYLvl+3Qu6GSUiFmvFoRHWExF2qbJIY/G
	zD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ms7ZLmcoJhg77w8VzvLGHlAkkgZUab688X+vV3LHlnU=;
	b=nmw5FXiDJmb6Zy4nA6MkVHtWiDz0EPoiFXuxpoR21A7oP4+v7xxap3K/9ttCoYgxI6
	MTW3LoHaUV1rnGWpTh4DZs/OE1/d2k5EqIX70j3weeT/ALbZ78FFjD7llH9uCb5eJE5L
	bh14OyXDFQq28fMJrRp8E8R7uCrIrUd5jOyEdtp1tGrgJcGAP81iSSUODGrmCU/ta+sC
	R8dN48OYVU4fnSGTzACBmd0aiyhXsXxA9nTHoFfqaWmt5XRRiMDTFXOc6Jd8AjhACW/q
	0Yx46vLhOIJGMll/sufntPQQgRltpwnzsWLs65g+S0+oANiTzKTJQPsqMfi3wgAvN6jg
	DrJw==
X-Gm-Message-State: APjAAAVI3SRocCNQ8g/yfNiHOHxvVZTPFTAkWLvxSxNx9OjPYFelaFsl
	YWiGVr52052/1obA5eKffP2J1Hxw
X-Google-Smtp-Source: APXvYqxCxdFQPc9hw3xVfGDHijIIFwvnqo5pBQJgFpcEflaP7EefNXke5m6irt1hjoe0iVsWLn64uw==
X-Received: by 2002:a05:6a00:8e:: with SMTP id
	c14mr28641014pfj.241.1567348613666; 
	Sun, 01 Sep 2019 07:36:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:08 -0700
Message-Id: <4e4c7c20791995c220febe78f2623c5f647e231d.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 30/43] icecc.bbclass: catch subprocess.CalledProcessError
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:53 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* this might be related to:
  commit d2fcaeb153fdc3f8d7143ea823139f1537055ff1
  Author: Douglas Royds <douglas.royds@taitradio.com>
  Date:   Thu Dec 20 11:59:47 2018 +1300

    icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time

* it's still a bit unclear when and why this happends, but I'm seeing
  random tasks sometimes failing with:

WARNING: Exception during build_dependencies for set_icecc_env
WARNING: Error during finalise of /build/meta-oe/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
ERROR: Traceback (most recent call last):
  File "/build/bitbake/lib/bb/data_smart.py", line 411, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/build/bitbake/lib/bb/data_smart.py", line 136, in python_sub
    value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
  File "/build/bitbake/lib/bb/utils.py", line 421, in better_eval
    return eval(source, ctx, locals)
  File "Var <set_icecc_env>", line 1, in <module>
  File "/build/oe-core/meta/classes/icecc.bbclass", line 287, in icecc_get_and_check_tool
    link_path = icecc_get_tool_link(t, d)
  File "/build/oe-core/meta/classes/icecc.bbclass", line 246, in icecc_get_tool_link
    return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
  File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
    **kwargs).stdout
  File "/usr/lib/python3.6/subprocess.py", line 418, in run
    output=stdout, stderr=stderr)
subprocess.CalledProcessError: Command 'readlink -f /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++' returned non-zero exit status 1.

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/build/bitbake/bin/bitbake-worker", line 239, in child
    the_data = bb_cache.loadDataFull(fn, appends)
  File "/build/bitbake/lib/bb/cache.py", line 327, in loadDataFull
    bb_data = self.load_bbfile(virtualfn, appends, virtonly=True)
  File "/build/bitbake/lib/bb/cache.py", line 340, in load_bbfile
    datastores = parse_recipe(bb_data, bbfile, appends, mc)
  File "/build/bitbake/lib/bb/cache.py", line 303, in parse_recipe
    bb_data = bb.parse.handle(bbfile, bb_data)
  File "/build/bitbake/lib/bb/parse/__init__.py", line 107, in handle
    return h['handle'](fn, data, include)
  File "/build/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 142, in handle
    return ast.multi_finalize(fn, d)
  File "/build/bitbake/lib/bb/parse/ast.py", line 386, in multi_finalize
    finalize(fn, d)
  File "/build/bitbake/lib/bb/parse/ast.py", line 351, in finalize
    bb.parse.siggen.finalise(fn, d, variant)
  File "/build/bitbake/lib/bb/siggen.py", line 147, in finalise
    taskdeps = self._build_data(fn, d)
  File "/build/bitbake/lib/bb/siggen.py", line 118, in _build_data
    tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)
  File "/build/bitbake/lib/bb/data.py", line 388, in generate_dependencies
    deps[dep], values[dep] = build_dependencies(dep, keys, shelldeps, varflagsexcl, d)
  File "/build/bitbake/lib/bb/data.py", line 317, in build_dependencies
    value, parsedvar = d.getVarFlag(key, "_content", False, retparser=True)
  File "/build/bitbake/lib/bb/data_smart.py", line 802, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/build/bitbake/lib/bb/data_smart.py", line 424, in expandWithRefs
    raise ExpansionError(varname, s, exc).with_traceback(tb) from exc
  File "/build/bitbake/lib/bb/data_smart.py", line 411, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/build/bitbake/lib/bb/data_smart.py", line 136, in python_sub
    value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
  File "/build/bitbake/lib/bb/utils.py", line 421, in better_eval
    return eval(source, ctx, locals)
  File "Var <set_icecc_env>", line 1, in <module>
  File "/build/oe-core/meta/classes/icecc.bbclass", line 287, in icecc_get_and_check_tool
    link_path = icecc_get_tool_link(t, d)
  File "/build/oe-core/meta/classes/icecc.bbclass", line 246, in icecc_get_tool_link
    return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
  File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
    **kwargs).stdout
  File "/usr/lib/python3.6/subprocess.py", line 418, in run
    output=stdout, stderr=stderr)
bb.data_smart.ExpansionError: Failure expanding variable set_icecc_env, expression was     if [ "${@use_icecc(bb, d)}" = "no" ]
    then
        return
    fi
    ICECC_VERSION="${@icecc_version(bb, d)}"
    if [ "x${ICECC_VERSION}" = "x" ]
    then
        bbwarn "Cannot use icecc: could not get ICECC_VERSION"
        return
    fi

    ICE_PATH="${@icecc_path(bb, d)}"
    if [ "x${ICE_PATH}" = "x" ]
    then
        bbwarn "Cannot use icecc: could not get ICE_PATH"
        return
    fi

    ICECC_BIN="${@get_icecc(d)}"
    if [ -z "${ICECC_BIN}" ]; then
        bbwarn "Cannot use icecc: icecc binary not found"
        return
    fi
    if [ -z "$(which patchelf patchelf-uninative)" ]; then
        bbwarn "Cannot use icecc: patchelf not found"
        return
    fi

    # Create symlinks to icecc in the recipe-sysroot directory
    mkdir -p ${ICE_PATH}
    if [ -n "${KERNEL_CC}" ]; then
        compilers="${@get_cross_kernel_cc(bb,d)}"
    else
        compilers="x86_64-oe-linux-gcc x86_64-oe-linux-g++"
    fi
    for compiler in $compilers; do
        ln -sf ${ICECC_BIN} ${ICE_PATH}/$compiler
    done

    ICECC_CC="${@icecc_get_and_check_tool(bb, d, "gcc")}"
    ICECC_CXX="${@icecc_get_and_check_tool(bb, d, "g++")}"
    # cannot use icecc_get_and_check_tool here because it assumes as without target_sys prefix
    ICECC_WHICH_AS="${@bb.utils.which(os.getenv('PATH'), 'as')}"
    if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
    then
        bbwarn "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
        return
    fi

    ICE_VERSION=`$ICECC_CC -dumpversion`
    ICECC_VERSION=`echo ${ICECC_VERSION} | sed -e "s/@VERSION@/$ICE_VERSION/g"`
    if [ ! -x "/build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env" ]
    then
        bbwarn "Cannot use icecc: invalid ICECC_ENV_EXEC"
        return
    fi

    ICECC_AS="`${ICECC_CC} -print-prog-name=as`"
    # for target recipes should return something like:
    # /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as
    # and just "as" for native, if it returns "as" in current directory (for whatever reason) use "as" from PATH
    if [ "`dirname "${ICECC_AS}"`" = "." ]
    then
        ICECC_AS="${ICECC_WHICH_AS}"
    fi

    if [ ! -f "${ICECC_VERSION}.done" ]
    then
        mkdir -p "`dirname "${ICECC_VERSION}"`"

        # the ICECC_VERSION generation step must be locked by a mutex
        # in order to prevent race conditions
        if flock -n "${ICECC_VERSION}.lock" \
            /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env  "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
        then
            touch "${ICECC_VERSION}.done"
        elif ! wait_for_file "${ICECC_VERSION}.done" 30
        then
            # locking failed so wait for ${ICECC_VERSION}.done to appear
            bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
            return
        fi
    fi

    # Don't let ccache find the icecream compiler links that have been created, otherwise
    # it can end up invoking icecream recursively.
    export CCACHE_PATH="$PATH"
    export CCACHE_DISABLE="1"

    export ICECC_VERSION ICECC_CC ICECC_CXX
    export PATH="$ICE_PATH:$PATH"

    bbnote "Using icecc path: $ICE_PATH"
    bbnote "Using icecc tarball: $ICECC_VERSION"
 which triggered exception CalledProcessError: Command 'readlink -f /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++' returned non-zero exit status 1.

ERROR: Task (virtual:multilib:lib32:/build/meta-oe/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb:do_patch) failed with exit code '1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/icecc.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index edb0e10..63d8b4d 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -243,7 +243,11 @@ def icecc_get_external_tool(bb, d, tool):
 
 def icecc_get_tool_link(tool, d):
     import subprocess
-    return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
+    try:
+        return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
+    except subprocess.CalledProcessError as e:
+        bb.note("icecc: one of the tools probably disappeared during recipe parsing, cmd readlink -f %s returned %d:\n%s" % (tool, e.returncode, e.output.decode("utf-8")))
+        return tool
 
 def icecc_get_path_tool(tool, d):
     # This is a little ugly, but we want to make sure we add an actual
-- 
2.7.4


