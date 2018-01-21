Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9629071BB9;
	Sun, 21 Jan 2018 09:00:31 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id 36so5374441wrh.1;
	Sun, 21 Jan 2018 01:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7Ikk0AqSvTWxfTtK4t/YHa0FYeb995diSN40lPBuzt4=;
	b=p3WHUWNl1rouz4W7yBZeOhW9TEieDCdJBEtyZvtqud1BpGwNq5Ept5Xt53UWLouUw1
	eaEbXI+BJv0KEN+TetRI1kSB58jY2A89eZvvtJLUVuzDJL+V7cn0FBQMZ7k8fV9lwS5s
	P6p+AgtYHnHEiQE5fR7wNsHQfIG9jdaAVnbAwTaPo2T10d4qVzsdM9K06i39unxq/SlH
	nDsIsKDc4OKw1j6FSksXVSlyvXUQZwdl0m/QktwIe07/0tDPV8HfvqLwhE8g0dq6ShhP
	QHvIq0z1bUKdAvIPMMoi3Bf7aAp5QPQ4GAzXAb7JcIq0GGUceqpk7RgGAuyXhw19ojrt
	f4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7Ikk0AqSvTWxfTtK4t/YHa0FYeb995diSN40lPBuzt4=;
	b=flQV+Il4S/OEp/S3frkWKXP8zUlOx+ADkAPskqh3p59yu2FyTsbAetbfACRFZW0RgG
	Dtm7wSA6qfYUizKP7sCgv0ByGEzwqoSTE/CzmKMfy4S01OXVpGogwHNFaUi5ICjajRNe
	CBjW5KFbIJfJxnM+8L+ayV3J84XxG7K5Z4lLrs0P4P3T90mp52sgyx4lhTVwkNCbfGdi
	p5etmuinekZmxjMIXM04wlzQuqdtAkZU9gLEz9KBLqz8pgIDRcpHLf8mQPq8KkicoYMS
	pOc4cr1txaF7L8JfDjdccRhKvOQ2VMyPPH2fdKs/NiPSKPfDN5sVFoUWFVbX+uaiXdXk
	Q57A==
X-Gm-Message-State: AKwxytfbPxXRozH1BIiicg2f5HNhOlVURtSOc6CUBNgqLEMxICJvTYKq
	ujJC2Gvb+ow6syI97FNs9ysHtYa1i0m/oJ3ToS88+Q==
X-Google-Smtp-Source: AH8x226hOp+EYcz7psS+/GmcESX4HNGRG/H5h1SJI1/6Y3wdCMJ818gYyjnkn026e3kTfjGtkIoErFP5axif++MDuSM=
X-Received: by 10.223.189.136 with SMTP id l8mr3229364wrh.58.1516525231369;
	Sun, 21 Jan 2018 01:00:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 21 Jan 2018 01:00:30 -0800 (PST)
In-Reply-To: <20180120223214.154D0235ED4@git.openembedded.org>
References: <151648753376.31338.5162580593839986526@git.openembedded.org>
	<20180120223214.154D0235ED4@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 21 Jan 2018 10:00:30 +0100
Message-ID: <CA+chaQfjbbdUsuvpBrmz2R9fo0A98p7dPo9LzYxYA+fwX+8KNQ@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/06: python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Sun, 21 Jan 2018 09:00:32 -0000
Content-Type: multipart/alternative; boundary="089e082b0df0b5714a0563458b5c"

--089e082b0df0b5714a0563458b5c
Content-Type: text/plain; charset="UTF-8"

Hello,

The last paragraph in commit message looks like it should be backwards
compatible right?

Then there might be some bug somewhere, because in my builds (which use
only very few python packages) there are few runtime dependencies which
cannot be satisfied anymore:
python-man
python-readline
python3-textutils

Also probably related to this I've seen python(3)-smbus recipes failing to
build now with:
smbusmodule.c:192:48: error: 'I2C_SMBUS_WRITE' undeclared (first use in
this function); did you mean 'I2C_SMBUS'?

Regards,

On Sat, Jan 20, 2018 at 11:32 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit 6959e2e4dba5bbfa6ffd49c44e738cc1c38bc280
> Author: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> AuthorDate: Tue Jun 20 14:11:44 2017 -0700
>
>     python: Restructure python packaging and replace it with autopackaging
>
>     The reason we have a manifest file for python is that our goal is to
>     keep python-core as small as posible and add other python packages only
>     when the user needs them, hence why we split upstream python into
> several
>     packages.
>
>     Although our manifest file has several issues:
>      - Its unorganized and hard to read and understand it for an average
>        human being.
>      - When a new package needs to be added, the user actually has to
> modify
>        the script that creates the manifest, then call the script to create
>        a new manifest, and then submit a patch for both the script and the
>        manifest, so its a little convoluted.
>      - Git complains every single time a patch is submitted to the
> manifest,
>        since it violates some of its guidelines.
>      - It changes or may change with every release of python, its
> impossible
>        to know if the required files for a certain package have changed
>        (it could have more or less dependencies), the only way of doing so
>        would be to install and test them all one by one on separate
> individual
>        images, and even then we wouldnt know if they require less
> dependencies,
>        we would just know if an extra dependency is required since it would
>        complain, lets face it, this isnt feasible.
>      - The same thing happens for new packages, if someone wants to add a
>        new package, its dependencies need to be checked manually one by
> one.
>
>     This patch fixes those issues, while adding some additional features.
>
>     Features/Fixes:
>
>      - A new manifest format is used (JSON), easy to read and understand.
>        This file is parsed by the python recipe and python packages read
>        from here are passed directly to bitbake during parsing time.
>      - It provides an automatic manifest creation task (explained below),
>        which automagically checks for every package dependencies and adds
>        them to the new manifest, hence we will have on each package exactly
>        what that package needs to be run, providing finer granularity.
>      - Dependencies are also checked automagically for new packages
> (explained below).
>      - Fixes the manifest in the following ways:
>        * python-core should be base and all packages should depend on it,
>          fixes lang, string, codecs, etc.
>        * Fixes packages with repeated files (e.g. bssdb and db, or
>          netclient and mime, and many others).
>      - Sitecustomize was fixed since encoding was deprecated.
>      - The JSON manifest file invalidates bitbake's cache, so if it changes
>        the python package will be rebuilt.
>      - It creates a solution for users that want precompiled bytecode files
>        (*.pyc) INCLUDE_PYCS = "1" can be set by the user on their
> local.conf to
>        include such files, some argument they get faster boot time, even
> when the
>        files would be created on their first run?, but they also sometimes
> give a
>        magic number error and take up space, so we leave it to the user to
>        decide if they want them or not.
>      - Fixes python-core dependencies, e.g.
>        When python is run on an image, it TRIES to import everything it
> needs,
>        but it doesnt necessarily fails when it doesnt find something, so
> even if
>        we didnt know, we had errors like (trimmed on purpose):
>        # trying /usr/lib/python2.7/_locale.so
>        # trying /usr/lib/python2.7/lib-dynload/_locale.so
>        # trying /usr/lib/python2.7/_sysconfigdata.so
>
>        while it didnt complain about _locale it should have imported it,
>        after creating a new manifest with the automated script we get:
>
>        # trying /usr/lib/python2.7/lib-dynload/_locale.so
>        dlopen("/usr/lib/python2.7/lib-dynload/_locale.so", 2);
>        import _locale # dynamically loaded from /usr/lib/python2.7/lib-
> dynload/_locale.so
>
>     How to use (after a new release of python, or maybe before every OE
>     release):
>      - A new task called create_manifest was added to the python package,
>        which may be invoked via:
>
>      $ bitbake python -c create_manifest
>
>      This task runs a script on native python on our HOST system, and since
>      the python and python-native packages come from the same source, we
> can
>      use it to know the dependencies of each module as if we were doing it
>      on an image, this script is called create_manifest.py and in a very
>      simplistic way it does the following:
>
>      1. Reads the JSON manifest file and creates a dictionary data
> structure
>         with all of our python packages, their FILES, RDEPENDS and SUMMARY.
>      2. Loops through all of them and runs every module listed on them
>         asynchronously, determining every dependency that they have.
>      3. These module dependencies are then handled, to be able to know
> which
>         packages contain those files and which should RDEPEND on one
> another.
>      4. The data structure that comes out of this, is then used to create a
>         new manifest file which is automatically copied onto the user's
> python
>         directory replacing the old one.
>
>      Create_manifest script features:
>      - Handles modules which dont exist anymore (new release for example).
>      - Handles modules that are builtin.
>      - Deals with modules which were not compiled (e.g. bsddb or
> ossaudiodev)
>      - Deals with packages which include folders.
>      - Deals with packages which include FILES with a wildcard.
>      - The manifest can be constructed on a multilib environment as well.
>      - This method works for both python modules and shared libraries used
>        by python.
>
>     How to add a new package:
>      - If a user wants to add a new package all that has to be done is
>        modify the python2-manifest.json file, and add the required file(s)
>        to the FILES list, the script should handle all the rest.
>        Real example:
>        We want to add a web browser package, including the file
> webbrowser.py
>        which at the moment is on python-misc.
>        "webbrowser": {
>            "files": ["${libdir}/python2.7/lib-dynload/webbrowser.py"],
>            "rdepends": [],
>            "summary": "Python Web Browser support"}
>
>      Run bitbake python -c create_manifest and the resulting manifest
>      should  be completed after a few seconds, showing something like:
>        "webbrowser": {
>           "files": ["${libdir}/python2.7/webbrowser.py"],
>           "rdepends": ["core","fcntl","io","pickle","shell","subprocess"],
>           "summary": "Python Web Browser support"}
>
>     Known errors/issues:
>      - Some special packages are handled differently: core, misc,
>        modules,dev, staticdev.
>        All these should be handled manually, because they either include
>        binaries, static libraries, include files, etc. (something that we
>        cant import).
>        Specifically static libraries are not not supported by this method
>        and have to be handled by the user.
>      - The change should be transparent to the user, other than the fact
>        that now we CANT build python-foo (it was pretty dumb anyway, since
>        what building python-foo actually did was building the whole python
>        package anyway), but doing IMAGE_INSTALL_append = " python-foo"
>        would create an image with the requested package with no issues.
>
>     [YOCTO #11510] [YOCTO #11694] [YOCTO #11695]
>
>     Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.
> intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../python/python-2.7-manifest.inc                 |  840
> ----------------
>  .../python/python-native-2.7-manifest.inc          |    9 -
>  .../python/python-native_2.7.13.bb                 |   24 +-
>  .../python/python/create_manifest2.py              |  277 ++++++
>  .../python/python/get_module_deps2.py              |  112 +++
>  .../python/python/python2-manifest.json            | 1032
> ++++++++++++++++++++
>  .../python/python/sitecustomize.py                 |    8 -
>  meta/recipes-devtools/python/python_2.7.13.bb      |   88 +-
>  scripts/contrib/python/generate-manifest-2.7.py    |  426 --------
>  9 files changed, 1528 insertions(+), 1288 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc
> b/meta/recipes-devtools/python/python-2.7-manifest.inc
> deleted file mode 100644
> index 7c3fc1b..0000000
> --- a/meta/recipes-devtools/python/python-2.7-manifest.inc
> +++ /dev/null
> @@ -1,840 +0,0 @@
> -
> -# WARNING: This file is AUTO GENERATED: Manual edits will be lost next
> time I regenerate the file.
> -# Generator: './scripts/contrib/python/generate-manifest-2.7.py' Version
> 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
> -
> -
> -
> -PROVIDES+=" \
> -  ${PN}-2to3 \
> -  ${PN}-argparse \
> -  ${PN}-audio \
> -  ${PN}-bsddb \
> -  ${PN}-codecs \
> -  ${PN}-compile \
> -  ${PN}-compiler \
> -  ${PN}-compression \
> -  ${PN}-contextlib \
> -  ${PN}-core \
> -  ${PN}-crypt \
> -  ${PN}-ctypes \
> -  ${PN}-curses \
> -  ${PN}-datetime \
> -  ${PN}-db \
> -  ${PN}-debugger \
> -  ${PN}-dev \
> -  ${PN}-difflib \
> -  ${PN}-distutils \
> -  ${PN}-distutils-staticdev \
> -  ${PN}-doctest \
> -  ${PN}-email \
> -  ${PN}-fcntl \
> -  ${PN}-gdbm \
> -  ${PN}-hotshot \
> -  ${PN}-html \
> -  ${PN}-idle \
> -  ${PN}-image \
> -  ${PN}-importlib \
> -  ${PN}-io \
> -  ${PN}-json \
> -  ${PN}-lang \
> -  ${PN}-logging \
> -  ${PN}-mailbox \
> -  ${PN}-math \
> -  ${PN}-mime \
> -  ${PN}-mmap \
> -  ${PN}-multiprocessing \
> -  ${PN}-netclient \
> -  ${PN}-netserver \
> -  ${PN}-numbers \
> -  ${PN}-pickle \
> -  ${PN}-pkgutil \
> -  ${PN}-plistlib \
> -  ${PN}-pprint \
> -  ${PN}-profile \
> -  ${PN}-pydoc \
> -  ${PN}-re \
> -  ${PN}-readline \
> -  ${PN}-resource \
> -  ${PN}-robotparser \
> -  ${PN}-runpy \
> -  ${PN}-shell \
> -  ${PN}-smtpd \
> -  ${PN}-sqlite3 \
> -  ${PN}-sqlite3-tests \
> -  ${PN}-stringold \
> -  ${PN}-subprocess \
> -  ${PN}-syslog \
> -  ${PN}-terminal \
> -  ${PN}-tests \
> -  ${PN}-textutils \
> -  ${PN}-threading \
> -  ${PN}-tkinter \
> -  ${PN}-unittest \
> -  ${PN}-unixadmin \
> -  ${PN}-xml \
> -  ${PN}-xmlrpc \
> -  ${PN}-zlib \
> -"
> -
> -PACKAGES=" \
> -  ${PN}-dbg \
> -  ${PN}-2to3 \
> -  ${PN}-argparse \
> -  ${PN}-audio \
> -  ${PN}-bsddb \
> -  ${PN}-codecs \
> -  ${PN}-compile \
> -  ${PN}-compiler \
> -  ${PN}-compression \
> -  ${PN}-contextlib \
> -  ${PN}-core \
> -  ${PN}-crypt \
> -  ${PN}-ctypes \
> -  ${PN}-curses \
> -  ${PN}-datetime \
> -  ${PN}-db \
> -  ${PN}-debugger \
> -  ${PN}-dev \
> -  ${PN}-difflib \
> -  ${PN}-distutils-staticdev ${PN}-distutils \
> -  ${PN}-doctest \
> -  ${PN}-email \
> -  ${PN}-fcntl \
> -  ${PN}-gdbm \
> -  ${PN}-hotshot \
> -  ${PN}-html \
> -  ${PN}-idle \
> -  ${PN}-image \
> -  ${PN}-importlib \
> -  ${PN}-io \
> -  ${PN}-json \
> -  ${PN}-lang \
> -  ${PN}-logging \
> -  ${PN}-mailbox \
> -  ${PN}-math \
> -  ${PN}-mime \
> -  ${PN}-mmap \
> -  ${PN}-multiprocessing \
> -  ${PN}-netclient \
> -  ${PN}-netserver \
> -  ${PN}-numbers \
> -  ${PN}-pickle \
> -  ${PN}-pkgutil \
> -  ${PN}-plistlib \
> -  ${PN}-pprint \
> -  ${PN}-profile \
> -  ${PN}-pydoc \
> -  ${PN}-re \
> -  ${PN}-readline \
> -  ${PN}-resource \
> -  ${PN}-robotparser \
> -  ${PN}-runpy \
> -  ${PN}-shell \
> -  ${PN}-smtpd \
> -  ${PN}-sqlite3 \
> -  ${PN}-sqlite3-tests \
> -  ${PN}-stringold \
> -  ${PN}-subprocess \
> -  ${PN}-syslog \
> -  ${PN}-terminal \
> -  ${PN}-tests \
> -  ${PN}-textutils \
> -  ${PN}-threading \
> -  ${PN}-tkinter \
> -  ${PN}-unittest \
> -  ${PN}-unixadmin \
> -  ${PN}-xml \
> -  ${PN}-xmlrpc \
> -  ${PN}-zlib \
> -  ${PN}-modules\
> -"
> -
> -SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
> -RDEPENDS_${PN}-2to3="${PN}-core"
> -FILES_${PN}-2to3=" \
> -    ${bindir}/2to3 \
> -    ${libdir}/python2.7/lib2to3 \
> -"
> -
> -SUMMARY_${PN}-argparse="Python command line argument parser"
> -RDEPENDS_${PN}-argparse="${PN}-core ${PN}-codecs ${PN}-textutils"
> -FILES_${PN}-argparse=" \
> -    ${libdir}/python2.7/argparse.* \
> -"
> -
> -SUMMARY_${PN}-audio="Python Audio Handling"
> -RDEPENDS_${PN}-audio="${PN}-core"
> -FILES_${PN}-audio=" \
> -    ${libdir}/python2.7/wave.* \
> -    ${libdir}/python2.7/chunk.* \
> -    ${libdir}/python2.7/sndhdr.* \
> -    ${libdir}/python2.7/lib-dynload/ossaudiodev.so \
> -    ${libdir}/python2.7/lib-dynload/audioop.so \
> -    ${libdir}/python2.7/audiodev.* \
> -    ${libdir}/python2.7/sunaudio.* \
> -    ${libdir}/python2.7/sunau.* \
> -    ${libdir}/python2.7/toaiff.* \
> -"
> -
> -SUMMARY_${PN}-bsddb="Python bindings for the Berkeley Database"
> -RDEPENDS_${PN}-bsddb="${PN}-core"
> -FILES_${PN}-bsddb=" \
> -    ${libdir}/python2.7/bsddb \
> -    ${libdir}/python2.7/lib-dynload/_bsddb.so \
> -"
> -
> -SUMMARY_${PN}-codecs="Python codecs, encodings & i18n support"
> -RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
> -FILES_${PN}-codecs=" \
> -    ${libdir}/python2.7/codecs.* \
> -    ${libdir}/python2.7/encodings \
> -    ${libdir}/python2.7/gettext.* \
> -    ${libdir}/python2.7/locale.* \
> -    ${libdir}/python2.7/lib-dynload/_locale.so \
> -    ${libdir}/python2.7/lib-dynload/_codecs* \
> -    ${libdir}/python2.7/lib-dynload/_multibytecodec.so \
> -    ${libdir}/python2.7/lib-dynload/unicodedata.so \
> -    ${libdir}/python2.7/stringprep.* \
> -    ${libdir}/python2.7/xdrlib.* \
> -"
> -
> -SUMMARY_${PN}-compile="Python bytecode compilation support"
> -RDEPENDS_${PN}-compile="${PN}-core"
> -FILES_${PN}-compile=" \
> -    ${libdir}/python2.7/py_compile.* \
> -    ${libdir}/python2.7/compileall.* \
> -"
> -
> -SUMMARY_${PN}-compiler="Python compiler support"
> -RDEPENDS_${PN}-compiler="${PN}-core"
> -FILES_${PN}-compiler=" \
> -    ${libdir}/python2.7/compiler \
> -"
> -
> -SUMMARY_${PN}-compression="Python high-level compression support"
> -RDEPENDS_${PN}-compression="${PN}-core ${PN}-zlib"
> -FILES_${PN}-compression=" \
> -    ${libdir}/python2.7/gzip.* \
> -    ${libdir}/python2.7/zipfile.* \
> -    ${libdir}/python2.7/tarfile.* \
> -    ${libdir}/python2.7/lib-dynload/bz2.so \
> -"
> -
> -SUMMARY_${PN}-contextlib="Python utilities for with-statementcontexts."
> -RDEPENDS_${PN}-contextlib="${PN}-core"
> -FILES_${PN}-contextlib=" \
> -    ${libdir}/python${PYTHON_MAJMIN}/contextlib.* \
> -"
> -
> -SUMMARY_${PN}-core="Python interpreter and core modules"
> -RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
> -FILES_${PN}-core=" \
> -    ${libdir}/python2.7/__future__.* \
> -    ${libdir}/python2.7/_abcoll.* \
> -    ${libdir}/python2.7/abc.* \
> -    ${libdir}/python2.7/ast.* \
> -    ${libdir}/python2.7/copy.* \
> -    ${libdir}/python2.7/copy_reg.* \
> -    ${libdir}/python2.7/ConfigParser.* \
> -    ${libdir}/python2.7/genericpath.* \
> -    ${libdir}/python2.7/getopt.* \
> -    ${libdir}/python2.7/linecache.* \
> -    ${libdir}/python2.7/new.* \
> -    ${libdir}/python2.7/os.* \
> -    ${libdir}/python2.7/posixpath.* \
> -    ${libdir}/python2.7/struct.* \
> -    ${libdir}/python2.7/warnings.* \
> -    ${libdir}/python2.7/site.* \
> -    ${libdir}/python2.7/stat.* \
> -    ${libdir}/python2.7/UserDict.* \
> -    ${libdir}/python2.7/UserList.* \
> -    ${libdir}/python2.7/UserString.* \
> -    ${libdir}/python2.7/lib-dynload/binascii.so \
> -    ${libdir}/python2.7/lib-dynload/_struct.so \
> -    ${libdir}/python2.7/lib-dynload/time.so \
> -    ${libdir}/python2.7/lib-dynload/xreadlines.so \
> -    ${libdir}/python2.7/types.* \
> -    ${libdir}/python2.7/platform.* \
> -    ${bindir}/python* \
> -    ${libdir}/python2.7/_weakrefset.* \
> -    ${libdir}/python2.7/sysconfig.* \
> -    ${libdir}/python2.7/_sysconfigdata.* \
> -    ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h \
> -    ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py \
> -"
> -
> -SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
> -RDEPENDS_${PN}-crypt="${PN}-core"
> -FILES_${PN}-crypt=" \
> -    ${libdir}/python2.7/hashlib.* \
> -    ${libdir}/python2.7/md5.* \
> -    ${libdir}/python2.7/sha.* \
> -    ${libdir}/python2.7/lib-dynload/crypt.so \
> -    ${libdir}/python2.7/lib-dynload/_hashlib.so \
> -    ${libdir}/python2.7/lib-dynload/_sha256.so \
> -    ${libdir}/python2.7/lib-dynload/_sha512.so \
> -"
> -
> -SUMMARY_${PN}-ctypes="Python C types support"
> -RDEPENDS_${PN}-ctypes="${PN}-core"
> -FILES_${PN}-ctypes=" \
> -    ${libdir}/python2.7/ctypes \
> -    ${libdir}/python2.7/lib-dynload/_ctypes.so \
> -    ${libdir}/python2.7/lib-dynload/_ctypes_test.so \
> -"
> -
> -SUMMARY_${PN}-curses="Python curses support"
> -RDEPENDS_${PN}-curses="${PN}-core"
> -FILES_${PN}-curses=" \
> -    ${libdir}/python2.7/curses \
> -    ${libdir}/python2.7/lib-dynload/_curses.so \
> -    ${libdir}/python2.7/lib-dynload/_curses_panel.so \
> -"
> -
> -SUMMARY_${PN}-datetime="Python calendar and time support"
> -RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
> -FILES_${PN}-datetime=" \
> -    ${libdir}/python2.7/_strptime.* \
> -    ${libdir}/python2.7/calendar.* \
> -    ${libdir}/python2.7/lib-dynload/datetime.so \
> -"
> -
> -SUMMARY_${PN}-db="Python file-based database support"
> -RDEPENDS_${PN}-db="${PN}-core"
> -FILES_${PN}-db=" \
> -    ${libdir}/python2.7/anydbm.* \
> -    ${libdir}/python2.7/dumbdbm.* \
> -    ${libdir}/python2.7/whichdb.* \
> -"
> -
> -SUMMARY_${PN}-debugger="Python debugger"
> -RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re
> ${PN}-stringold ${PN}-shell ${PN}-pprint"
> -FILES_${PN}-debugger=" \
> -    ${libdir}/python2.7/bdb.* \
> -    ${libdir}/python2.7/pdb.* \
> -"
> -
> -SUMMARY_${PN}-dev="Python development package"
> -RDEPENDS_${PN}-dev="${PN}-core"
> -FILES_${PN}-dev=" \
> -    ${includedir} \
> -    ${libdir}/lib*${SOLIBSDEV} \
> -    ${libdir}/*.la \
> -    ${libdir}/*.a \
> -    ${libdir}/*.o \
> -    ${libdir}/pkgconfig \
> -    ${base_libdir}/*.a \
> -    ${base_libdir}/*.o \
> -    ${datadir}/aclocal \
> -    ${datadir}/pkgconfig \
> -    ${libdir}/python2.7/config/Makefile \
> -"
> -
> -SUMMARY_${PN}-difflib="Python helpers for computing deltas between
> objects"
> -RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
> -FILES_${PN}-difflib=" \
> -    ${libdir}/python2.7/difflib.* \
> -"
> -
> -SUMMARY_${PN}-distutils="Python Distribution Utilities"
> -RDEPENDS_${PN}-distutils="${PN}-core ${PN}-email"
> -FILES_${PN}-distutils=" \
> -    ${libdir}/python2.7/config \
> -    ${libdir}/python2.7/distutils \
> -"
> -
> -SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static
> libraries)"
> -RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
> -FILES_${PN}-distutils-staticdev=" \
> -    ${libdir}/python2.7/config/lib*.a \
> -"
> -
> -SUMMARY_${PN}-doctest="Python framework for running examples in
> docstrings"
> -RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re
> ${PN}-unittest ${PN}-debugger ${PN}-difflib"
> -FILES_${PN}-doctest=" \
> -    ${libdir}/python2.7/doctest.* \
> -"
> -
> -SUMMARY_${PN}-email="Python email support"
> -RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime
> ${PN}-audio ${PN}-image ${PN}-netclient"
> -FILES_${PN}-email=" \
> -    ${libdir}/python2.7/imaplib.* \
> -    ${libdir}/python2.7/email \
> -"
> -
> -SUMMARY_${PN}-fcntl="Python's fcntl interface"
> -RDEPENDS_${PN}-fcntl="${PN}-core"
> -FILES_${PN}-fcntl=" \
> -    ${libdir}/python2.7/lib-dynload/fcntl.so \
> -"
> -
> -SUMMARY_${PN}-gdbm="Python GNU database support"
> -RDEPENDS_${PN}-gdbm="${PN}-core"
> -FILES_${PN}-gdbm=" \
> -    ${libdir}/python2.7/lib-dynload/gdbm.so \
> -"
> -
> -SUMMARY_${PN}-hotshot="Python hotshot performance profiler"
> -RDEPENDS_${PN}-hotshot="${PN}-core"
> -FILES_${PN}-hotshot=" \
> -    ${libdir}/python2.7/hotshot \
> -    ${libdir}/python2.7/lib-dynload/_hotshot.so \
> -"
> -
> -SUMMARY_${PN}-html="Python HTML processing support"
> -RDEPENDS_${PN}-html="${PN}-core"
> -FILES_${PN}-html=" \
> -    ${libdir}/python2.7/formatter.* \
> -    ${libdir}/python2.7/htmlentitydefs.* \
> -    ${libdir}/python2.7/htmllib.* \
> -    ${libdir}/python2.7/markupbase.* \
> -    ${libdir}/python2.7/sgmllib.* \
> -    ${libdir}/python2.7/HTMLParser.* \
> -"
> -
> -SUMMARY_${PN}-idle="Python Integrated Development Environment"
> -RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
> -FILES_${PN}-idle=" \
> -    ${bindir}/idle \
> -    ${libdir}/python2.7/idlelib \
> -"
> -
> -SUMMARY_${PN}-image="Python graphical image handling"
> -RDEPENDS_${PN}-image="${PN}-core"
> -FILES_${PN}-image=" \
> -    ${libdir}/python2.7/colorsys.* \
> -    ${libdir}/python2.7/imghdr.* \
> -    ${libdir}/python2.7/lib-dynload/imageop.so \
> -    ${libdir}/python2.7/lib-dynload/rgbimg.so \
> -"
> -
> -SUMMARY_${PN}-importlib="Python import implementation library"
> -RDEPENDS_${PN}-importlib="${PN}-core"
> -FILES_${PN}-importlib=" \
> -    ${libdir}/python2.7/importlib \
> -"
> -
> -SUMMARY_${PN}-io="Python low-level I/O"
> -RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient
> ${PN}-contextlib"
> -FILES_${PN}-io=" \
> -    ${libdir}/python2.7/lib-dynload/_socket.so \
> -    ${libdir}/python2.7/lib-dynload/_io.so \
> -    ${libdir}/python2.7/lib-dynload/_ssl.so \
> -    ${libdir}/python2.7/lib-dynload/select.so \
> -    ${libdir}/python2.7/lib-dynload/termios.so \
> -    ${libdir}/python2.7/lib-dynload/cStringIO.so \
> -    ${libdir}/python2.7/pipes.* \
> -    ${libdir}/python2.7/socket.* \
> -    ${libdir}/python2.7/ssl.* \
> -    ${libdir}/python2.7/tempfile.* \
> -    ${libdir}/python2.7/StringIO.* \
> -    ${libdir}/python2.7/io.* \
> -    ${libdir}/python2.7/_pyio.* \
> -"
> -
> -SUMMARY_${PN}-json="Python JSON support"
> -RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re ${PN}-codecs"
> -FILES_${PN}-json=" \
> -    ${libdir}/python2.7/json \
> -    ${libdir}/python2.7/lib-dynload/_json.so \
> -"
> -
> -SUMMARY_${PN}-lang="Python low-level language support"
> -RDEPENDS_${PN}-lang="${PN}-core"
> -FILES_${PN}-lang=" \
> -    ${libdir}/python2.7/lib-dynload/_bisect.so \
> -    ${libdir}/python2.7/lib-dynload/_collections.so \
> -    ${libdir}/python2.7/lib-dynload/_heapq.so \
> -    ${libdir}/python2.7/lib-dynload/_weakref.so \
> -    ${libdir}/python2.7/lib-dynload/_functools.so \
> -    ${libdir}/python2.7/lib-dynload/array.so \
> -    ${libdir}/python2.7/lib-dynload/itertools.so \
> -    ${libdir}/python2.7/lib-dynload/operator.so \
> -    ${libdir}/python2.7/lib-dynload/parser.so \
> -    ${libdir}/python2.7/atexit.* \
> -    ${libdir}/python2.7/bisect.* \
> -    ${libdir}/python2.7/code.* \
> -    ${libdir}/python2.7/codeop.* \
> -    ${libdir}/python2.7/collections.* \
> -    ${libdir}/python2.7/dis.* \
> -    ${libdir}/python2.7/functools.* \
> -    ${libdir}/python2.7/heapq.* \
> -    ${libdir}/python2.7/inspect.* \
> -    ${libdir}/python2.7/keyword.* \
> -    ${libdir}/python2.7/opcode.* \
> -    ${libdir}/python2.7/symbol.* \
> -    ${libdir}/python2.7/repr.* \
> -    ${libdir}/python2.7/token.* \
> -    ${libdir}/python2.7/tokenize.* \
> -    ${libdir}/python2.7/traceback.* \
> -    ${libdir}/python2.7/weakref.* \
> -"
> -
> -SUMMARY_${PN}-logging="Python logging support"
> -RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle
> ${PN}-stringold"
> -FILES_${PN}-logging=" \
> -    ${libdir}/python2.7/logging \
> -"
> -
> -SUMMARY_${PN}-mailbox="Python mailbox format support"
> -RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
> -FILES_${PN}-mailbox=" \
> -    ${libdir}/python2.7/mailbox.* \
> -"
> -
> -SUMMARY_${PN}-math="Python math support"
> -RDEPENDS_${PN}-math="${PN}-core ${PN}-crypt"
> -FILES_${PN}-math=" \
> -    ${libdir}/python2.7/lib-dynload/cmath.so \
> -    ${libdir}/python2.7/lib-dynload/math.so \
> -    ${libdir}/python2.7/lib-dynload/_random.so \
> -    ${libdir}/python2.7/random.* \
> -    ${libdir}/python2.7/sets.* \
> -"
> -
> -SUMMARY_${PN}-mime="Python MIME handling APIs"
> -RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
> -FILES_${PN}-mime=" \
> -    ${libdir}/python2.7/mimetools.* \
> -    ${libdir}/python2.7/uu.* \
> -    ${libdir}/python2.7/quopri.* \
> -    ${libdir}/python2.7/rfc822.* \
> -    ${libdir}/python2.7/MimeWriter.* \
> -"
> -
> -SUMMARY_${PN}-mmap="Python memory-mapped file support"
> -RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
> -FILES_${PN}-mmap=" \
> -    ${libdir}/python2.7/lib-dynload/mmap.so \
> -"
> -
> -SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
> -RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang
> ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
> -FILES_${PN}-multiprocessing=" \
> -    ${libdir}/python2.7/lib-dynload/_multiprocessing.so \
> -    ${libdir}/python2.7/multiprocessing \
> -"
> -
> -SUMMARY_${PN}-netclient="Python Internet Protocol clients"
> -RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io
> ${PN}-lang ${PN}-logging ${PN}-mime"
> -FILES_${PN}-netclient=" \
> -    ${libdir}/python2.7/*Cookie*.* \
> -    ${libdir}/python2.7/base64.* \
> -    ${libdir}/python2.7/cookielib.* \
> -    ${libdir}/python2.7/ftplib.* \
> -    ${libdir}/python2.7/gopherlib.* \
> -    ${libdir}/python2.7/hmac.* \
> -    ${libdir}/python2.7/httplib.* \
> -    ${libdir}/python2.7/mimetypes.* \
> -    ${libdir}/python2.7/nntplib.* \
> -    ${libdir}/python2.7/poplib.* \
> -    ${libdir}/python2.7/smtplib.* \
> -    ${libdir}/python2.7/telnetlib.* \
> -    ${libdir}/python2.7/urllib.* \
> -    ${libdir}/python2.7/urllib2.* \
> -    ${libdir}/python2.7/urlparse.* \
> -    ${libdir}/python2.7/uuid.* \
> -    ${libdir}/python2.7/rfc822.* \
> -    ${libdir}/python2.7/mimetools.* \
> -"
> -
> -SUMMARY_${PN}-netserver="Python Internet Protocol servers"
> -RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient ${PN}-shell
> ${PN}-threading"
> -FILES_${PN}-netserver=" \
> -    ${libdir}/python2.7/cgi.* \
> -    ${libdir}/python2.7/*HTTPServer.* \
> -    ${libdir}/python2.7/SocketServer.* \
> -"
> -
> -SUMMARY_${PN}-numbers="Python number APIs"
> -RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
> -FILES_${PN}-numbers=" \
> -    ${libdir}/python2.7/decimal.* \
> -    ${libdir}/python2.7/fractions.* \
> -    ${libdir}/python2.7/numbers.* \
> -"
> -
> -SUMMARY_${PN}-pickle="Python serialisation/persistence support"
> -RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
> -FILES_${PN}-pickle=" \
> -    ${libdir}/python2.7/pickle.* \
> -    ${libdir}/python2.7/shelve.* \
> -    ${libdir}/python2.7/lib-dynload/cPickle.so \
> -    ${libdir}/python2.7/pickletools.* \
> -"
> -
> -SUMMARY_${PN}-pkgutil="Python package extension utility support"
> -RDEPENDS_${PN}-pkgutil="${PN}-core"
> -FILES_${PN}-pkgutil=" \
> -    ${libdir}/python2.7/pkgutil.* \
> -"
> -
> -SUMMARY_${PN}-plistlib="Generate and parse Mac OS X .plist files"
> -RDEPENDS_${PN}-plistlib="${PN}-core ${PN}-datetime ${PN}-io"
> -FILES_${PN}-plistlib=" \
> -    ${libdir}/python2.7/plistlib.* \
> -"
> -
> -SUMMARY_${PN}-pprint="Python pretty-print support"
> -RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
> -FILES_${PN}-pprint=" \
> -    ${libdir}/python2.7/pprint.* \
> -"
> -
> -SUMMARY_${PN}-profile="Python basic performance profiling support"
> -RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
> -FILES_${PN}-profile=" \
> -    ${libdir}/python2.7/profile.* \
> -    ${libdir}/python2.7/pstats.* \
> -    ${libdir}/python2.7/cProfile.* \
> -    ${libdir}/python2.7/lib-dynload/_lsprof.so \
> -"
> -
> -SUMMARY_${PN}-pydoc="Python interactive help support"
> -RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
> -FILES_${PN}-pydoc=" \
> -    ${bindir}/pydoc \
> -    ${libdir}/python2.7/pydoc.* \
> -    ${libdir}/python2.7/pydoc_data \
> -"
> -
> -SUMMARY_${PN}-re="Python Regular Expression APIs"
> -RDEPENDS_${PN}-re="${PN}-core"
> -FILES_${PN}-re=" \
> -    ${libdir}/python2.7/re.* \
> -    ${libdir}/python2.7/sre.* \
> -    ${libdir}/python2.7/sre_compile.* \
> -    ${libdir}/python2.7/sre_constants* \
> -    ${libdir}/python2.7/sre_parse.* \
> -"
> -
> -SUMMARY_${PN}-readline="Python readline support"
> -RDEPENDS_${PN}-readline="${PN}-core"
> -FILES_${PN}-readline=" \
> -    ${libdir}/python2.7/lib-dynload/readline.so \
> -    ${libdir}/python2.7/rlcompleter.* \
> -"
> -
> -SUMMARY_${PN}-resource="Python resource control interface"
> -RDEPENDS_${PN}-resource="${PN}-core"
> -FILES_${PN}-resource=" \
> -    ${libdir}/python2.7/lib-dynload/resource.so \
> -"
> -
> -SUMMARY_${PN}-robotparser="Python robots.txt parser"
> -RDEPENDS_${PN}-robotparser="${PN}-core ${PN}-netclient"
> -FILES_${PN}-robotparser=" \
> -    ${libdir}/python2.7/robotparser.* \
> -"
> -
> -SUMMARY_${PN}-runpy="Python script for locating/executing scripts in
> module namespace"
> -RDEPENDS_${PN}-runpy="${PN}-core ${PN}-pkgutil"
> -FILES_${PN}-runpy=" \
> -    ${libdir}/python2.7/runpy.* \
> -"
> -
> -SUMMARY_${PN}-shell="Python shell-like functionality"
> -RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
> -FILES_${PN}-shell=" \
> -    ${libdir}/python2.7/cmd.* \
> -    ${libdir}/python2.7/commands.* \
> -    ${libdir}/python2.7/dircache.* \
> -    ${libdir}/python2.7/fnmatch.* \
> -    ${libdir}/python2.7/glob.* \
> -    ${libdir}/python2.7/popen2.* \
> -    ${libdir}/python2.7/shlex.* \
> -    ${libdir}/python2.7/shutil.* \
> -"
> -
> -SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
> -RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
> -FILES_${PN}-smtpd=" \
> -    ${bindir}/smtpd.* \
> -    ${libdir}/python2.7/smtpd.* \
> -"
> -
> -SUMMARY_${PN}-sqlite3="Python Sqlite3 database support"
> -RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt
> ${PN}-io ${PN}-threading ${PN}-zlib"
> -FILES_${PN}-sqlite3=" \
> -    ${libdir}/python2.7/lib-dynload/_sqlite3.so \
> -    ${libdir}/python2.7/sqlite3/dbapi2.* \
> -    ${libdir}/python2.7/sqlite3/__init__.* \
> -    ${libdir}/python2.7/sqlite3/dump.* \
> -"
> -
> -SUMMARY_${PN}-sqlite3-tests="Python Sqlite3 database support tests"
> -RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
> -FILES_${PN}-sqlite3-tests=" \
> -    ${libdir}/python2.7/sqlite3/test \
> -"
> -
> -SUMMARY_${PN}-stringold="Python string APIs [deprecated]"
> -RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
> -FILES_${PN}-stringold=" \
> -    ${libdir}/python2.7/lib-dynload/strop.so \
> -    ${libdir}/python2.7/string.* \
> -    ${libdir}/python2.7/stringold.* \
> -"
> -
> -SUMMARY_${PN}-subprocess="Python subprocess support"
> -RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl
> ${PN}-pickle"
> -FILES_${PN}-subprocess=" \
> -    ${libdir}/python2.7/subprocess.* \
> -"
> -
> -SUMMARY_${PN}-syslog="Python syslog interface"
> -RDEPENDS_${PN}-syslog="${PN}-core"
> -FILES_${PN}-syslog=" \
> -    ${libdir}/python2.7/lib-dynload/syslog.so \
> -"
> -
> -SUMMARY_${PN}-terminal="Python terminal controlling support"
> -RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
> -FILES_${PN}-terminal=" \
> -    ${libdir}/python2.7/pty.* \
> -    ${libdir}/python2.7/tty.* \
> -"
> -
> -SUMMARY_${PN}-tests="Python tests"
> -RDEPENDS_${PN}-tests="${PN}-core ${PN}-modules"
> -FILES_${PN}-tests=" \
> -    ${libdir}/python2.7/test \
> -"
> -
> -SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV
> support"
> -RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
> -FILES_${PN}-textutils=" \
> -    ${libdir}/python2.7/lib-dynload/_csv.so \
> -    ${libdir}/python2.7/csv.* \
> -    ${libdir}/python2.7/optparse.* \
> -    ${libdir}/python2.7/textwrap.* \
> -"
> -
> -SUMMARY_${PN}-threading="Python threading & synchronization support"
> -RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
> -FILES_${PN}-threading=" \
> -    ${libdir}/python2.7/_threading_local.* \
> -    ${libdir}/python2.7/dummy_thread.* \
> -    ${libdir}/python2.7/dummy_threading.* \
> -    ${libdir}/python2.7/mutex.* \
> -    ${libdir}/python2.7/threading.* \
> -    ${libdir}/python2.7/Queue.* \
> -"
> -
> -SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
> -RDEPENDS_${PN}-tkinter="${PN}-core"
> -FILES_${PN}-tkinter=" \
> -    ${libdir}/python2.7/lib-dynload/_tkinter.so \
> -    ${libdir}/python2.7/lib-tk \
> -"
> -
> -SUMMARY_${PN}-unittest="Python unit testing framework"
> -RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io
> ${PN}-difflib ${PN}-pprint ${PN}-shell"
> -FILES_${PN}-unittest=" \
> -    ${libdir}/python2.7/unittest/ \
> -"
> -
> -SUMMARY_${PN}-unixadmin="Python Unix administration support"
> -RDEPENDS_${PN}-unixadmin="${PN}-core"
> -FILES_${PN}-unixadmin=" \
> -    ${libdir}/python2.7/lib-dynload/nis.so \
> -    ${libdir}/python2.7/lib-dynload/grp.so \
> -    ${libdir}/python2.7/lib-dynload/pwd.so \
> -    ${libdir}/python2.7/getpass.* \
> -"
> -
> -SUMMARY_${PN}-xml="Python basic XML support"
> -RDEPENDS_${PN}-xml="${PN}-core ${PN}-re"
> -FILES_${PN}-xml=" \
> -    ${libdir}/python2.7/lib-dynload/_elementtree.so \
> -    ${libdir}/python2.7/lib-dynload/pyexpat.so \
> -    ${libdir}/python2.7/xml \
> -    ${libdir}/python2.7/xmllib.* \
> -"
> -
> -SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
> -RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
> -FILES_${PN}-xmlrpc=" \
> -    ${libdir}/python2.7/xmlrpclib.* \
> -    ${libdir}/python2.7/SimpleXMLRPCServer.* \
> -    ${libdir}/python2.7/DocXMLRPCServer.* \
> -"
> -
> -SUMMARY_${PN}-zlib="Python zlib compression support"
> -RDEPENDS_${PN}-zlib="${PN}-core"
> -FILES_${PN}-zlib=" \
> -    ${libdir}/python2.7/lib-dynload/zlib.so \
> -"
> -
> -SUMMARY_${PN}-modules="All Python modules"
> -RDEPENDS_${PN}-modules=" \
> -  ${PN}-2to3 \
> -  ${PN}-argparse \
> -  ${PN}-audio \
> -  ${PN}-bsddb \
> -  ${PN}-codecs \
> -  ${PN}-compile \
> -  ${PN}-compiler \
> -  ${PN}-compression \
> -  ${PN}-contextlib \
> -  ${PN}-core \
> -  ${PN}-crypt \
> -  ${PN}-ctypes \
> -  ${PN}-curses \
> -  ${PN}-datetime \
> -  ${PN}-db \
> -  ${PN}-debugger \
> -  ${PN}-difflib \
> -  ${PN}-distutils \
> -  ${PN}-doctest \
> -  ${PN}-email \
> -  ${PN}-fcntl \
> -  ${PN}-gdbm \
> -  ${PN}-hotshot \
> -  ${PN}-html \
> -  ${PN}-idle \
> -  ${PN}-image \
> -  ${PN}-importlib \
> -  ${PN}-io \
> -  ${PN}-json \
> -  ${PN}-lang \
> -  ${PN}-logging \
> -  ${PN}-mailbox \
> -  ${PN}-math \
> -  ${PN}-mime \
> -  ${PN}-mmap \
> -  ${PN}-multiprocessing \
> -  ${PN}-netclient \
> -  ${PN}-netserver \
> -  ${PN}-numbers \
> -  ${PN}-pickle \
> -  ${PN}-pkgutil \
> -  ${PN}-plistlib \
> -  ${PN}-pprint \
> -  ${PN}-profile \
> -  ${PN}-pydoc \
> -  ${PN}-re \
> -  ${PN}-readline \
> -  ${PN}-resource \
> -  ${PN}-robotparser \
> -  ${PN}-runpy \
> -  ${PN}-shell \
> -  ${PN}-smtpd \
> -  ${PN}-sqlite3 \
> -  ${PN}-sqlite3-tests \
> -  ${PN}-stringold \
> -  ${PN}-subprocess \
> -  ${PN}-syslog \
> -  ${PN}-terminal \
> -  ${PN}-textutils \
> -  ${PN}-threading \
> -  ${PN}-tkinter \
> -  ${PN}-unittest \
> -  ${PN}-unixadmin \
> -  ${PN}-xml \
> -  ${PN}-xmlrpc \
> -  ${PN}-zlib \
> -"
> -ALLOW_EMPTY_${PN}-modules = "1"
> -
> -
> diff --git a/meta/recipes-devtools/python/python-native-2.7-manifest.inc
> b/meta/recipes-devtools/python/python-native-2.7-manifest.inc
> deleted file mode 100644
> index b05aae0..0000000
> --- a/meta/recipes-devtools/python/python-native-2.7-manifest.inc
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -
> -# WARNING: This file is AUTO GENERATED: Manual edits will be lost next
> time I regenerate the file.
> -# Generator: '../scripts/contrib/python/generate-manifest-2.7.py
> --native' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <
> mlauer@vanille-media.de>
> -
> -
> -
> -RPROVIDES += "python-modules-native python-2to3-native
> python-argparse-native python-audio-native python-bsddb-native
> python-codecs-native python-compile-native python-compiler-native
> python-compression-native python-contextlib-native python-core-native
> python-crypt-native python-ctypes-native python-curses-native
> python-datetime-native python-db-native python-debugger-native
> python-dev-native python-difflib-native python-distutils-native
> python-distutils-staticdev-native python-doctest- [...]
> -
> -
> diff --git a/meta/recipes-devtools/python/python-native_2.7.13.bb
> b/meta/recipes-devtools/python/python-native_2.7.13.bb
> index 7edf153..2b74003 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.13.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.13.bb
> @@ -1,5 +1,4 @@
>  require python.inc
> -
>  EXTRANATIVEPATH += "bzip2-native"
>  DEPENDS = "openssl-native bzip2-replacement-native zlib-native
> readline-native sqlite3-native expat-native"
>  PR = "${INC_PR}.1"
> @@ -25,8 +24,6 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:"
>
>  inherit native
>
> -require python-native-${PYTHON_MAJMIN}-manifest.inc
> -
>  EXTRA_OECONF_append = " --bindir=${bindir}/${PN}
> --with-system-expat=${STAGING_DIR_HOST}"
>
>  EXTRA_OEMAKE = '\
> @@ -59,3 +56,24 @@ do_install() {
>         # installed in the native sysroot, so disable user site support.
>         sed -i -e 's,^\(ENABLE_USER_SITE = \).*,\1False,'
> ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
>  }
> +
> +python(){
> +
> +    # Read JSON manifest
> +    import json
> +    pythondir = d.getVar('THISDIR',True)
> +    with open(pythondir+'/python/python2-manifest.json') as
> manifest_file:
> +        python_manifest=json.load(manifest_file)
> +
> +    rprovides = d.getVar('RPROVIDES').split()
> +
> +    # Hardcoded since it cant be python-native-foo, should be
> python-foo-native
> +    pn = 'python'
> +
> +    for key in python_manifest:
> +        pypackage = pn + '-' + key + '-native'
> +        if pypackage not in rprovides:
> +              rprovides.append(pypackage)
> +
> +    d.setVar('RPROVIDES', ' '.join(rprovides))
> +}
> diff --git a/meta/recipes-devtools/python/python/create_manifest2.py
> b/meta/recipes-devtools/python/python/create_manifest2.py
> new file mode 100644
> index 0000000..bd64ec3
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/create_manifest2.py
> @@ -0,0 +1,277 @@
> +# This script is used as a bitbake task to create a new python manifest
> +# $ bitbake python -c create_manifest
> +#
> +# Our goal is to keep python-core as small as posible and add other python
> +# packages only when the user needs them, hence why we split upstream
> python
> +# into several packages.
> +#
> +# In a very simplistic way what this does is:
> +# Launch python and see specifically what is required for it to run at a
> minimum
> +#
> +# Go through the python-manifest file and launch a separate task for
> every single
> +# one of the files on each package, this task will check what was
> required for that
> +# specific module to run, these modules will be called dependencies.
> +# The output of such task will be a list of the modules or dependencies
> that were
> +# found for that file.
> +#
> +# Such output will be parsed by this script, we will look for each
> dependency on the
> +# manifest and if we find that another package already includes it, then
> we will add
> +# that package as an RDEPENDS to the package we are currently checking;
> in case we dont
> +# find the current dependency on any other package we will add it to the
> current package
> +# as part of FILES.
> +#
> +#
> +# This way we will create a new manifest from the data structure that was
> built during
> +# this process, ont this new manifest each package will contain
> specifically only
> +# what it needs to run.
> +#
> +# There are some caveats which we try to deal with, such as repeated
> files on different
> +# packages, packages that include folders, wildcards, and special
> packages.
> +# Its also important to note that this method only works for python
> files, and shared
> +# libraries. Static libraries, header files and binaries need to be dealt
> with manually.
> +#
> +# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <
> aehs29@gmail.com>
> +
> +
> +import sys
> +import subprocess
> +import json
> +import os
> +
> +# Hack to get native python search path (for folders), not fond of it but
> it works for now
> +pivot='recipe-sysroot-native'
> +for p in sys.path:
> +  if pivot in p:
> +    nativelibfolder=p[:p.find(pivot)+len(pivot)]
> +
> +# Empty dict to hold the whole manifest
> +new_manifest = {}
> +
> +# Check for repeated files, folders and wildcards
> +allfiles=[]
> +repeated=[]
> +wildcards=[]
> +
> +hasfolders=[]
> +allfolders=[]
> +
> +def isFolder(value):
> +  if os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib'))
> or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64'))
> or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
> +    return True
> +  else:
> +    return False
> +
> +# Read existing JSON manifest
> +with open('python2-manifest.json') as manifest:
> +  old_manifest=json.load(manifest)
> +
> +
> +# First pass to get core-package functionality, because we base
> everything on the fact that core is actually working
> +# Not exactly the same so it should not be a function
> +print ("Getting dependencies for core package:")
> +
> +# Special call to check for core package
> +output = subprocess.check_output([sys.executable, 'get_module_deps2.py',
> 'python-core-package'])
> +for item in output.split():
> +    # We append it so it doesnt hurt what we currently have:
> +    if item not in old_manifest['core']['files']:
> +        # We use the same data structure since its the one which will be
> used to check
> +        # dependencies for other packages
> +        old_manifest['core']['files'].append(item)
> +
> +for value in old_manifest['core']['files']:
> +  # Ignore folders, since we don't import those, difficult to handle
> multilib
> +  if isFolder(value):
> +    # Pass it directly
> +    if value not in old_manifest['core']['files']:
> +      old_manifest['core']['files'].append(value)
> +  # Ignore binaries, since we don't import those, assume it was added
> correctly (manually)
> +  if '${bindir}' in value:
> +    # Pass it directly
> +    if value not in old_manifest['core']['files']:
> +      old_manifest['core']['files'].append(value)
> +    continue
> +  # Ignore empty values
> +  if value == '':
> +    continue
> +  if '${includedir}' in value:
> +    if value not in old_manifest['core']['files']:
> +      old_manifest['core']['files'].append(value)
> +    continue
> +  # Get module name , shouldnt be affected by libdir/bindir
> +  value = os.path.splitext(os.path.basename(os.path.normpath(value)))[0]
> +
> +
> +  # Launch separate task for each module for deterministic behavior
> +  # Each module will only import what is necessary for it to work in
> specific
> +  print ('Getting dependencies for module: %s' % value)
> +  output = subprocess.check_output([sys.executable,
> 'get_module_deps2.py', '%s' % value])
> +  for item in output.split():
> +    # We append it so it doesnt hurt what we currently have:
> +    if item not in old_manifest['core']['files']:
> +      old_manifest['core']['files'].append(item)
> +
> +# We check which packages include folders
> +for key in old_manifest:
> +    for value in old_manifest[key]['files']:
> +        # Ignore folders, since we don't import those, difficult to
> handle multilib
> +        if isFolder(value):
> +            print ('%s is a folder' % value)
> +            if key not in hasfolders:
> +                hasfolders.append(key)
> +            if value not in allfolders:
> +                allfolders.append(value)
> +
> +for key in old_manifest:
> +    # Use an empty dict as data structure to hold data for each package
> and fill it up
> +    new_manifest[key]={}
> +    new_manifest[key]['files']=[]
> +    new_manifest[key]['rdepends']=[]
> +    # All packages should depend on core
> +    if key != 'core':
> +         new_manifest[key]['rdepends'].append('core')
> +    new_manifest[key]['summary']=old_manifest[key]['summary']
> +
> +    # Handle special cases, we assume that when they were manually added
> +    # to the manifest we knew what we were doing.
> +    print ('Handling package %s' % key)
> +    special_packages=['misc', 'modules', 'dev']
> +    if key in special_packages or 'staticdev' in key:
> +        print('Passing %s package directly' % key)
> +        new_manifest[key]=old_manifest[key]
> +        continue
> +
> +    for value in old_manifest[key]['files']:
> +        # We already handled core on the first pass
> +        if key == 'core':
> +            new_manifest[key]['files'].append(value)
> +            continue
> +        # Ignore folders, since we don't import those, difficult to
> handle multilib
> +        if isFolder(value):
> +            # Pass folders directly
> +            new_manifest[key]['files'].append(value)
> +        # Ignore binaries, since we don't import those
> +        if '${bindir}' in value:
> +            # Pass it directly to the new manifest data structure
> +            if value not in new_manifest[key]['files']:
> +                new_manifest[key]['files'].append(value)
> +            continue
> +        # Ignore empty values
> +        if value == '':
> +            continue
> +        if '${includedir}' in value:
> +            if value not in new_manifest[key]['files']:
> +                new_manifest[key]['files'].append(value)
> +            continue
> +        # Get module name , shouldnt be affected by libdir/bindir
> +        value = os.path.splitext(os.path.basename(os.path.normpath(
> value)))[0]
> +
> +        # Launch separate task for each module for deterministic behavior
> +        # Each module will only import what is necessary for it to work
> in specific
> +        print ('Getting dependencies for module: %s' % value)
> +        output = subprocess.check_output([sys.executable,
> 'get_module_deps2.py', '%s' % value])
> +
> +        # We can print dependencies for debugging purposes
> +        #print (output)
> +        # Output will have all dependencies
> +        for item in output.split():
> +
> +            # Warning: This first part is ugly
> +            # One of the dependencies that was found, could be inside of
> one of the folders included by another package
> +            # We need to check if this happens so we can add the package
> containing the folder as an RDEPENDS
> +            # e.g. Folder encodings contained in codecs
> +            # This would be solved if no packages included any folders
> +
> +            # This can be done in two ways:
> +            # 1 - We assume that if we take out the filename from the
> path we would get
> +            #   the folder string, then we would check if folder string
> is in the list of folders
> +            #   This would not work if a package contains a folder which
> contains another folder
> +            #   e.g. path/folder1/folder2/filename  folder_string=
> path/folder1/folder2
> +            #   folder_string would not match any value contained in the
> list of folders
> +            #
> +            # 2 - We do it the other way around, checking if the folder
> is contained in the path
> +            #   e.g. path/folder1/folder2/filename  folder_string=
> path/folder1/folder2
> +            #   is folder_string inside path/folder1/folder2/filename?,
> +            #   Yes, it works, but we waste a couple of milliseconds.
> +
> +            inFolders=False
> +            for folder in allfolders:
> +                if folder in item:
> +                    inFolders = True # Did we find a folder?
> +                    folderFound = False # Second flag to break inner for
> +                    # Loop only through packages which contain folders
> +                    for keyfolder in hasfolders:
> +                        if (folderFound == False):
> +                            #print("Checking folder %s on package %s" %
> (item,keyfolder))
> +                            for file_folder in old_manifest[keyfolder]['
> files']:
> +                                if file_folder==folder:
> +                                    print ('%s found in %s' % (folder,
> keyfolder))
> +                                    folderFound = True
> +                                    if keyfolder not in
> new_manifest[key]['rdepends'] and keyfolder != key:
> +                                        new_manifest[key]['rdepends'].
> append(keyfolder)
> +                        else:
> +                            break
> +
> +            # A folder was found so we're done with this item, we can go
> on
> +            if inFolders:
> +                continue
> +
> +            # We might already have it on the dictionary since it could
> depend on a (previously checked) module
> +            if item not in new_manifest[key]['files']:
> +                # Handle core as a special package, we already did it so
> we pass it to NEW data structure directly
> +                if key=='core':
> +                  print('Adding %s to %s FILES' % (item, key))
> +                  if item.endswith('*'):
> +                      wildcards.append(item)
> +                  new_manifest[key]['files'].append(item)
> +
> +                  # Check for repeated files
> +                  if item not in allfiles:
> +                      allfiles.append(item)
> +                  else:
> +                      repeated.append(item)
> +
> +                else:
> +
> +                    # Check if this dependency is already contained on
> another package, so we add it
> +                    # as an RDEPENDS, or if its not, it means it should
> be contained on the current
> +                    # package, so we should add it to FILES
> +                    for newkey in old_manifest:
> +                        # Debug
> +                        #print("Checking %s " % item + " in %s" % newkey)
> +                        if item in old_manifest[newkey]['files']:
> +                                # Since were nesting, we need to check
> its not the same key
> +                                if(newkey!=key):
> +                                    if newkey not in
> new_manifest[key]['rdepends']:
> +                                       # Add it to the new manifest data
> struct
> +                                       # Debug
> +                                       print('Adding %s to %s RDEPENDS,
> because it contains %s' % (newkey, key, item))
> +                                       new_manifest[key]['rdepends'].
> append(newkey)
> +                                    break
> +                    else:
> +                      # Debug
> +                      print('Adding %s to %s FILES' % (item, key))
> +                      # Since it wasnt found on another package, its not
> an RDEP, so add it to FILES for this package
> +                      new_manifest[key]['files'].append(item)
> +                      if item.endswith('*'):
> +                          wildcards.append(item)
> +                      if item not in allfiles:
> +                          allfiles.append(item)
> +                      else:
> +                          repeated.append(item)
> +
> +print ('The following files are repeated (contained in more than one
> package), please check which package should get it:')
> +print (repeated)
> +print('The following files contain wildcards, please check they are
> necessary')
> +print(wildcards)
> +print('The following files contain folders, please check they are
> necessary')
> +print(hasfolders)
> +
> +# Sort it just so it looks nice
> +for key in new_manifest:
> +    new_manifest[key]['files'].sort()
> +    new_manifest[key]['rdepends'].sort()
> +
> +# Create the manifest from the data structure that was built
> +with open('python2-manifest.json.new','w') as outfile:
> +    json.dump(new_manifest,outfile,sort_keys=True, indent=4)
> diff --git a/meta/recipes-devtools/python/python/get_module_deps2.py
> b/meta/recipes-devtools/python/python/get_module_deps2.py
> new file mode 100644
> index 0000000..73e7c6f
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/get_module_deps2.py
> @@ -0,0 +1,112 @@
> +# This script is launched on separate task for each python module
> +# It checks for dependencies for that specific module and prints
> +# them out, the output of this execution will have all dependencies
> +# for a specific module, which will be parsed an dealt on
> create_manifest.py
> +#
> +# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <
> aehs29@gmail.com>
> +
> +
> +# We can get a log per module, for all the dependencies that were found,
> but its messy.
> +debug=False
> +
> +import sys
> +
> +# We can get a list of the modules which are currently required to run
> python
> +# so we run python-core and get its modules, we then import what we need
> +# and check what modules are currently running, if we substract them from
> the
> +# modules we had initially, we get the dependencies for the module we
> imported.
> +
> +# We use importlib to achieve this, so we also need to know what modules
> importlib needs
> +import importlib
> +
> +core_deps=set(sys.modules)
> +
> +def fix_path(dep_path):
> +    import os
> +    # We DONT want the path on our HOST system
> +    pivot='recipe-sysroot-native'
> +    dep_path=dep_path[dep_path.find(pivot)+len(pivot):]
> +
> +    if '/usr/bin' in dep_path:
> +        dep_path = dep_path.replace('/usr/bin''${bindir}')
> +
> +    # Handle multilib, is there a better way?
> +    if '/usr/lib32' in dep_path:
> +        dep_path = dep_path.replace('/usr/lib32','${libdir}')
> +    if '/usr/lib64' in dep_path:
> +        dep_path = dep_path.replace('/usr/lib64','${libdir}')
> +    if '/usr/lib' in dep_path:
> +        dep_path = dep_path.replace('/usr/lib','${libdir}')
> +    if '/usr/include' in dep_path:
> +        dep_path = dep_path.replace('/usr/include','${includedir}')
> +    if '__init__.' in dep_path:
> +        dep_path =  os.path.split(dep_path)[0]
> +
> +    # If a *.pyc file was imported, we replace it with *.py (since we
> deal with PYCs on create_manifest)
> +    if '.pyc' in dep_path:
> +        dep_path = dep_path.replace('.pyc','.py')
> +
> +    return dep_path
> +
> +# Module to import was passed as an argument
> +current_module =  str(sys.argv[1]).rstrip()
> +if(debug==True):
> +       log = open('log_%s' % current_module,'w')
> +        log.write('Module %s generated the following dependencies:\n' %
> current_module)
> +try:
> +    importlib.import_module('%s' % current_module)
> +except ImportError as e:
> +    if (debug==True):
> +        log.write('Module was not found')
> +    pass
> +
> +
> +# Get current module dependencies, dif will contain a list of specific
> deps for this module
> +module_deps=set(sys.modules)
> +
> +# We handle the core package (1st pass on create_manifest.py) as a
> special case
> +if current_module == 'python-core-package':
> +    dif = core_deps
> +else:
> +    dif = module_deps-core_deps
> +
> +
> +# Check where each dependency came from
> +for item in dif:
> +    dep_path=''
> +    try:
> +        if (debug==True):
> +            log.write('Calling: sys.modules[' + '%s' % item +
> '].__file__\n')
> +        dep_path = sys.modules['%s' % item].__file__
> +    except AttributeError as e:
> +        # Deals with thread (builtin module) not having __file__ attribute
> +       if debug==True:
> +            log.write(item + ' ')
> +            log.write(str(e))
> +           log.write('\n')
> +            pass
> +    except NameError as e:
> +        # Deals with NameError: name 'dep_path' is not defined
> +        # because module is not found (wasn't compiled?), e.g. bddsm
> +        if (debug==True):
> +            log.write(item+' ')
> +            log.write(str(e))
> +        pass
> +
> +    # Site-customize is a special case since we (OpenEmbedded) put it
> there manually
> +    if 'sitecustomize' in dep_path:
> +        dep_path = '${libdir}/python2.7/sitecustomize.py'
> +        # Prints out result, which is what will be used by create_manifest
> +        print (dep_path)
> +        continue
> +
> +    dep_path = fix_path(dep_path)
> +
> +    if (debug==True):
> +        log.write(dep_path+'\n')
> +
> +    # Prints out result, which is what will be used by create_manifest
> +    print (dep_path)
> +
> +if debug==True:
> +    log.close()
> diff --git a/meta/recipes-devtools/python/python/python2-manifest.json
> b/meta/recipes-devtools/python/python/python2-manifest.json
> new file mode 100644
> index 0000000..8ebc715
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/python2-manifest.json
> @@ -0,0 +1,1032 @@
> +{
> +    "2to3": {
> +        "files": [
> +            "${bindir}/2to3",
> +            "${libdir}/python2.7/lib2to3"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python automated Python 2 to 3 code translator"
> +    },
> +    "argparse": {
> +        "files": [
> +            "${libdir}/python2.7/argparse.py"
> +        ],
> +        "rdepends": [
> +            "codecs",
> +            "core",
> +            "lang",
> +            "textutils"
> +        ],
> +        "summary": "Python command line argument parser"
> +    },
> +    "audio": {
> +        "files": [
> +            "${libdir}/python2.7/audiodev.py",
> +            "${libdir}/python2.7/chunk.py",
> +            "${libdir}/python2.7/lib-dynload/audioop.so",
> +            "${libdir}/python2.7/lib-dynload/ossaudiodev.so",
> +            "${libdir}/python2.7/sndhdr.py",
> +            "${libdir}/python2.7/sunau.py",
> +            "${libdir}/python2.7/sunaudio.py",
> +            "${libdir}/python2.7/toaiff.py",
> +            "${libdir}/python2.7/wave.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "crypt",
> +            "fcntl",
> +            "io",
> +            "math"
> +        ],
> +        "summary": "Python Audio Handling"
> +    },
> +    "bsddb": {
> +        "files": [
> +            "${libdir}/python2.7/bsddb",
> +            "${libdir}/python2.7/lib-dynload/_bsddb.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python bindings for the Berkeley Database"
> +    },
> +    "codecs": {
> +        "files": [
> +            "${libdir}/python2.7/gettext.py",
> +            "${libdir}/python2.7/lib-dynload/_codecs_cn.so",
> +            "${libdir}/python2.7/lib-dynload/_codecs_hk.so",
> +            "${libdir}/python2.7/lib-dynload/_codecs_iso2022.so",
> +            "${libdir}/python2.7/lib-dynload/_codecs_jp.so",
> +            "${libdir}/python2.7/lib-dynload/_codecs_kr.so",
> +            "${libdir}/python2.7/lib-dynload/_codecs_tw.so",
> +            "${libdir}/python2.7/lib-dynload/_multibytecodec.so",
> +            "${libdir}/python2.7/lib-dynload/unicodedata.so",
> +            "${libdir}/python2.7/locale.py",
> +            "${libdir}/python2.7/stringprep.py",
> +            "${libdir}/python2.7/xdrlib.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "io",
> +            "lang"
> +        ],
> +        "summary": "Python codec"
> +    },
> +    "compile": {
> +        "files": [
> +            "${libdir}/python2.7/compileall.py",
> +            "${libdir}/python2.7/py_compile.py"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python bytecode compilation support"
> +    },
> +    "compiler": {
> +        "files": [
> +            "${libdir}/python2.7/compiler"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "io",
> +            "lang"
> +        ],
> +        "summary": "Python compiler support"
> +    },
> +    "compression": {
> +        "files": [
> +            "${libdir}/python2.7/gzip.py",
> +            "${libdir}/python2.7/lib-dynload/bz2.so",
> +            "${libdir}/python2.7/tarfile.py",
> +            "${libdir}/python2.7/zipfile.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "io",
> +            "shell",
> +            "unixadmin",
> +            "zlib"
> +        ],
> +        "summary": "Python high-level compression support"
> +    },
> +    "contextlib": {
> +        "files": [
> +            "${libdir}/python2.7/contextlib.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "lang"
> +        ],
> +        "summary": "Python utilities for with-statementcontexts."
> +    },
> +    "core": {
> +        "files": [
> +            "${bindir}/python*",
> +            "${includedir}/python2.7/pyconfig*.h",
> +            "${libdir}/python2.7/ConfigParser.py",
> +            "${libdir}/python2.7/UserDict.py",
> +            "${libdir}/python2.7/UserList.py",
> +            "${libdir}/python2.7/UserString.py",
> +            "${libdir}/python2.7/__future__.py",
> +            "${libdir}/python2.7/_abcoll.py",
> +            "${libdir}/python2.7/_sysconfigdata.py",
> +            "${libdir}/python2.7/_weakrefset.py",
> +            "${libdir}/python2.7/abc.py",
> +            "${libdir}/python2.7/ast.py",
> +            "${libdir}/python2.7/atexit.py",
> +            "${libdir}/python2.7/codecs.py",
> +            "${libdir}/python2.7/collections.py",
> +            "${libdir}/python2.7/copy.py",
> +            "${libdir}/python2.7/copy_reg.py",
> +            "${libdir}/python2.7/encodings",
> +            "${libdir}/python2.7/encodings/aliases.py",
> +            "${libdir}/python2.7/encodings/utf_8.py",
> +            "${libdir}/python2.7/genericpath.py",
> +            "${libdir}/python2.7/getopt.py",
> +            "${libdir}/python2.7/heapq.py",
> +            "${libdir}/python2.7/importlib",
> +            "${libdir}/python2.7/keyword.py",
> +            "${libdir}/python2.7/lib-dynload/_collections.so",
> +            "${libdir}/python2.7/lib-dynload/_heapq.so",
> +            "${libdir}/python2.7/lib-dynload/_locale.so",
> +            "${libdir}/python2.7/lib-dynload/_struct.so",
> +            "${libdir}/python2.7/lib-dynload/binascii.so",
> +            "${libdir}/python2.7/lib-dynload/itertools.so",
> +            "${libdir}/python2.7/lib-dynload/operator.so",
> +            "${libdir}/python2.7/lib-dynload/readline.so",
> +            "${libdir}/python2.7/lib-dynload/strop.so",
> +            "${libdir}/python2.7/lib-dynload/time.so",
> +            "${libdir}/python2.7/lib-dynload/xreadlines.so",
> +            "${libdir}/python2.7/linecache.py",
> +            "${libdir}/python2.7/new.py",
> +            "${libdir}/python2.7/os.py",
> +            "${libdir}/python2.7/platform.py",
> +            "${libdir}/python2.7/posixpath.py",
> +            "${libdir}/python2.7/re.py",
> +            "${libdir}/python2.7/rlcompleter.py",
> +            "${libdir}/python2.7/site.py",
> +            "${libdir}/python2.7/sitecustomize.py",
> +            "${libdir}/python2.7/sre_compile.py",
> +            "${libdir}/python2.7/sre_constants.py",
> +            "${libdir}/python2.7/sre_parse.py",
> +            "${libdir}/python2.7/stat.py",
> +            "${libdir}/python2.7/string.py",
> +            "${libdir}/python2.7/struct.py",
> +            "${libdir}/python2.7/sysconfig.py",
> +            "${libdir}/python2.7/traceback.py",
> +            "${libdir}/python2.7/types.py",
> +            "${libdir}/python2.7/warnings.py",
> +            "${libdir}/python2.7/weakref.py"
> +        ],
> +        "rdepends": [],
> +        "summary": "Python interpreter and core modules"
> +    },
> +    "crypt": {
> +        "files": [
> +            "${libdir}/python2.7/hashlib.py",
> +            "${libdir}/python2.7/lib-dynload/_hashlib.so",
> +            "${libdir}/python2.7/lib-dynload/crypt.so",
> +            "${libdir}/python2.7/md5.py",
> +            "${libdir}/python2.7/sha.py"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python basic cryptographic and hashing support"
> +    },
> +    "ctypes": {
> +        "files": [
> +            "${libdir}/python2.7/ctypes",
> +            "${libdir}/python2.7/lib-dynload/_ctypes.so",
> +            "${libdir}/python2.7/lib-dynload/_ctypes_test.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python C types support"
> +    },
> +    "curses": {
> +        "files": [
> +            "${libdir}/python2.7/curses",
> +            "${libdir}/python2.7/lib-dynload/_curses.so",
> +            "${libdir}/python2.7/lib-dynload/_curses_panel.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python curses support"
> +    },
> +    "datetime": {
> +        "files": [
> +            "${libdir}/python2.7/_strptime.py",
> +            "${libdir}/python2.7/calendar.py",
> +            "${libdir}/python2.7/lib-dynload/datetime.so"
> +        ],
> +        "rdepends": [
> +            "codecs",
> +            "core",
> +            "lang"
> +        ],
> +        "summary": "Python calendar and time support"
> +    },
> +    "db": {
> +        "files": [
> +            "${libdir}/python2.7/anydbm.py",
> +            "${libdir}/python2.7/dbhash.py",
> +            "${libdir}/python2.7/dumbdbm.py",
> +            "${libdir}/python2.7/lib-dynload/dbm.so",
> +            "${libdir}/python2.7/whichdb.py"
> +        ],
> +        "rdepends": [
> +            "bsddb",
> +            "core",
> +            "gdbm"
> +        ],
> +        "summary": "Python file-based database support"
> +    },
> +    "debugger": {
> +        "files": [
> +            "${libdir}/python2.7/bdb.py",
> +            "${libdir}/python2.7/pdb.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "io",
> +            "lang",
> +            "pprint",
> +            "shell"
> +        ],
> +        "summary": "Python debugger"
> +    },
> +    "dev": {
> +        "files": [
> +            "${base_libdir}/*.a",
> +            "${base_libdir}/*.o",
> +            "${datadir}/aclocal",
> +            "${datadir}/pkgconfig",
> +            "${includedir}",
> +            "${libdir}/*.a",
> +            "${libdir}/*.la",
> +            "${libdir}/*.o",
> +            "${libdir}/lib*${SOLIBSDEV}",
> +            "${libdir}/pkgconfig",
> +            "${libdir}/python2.7/config/Makefile"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python development package"
> +    },
> +    "difflib": {
> +        "files": [
> +            "${libdir}/python2.7/difflib.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "lang"
> +        ],
> +        "summary": "Python helpers for computing deltas between objects"
> +    },
> +    "distutils": {
> +        "files": [
> +            "${libdir}/python2.7/config",
> +            "${libdir}/python2.7/distutils"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python Distribution Utilities"
> +    },
> +    "distutils-staticdev": {
> +        "files": [
> +            "${libdir}/python2.7/config/lib*.a"
> +        ],
> +        "rdepends": [
> +            "distutils"
> +        ],
> +        "summary": "Python distribution utilities (static libraries)"
> +    },
> +    "doctest": {
> +        "files": [
> +            "${libdir}/python2.7/doctest.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "crypt",
> +            "debugger",
> +            "difflib",
> +            "fcntl",
> +            "io",
> +            "lang",
> +            "math",
> +            "pprint",
> +            "shell",
> +            "unittest"
> +        ],
> +        "summary": "Python framework for running examples in docstrings"
> +    },
> +    "email": {
> +        "files": [
> +            "${libdir}/python2.7/email",
> +            "${libdir}/python2.7/imaplib.py"
> +        ],
> +        "rdepends": [
> +            "contextlib",
> +            "core",
> +            "crypt",
> +            "fcntl",
> +            "io",
> +            "lang",
> +            "math",
> +            "netclient",
> +            "pickle",
> +            "subprocess",
> +            "textutils"
> +        ],
> +        "summary": "Python email support"
> +    },
> +    "fcntl": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/fcntl.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python's fcntl interface"
> +    },
> +    "gdbm": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/gdbm.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python GNU database support"
> +    },
> +    "hotshot": {
> +        "files": [
> +            "${libdir}/python2.7/hotshot",
> +            "${libdir}/python2.7/lib-dynload/_hotshot.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python hotshot performance profiler"
> +    },
> +    "html": {
> +        "files": [
> +            "${libdir}/python2.7/HTMLParser.py",
> +            "${libdir}/python2.7/formatter.py",
> +            "${libdir}/python2.7/htmlentitydefs.py",
> +            "${libdir}/python2.7/htmllib.py",
> +            "${libdir}/python2.7/markupbase.py",
> +            "${libdir}/python2.7/sgmllib.py"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python HTML processing support"
> +    },
> +    "idle": {
> +        "files": [
> +            "${bindir}/idle",
> +            "${libdir}/python2.7/idlelib"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python Integrated Development Environment"
> +    },
> +    "image": {
> +        "files": [
> +            "${libdir}/python2.7/colorsys.py",
> +            "${libdir}/python2.7/imghdr.py"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python graphical image handling"
> +    },
> +    "io": {
> +        "files": [
> +            "${libdir}/python2.7/StringIO.py",
> +            "${libdir}/python2.7/_pyio.py",
> +            "${libdir}/python2.7/io.py",
> +            "${libdir}/python2.7/lib-dynload/_io.so",
> +            "${libdir}/python2.7/lib-dynload/_socket.so",
> +            "${libdir}/python2.7/lib-dynload/_ssl.so",
> +            "${libdir}/python2.7/lib-dynload/cStringIO.so",
> +            "${libdir}/python2.7/lib-dynload/select.so",
> +            "${libdir}/python2.7/lib-dynload/termios.so",
> +            "${libdir}/python2.7/pipes.py",
> +            "${libdir}/python2.7/socket.py",
> +            "${libdir}/python2.7/ssl.py",
> +            "${libdir}/python2.7/tempfile.py"
> +        ],
> +        "rdepends": [
> +            "contextlib",
> +            "core",
> +            "crypt",
> +            "fcntl",
> +            "lang",
> +            "math",
> +            "netclient",
> +            "textutils"
> +        ],
> +        "summary": "Python low-level I/O"
> +    },
> +    "json": {
> +        "files": [
> +            "${libdir}/python2.7/json",
> +            "${libdir}/python2.7/lib-dynload/_json.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python JSON support"
> +    },
> +    "lang": {
> +        "files": [
> +            "${libdir}/python2.7/bisect.py",
> +            "${libdir}/python2.7/code.py",
> +            "${libdir}/python2.7/codeop.py",
> +            "${libdir}/python2.7/dis.py",
> +            "${libdir}/python2.7/functools.py",
> +            "${libdir}/python2.7/inspect.py",
> +            "${libdir}/python2.7/lib-dynload/_bisect.so",
> +            "${libdir}/python2.7/lib-dynload/_functools.so",
> +            "${libdir}/python2.7/lib-dynload/array.so",
> +            "${libdir}/python2.7/lib-dynload/parser.so",
> +            "${libdir}/python2.7/opcode.py",
> +            "${libdir}/python2.7/repr.py",
> +            "${libdir}/python2.7/symbol.py",
> +            "${libdir}/python2.7/token.py",
> +            "${libdir}/python2.7/tokenize.py"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python low-level language support"
> +    },
> +    "logging": {
> +        "files": [
> +            "${libdir}/python2.7/logging"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "io",
> +            "threading"
> +        ],
> +        "summary": "Python logging support"
> +    },
> +    "mailbox": {
> +        "files": [
> +            "${libdir}/python2.7/mailbox.py"
> +        ],
> +        "rdepends": [
> +            "codecs",
> +            "contextlib",
> +            "core",
> +            "crypt",
> +            "datetime",
> +            "email",
> +            "fcntl",
> +            "io",
> +            "lang",
> +            "math",
> +            "mime",
> +            "netclient",
> +            "textutils"
> +        ],
> +        "summary": "Python mailbox format support"
> +    },
> +    "math": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/_random.so",
> +            "${libdir}/python2.7/lib-dynload/cmath.so",
> +            "${libdir}/python2.7/lib-dynload/math.so",
> +            "${libdir}/python2.7/random.py",
> +            "${libdir}/python2.7/sets.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "crypt"
> +        ],
> +        "summary": "Python math support"
> +    },
> +    "mime": {
> +        "files": [
> +            "${libdir}/python2.7/MimeWriter.py",
> +            "${libdir}/python2.7/mimetools.py",
> +            "${libdir}/python2.7/mimetypes.py",
> +            "${libdir}/python2.7/quopri.py",
> +            "${libdir}/python2.7/rfc822.py",
> +            "${libdir}/python2.7/uu.py"
> +        ],
> +        "rdepends": [
> +            "contextlib",
> +            "core",
> +            "crypt",
> +            "fcntl",
> +            "io",
> +            "lang",
> +            "math",
> +            "netclient",
> +            "textutils"
> +        ],
> +        "summary": "Python MIME handling APIs"
> +    },
> +    "mmap": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/mmap.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python memory-mapped file support"
> +    },
> +    "modules": {
> +        "files": [],
> +        "rdepends": [
> +            "2to3",
> +            "argparse",
> +            "audio",
> +            "bsddb",
> +            "codecs",
> +            "compile",
> +            "compiler",
> +            "compression",
> +            "contextlib",
> +            "core",
> +            "crypt",
> +            "ctypes",
> +            "curses",
> +            "datetime",
> +            "db",
> +            "debugger",
> +            "difflib",
> +            "distutils",
> +            "doctest",
> +            "email",
> +            "fcntl",
> +            "gdbm",
> +            "hotshot",
> +            "html",
> +            "idle",
> +            "image",
> +            "io",
> +            "json",
> +            "lang",
> +            "logging",
> +            "mailbox",
> +            "math",
> +            "mime",
> +            "mmap",
> +            "multiprocessing",
> +            "netclient",
> +            "netserver",
> +            "numbers",
> +            "pickle",
> +            "pkgutil",
> +            "plistlib",
> +            "pprint",
> +            "profile",
> +            "pydoc",
> +            "re",
> +            "resource",
> +            "robotparser",
> +            "shell",
> +            "smtpd",
> +            "sqlite3",
> +            "sqlite3",
> +            "stringold",
> +            "subprocess",
> +            "syslog",
> +            "terminal",
> +            "textutils",
> +            "threading",
> +            "tkinter",
> +            "unittest",
> +            "unixadmin",
> +            "xml",
> +            "xmlrpc",
> +            "zlib"
> +        ],
> +        "summary": "All Python modules"
> +    },
> +    "multiprocessing": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/_multiprocessing.so",
> +            "${libdir}/python2.7/multiprocessing"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "fcntl",
> +            "io",
> +            "pickle",
> +            "subprocess",
> +            "threading"
> +        ],
> +        "summary": "Python multiprocessing support"
> +    },
> +    "netclient": {
> +        "files": [
> +            "${libdir}/python2.7/Cookie.py",
> +            "${libdir}/python2.7/_LWPCookieJar.py",
> +            "${libdir}/python2.7/_MozillaCookieJar.py",
> +            "${libdir}/python2.7/base64.py",
> +            "${libdir}/python2.7/cookielib.py",
> +            "${libdir}/python2.7/ftplib.py",
> +            "${libdir}/python2.7/hmac.py",
> +            "${libdir}/python2.7/httplib.py",
> +            "${libdir}/python2.7/nntplib.py",
> +            "${libdir}/python2.7/poplib.py",
> +            "${libdir}/python2.7/smtplib.py",
> +            "${libdir}/python2.7/telnetlib.py",
> +            "${libdir}/python2.7/urllib.py",
> +            "${libdir}/python2.7/urllib2.py",
> +            "${libdir}/python2.7/urlparse.py",
> +            "${libdir}/python2.7/uuid.py"
> +        ],
> +        "rdepends": [
> +            "codecs",
> +            "contextlib",
> +            "core",
> +            "crypt",
> +            "ctypes",
> +            "datetime",
> +            "email",
> +            "fcntl",
> +            "io",
> +            "lang",
> +            "math",
> +            "mime",
> +            "pickle",
> +            "subprocess",
> +            "textutils",
> +            "threading"
> +        ],
> +        "summary": "Python Internet Protocol clients"
> +    },
> +    "netserver": {
> +        "files": [
> +            "${libdir}/python2.7/BaseHTTPServer.py",
> +            "${libdir}/python2.7/CGIHTTPServer.py",
> +            "${libdir}/python2.7/SimpleHTTPServer.py",
> +            "${libdir}/python2.7/SocketServer.py",
> +            "${libdir}/python2.7/cgi.py"
> +        ],
> +        "rdepends": [
> +            "contextlib",
> +            "core",
> +            "crypt",
> +            "fcntl",
> +            "io",
> +            "lang",
> +            "math",
> +            "mime",
> +            "netclient",
> +            "shell",
> +            "textutils",
> +            "threading",
> +            "unixadmin"
> +        ],
> +        "summary": "Python Internet Protocol servers"
> +    },
> +    "numbers": {
> +        "files": [
> +            "${libdir}/python2.7/decimal.py",
> +            "${libdir}/python2.7/fractions.py",
> +            "${libdir}/python2.7/numbers.py"
> +        ],
> +        "rdepends": [
> +            "codecs",
> +            "core",
> +            "lang",
> +            "math",
> +            "threading"
> +        ],
> +        "summary": "Python number APIs"
> +    },
> +    "pickle": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/cPickle.so",
> +            "${libdir}/python2.7/pickle.py",
> +            "${libdir}/python2.7/pickletools.py",
> +            "${libdir}/python2.7/shelve.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "io"
> +        ],
> +        "summary": "Python serialisation/persistence support"
> +    },
> +    "pkgutil": {
> +        "files": [
> +            "${libdir}/python2.7/pkgutil.py"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python package extension utility support"
> +    },
> +    "plistlib": {
> +        "files": [
> +            "${libdir}/python2.7/plistlib.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "datetime",
> +            "io"
> +        ],
> +        "summary": "Generate and parse Mac OS X .plist files"
> +    },
> +    "pprint": {
> +        "files": [
> +            "${libdir}/python2.7/pprint.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "io"
> +        ],
> +        "summary": "Python pretty-print support"
> +    },
> +    "profile": {
> +        "files": [
> +            "${libdir}/python2.7/cProfile.py",
> +            "${libdir}/python2.7/lib-dynload/_lsprof.so",
> +            "${libdir}/python2.7/profile.py",
> +            "${libdir}/python2.7/pstats.py"
> +        ],
> +        "rdepends": [
> +            "codecs",
> +            "core",
> +            "lang",
> +            "resource",
> +            "textutils"
> +        ],
> +        "summary": "Python basic performance profiling support"
> +    },
> +    "pydoc": {
> +        "files": [
> +            "${bindir}/pydoc",
> +            "${libdir}/python2.7/pydoc.py",
> +            "${libdir}/python2.7/pydoc_data"
> +        ],
> +        "rdepends": [
> +            "codecs",
> +            "core",
> +            "lang",
> +            "pkgutil"
> +        ],
> +        "summary": "Python interactive help support"
> +    },
> +    "re": {
> +        "files": [
> +            "${libdir}/python2.7/sre.py"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python Regular Expression APIs"
> +    },
> +    "resource": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/resource.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python resource control interface"
> +    },
> +    "robotparser": {
> +        "files": [
> +            "${libdir}/python2.7/robotparser.py"
> +        ],
> +        "rdepends": [
> +            "contextlib",
> +            "core",
> +            "io",
> +            "lang",
> +            "netclient",
> +            "textutils"
> +        ],
> +        "summary": "Python robots.txt parser"
> +    },
> +    "shell": {
> +        "files": [
> +            "${libdir}/python2.7/cmd.py",
> +            "${libdir}/python2.7/commands.py",
> +            "${libdir}/python2.7/dircache.py",
> +            "${libdir}/python2.7/fnmatch.py",
> +            "${libdir}/python2.7/glob.py",
> +            "${libdir}/python2.7/popen2.py",
> +            "${libdir}/python2.7/shlex.py",
> +            "${libdir}/python2.7/shutil.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "io",
> +            "unixadmin"
> +        ],
> +        "summary": "Python shell-like functionality"
> +    },
> +    "smtpd": {
> +        "files": [
> +            "${bindir}/smtpd.py",
> +            "${libdir}/python2.7/asynchat.py",
> +            "${libdir}/python2.7/asyncore.py",
> +            "${libdir}/python2.7/smtpd.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "fcntl",
> +            "io",
> +            "lang"
> +        ],
> +        "summary": "Python Simple Mail Transport Daemon"
> +    },
> +    "sqlite3": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/_sqlite3.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python Sqlite3 database support"
> +    },
> +    "sqlite3-tests": {
> +        "files": [
> +            "${libdir}/python2.7/sqlite3/test"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "tests"
> +        ],
> +        "summary": "Python Sqlite3 database support tests"
> +    },
> +    "stringold": {
> +        "files": [
> +            "${libdir}/python2.7/stringold.py"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python string APIs [deprecated]"
> +    },
> +    "subprocess": {
> +        "files": [
> +            "${libdir}/python2.7/subprocess.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "fcntl",
> +            "io",
> +            "pickle"
> +        ],
> +        "summary": "Python subprocess support"
> +    },
> +    "syslog": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/syslog.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python syslog interface"
> +    },
> +    "terminal": {
> +        "files": [
> +            "${libdir}/python2.7/pty.py",
> +            "${libdir}/python2.7/tty.py"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "io"
> +        ],
> +        "summary": "Python terminal controlling support"
> +    },
> +    "tests": {
> +        "files": [
> +            "${libdir}/python2.7/test"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python tests"
> +    },
> +    "textutils": {
> +        "files": [
> +            "${libdir}/python2.7/csv.py",
> +            "${libdir}/python2.7/lib-dynload/_csv.so",
> +            "${libdir}/python2.7/optparse.py",
> +            "${libdir}/python2.7/textwrap.py"
> +        ],
> +        "rdepends": [
> +            "codecs",
> +            "core",
> +            "io",
> +            "lang"
> +        ],
> +        "summary": "Python option parsin"
> +    },
> +    "threading": {
> +        "files": [
> +            "${libdir}/python2.7/Queue.py",
> +            "${libdir}/python2.7/_threading_local.py",
> +            "${libdir}/python2.7/dummy_thread.py",
> +            "${libdir}/python2.7/dummy_threading.py",
> +            "${libdir}/python2.7/mutex.py",
> +            "${libdir}/python2.7/threading.py"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python threading & synchronization support"
> +    },
> +    "tkinter": {
> +        "files": [
> +            "${libdir}/python2.7/lib-tk"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python Tcl/Tk bindings"
> +    },
> +    "unittest": {
> +        "files": [
> +            "${libdir}/python2.7/unittest"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "difflib",
> +            "io",
> +            "lang",
> +            "pprint",
> +            "shell"
> +        ],
> +        "summary": "Python unit testing framework"
> +    },
> +    "unixadmin": {
> +        "files": [
> +            "${libdir}/python2.7/getpass.py",
> +            "${libdir}/python2.7/lib-dynload/grp.so",
> +            "${libdir}/python2.7/lib-dynload/nis.so"
> +        ],
> +        "rdepends": [
> +            "core",
> +            "io"
> +        ],
> +        "summary": "Python Unix administration support"
> +    },
> +    "xml": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/_elementtree.so",
> +            "${libdir}/python2.7/lib-dynload/pyexpat.so",
> +            "${libdir}/python2.7/xml"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python basic XML support"
> +    },
> +    "xmlrpc": {
> +        "files": [
> +            "${libdir}/python2.7/DocXMLRPCServer.py",
> +            "${libdir}/python2.7/SimpleXMLRPCServer.py"
> +        ],
> +        "rdepends": [
> +            "codecs",
> +            "compression",
> +            "contextlib",
> +            "core",
> +            "crypt",
> +            "datetime",
> +            "fcntl",
> +            "io",
> +            "lang",
> +            "math",
> +            "mime",
> +            "netclient",
> +            "netserver",
> +            "pkgutil",
> +            "pydoc",
> +            "textutils",
> +            "threading",
> +            "xml",
> +            "zlib"
> +        ],
> +        "summary": "Python XML-RPC support"
> +    },
> +    "zlib": {
> +        "files": [
> +            "${libdir}/python2.7/lib-dynload/zlib.so"
> +        ],
> +        "rdepends": [
> +            "core"
> +        ],
> +        "summary": "Python zlib compression support"
> +    }
> +}
> \ No newline at end of file
> diff --git a/meta/recipes-devtools/python/python/sitecustomize.py
> b/meta/recipes-devtools/python/python/sitecustomize.py
> index 2739018..4c8b5e2 100644
> --- a/meta/recipes-devtools/python/python/sitecustomize.py
> +++ b/meta/recipes-devtools/python/python/sitecustomize.py
> @@ -27,19 +27,11 @@ def __enableReadlineSupport():
>      except IOError:
>          pass
>
> -def __enableDefaultEncoding():
> -    import sys
> -    try:
> -        sys.setdefaultencoding( "utf8" )
> -    except LookupError:
> -        pass
> -
>  import sys
>  try:
>      import rlcompleter, readline
>  except ImportError:
>      pass
>  else:
> -    __enableDefaultEncoding()
>      __registerExitHandler()
>      __enableReadlineSupport()
> diff --git a/meta/recipes-devtools/python/python_2.7.13.bb
> b/meta/recipes-devtools/python/python_2.7.13.bb
> index 754c029..dbafb95 100644
> --- a/meta/recipes-devtools/python/python_2.7.13.bb
> +++ b/meta/recipes-devtools/python/python_2.7.13.bb
> @@ -1,5 +1,7 @@
>  require python.inc
> +
>  DEPENDS = "python-native libffi bzip2 gdbm openssl readline sqlite3 zlib"
> +
>  PR = "${INC_PR}"
>
>  DISTRO_SRC_URI ?= "file://sitecustomize.py"
> @@ -145,11 +147,9 @@ py_package_preprocess () {
>      python -m py_compile ${PKGD}/${libdir}/python${
> PYTHON_MAJMIN}/_sysconfigdata.py
>  }
>
> -require python-${PYTHON_MAJMIN}-manifest.inc
>
>  # manual dependency additions
>  RPROVIDES_${PN}-core = "${PN}"
> -RRECOMMENDS_${PN}-core = "${PN}-readline"
>  RRECOMMENDS_${PN}-core_append_class-nativesdk = "
> nativesdk-python-modules"
>  RRECOMMENDS_${PN}-crypt = "openssl"
>
> @@ -193,3 +193,87 @@ FILES_${PN}-man = "${datadir}/man"
>  RDEPENDS_${PN}-modules_remove = "${@bb.utils.contains('PACKAGECONFIG',
> 'bdb', '', '${PN}-bsddb', d)}"
>
>  BBCLASSEXTEND = "nativesdk"
> +
> +RPROVIDES_${PN} += "${PN}-modules"
> +
> +# We want bytecode precompiled .py files (.pyc's) by default
> +# but the user may set it on their own conf
> +
> +INCLUDE_PYCS ?= "1"
> +
> +python(){
> +
> +    pythondir = d.getVar('THISDIR',True)
> +
> +    # Read JSON manifest
> +    import json
> +    with open(pythondir+'/python/python2-manifest.json') as
> manifest_file:
> +        python_manifest=json.load(manifest_file)
> +
> +    include_pycs = d.getVar('INCLUDE_PYCS')
> +
> +    packages = d.getVar('PACKAGES').split()
> +    pn = d.getVar('PN')
> +
> +
> +    newpackages=[]
> +
> +    for key in python_manifest:
> +        pypackage= pn + '-' + key
> +
> +        if pypackage not in packages:
> +            # We need to prepend, otherwise python-misc gets everything
> +            # so we use a new variable
> +            newpackages.append(pypackage)
> +
> +        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
> +        d.setVar('FILES_' + pypackage, '')
> +        for value in python_manifest[key]['files']:
> +            d.appendVar('FILES_' + pypackage, ' ' + value)
> +            if include_pycs == '1':
> +                if value.endswith('.py'):
> +                    d.appendVar('FILES_' + pypackage, ' ' + value + 'c')
> +
> +        d.setVar('RDEPENDS_' + pypackage, '')
> +        for value in python_manifest[key]['rdepends']:
> +            # Make it work with or without $PN
> +            if '${PN}' in value:
> +                value=value.split('-')[1]
> +            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
> +        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
> +
> +    # We need to ensure staticdev packages match for files first so we
> sort in reverse
> +    newpackages.sort(reverse=True)
> +    # Prepending so to avoid python-misc getting everything
> +    packages = newpackages + packages
> +    d.setVar('PACKAGES', ' '.join(packages))
> +    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
> +}
> +
> +do_split_packages[file-checksums] += "${THISDIR}/python/python2-
> manifest.json:True"
> +
> +# Files needed to create a new manifest
> +SRC_URI += "file://create_manifest2.py file://get_module_deps2.py
> file://python2-manifest.json"
> +
> +do_create_manifest() {
> +
> +# This task should be run with every new release of Python.
> +# We must ensure that PACKAGECONFIG enables everything when creating
> +# a new manifest, this is to base our new manifest on a complete
> +# native python build, containing all dependencies, otherwise the task
> +# wont be able to find the required files.
> +# e.g. BerkeleyDB is an optional build dependency so it may or may not
> +# be present, we must ensure it is.
> +
> +cd ${WORKDIR}
> +# This needs to be executed by python-native and NOT by HOST's python
> +nativepython create_manifest2.py
> +cp python2-manifest.json.new ${THISDIR}/python/python2-manifest.json
> +}
> +
> +# bitbake python -c create_manifest
> +addtask do_create_manifest
> +
> +# Make sure we have native python ready when we create a new manifest
> +do_create_manifest[depends] += "python:do_prepare_recipe_sysroot"
> +do_create_manifest[depends] += "python:do_patch"
> diff --git a/scripts/contrib/python/generate-manifest-2.7.py
> b/scripts/contrib/python/generate-manifest-2.7.py
> deleted file mode 100755
> index ee75403..0000000
> --- a/scripts/contrib/python/generate-manifest-2.7.py
> +++ /dev/null
> @@ -1,426 +0,0 @@
> -#!/usr/bin/env python
> -
> -# generate Python Manifest for the OpenEmbedded build system
> -# (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
> -# (C) 2007 Jeremy Laine
> -# licensed under MIT, see COPYING.MIT
> -#
> -# June 22, 2011 -- Mark Hatle <mark.hatle@windriver.com>
> -#  * Updated to no longer generate special -dbg package, instead use the
> -#    single system -dbg
> -#  * Update version with ".1" to indicate this change
> -#
> -# February 26, 2017 -- Ming Liu <peter.x.liu@external.atlascopco.com>
> -#  * Updated to support generating manifest for native python
> -
> -import os
> -import sys
> -import time
> -import argparse
> -
> -VERSION = "2.7.2"
> -
> -__author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
> -__version__ = "20110222.2"
> -
> -class MakefileMaker:
> -
> -    def __init__( self, outfile, isNative ):
> -        """initialize"""
> -        self.packages = {}
> -        self.excluded_pkgs = []
> -        self.targetPrefix = "${libdir}/python%s/" % VERSION[:3]
> -        self.isNative = isNative
> -        self.output = outfile
> -        self.out( """
> -# WARNING: This file is AUTO GENERATED: Manual edits will be lost next
> time I regenerate the file.
> -# Generator: '%s%s' Version %s (C) 2002-2010 Michael 'Mickey' Lauer <
> mlauer@vanille-media.de>
> -""" % ( sys.argv[0], ' --native' if isNative else '', __version__ ) )
> -
> -    #
> -    # helper functions
> -    #
> -
> -    def out( self, data ):
> -        """print a line to the output file"""
> -        self.output.write( "%s\n" % data )
> -
> -    def setPrefix( self, targetPrefix ):
> -        """set a file prefix for addPackage files"""
> -        self.targetPrefix = targetPrefix
> -
> -    def doProlog( self ):
> -        self.out( """ """ )
> -        self.out( "" )
> -
> -    def addPackage( self, name, description, dependencies, filenames,
> mod_exclude = False ):
> -        """add a package to the Makefile"""
> -        if type( filenames ) == type( "" ):
> -            filenames = filenames.split()
> -        fullFilenames = []
> -        for filename in filenames:
> -            if filename[0] != "$":
> -                fullFilenames.append( "%s%s" % ( self.targetPrefix,
> filename ) )
> -            else:
> -                fullFilenames.append( filename )
> -        if mod_exclude:
> -            self.excluded_pkgs.append( name )
> -        self.packages[name] = description, dependencies, fullFilenames
> -
> -    def doBody( self ):
> -        """generate body of Makefile"""
> -
> -        global VERSION
> -
> -        #
> -        # generate rprovides line for native
> -        #
> -
> -        if self.isNative:
> -            pkglist = []
> -            for name in ['${PN}-modules'] + sorted(self.packages):
> -                pkglist.append('%s-native' % name.replace('${PN}',
> 'python'))
> -
> -            self.out('RPROVIDES += "%s"' % " ".join(pkglist))
> -            return
> -
> -        #
> -        # generate provides line
> -        #
> -
> -        provideLine = 'PROVIDES+=" \\\n'
> -        for name in sorted(self.packages):
> -            provideLine += "  %s \\\n" % name
> -        provideLine += '"'
> -
> -        self.out( provideLine )
> -        self.out( "" )
> -
> -        #
> -        # generate package line
> -        #
> -
> -        packageLine = 'PACKAGES=" \\\n'
> -        packageLine += '  ${PN}-dbg \\\n'
> -        for name in sorted(self.packages):
> -            if name.startswith("${PN}-distutils"):
> -                if name == "${PN}-distutils":
> -                    packageLine += "  %s-staticdev %s \\\n" % (name, name)
> -            elif name != '${PN}-dbg':
> -                packageLine += "  %s \\\n" % name
> -        packageLine += '  ${PN}-modules\\\n"'
> -
> -        self.out( packageLine )
> -        self.out( "" )
> -
> -        #
> -        # generate package variables
> -        #
> -
> -        for name, data in sorted(self.packages.items()):
> -            desc, deps, files = data
> -
> -            #
> -            # write out the description, revision and dependencies
> -            #
> -            self.out( 'SUMMARY_%s="%s"' % ( name, desc ) )
> -            self.out( 'RDEPENDS_%s="%s"' % ( name, deps ) )
> -
> -            line = 'FILES_%s=" \\\n' % name
> -
> -            #
> -            # check which directories to make in the temporary directory
> -            #
> -
> -            dirset = {} # if python had a set-datatype this would be
> sufficient. for now, we're using a dict instead.
> -            for target in files:
> -                dirset[os.path.dirname( target )] = True
> -
> -            #
> -            # generate which files to copy for the target (-dfR because
> whole directories are also allowed)
> -            #
> -
> -            for target in files:
> -                line += "    %s \\\n" % target
> -
> -            line += '"'
> -            self.out( line )
> -            self.out( "" )
> -
> -        self.out( 'SUMMARY_${PN}-modules="All Python modules"' )
> -        line = 'RDEPENDS_${PN}-modules=" \\\n'
> -
> -        for name, data in sorted(self.packages.items()):
> -            if name not in ['${PN}-dev', '${PN}-distutils-staticdev'] and
> name not in self.excluded_pkgs:
> -                line += "  %s \\\n" % name
> -
> -        line += '"'
> -        self.out( line )
> -        self.out( 'ALLOW_EMPTY_${PN}-modules = "1"' )
> -
> -    def doEpilog( self ):
> -        self.out( """""" )
> -        self.out( "" )
> -
> -    def make( self ):
> -        self.doProlog()
> -        self.doBody()
> -        self.doEpilog()
> -
> -if __name__ == "__main__":
> -    parser = argparse.ArgumentParser( description='generate python
> manifest' )
> -    parser.add_argument( '-n', '--native', help='generate manifest for
> native python', action='store_true' )
> -    parser.add_argument( 'outfile', metavar='OUTPUT_FILE', nargs='?',
> default='', help='Output file (defaults to stdout)' )
> -    args = parser.parse_args()
> -
> -    if args.outfile:
> -        try:
> -            os.unlink( args.outfile )
> -        except Exception:
> -            sys.exc_clear()
> -        outfile = open( args.outfile, "w" )
> -    else:
> -        outfile = sys.stdout
> -
> -    m = MakefileMaker( outfile, args.native )
> -
> -    # Add packages here. Only specify dlopen-style library dependencies
> here, no ldd-style dependencies!
> -    # Parameters: revision, name, description, dependencies, filenames
> -    #
> -
> -    m.addPackage( "${PN}-core", "Python interpreter and core modules",
> "${PN}-lang ${PN}-re",
> -    "__future__.* _abcoll.* abc.* ast.* copy.* copy_reg.* ConfigParser.*
> " +
> -    "genericpath.* getopt.* linecache.* new.* " +
> -    "os.* posixpath.* struct.* " +
> -    "warnings.* site.* stat.* " +
> -    "UserDict.* UserList.* UserString.* " +
> -    "lib-dynload/binascii.so lib-dynload/_struct.so lib-dynload/time.so "
> +
> -    "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python* "  +
> -    "_weakrefset.* sysconfig.* _sysconfigdata.* " +
> -    "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
> -    "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
> -
> -    m.addPackage( "${PN}-dev", "Python development package", "${PN}-core",
> -    "${includedir} " +
> -    "${libdir}/lib*${SOLIBSDEV} " +
> -    "${libdir}/*.la " +
> -    "${libdir}/*.a " +
> -    "${libdir}/*.o " +
> -    "${libdir}/pkgconfig " +
> -    "${base_libdir}/*.a " +
> -    "${base_libdir}/*.o " +
> -    "${datadir}/aclocal " +
> -    "${datadir}/pkgconfig " +
> -    "config/Makefile ")
> -
> -    m.addPackage( "${PN}-2to3", "Python automated Python 2 to 3 code
> translator", "${PN}-core",
> -    "${bindir}/2to3 lib2to3" ) # package
> -
> -    m.addPackage( "${PN}-idle", "Python Integrated Development
> Environment", "${PN}-core ${PN}-tkinter",
> -    "${bindir}/idle idlelib" ) # package
> -
> -    m.addPackage( "${PN}-pydoc", "Python interactive help support",
> "${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re",
> -    "${bindir}/pydoc pydoc.* pydoc_data" )
> -
> -    m.addPackage( "${PN}-smtpd", "Python Simple Mail Transport Daemon",
> "${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime",
> -    "${bindir}/smtpd.* smtpd.*" )
> -
> -    m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-core",
> -    "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.so
> lib-dynload/audioop.so audiodev.* sunaudio.* sunau.* toaiff.*" )
> -
> -    m.addPackage( "${PN}-bsddb", "Python bindings for the Berkeley
> Database", "${PN}-core",
> -    "bsddb lib-dynload/_bsddb.so" ) # package
> -
> -    m.addPackage( "${PN}-codecs", "Python codecs, encodings & i18n
> support", "${PN}-core ${PN}-lang",
> -    "codecs.* encodings gettext.* locale.* lib-dynload/_locale.so
> lib-dynload/_codecs* lib-dynload/_multibytecodec.so
> lib-dynload/unicodedata.so stringprep.* xdrlib.*" )
> -
> -    m.addPackage( "${PN}-compile", "Python bytecode compilation support",
> "${PN}-core",
> -    "py_compile.* compileall.*" )
> -
> -    m.addPackage( "${PN}-compiler", "Python compiler support",
> "${PN}-core",
> -    "compiler" ) # package
> -
> -    m.addPackage( "${PN}-compression", "Python high-level compression
> support", "${PN}-core ${PN}-zlib",
> -    "gzip.* zipfile.* tarfile.* lib-dynload/bz2.so" )
> -
> -    m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing
> support", "${PN}-core",
> -    "hashlib.* md5.* sha.* lib-dynload/crypt.so lib-dynload/_hashlib.so
> lib-dynload/_sha256.so lib-dynload/_sha512.so" )
> -
> -    m.addPackage( "${PN}-textutils", "Python option parsing, text
> wrapping and CSV support", "${PN}-core ${PN}-io ${PN}-re ${PN}-stringold",
> -    "lib-dynload/_csv.so csv.* optparse.* textwrap.*" )
> -
> -    m.addPackage( "${PN}-curses", "Python curses support", "${PN}-core",
> -    "curses lib-dynload/_curses.so lib-dynload/_curses_panel.so" ) #
> directory + low level module
> -
> -    m.addPackage( "${PN}-ctypes", "Python C types support", "${PN}-core",
> -    "ctypes lib-dynload/_ctypes.so lib-dynload/_ctypes_test.so" ) #
> directory + low level module
> -
> -    m.addPackage( "${PN}-datetime", "Python calendar and time support",
> "${PN}-core ${PN}-codecs",
> -    "_strptime.* calendar.* lib-dynload/datetime.so" )
> -
> -    m.addPackage( "${PN}-db", "Python file-based database support",
> "${PN}-core",
> -    "anydbm.* dumbdbm.* whichdb.* " )
> -
> -    m.addPackage( "${PN}-debugger", "Python debugger", "${PN}-core
> ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint",
> -    "bdb.* pdb.*" )
> -
> -    m.addPackage( "${PN}-difflib", "Python helpers for computing deltas
> between objects", "${PN}-lang ${PN}-re",
> -    "difflib.*" )
> -
> -    m.addPackage( "${PN}-distutils-staticdev", "Python distribution
> utilities (static libraries)", "${PN}-distutils",
> -    "config/lib*.a" ) # package
> -
> -    m.addPackage( "${PN}-distutils", "Python Distribution Utilities",
> "${PN}-core ${PN}-email",
> -    "config distutils" ) # package
> -
> -    m.addPackage( "${PN}-doctest", "Python framework for running examples
> in docstrings", "${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest
> ${PN}-debugger ${PN}-difflib",
> -    "doctest.*" )
> -
> -    m.addPackage( "${PN}-email", "Python email support", "${PN}-core
> ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient",
> -    "imaplib.* email" ) # package
> -
> -    m.addPackage( "${PN}-fcntl", "Python's fcntl interface", "${PN}-core",
> -    "lib-dynload/fcntl.so" )
> -
> -    m.addPackage( "${PN}-hotshot", "Python hotshot performance profiler",
> "${PN}-core",
> -    "hotshot lib-dynload/_hotshot.so" )
> -
> -    m.addPackage( "${PN}-html", "Python HTML processing support",
> "${PN}-core",
> -    "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.*
> HTMLParser.* " )
> -
> -    m.addPackage( "${PN}-importlib", "Python import implementation
> library", "${PN}-core",
> -    "importlib" )
> -
> -    m.addPackage( "${PN}-gdbm", "Python GNU database support",
> "${PN}-core",
> -    "lib-dynload/gdbm.so" )
> -
> -    m.addPackage( "${PN}-image", "Python graphical image handling",
> "${PN}-core",
> -    "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so" )
> -
> -    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core
> ${PN}-math ${PN}-textutils ${PN}-netclient ${PN}-contextlib",
> -    "lib-dynload/_socket.so lib-dynload/_io.so lib-dynload/_ssl.so
> lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
> -    "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
> -
> -    m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core
> ${PN}-math ${PN}-re ${PN}-codecs",
> -    "json lib-dynload/_json.so" ) # package
> -
> -    m.addPackage( "${PN}-lang", "Python low-level language support",
> "${PN}-core",
> -    "lib-dynload/_bisect.so lib-dynload/_collections.so
> lib-dynload/_heapq.so lib-dynload/_weakref.so lib-dynload/_functools.so " +
> -    "lib-dynload/array.so lib-dynload/itertools.so
> lib-dynload/operator.so lib-dynload/parser.so " +
> -    "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.*
> heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
> -    "tokenize.* traceback.* weakref.*" )
> -
> -    m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core
> ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
> -    "logging" ) # package
> -
> -    m.addPackage( "${PN}-mailbox", "Python mailbox format support",
> "${PN}-core ${PN}-mime",
> -    "mailbox.*" )
> -
> -    m.addPackage( "${PN}-math", "Python math support", "${PN}-core
> ${PN}-crypt",
> -    "lib-dynload/cmath.so lib-dynload/math.so lib-dynload/_random.so
> random.* sets.*" )
> -
> -    m.addPackage( "${PN}-mime", "Python MIME handling APIs", "${PN}-core
> ${PN}-io",
> -    "mimetools.* uu.* quopri.* rfc822.* MimeWriter.*" )
> -
> -    m.addPackage( "${PN}-mmap", "Python memory-mapped file support",
> "${PN}-core ${PN}-io",
> -    "lib-dynload/mmap.so " )
> -
> -    m.addPackage( "${PN}-multiprocessing", "Python multiprocessing
> support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading
> ${PN}-ctypes ${PN}-mmap",
> -    "lib-dynload/_multiprocessing.so multiprocessing" ) # package
> -
> -    m.addPackage( "${PN}-netclient", "Python Internet Protocol clients",
> "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging
> ${PN}-mime",
> -    "*Cookie*.* " +
> -    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.*
> mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.*
> urlparse.* uuid.* rfc822.* mimetools.*" )
> -
> -    m.addPackage( "${PN}-netserver", "Python Internet Protocol servers",
> "${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading",
> -    "cgi.* *HTTPServer.* SocketServer.*" )
> -
> -    m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core
> ${PN}-lang ${PN}-re",
> -    "decimal.* fractions.* numbers.*" )
> -
> -    m.addPackage( "${PN}-pickle", "Python serialisation/persistence
> support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
> -    "pickle.* shelve.* lib-dynload/cPickle.so pickletools.*" )
> -
> -    m.addPackage( "${PN}-pkgutil", "Python package extension utility
> support", "${PN}-core",
> -    "pkgutil.*")
> -
> -    m.addPackage( "${PN}-plistlib", "Generate and parse Mac OS X .plist
> files", "${PN}-core ${PN}-datetime ${PN}-io",
> -    "plistlib.*")
> -
> -    m.addPackage( "${PN}-pprint", "Python pretty-print support",
> "${PN}-core ${PN}-io",
> -    "pprint.*" )
> -
> -    m.addPackage( "${PN}-profile", "Python basic performance profiling
> support", "${PN}-core ${PN}-textutils",
> -    "profile.* pstats.* cProfile.* lib-dynload/_lsprof.so" )
> -
> -    m.addPackage( "${PN}-re", "Python Regular Expression APIs",
> "${PN}-core",
> -    "re.* sre.* sre_compile.* sre_constants* sre_parse.*" ) # _sre is
> builtin
> -
> -    m.addPackage( "${PN}-readline", "Python readline support",
> "${PN}-core",
> -    "lib-dynload/readline.so rlcompleter.*" )
> -
> -    m.addPackage( "${PN}-resource", "Python resource control interface",
> "${PN}-core",
> -    "lib-dynload/resource.so" )
> -
> -    m.addPackage( "${PN}-shell", "Python shell-like functionality",
> "${PN}-core ${PN}-re",
> -    "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.*
> shutil.*" )
> -
> -    m.addPackage( "${PN}-robotparser", "Python robots.txt parser",
> "${PN}-core ${PN}-netclient",
> -    "robotparser.*")
> -
> -    m.addPackage( "${PN}-runpy", "Python script for locating/executing
> scripts in module namespace", "${PN}-core ${PN}-pkgutil",
> -    "runpy.*")
> -
> -    m.addPackage( "${PN}-subprocess", "Python subprocess support",
> "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
> -    "subprocess.*" )
> -
> -    m.addPackage( "${PN}-sqlite3", "Python Sqlite3 database support",
> "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading
> ${PN}-zlib",
> -    "lib-dynload/_sqlite3.so sqlite3/dbapi2.* sqlite3/__init__.*
> sqlite3/dump.*" )
> -
> -    m.addPackage( "${PN}-sqlite3-tests", "Python Sqlite3 database support
> tests", "${PN}-core ${PN}-sqlite3",
> -    "sqlite3/test" )
> -
> -    m.addPackage( "${PN}-stringold", "Python string APIs [deprecated]",
> "${PN}-core ${PN}-re",
> -    "lib-dynload/strop.so string.* stringold.*" )
> -
> -    m.addPackage( "${PN}-syslog", "Python syslog interface", "${PN}-core",
> -    "lib-dynload/syslog.so" )
> -
> -    m.addPackage( "${PN}-terminal", "Python terminal controlling
> support", "${PN}-core ${PN}-io",
> -    "pty.* tty.*" )
> -
> -    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core
> ${PN}-modules",
> -    "test", True ) # package
> -
> -    m.addPackage( "${PN}-threading", "Python threading & synchronization
> support", "${PN}-core ${PN}-lang",
> -    "_threading_local.* dummy_thread.* dummy_threading.* mutex.*
> threading.* Queue.*" )
> -
> -    m.addPackage( "${PN}-tkinter", "Python Tcl/Tk bindings", "${PN}-core",
> -    "lib-dynload/_tkinter.so lib-tk" ) # package
> -
> -    m.addPackage( "${PN}-unittest", "Python unit testing framework",
> "${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint
> ${PN}-shell",
> -    "unittest/" )
> -
> -    m.addPackage( "${PN}-unixadmin", "Python Unix administration
> support", "${PN}-core",
> -    "lib-dynload/nis.so lib-dynload/grp.so lib-dynload/pwd.so getpass.*" )
> -
> -    m.addPackage( "${PN}-xml", "Python basic XML support", "${PN}-core
> ${PN}-re",
> -    "lib-dynload/_elementtree.so lib-dynload/pyexpat.so xml xmllib.*" ) #
> package
> -
> -    m.addPackage( "${PN}-xmlrpc", "Python XML-RPC support", "${PN}-core
> ${PN}-xml ${PN}-netserver ${PN}-lang",
> -    "xmlrpclib.* SimpleXMLRPCServer.* DocXMLRPCServer.*" )
> -
> -    m.addPackage( "${PN}-zlib", "Python zlib compression support",
> "${PN}-core",
> -    "lib-dynload/zlib.so" )
> -
> -    m.addPackage( "${PN}-mailbox", "Python mailbox format support",
> "${PN}-core ${PN}-mime",
> -    "mailbox.*" )
> -
> -    m.addPackage( "${PN}-argparse", "Python command line argument
> parser", "${PN}-core ${PN}-codecs ${PN}-textutils",
> -    "argparse.*" )
> -
> -    m.addPackage( "${PN}-contextlib", "Python utilities for
> with-statement" +
> -    "contexts.", "${PN}-core",
> -    "${libdir}/python${PYTHON_MAJMIN}/contextlib.*" )
> -
> -    m.make()
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--089e082b0df0b5714a0563458b5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>The last paragraph in commit mes=
sage looks like it should be backwards compatible right?</div><div><br></di=
v><div>Then there might be some bug somewhere, because in my builds (which =
use only very few python packages) there are few runtime dependencies which=
 cannot be satisfied anymore:</div><div>python-man</div><div>python-readlin=
e</div><div>python3-textutils</div><div><br></div><div>Also probably relate=
d to this I&#39;ve seen python(3)-smbus recipes failing to build now with:<=
/div><div>smbusmodule.c:192:48: error: &#39;I2C_SMBUS_WRITE&#39; undeclared=
 (first use in this function); did you mean &#39;I2C_SMBUS&#39;?<br></div><=
div><br></div><div>Regards,</div></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On Sat, Jan 20, 2018 at 11:32 PM,  <span dir=3D"ltr">=
&lt;<a href=3D"mailto:git@git.openembedded.org" target=3D"_blank">git@git.o=
penembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Thi=
s is an automated email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 6959e2e4dba5bbfa6ffd49c44e738c<wbr>c1c38bc280<br>
Author: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.hernandez@linux=
.intel.com">alejandro.hernandez@linux.<wbr>intel.com</a>&gt;<br>
AuthorDate: Tue Jun 20 14:11:44 2017 -0700<br>
<br>
=C2=A0 =C2=A0 python: Restructure python packaging and replace it with auto=
packaging<br>
<br>
=C2=A0 =C2=A0 The reason we have a manifest file for python is that our goa=
l is to<br>
=C2=A0 =C2=A0 keep python-core as small as posible and add other python pac=
kages only<br>
=C2=A0 =C2=A0 when the user needs them, hence why we split upstream python =
into several<br>
=C2=A0 =C2=A0 packages.<br>
<br>
=C2=A0 =C2=A0 Although our manifest file has several issues:<br>
=C2=A0 =C2=A0 =C2=A0- Its unorganized and hard to read and understand it fo=
r an average<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0human being.<br>
=C2=A0 =C2=A0 =C2=A0- When a new package needs to be added, the user actual=
ly has to modify<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0the script that creates the manifest, then call =
the script to create<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0a new manifest, and then submit a patch for both=
 the script and the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0manifest, so its a little convoluted.<br>
=C2=A0 =C2=A0 =C2=A0- Git complains every single time a patch is submitted =
to the manifest,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0since it violates some of its guidelines.<br>
=C2=A0 =C2=A0 =C2=A0- It changes or may change with every release of python=
, its impossible<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0to know if the required files for a certain pack=
age have changed<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0(it could have more or less dependencies), the o=
nly way of doing so<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0would be to install and test them all one by one=
 on separate individual<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0images, and even then we wouldnt know if they re=
quire less dependencies,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0we would just know if an extra dependency is req=
uired since it would<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0complain, lets face it, this isnt feasible.<br>
=C2=A0 =C2=A0 =C2=A0- The same thing happens for new packages, if someone w=
ants to add a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0new package, its dependencies need to be checked=
 manually one by one.<br>
<br>
=C2=A0 =C2=A0 This patch fixes those issues, while adding some additional f=
eatures.<br>
<br>
=C2=A0 =C2=A0 Features/Fixes:<br>
<br>
=C2=A0 =C2=A0 =C2=A0- A new manifest format is used (JSON), easy to read an=
d understand.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0This file is parsed by the python recipe and pyt=
hon packages read<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0from here are passed directly to bitbake during =
parsing time.<br>
=C2=A0 =C2=A0 =C2=A0- It provides an automatic manifest creation task (expl=
ained below),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0which automagically checks for every package dep=
endencies and adds<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0them to the new manifest, hence we will have on =
each package exactly<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0what that package needs to be run, providing fin=
er granularity.<br>
=C2=A0 =C2=A0 =C2=A0- Dependencies are also checked automagically for new p=
ackages (explained below).<br>
=C2=A0 =C2=A0 =C2=A0- Fixes the manifest in the following ways:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* python-core should be base and all packages sh=
ould depend on it,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fixes lang, string, codecs, etc.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* Fixes packages with repeated files (e.g. bssdb=
 and db, or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0netclient and mime, and many others).<br>
=C2=A0 =C2=A0 =C2=A0- Sitecustomize was fixed since encoding was deprecated=
.<br>
=C2=A0 =C2=A0 =C2=A0- The JSON manifest file invalidates bitbake&#39;s cach=
e, so if it changes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0the python package will be rebuilt.<br>
=C2=A0 =C2=A0 =C2=A0- It creates a solution for users that want precompiled=
 bytecode files<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0(*.pyc) INCLUDE_PYCS =3D &quot;1&quot; can be se=
t by the user on their local.conf to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0include such files, some argument they get faste=
r boot time, even when the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0files would be created on their first run?, but =
they also sometimes give a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0magic number error and take up space, so we leav=
e it to the user to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0decide if they want them or not.<br>
=C2=A0 =C2=A0 =C2=A0- Fixes python-core dependencies, e.g.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0When python is run on an image, it TRIES to impo=
rt everything it needs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0but it doesnt necessarily fails when it doesnt f=
ind something, so even if<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0we didnt know, we had errors like (trimmed on pu=
rpose):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# trying /usr/lib/python2.7/_locale.so<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# trying /usr/lib/python2.7/lib-<wbr>dynload/_lo=
cale.so<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# trying /usr/lib/python2.7/_<wbr>sysconfigdata.=
so<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0while it didnt complain about _locale it should =
have imported it,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0after creating a new manifest with the automated=
 script we get:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# trying /usr/lib/python2.7/lib-<wbr>dynload/_lo=
cale.so<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0dlopen(&quot;/usr/lib/python2.7/<wbr>lib-dynload=
/_locale.so&quot;, 2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0import _locale # dynamically loaded from /usr/li=
b/python2.7/lib-<wbr>dynload/_locale.so<br>
<br>
=C2=A0 =C2=A0 How to use (after a new release of python, or maybe before ev=
ery OE<br>
=C2=A0 =C2=A0 release):<br>
=C2=A0 =C2=A0 =C2=A0- A new task called create_manifest was added to the py=
thon package,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0which may be invoked via:<br>
<br>
=C2=A0 =C2=A0 =C2=A0$ bitbake python -c create_manifest<br>
<br>
=C2=A0 =C2=A0 =C2=A0This task runs a script on native python on our HOST sy=
stem, and since<br>
=C2=A0 =C2=A0 =C2=A0the python and python-native packages come from the sam=
e source, we can<br>
=C2=A0 =C2=A0 =C2=A0use it to know the dependencies of each module as if we=
 were doing it<br>
=C2=A0 =C2=A0 =C2=A0on an image, this script is called create_manifest.py a=
nd in a very<br>
=C2=A0 =C2=A0 =C2=A0simplistic way it does the following:<br>
<br>
=C2=A0 =C2=A0 =C2=A01. Reads the JSON manifest file and creates a dictionar=
y data structure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 with all of our python packages, their FILES, R=
DEPENDS and SUMMARY.<br>
=C2=A0 =C2=A0 =C2=A02. Loops through all of them and runs every module list=
ed on them<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 asynchronously, determining every dependency th=
at they have.<br>
=C2=A0 =C2=A0 =C2=A03. These module dependencies are then handled, to be ab=
le to know which<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 packages contain those files and which should R=
DEPEND on one another.<br>
=C2=A0 =C2=A0 =C2=A04. The data structure that comes out of this, is then u=
sed to create a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 new manifest file which is automatically copied=
 onto the user&#39;s python<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 directory replacing the old one.<br>
<br>
=C2=A0 =C2=A0 =C2=A0Create_manifest script features:<br>
=C2=A0 =C2=A0 =C2=A0- Handles modules which dont exist anymore (new release=
 for example).<br>
=C2=A0 =C2=A0 =C2=A0- Handles modules that are builtin.<br>
=C2=A0 =C2=A0 =C2=A0- Deals with modules which were not compiled (e.g. bsdd=
b or ossaudiodev)<br>
=C2=A0 =C2=A0 =C2=A0- Deals with packages which include folders.<br>
=C2=A0 =C2=A0 =C2=A0- Deals with packages which include FILES with a wildca=
rd.<br>
=C2=A0 =C2=A0 =C2=A0- The manifest can be constructed on a multilib environ=
ment as well.<br>
=C2=A0 =C2=A0 =C2=A0- This method works for both python modules and shared =
libraries used<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0by python.<br>
<br>
=C2=A0 =C2=A0 How to add a new package:<br>
=C2=A0 =C2=A0 =C2=A0- If a user wants to add a new package all that has to =
be done is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0modify the python2-manifest.json file, and add t=
he required file(s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0to the FILES list, the script should handle all =
the rest.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Real example:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0We want to add a web browser package, including =
the file webbrowser.py<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0which at the moment is on python-misc.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;webbrowser&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;files&quot;: [&quot;${libdir=
}/python2.7/lib-<wbr>dynload/webbrowser.py&quot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rdepends&quot;: [],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;summary&quot;: &quot;Python =
Web Browser support&quot;}<br>
<br>
=C2=A0 =C2=A0 =C2=A0Run bitbake python -c create_manifest and the resulting=
 manifest<br>
=C2=A0 =C2=A0 =C2=A0should=C2=A0 be completed after a few seconds, showing =
something like:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;webbrowser&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [&quot;${libdir}/pyth=
on2.7/<wbr>webbrowser.py&quot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [&quot;core&quot;,=
&quot;fcntl&quot;,&quot;io&quot;,&quot;pickle&quot;,<wbr>&quot;shell&quot;,=
&quot;subprocess&quot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Web Br=
owser support&quot;}<br>
<br>
=C2=A0 =C2=A0 Known errors/issues:<br>
=C2=A0 =C2=A0 =C2=A0- Some special packages are handled differently: core, =
misc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0modules,dev, staticdev.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0All these should be handled manually, because th=
ey either include<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0binaries, static libraries, include files, etc. =
(something that we<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cant import).<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Specifically static libraries are not not suppor=
ted by this method<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0and have to be handled by the user.<br>
=C2=A0 =C2=A0 =C2=A0- The change should be transparent to the user, other t=
han the fact<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0that now we CANT build python-foo (it was pretty=
 dumb anyway, since<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0what building python-foo actually did was buildi=
ng the whole python<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0package anyway), but doing IMAGE_INSTALL_append =
=3D &quot; python-foo&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0would create an image with the requested package=
 with no issues.<br>
<br>
=C2=A0 =C2=A0 [YOCTO #11510] [YOCTO #11694] [YOCTO #11695]<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailto:alej=
andro.hernandez@linux.intel.com">alejandro.hernandez@linux.<wbr>intel.com</=
a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0.../python/python-2.7-<wbr>manifest.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 840 ----------------<br>
=C2=A0.../python/python-native-2.7-<wbr>manifest.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 9 -<br>
=C2=A0.../python/<a href=3D"http://python-native_2.7.13.bb" rel=3D"noreferr=
er" target=3D"_blank">python-native_2.7.<wbr>13.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A024 +-<br>
=C2=A0.../python/python/create_<wbr>manifest2.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 277 ++++++<br>
=C2=A0.../python/python/get_module_<wbr>deps2.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 112 +++<br>
=C2=A0.../python/python/python2-<wbr>manifest.json=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1032 ++++++++++++++++++++<br>
=C2=A0.../python/python/<wbr>sitecustomize.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 -<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python_2.7.13.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>ython_2.7.13.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A088 +-<br>
=C2=A0scripts/contrib/python/<a href=3D"http://generate-manifest-2.7.py" re=
l=3D"noreferrer" target=3D"_blank">generat<wbr>e-manifest-2.7.py</a>=C2=A0 =
=C2=A0 |=C2=A0 426 --------<br>
=C2=A09 files changed, 1528 insertions(+), 1288 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/python-2.7-manifest.inc b/me=
ta/recipes-devtools/<wbr>python/python-2.7-manifest.inc<br>
deleted file mode 100644<br>
index 7c3fc1b..0000000<br>
--- a/meta/recipes-devtools/<wbr>python/python-2.7-manifest.inc<br>
+++ /dev/null<br>
@@ -1,840 +0,0 @@<br>
-<br>
-# WARNING: This file is AUTO GENERATED: Manual edits will be lost next tim=
e I regenerate the file.<br>
-# Generator: &#39;./scripts/contrib/python/<a href=3D"http://generate-mani=
fest-2.7.py" rel=3D"noreferrer" target=3D"_blank">gene<wbr>rate-manifest-2.=
7.py</a>&#39; Version 20110222.2 (C) 2002-2010 Michael &#39;Mickey&#39; Lau=
er &lt;<a href=3D"mailto:mlauer@vanille-media.de">mlauer@vanille-media.de</=
a>&gt;<br>
-<br>
-<br>
-<br>
-PROVIDES+=3D&quot; \<br>
-=C2=A0 ${PN}-2to3 \<br>
-=C2=A0 ${PN}-argparse \<br>
-=C2=A0 ${PN}-audio \<br>
-=C2=A0 ${PN}-bsddb \<br>
-=C2=A0 ${PN}-codecs \<br>
-=C2=A0 ${PN}-compile \<br>
-=C2=A0 ${PN}-compiler \<br>
-=C2=A0 ${PN}-compression \<br>
-=C2=A0 ${PN}-contextlib \<br>
-=C2=A0 ${PN}-core \<br>
-=C2=A0 ${PN}-crypt \<br>
-=C2=A0 ${PN}-ctypes \<br>
-=C2=A0 ${PN}-curses \<br>
-=C2=A0 ${PN}-datetime \<br>
-=C2=A0 ${PN}-db \<br>
-=C2=A0 ${PN}-debugger \<br>
-=C2=A0 ${PN}-dev \<br>
-=C2=A0 ${PN}-difflib \<br>
-=C2=A0 ${PN}-distutils \<br>
-=C2=A0 ${PN}-distutils-staticdev \<br>
-=C2=A0 ${PN}-doctest \<br>
-=C2=A0 ${PN}-email \<br>
-=C2=A0 ${PN}-fcntl \<br>
-=C2=A0 ${PN}-gdbm \<br>
-=C2=A0 ${PN}-hotshot \<br>
-=C2=A0 ${PN}-html \<br>
-=C2=A0 ${PN}-idle \<br>
-=C2=A0 ${PN}-image \<br>
-=C2=A0 ${PN}-importlib \<br>
-=C2=A0 ${PN}-io \<br>
-=C2=A0 ${PN}-json \<br>
-=C2=A0 ${PN}-lang \<br>
-=C2=A0 ${PN}-logging \<br>
-=C2=A0 ${PN}-mailbox \<br>
-=C2=A0 ${PN}-math \<br>
-=C2=A0 ${PN}-mime \<br>
-=C2=A0 ${PN}-mmap \<br>
-=C2=A0 ${PN}-multiprocessing \<br>
-=C2=A0 ${PN}-netclient \<br>
-=C2=A0 ${PN}-netserver \<br>
-=C2=A0 ${PN}-numbers \<br>
-=C2=A0 ${PN}-pickle \<br>
-=C2=A0 ${PN}-pkgutil \<br>
-=C2=A0 ${PN}-plistlib \<br>
-=C2=A0 ${PN}-pprint \<br>
-=C2=A0 ${PN}-profile \<br>
-=C2=A0 ${PN}-pydoc \<br>
-=C2=A0 ${PN}-re \<br>
-=C2=A0 ${PN}-readline \<br>
-=C2=A0 ${PN}-resource \<br>
-=C2=A0 ${PN}-robotparser \<br>
-=C2=A0 ${PN}-runpy \<br>
-=C2=A0 ${PN}-shell \<br>
-=C2=A0 ${PN}-smtpd \<br>
-=C2=A0 ${PN}-sqlite3 \<br>
-=C2=A0 ${PN}-sqlite3-tests \<br>
-=C2=A0 ${PN}-stringold \<br>
-=C2=A0 ${PN}-subprocess \<br>
-=C2=A0 ${PN}-syslog \<br>
-=C2=A0 ${PN}-terminal \<br>
-=C2=A0 ${PN}-tests \<br>
-=C2=A0 ${PN}-textutils \<br>
-=C2=A0 ${PN}-threading \<br>
-=C2=A0 ${PN}-tkinter \<br>
-=C2=A0 ${PN}-unittest \<br>
-=C2=A0 ${PN}-unixadmin \<br>
-=C2=A0 ${PN}-xml \<br>
-=C2=A0 ${PN}-xmlrpc \<br>
-=C2=A0 ${PN}-zlib \<br>
-&quot;<br>
-<br>
-PACKAGES=3D&quot; \<br>
-=C2=A0 ${PN}-dbg \<br>
-=C2=A0 ${PN}-2to3 \<br>
-=C2=A0 ${PN}-argparse \<br>
-=C2=A0 ${PN}-audio \<br>
-=C2=A0 ${PN}-bsddb \<br>
-=C2=A0 ${PN}-codecs \<br>
-=C2=A0 ${PN}-compile \<br>
-=C2=A0 ${PN}-compiler \<br>
-=C2=A0 ${PN}-compression \<br>
-=C2=A0 ${PN}-contextlib \<br>
-=C2=A0 ${PN}-core \<br>
-=C2=A0 ${PN}-crypt \<br>
-=C2=A0 ${PN}-ctypes \<br>
-=C2=A0 ${PN}-curses \<br>
-=C2=A0 ${PN}-datetime \<br>
-=C2=A0 ${PN}-db \<br>
-=C2=A0 ${PN}-debugger \<br>
-=C2=A0 ${PN}-dev \<br>
-=C2=A0 ${PN}-difflib \<br>
-=C2=A0 ${PN}-distutils-staticdev ${PN}-distutils \<br>
-=C2=A0 ${PN}-doctest \<br>
-=C2=A0 ${PN}-email \<br>
-=C2=A0 ${PN}-fcntl \<br>
-=C2=A0 ${PN}-gdbm \<br>
-=C2=A0 ${PN}-hotshot \<br>
-=C2=A0 ${PN}-html \<br>
-=C2=A0 ${PN}-idle \<br>
-=C2=A0 ${PN}-image \<br>
-=C2=A0 ${PN}-importlib \<br>
-=C2=A0 ${PN}-io \<br>
-=C2=A0 ${PN}-json \<br>
-=C2=A0 ${PN}-lang \<br>
-=C2=A0 ${PN}-logging \<br>
-=C2=A0 ${PN}-mailbox \<br>
-=C2=A0 ${PN}-math \<br>
-=C2=A0 ${PN}-mime \<br>
-=C2=A0 ${PN}-mmap \<br>
-=C2=A0 ${PN}-multiprocessing \<br>
-=C2=A0 ${PN}-netclient \<br>
-=C2=A0 ${PN}-netserver \<br>
-=C2=A0 ${PN}-numbers \<br>
-=C2=A0 ${PN}-pickle \<br>
-=C2=A0 ${PN}-pkgutil \<br>
-=C2=A0 ${PN}-plistlib \<br>
-=C2=A0 ${PN}-pprint \<br>
-=C2=A0 ${PN}-profile \<br>
-=C2=A0 ${PN}-pydoc \<br>
-=C2=A0 ${PN}-re \<br>
-=C2=A0 ${PN}-readline \<br>
-=C2=A0 ${PN}-resource \<br>
-=C2=A0 ${PN}-robotparser \<br>
-=C2=A0 ${PN}-runpy \<br>
-=C2=A0 ${PN}-shell \<br>
-=C2=A0 ${PN}-smtpd \<br>
-=C2=A0 ${PN}-sqlite3 \<br>
-=C2=A0 ${PN}-sqlite3-tests \<br>
-=C2=A0 ${PN}-stringold \<br>
-=C2=A0 ${PN}-subprocess \<br>
-=C2=A0 ${PN}-syslog \<br>
-=C2=A0 ${PN}-terminal \<br>
-=C2=A0 ${PN}-tests \<br>
-=C2=A0 ${PN}-textutils \<br>
-=C2=A0 ${PN}-threading \<br>
-=C2=A0 ${PN}-tkinter \<br>
-=C2=A0 ${PN}-unittest \<br>
-=C2=A0 ${PN}-unixadmin \<br>
-=C2=A0 ${PN}-xml \<br>
-=C2=A0 ${PN}-xmlrpc \<br>
-=C2=A0 ${PN}-zlib \<br>
-=C2=A0 ${PN}-modules\<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-2to3=3D&quot;Python automated Python 2 to 3 code translator&=
quot;<br>
-RDEPENDS_${PN}-2to3=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-2to3=3D&quot; \<br>
-=C2=A0 =C2=A0 ${bindir}/2to3 \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib2to3 \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-argparse=3D&quot;<wbr>Python command line argument parser&qu=
ot;<br>
-RDEPENDS_${PN}-argparse=3D&quot;${<wbr>PN}-core ${PN}-codecs ${PN}-textuti=
ls&quot;<br>
-FILES_${PN}-argparse=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/argparse.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-audio=3D&quot;Python Audio Handling&quot;<br>
-RDEPENDS_${PN}-audio=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-audio=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/wave.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/chunk.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sndhdr.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/ossaudiodev.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/audioop.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/audiodev.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sunaudio.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sunau.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/toaiff.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-bsddb=3D&quot;Python bindings for the Berkeley Database&quot=
;<br>
-RDEPENDS_${PN}-bsddb=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-bsddb=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/bsddb \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_bsddb.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-codecs=3D&quot;Python codecs, encodings &amp; i18n support&q=
uot;<br>
-RDEPENDS_${PN}-codecs=3D&quot;${PN}-<wbr>core ${PN}-lang&quot;<br>
-FILES_${PN}-codecs=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/codecs.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/encodings \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/gettext.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/locale.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_locale.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_codecs* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_multibytecodec.so \<br=
>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/unicodedata.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>stringprep.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/xdrlib.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-compile=3D&quot;Python bytecode compilation support&quot;<br=
>
-RDEPENDS_${PN}-compile=3D&quot;${PN}<wbr>-core&quot;<br>
-FILES_${PN}-compile=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/py_<wbr>compile.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>compileall.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-compiler=3D&quot;<wbr>Python compiler support&quot;<br>
-RDEPENDS_${PN}-compiler=3D&quot;${<wbr>PN}-core&quot;<br>
-FILES_${PN}-compiler=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/compiler \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-compression=3D&quot;<wbr>Python high-level compression suppo=
rt&quot;<br>
-RDEPENDS_${PN}-compression=3D&quot;$<wbr>{PN}-core ${PN}-zlib&quot;<br>
-FILES_${PN}-compression=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/gzip.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/zipfile.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/tarfile.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/bz2.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-contextlib=3D&quot;<wbr>Python utilities for with-statementc=
ontexts.&quot;<br>
-RDEPENDS_${PN}-contextlib=3D&quot;${<wbr>PN}-core&quot;<br>
-FILES_${PN}-contextlib=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python${PYTHON_<wbr>MAJMIN}/contextlib.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-core=3D&quot;Python interpreter and core modules&quot;<br>
-RDEPENDS_${PN}-core=3D&quot;${PN}-<wbr>lang ${PN}-re&quot;<br>
-FILES_${PN}-core=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/__future__<wbr>.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/_abcoll.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/abc.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/ast.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/copy.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/copy_reg.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>ConfigParser.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>genericpath.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/getopt.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/linecache.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/new.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/os.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/posixpath.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/struct.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/warnings.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/site.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/stat.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/UserDict.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/UserList.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>UserString.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/binascii.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_struct.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/time.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/xreadlines.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/types.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/platform.* \<br>
-=C2=A0 =C2=A0 ${bindir}/python* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/_<wbr>weakrefset.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sysconfig.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/_<wbr>sysconfigdata.* \<br>
-=C2=A0 =C2=A0 ${includedir}/python${PYTHON_<wbr>MAJMIN}/pyconfig*.h \<br>
-=C2=A0 =C2=A0 ${libdir}/python${PYTHON_<wbr>MAJMIN}/sitecustomize.py \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-crypt=3D&quot;Python basic cryptographic and hashing support=
&quot;<br>
-RDEPENDS_${PN}-crypt=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-crypt=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/hashlib.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/md5.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sha.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/crypt.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_hashlib.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_sha256.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_sha512.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-ctypes=3D&quot;Python C types support&quot;<br>
-RDEPENDS_${PN}-ctypes=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-ctypes=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/ctypes \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_ctypes.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_ctypes_test.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-curses=3D&quot;Python curses support&quot;<br>
-RDEPENDS_${PN}-curses=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-curses=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/curses \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_curses.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_curses_panel.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-datetime=3D&quot;<wbr>Python calendar and time support&quot;=
<br>
-RDEPENDS_${PN}-datetime=3D&quot;${<wbr>PN}-core ${PN}-codecs&quot;<br>
-FILES_${PN}-datetime=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/_strptime.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/calendar.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/datetime.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-db=3D&quot;Python file-based database support&quot;<br>
-RDEPENDS_${PN}-db=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-db=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/anydbm.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/dumbdbm.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/whichdb.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-debugger=3D&quot;<wbr>Python debugger&quot;<br>
-RDEPENDS_${PN}-debugger=3D&quot;${<wbr>PN}-core ${PN}-io ${PN}-lang ${PN}-=
re ${PN}-stringold ${PN}-shell ${PN}-pprint&quot;<br>
-FILES_${PN}-debugger=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/bdb.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/pdb.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-dev=3D&quot;Python development package&quot;<br>
-RDEPENDS_${PN}-dev=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-dev=3D&quot; \<br>
-=C2=A0 =C2=A0 ${includedir} \<br>
-=C2=A0 =C2=A0 ${libdir}/lib*${SOLIBSDEV} \<br>
-=C2=A0 =C2=A0 ${libdir}/*.la \<br>
-=C2=A0 =C2=A0 ${libdir}/*.a \<br>
-=C2=A0 =C2=A0 ${libdir}/*.o \<br>
-=C2=A0 =C2=A0 ${libdir}/pkgconfig \<br>
-=C2=A0 =C2=A0 ${base_libdir}/*.a \<br>
-=C2=A0 =C2=A0 ${base_libdir}/*.o \<br>
-=C2=A0 =C2=A0 ${datadir}/aclocal \<br>
-=C2=A0 =C2=A0 ${datadir}/pkgconfig \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/config/<wbr>Makefile \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-difflib=3D&quot;Python helpers for computing deltas between =
objects&quot;<br>
-RDEPENDS_${PN}-difflib=3D&quot;${PN}<wbr>-lang ${PN}-re&quot;<br>
-FILES_${PN}-difflib=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/difflib.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-distutils=3D&quot;<wbr>Python Distribution Utilities&quot;<b=
r>
-RDEPENDS_${PN}-distutils=3D&quot;${<wbr>PN}-core ${PN}-email&quot;<br>
-FILES_${PN}-distutils=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/config \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/distutils \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-distutils-<wbr>staticdev=3D&quot;Python distribution utiliti=
es (static libraries)&quot;<br>
-RDEPENDS_${PN}-distutils-<wbr>staticdev=3D&quot;${PN}-distutils&quot;<br>
-FILES_${PN}-distutils-<wbr>staticdev=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/config/<wbr>lib*.a \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-doctest=3D&quot;Python framework for running examples in doc=
strings&quot;<br>
-RDEPENDS_${PN}-doctest=3D&quot;${PN}<wbr>-core ${PN}-lang ${PN}-io ${PN}-r=
e ${PN}-unittest ${PN}-debugger ${PN}-difflib&quot;<br>
-FILES_${PN}-doctest=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/doctest.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-email=3D&quot;Python email support&quot;<br>
-RDEPENDS_${PN}-email=3D&quot;${PN}-<wbr>core ${PN}-io ${PN}-re ${PN}-mime =
${PN}-audio ${PN}-image ${PN}-netclient&quot;<br>
-FILES_${PN}-email=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/imaplib.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/email \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-fcntl=3D&quot;Python&#39;s fcntl interface&quot;<br>
-RDEPENDS_${PN}-fcntl=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-fcntl=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/fcntl.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-gdbm=3D&quot;Python GNU database support&quot;<br>
-RDEPENDS_${PN}-gdbm=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-gdbm=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/gdbm.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-hotshot=3D&quot;Python hotshot performance profiler&quot;<br=
>
-RDEPENDS_${PN}-hotshot=3D&quot;${PN}<wbr>-core&quot;<br>
-FILES_${PN}-hotshot=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/hotshot \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_hotshot.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-html=3D&quot;Python HTML processing support&quot;<br>
-RDEPENDS_${PN}-html=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-html=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/formatter.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>htmlentitydefs.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/htmllib.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>markupbase.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sgmllib.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>HTMLParser.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-idle=3D&quot;Python Integrated Development Environment&quot;=
<br>
-RDEPENDS_${PN}-idle=3D&quot;${PN}-<wbr>core ${PN}-tkinter&quot;<br>
-FILES_${PN}-idle=3D&quot; \<br>
-=C2=A0 =C2=A0 ${bindir}/idle \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/idlelib \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-image=3D&quot;Python graphical image handling&quot;<br>
-RDEPENDS_${PN}-image=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-image=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/colorsys.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/imghdr.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/imageop.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/rgbimg.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-importlib=3D&quot;<wbr>Python import implementation library&=
quot;<br>
-RDEPENDS_${PN}-importlib=3D&quot;${<wbr>PN}-core&quot;<br>
-FILES_${PN}-importlib=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/importlib \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-io=3D&quot;Python low-level I/O&quot;<br>
-RDEPENDS_${PN}-io=3D&quot;${PN}-core ${PN}-math ${PN}-textutils ${PN}-netc=
lient ${PN}-contextlib&quot;<br>
-FILES_${PN}-io=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_socket.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_io.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_ssl.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/select.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/termios.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/cStringIO.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/pipes.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/socket.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/ssl.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/tempfile.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/StringIO.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/io.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/_pyio.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-json=3D&quot;Python JSON support&quot;<br>
-RDEPENDS_${PN}-json=3D&quot;${PN}-<wbr>core ${PN}-math ${PN}-re ${PN}-code=
cs&quot;<br>
-FILES_${PN}-json=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/json \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_json.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-lang=3D&quot;Python low-level language support&quot;<br>
-RDEPENDS_${PN}-lang=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-lang=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_bisect.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_collections.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_heapq.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_weakref.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_functools.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/array.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/itertools.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/operator.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/parser.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/atexit.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/bisect.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/code.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/codeop.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>collections.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/dis.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/functools.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/heapq.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/inspect.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/keyword.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/opcode.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/symbol.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/repr.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/token.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/tokenize.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/traceback.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/weakref.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-logging=3D&quot;Python logging support&quot;<br>
-RDEPENDS_${PN}-logging=3D&quot;${PN}<wbr>-core ${PN}-io ${PN}-lang ${PN}-p=
ickle ${PN}-stringold&quot;<br>
-FILES_${PN}-logging=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/logging \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-mailbox=3D&quot;Python mailbox format support&quot;<br>
-RDEPENDS_${PN}-mailbox=3D&quot;${PN}<wbr>-core ${PN}-mime&quot;<br>
-FILES_${PN}-mailbox=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/mailbox.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-math=3D&quot;Python math support&quot;<br>
-RDEPENDS_${PN}-math=3D&quot;${PN}-<wbr>core ${PN}-crypt&quot;<br>
-FILES_${PN}-math=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/cmath.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/math.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_random.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/random.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sets.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-mime=3D&quot;Python MIME handling APIs&quot;<br>
-RDEPENDS_${PN}-mime=3D&quot;${PN}-<wbr>core ${PN}-io&quot;<br>
-FILES_${PN}-mime=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/mimetools.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/uu.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/quopri.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/rfc822.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>MimeWriter.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-mmap=3D&quot;Python memory-mapped file support&quot;<br>
-RDEPENDS_${PN}-mmap=3D&quot;${PN}-<wbr>core ${PN}-io&quot;<br>
-FILES_${PN}-mmap=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/mmap.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-<wbr>multiprocessing=3D&quot;Python multiprocessing support&=
quot;<br>
-RDEPENDS_${PN}-<wbr>multiprocessing=3D&quot;${PN}-core ${PN}-io ${PN}-lang=
 ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap&quot;<br>
-FILES_${PN}-multiprocessing=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_multiprocessing.so \<b=
r>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>multiprocessing \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-netclient=3D&quot;<wbr>Python Internet Protocol clients&quot=
;<br>
-RDEPENDS_${PN}-netclient=3D&quot;${<wbr>PN}-core ${PN}-crypt ${PN}-datetim=
e ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime&quot;<br>
-FILES_${PN}-netclient=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/*Cookie*.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/base64.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/cookielib.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/ftplib.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/gopherlib.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/hmac.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/httplib.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/mimetypes.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/nntplib.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/poplib.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/smtplib.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/telnetlib.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/urllib.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/urllib2.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/urlparse.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/uuid.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/rfc822.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/mimetools.<wbr>* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-netserver=3D&quot;<wbr>Python Internet Protocol servers&quot=
;<br>
-RDEPENDS_${PN}-netserver=3D&quot;${<wbr>PN}-core ${PN}-netclient ${PN}-she=
ll ${PN}-threading&quot;<br>
-FILES_${PN}-netserver=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/cgi.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/*<wbr>HTTPServer.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>SocketServer.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-numbers=3D&quot;Python number APIs&quot;<br>
-RDEPENDS_${PN}-numbers=3D&quot;${PN}<wbr>-core ${PN}-lang ${PN}-re&quot;<b=
r>
-FILES_${PN}-numbers=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/decimal.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/fractions.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/numbers.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-pickle=3D&quot;Python serialisation/persistence support&quot=
;<br>
-RDEPENDS_${PN}-pickle=3D&quot;${PN}-<wbr>core ${PN}-codecs ${PN}-io ${PN}-=
re&quot;<br>
-FILES_${PN}-pickle=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/pickle.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/shelve.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/cPickle.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>pickletools.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-pkgutil=3D&quot;Python package extension utility support&quo=
t;<br>
-RDEPENDS_${PN}-pkgutil=3D&quot;${PN}<wbr>-core&quot;<br>
-FILES_${PN}-pkgutil=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/pkgutil.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-plistlib=3D&quot;<wbr>Generate and parse Mac OS X .plist fil=
es&quot;<br>
-RDEPENDS_${PN}-plistlib=3D&quot;${<wbr>PN}-core ${PN}-datetime ${PN}-io&qu=
ot;<br>
-FILES_${PN}-plistlib=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/plistlib.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-pprint=3D&quot;Python pretty-print support&quot;<br>
-RDEPENDS_${PN}-pprint=3D&quot;${PN}-<wbr>core ${PN}-io&quot;<br>
-FILES_${PN}-pprint=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/pprint.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-profile=3D&quot;Python basic performance profiling support&q=
uot;<br>
-RDEPENDS_${PN}-profile=3D&quot;${PN}<wbr>-core ${PN}-textutils&quot;<br>
-FILES_${PN}-profile=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/profile.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/pstats.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/cProfile.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_lsprof.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-pydoc=3D&quot;Python interactive help support&quot;<br>
-RDEPENDS_${PN}-pydoc=3D&quot;${PN}-<wbr>core ${PN}-lang ${PN}-stringold ${=
PN}-re&quot;<br>
-FILES_${PN}-pydoc=3D&quot; \<br>
-=C2=A0 =C2=A0 ${bindir}/pydoc \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/pydoc.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/pydoc_data \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-re=3D&quot;Python Regular Expression APIs&quot;<br>
-RDEPENDS_${PN}-re=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-re=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/re.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sre.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sre_<wbr>compile.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sre_<wbr>constants* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sre_parse.<wbr>* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-readline=3D&quot;<wbr>Python readline support&quot;<br>
-RDEPENDS_${PN}-readline=3D&quot;${<wbr>PN}-core&quot;<br>
-FILES_${PN}-readline=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/readline.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>rlcompleter.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-resource=3D&quot;<wbr>Python resource control interface&quot=
;<br>
-RDEPENDS_${PN}-resource=3D&quot;${<wbr>PN}-core&quot;<br>
-FILES_${PN}-resource=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/resource.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-robotparser=3D&quot;<wbr>Python robots.txt parser&quot;<br>
-RDEPENDS_${PN}-robotparser=3D&quot;$<wbr>{PN}-core ${PN}-netclient&quot;<b=
r>
-FILES_${PN}-robotparser=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>robotparser.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-runpy=3D&quot;Python script for locating/executing scripts i=
n module namespace&quot;<br>
-RDEPENDS_${PN}-runpy=3D&quot;${PN}-<wbr>core ${PN}-pkgutil&quot;<br>
-FILES_${PN}-runpy=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/runpy.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-shell=3D&quot;Python shell-like functionality&quot;<br>
-RDEPENDS_${PN}-shell=3D&quot;${PN}-<wbr>core ${PN}-re&quot;<br>
-FILES_${PN}-shell=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/cmd.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/commands.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/dircache.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/fnmatch.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/glob.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/popen2.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/shlex.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/shutil.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-smtpd=3D&quot;Python Simple Mail Transport Daemon&quot;<br>
-RDEPENDS_${PN}-smtpd=3D&quot;${PN}-<wbr>core ${PN}-netserver ${PN}-email $=
{PN}-mime&quot;<br>
-FILES_${PN}-smtpd=3D&quot; \<br>
-=C2=A0 =C2=A0 ${bindir}/smtpd.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/smtpd.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-sqlite3=3D&quot;Python Sqlite3 database support&quot;<br>
-RDEPENDS_${PN}-sqlite3=3D&quot;${PN}<wbr>-core ${PN}-datetime ${PN}-lang $=
{PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib&quot;<br>
-FILES_${PN}-sqlite3=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_sqlite3.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sqlite3/<wbr>dbapi2.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sqlite3/__<wbr>init__.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sqlite3/<wbr>dump.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-sqlite3-tests=3D&quot;<wbr>Python Sqlite3 database support t=
ests&quot;<br>
-RDEPENDS_${PN}-sqlite3-tests=3D<wbr>&quot;${PN}-core ${PN}-sqlite3&quot;<b=
r>
-FILES_${PN}-sqlite3-tests=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/sqlite3/<wbr>test \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-stringold=3D&quot;<wbr>Python string APIs [deprecated]&quot;=
<br>
-RDEPENDS_${PN}-stringold=3D&quot;${<wbr>PN}-core ${PN}-re&quot;<br>
-FILES_${PN}-stringold=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/strop.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/string.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/stringold.<wbr>* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-subprocess=3D&quot;<wbr>Python subprocess support&quot;<br>
-RDEPENDS_${PN}-subprocess=3D&quot;${<wbr>PN}-core ${PN}-io ${PN}-re ${PN}-=
fcntl ${PN}-pickle&quot;<br>
-FILES_${PN}-subprocess=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>subprocess.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-syslog=3D&quot;Python syslog interface&quot;<br>
-RDEPENDS_${PN}-syslog=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-syslog=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/syslog.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-terminal=3D&quot;<wbr>Python terminal controlling support&qu=
ot;<br>
-RDEPENDS_${PN}-terminal=3D&quot;${<wbr>PN}-core ${PN}-io&quot;<br>
-FILES_${PN}-terminal=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/pty.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/tty.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-tests=3D&quot;Python tests&quot;<br>
-RDEPENDS_${PN}-tests=3D&quot;${PN}-<wbr>core ${PN}-modules&quot;<br>
-FILES_${PN}-tests=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/test \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-textutils=3D&quot;<wbr>Python option parsing, text wrapping =
and CSV support&quot;<br>
-RDEPENDS_${PN}-textutils=3D&quot;${<wbr>PN}-core ${PN}-io ${PN}-re ${PN}-s=
tringold&quot;<br>
-FILES_${PN}-textutils=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_csv.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/csv.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/optparse.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/textwrap.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-threading=3D&quot;<wbr>Python threading &amp; synchronizatio=
n support&quot;<br>
-RDEPENDS_${PN}-threading=3D&quot;${<wbr>PN}-core ${PN}-lang&quot;<br>
-FILES_${PN}-threading=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/_<wbr>threading_local.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/dummy_<wbr>thread.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/dummy_<wbr>threading.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/mutex.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/threading.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/Queue.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-tkinter=3D&quot;Python Tcl/Tk bindings&quot;<br>
-RDEPENDS_${PN}-tkinter=3D&quot;${PN}<wbr>-core&quot;<br>
-FILES_${PN}-tkinter=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_tkinter.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-tk \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-unittest=3D&quot;<wbr>Python unit testing framework&quot;<br=
>
-RDEPENDS_${PN}-unittest=3D&quot;${<wbr>PN}-core ${PN}-stringold ${PN}-lang=
 ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell&quot;<br>
-FILES_${PN}-unittest=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/unittest/ \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-unixadmin=3D&quot;<wbr>Python Unix administration support&qu=
ot;<br>
-RDEPENDS_${PN}-unixadmin=3D&quot;${<wbr>PN}-core&quot;<br>
-FILES_${PN}-unixadmin=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/nis.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/grp.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/pwd.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/getpass.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-xml=3D&quot;Python basic XML support&quot;<br>
-RDEPENDS_${PN}-xml=3D&quot;${PN}-<wbr>core ${PN}-re&quot;<br>
-FILES_${PN}-xml=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/_elementtree.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/pyexpat.so \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/xml \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/xmllib.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-xmlrpc=3D&quot;Python XML-RPC support&quot;<br>
-RDEPENDS_${PN}-xmlrpc=3D&quot;${PN}-<wbr>core ${PN}-xml ${PN}-netserver ${=
PN}-lang&quot;<br>
-FILES_${PN}-xmlrpc=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/xmlrpclib.<wbr>* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>SimpleXMLRPCServer.* \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/<wbr>DocXMLRPCServer.* \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-zlib=3D&quot;Python zlib compression support&quot;<br>
-RDEPENDS_${PN}-zlib=3D&quot;${PN}-<wbr>core&quot;<br>
-FILES_${PN}-zlib=3D&quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/python2.7/lib-<wbr>dynload/zlib.so \<br>
-&quot;<br>
-<br>
-SUMMARY_${PN}-modules=3D&quot;All Python modules&quot;<br>
-RDEPENDS_${PN}-modules=3D&quot; \<br>
-=C2=A0 ${PN}-2to3 \<br>
-=C2=A0 ${PN}-argparse \<br>
-=C2=A0 ${PN}-audio \<br>
-=C2=A0 ${PN}-bsddb \<br>
-=C2=A0 ${PN}-codecs \<br>
-=C2=A0 ${PN}-compile \<br>
-=C2=A0 ${PN}-compiler \<br>
-=C2=A0 ${PN}-compression \<br>
-=C2=A0 ${PN}-contextlib \<br>
-=C2=A0 ${PN}-core \<br>
-=C2=A0 ${PN}-crypt \<br>
-=C2=A0 ${PN}-ctypes \<br>
-=C2=A0 ${PN}-curses \<br>
-=C2=A0 ${PN}-datetime \<br>
-=C2=A0 ${PN}-db \<br>
-=C2=A0 ${PN}-debugger \<br>
-=C2=A0 ${PN}-difflib \<br>
-=C2=A0 ${PN}-distutils \<br>
-=C2=A0 ${PN}-doctest \<br>
-=C2=A0 ${PN}-email \<br>
-=C2=A0 ${PN}-fcntl \<br>
-=C2=A0 ${PN}-gdbm \<br>
-=C2=A0 ${PN}-hotshot \<br>
-=C2=A0 ${PN}-html \<br>
-=C2=A0 ${PN}-idle \<br>
-=C2=A0 ${PN}-image \<br>
-=C2=A0 ${PN}-importlib \<br>
-=C2=A0 ${PN}-io \<br>
-=C2=A0 ${PN}-json \<br>
-=C2=A0 ${PN}-lang \<br>
-=C2=A0 ${PN}-logging \<br>
-=C2=A0 ${PN}-mailbox \<br>
-=C2=A0 ${PN}-math \<br>
-=C2=A0 ${PN}-mime \<br>
-=C2=A0 ${PN}-mmap \<br>
-=C2=A0 ${PN}-multiprocessing \<br>
-=C2=A0 ${PN}-netclient \<br>
-=C2=A0 ${PN}-netserver \<br>
-=C2=A0 ${PN}-numbers \<br>
-=C2=A0 ${PN}-pickle \<br>
-=C2=A0 ${PN}-pkgutil \<br>
-=C2=A0 ${PN}-plistlib \<br>
-=C2=A0 ${PN}-pprint \<br>
-=C2=A0 ${PN}-profile \<br>
-=C2=A0 ${PN}-pydoc \<br>
-=C2=A0 ${PN}-re \<br>
-=C2=A0 ${PN}-readline \<br>
-=C2=A0 ${PN}-resource \<br>
-=C2=A0 ${PN}-robotparser \<br>
-=C2=A0 ${PN}-runpy \<br>
-=C2=A0 ${PN}-shell \<br>
-=C2=A0 ${PN}-smtpd \<br>
-=C2=A0 ${PN}-sqlite3 \<br>
-=C2=A0 ${PN}-sqlite3-tests \<br>
-=C2=A0 ${PN}-stringold \<br>
-=C2=A0 ${PN}-subprocess \<br>
-=C2=A0 ${PN}-syslog \<br>
-=C2=A0 ${PN}-terminal \<br>
-=C2=A0 ${PN}-textutils \<br>
-=C2=A0 ${PN}-threading \<br>
-=C2=A0 ${PN}-tkinter \<br>
-=C2=A0 ${PN}-unittest \<br>
-=C2=A0 ${PN}-unixadmin \<br>
-=C2=A0 ${PN}-xml \<br>
-=C2=A0 ${PN}-xmlrpc \<br>
-=C2=A0 ${PN}-zlib \<br>
-&quot;<br>
-ALLOW_EMPTY_${PN}-modules =3D &quot;1&quot;<br>
-<br>
-<br>
diff --git a/meta/recipes-devtools/<wbr>python/python-native-2.7-<wbr>manif=
est.inc b/meta/recipes-devtools/<wbr>python/python-native-2.7-<wbr>manifest=
.inc<br>
deleted file mode 100644<br>
index b05aae0..0000000<br>
--- a/meta/recipes-devtools/<wbr>python/python-native-2.7-<wbr>manifest.inc=
<br>
+++ /dev/null<br>
@@ -1,9 +0,0 @@<br>
-<br>
-# WARNING: This file is AUTO GENERATED: Manual edits will be lost next tim=
e I regenerate the file.<br>
-# Generator: &#39;../scripts/contrib/python/<a href=3D"http://generate-man=
ifest-2.7.py" rel=3D"noreferrer" target=3D"_blank">gen<wbr>erate-manifest-2=
.7.py</a> --native&#39; Version 20110222.2 (C) 2002-2010 Michael &#39;Micke=
y&#39; Lauer &lt;<a href=3D"mailto:mlauer@vanille-media.de">mlauer@vanille-=
media.de</a>&gt;<br>
-<br>
-<br>
-<br>
-RPROVIDES +=3D &quot;python-modules-native python-2to3-native python-argpa=
rse-native python-audio-native python-bsddb-native python-codecs-native pyt=
hon-compile-native python-compiler-native python-compression-native python-=
contextlib-native python-core-native python-crypt-native python-ctypes-nati=
ve python-curses-native python-datetime-native python-db-native python-debu=
gger-native python-dev-native python-difflib-native python-distutils-native=
 python-distutils-staticdev-<wbr>native python-doctest- [...]<br>
-<br>
-<br>
diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python-nat=
ive_2.7.13.bb" rel=3D"noreferrer" target=3D"_blank">python-native_2.7.13.bb=
</a> b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python-native_2.=
7.13.bb" rel=3D"noreferrer" target=3D"_blank">python-native_2.7.13.bb</a><b=
r>
index 7edf153..2b74003 100644<br>
--- a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python-native_2.7=
.13.bb" rel=3D"noreferrer" target=3D"_blank">python-native_2.7.13.bb</a><br=
>
+++ b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python-native_2.7=
.13.bb" rel=3D"noreferrer" target=3D"_blank">python-native_2.7.13.bb</a><br=
>
@@ -1,5 +1,4 @@<br>
=C2=A0require python.inc<br>
-<br>
=C2=A0EXTRANATIVEPATH +=3D &quot;bzip2-native&quot;<br>
=C2=A0DEPENDS =3D &quot;openssl-native bzip2-replacement-native zlib-native=
 readline-native sqlite3-native expat-native&quot;<br>
=C2=A0PR =3D &quot;${INC_PR}.1&quot;<br>
@@ -25,8 +24,6 @@ FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/${PN}:&quot;<b=
r>
<br>
=C2=A0inherit native<br>
<br>
-require python-native-${PYTHON_MAJMIN}<wbr>-manifest.inc<br>
-<br>
=C2=A0EXTRA_OECONF_append =3D &quot; --bindir=3D${bindir}/${PN} --with-syst=
em-expat=3D${STAGING_<wbr>DIR_HOST}&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &#39;\<br>
@@ -59,3 +56,24 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # installed in the native sysroot, so disable u=
ser site support.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s,^\(ENABLE_USER_SITE =3D \).*,\=
1False,&#39; ${D}${libdir}/python${PYTHON_<wbr>MAJMIN}/site.py<br>
=C2=A0}<br>
+<br>
+python(){<br>
+<br>
+=C2=A0 =C2=A0 # Read JSON manifest<br>
+=C2=A0 =C2=A0 import json<br>
+=C2=A0 =C2=A0 pythondir =3D d.getVar(&#39;THISDIR&#39;,True)<br>
+=C2=A0 =C2=A0 with open(pythondir+&#39;/python/<wbr>python2-manifest.json&=
#39;) as manifest_file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_manifest=3Djson.load(<wbr>manifest_file=
)<br>
+<br>
+=C2=A0 =C2=A0 rprovides =3D d.getVar(&#39;RPROVIDES&#39;).split()<br>
+<br>
+=C2=A0 =C2=A0 # Hardcoded since it cant be python-native-foo, should be py=
thon-foo-native<br>
+=C2=A0 =C2=A0 pn =3D &#39;python&#39;<br>
+<br>
+=C2=A0 =C2=A0 for key in python_manifest:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pypackage =3D pn + &#39;-&#39; + key + &#39;-n=
ative&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pypackage not in rprovides:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rprovides.append(pypackag=
e)<br>
+<br>
+=C2=A0 =C2=A0 d.setVar(&#39;RPROVIDES&#39;, &#39; &#39;.join(rprovides))<b=
r>
+}<br>
diff --git a/meta/recipes-devtools/<wbr>python/python/create_<wbr>manifest2=
.py b/meta/recipes-devtools/<wbr>python/python/create_<wbr>manifest2.py<br>
new file mode 100644<br>
index 0000000..bd64ec3<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>python/python/create_<wbr>manifest2.py<br>
@@ -0,0 +1,277 @@<br>
+# This script is used as a bitbake task to create a new python manifest<br=
>
+# $ bitbake python -c create_manifest<br>
+#<br>
+# Our goal is to keep python-core as small as posible and add other python=
<br>
+# packages only when the user needs them, hence why we split upstream pyth=
on<br>
+# into several packages.<br>
+#<br>
+# In a very simplistic way what this does is:<br>
+# Launch python and see specifically what is required for it to run at a m=
inimum<br>
+#<br>
+# Go through the python-manifest file and launch a separate task for every=
 single<br>
+# one of the files on each package, this task will check what was required=
 for that<br>
+# specific module to run, these modules will be called dependencies.<br>
+# The output of such task will be a list of the modules or dependencies th=
at were<br>
+# found for that file.<br>
+#<br>
+# Such output will be parsed by this script, we will look for each depende=
ncy on the<br>
+# manifest and if we find that another package already includes it, then w=
e will add<br>
+# that package as an RDEPENDS to the package we are currently checking; in=
 case we dont<br>
+# find the current dependency on any other package we will add it to the c=
urrent package<br>
+# as part of FILES.<br>
+#<br>
+#<br>
+# This way we will create a new manifest from the data structure that was =
built during<br>
+# this process, ont this new manifest each package will contain specifical=
ly only<br>
+# what it needs to run.<br>
+#<br>
+# There are some caveats which we try to deal with, such as repeated files=
 on different<br>
+# packages, packages that include folders, wildcards, and special packages=
.<br>
+# Its also important to note that this method only works for python files,=
 and shared<br>
+# libraries. Static libraries, header files and binaries need to be dealt =
with manually.<br>
+#<br>
+# Author: Alejandro Enedino Hernandez Samaniego &quot;aehs29&quot; &lt;<a =
href=3D"mailto:aehs29@gmail.com">aehs29@gmail.com</a>&gt;<br>
+<br>
+<br>
+import sys<br>
+import subprocess<br>
+import json<br>
+import os<br>
+<br>
+# Hack to get native python search path (for folders), not fond of it but =
it works for now<br>
+pivot=3D&#39;recipe-sysroot-native&#39;<br>
+for p in sys.path:<br>
+=C2=A0 if pivot in p:<br>
+=C2=A0 =C2=A0 nativelibfolder=3Dp[:p.find(<wbr>pivot)+len(pivot)]<br>
+<br>
+# Empty dict to hold the whole manifest<br>
+new_manifest =3D {}<br>
+<br>
+# Check for repeated files, folders and wildcards<br>
+allfiles=3D[]<br>
+repeated=3D[]<br>
+wildcards=3D[]<br>
+<br>
+hasfolders=3D[]<br>
+allfolders=3D[]<br>
+<br>
+def isFolder(value):<br>
+=C2=A0 if os.path.isdir(value.replace(&#39;$<wbr>{libdir}&#39;,nativelibfo=
lder+&#39;/<wbr>usr/lib&#39;)) or os.path.isdir(value.replace(&#39;$<wbr>{l=
ibdir}&#39;,nativelibfolder+&#39;/<wbr>usr/lib64&#39;)) or os.path.isdir(va=
lue.replace(&#39;$<wbr>{libdir}&#39;,nativelibfolder+&#39;/<wbr>usr/lib32&#=
39;)):<br>
+=C2=A0 =C2=A0 return True<br>
+=C2=A0 else:<br>
+=C2=A0 =C2=A0 return False<br>
+<br>
+# Read existing JSON manifest<br>
+with open(&#39;python2-manifest.json&#39;) as manifest:<br>
+=C2=A0 old_manifest=3Djson.load(<wbr>manifest)<br>
+<br>
+<br>
+# First pass to get core-package functionality, because we base everything=
 on the fact that core is actually working<br>
+# Not exactly the same so it should not be a function<br>
+print (&quot;Getting dependencies for core package:&quot;)<br>
+<br>
+# Special call to check for core package<br>
+output =3D subprocess.check_output([sys.<wbr>executable, &#39;get_module_d=
eps2.py&#39;, &#39;python-core-package&#39;])<br>
+for item in output.split():<br>
+=C2=A0 =C2=A0 # We append it so it doesnt hurt what we currently have:<br>
+=C2=A0 =C2=A0 if item not in old_manifest[&#39;core&#39;][&#39;files&#39;]=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We use the same data structure since its the=
 one which will be used to check<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # dependencies for other packages<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 old_manifest[&#39;core&#39;][&#39;files&#39;].=
<wbr>append(item)<br>
+<br>
+for value in old_manifest[&#39;core&#39;][&#39;files&#39;]:<br>
+=C2=A0 # Ignore folders, since we don&#39;t import those, difficult to han=
dle multilib<br>
+=C2=A0 if isFolder(value):<br>
+=C2=A0 =C2=A0 # Pass it directly<br>
+=C2=A0 =C2=A0 if value not in old_manifest[&#39;core&#39;][&#39;files&#39;=
]:<br>
+=C2=A0 =C2=A0 =C2=A0 old_manifest[&#39;core&#39;][&#39;files&#39;].<wbr>ap=
pend(value)<br>
+=C2=A0 # Ignore binaries, since we don&#39;t import those, assume it was a=
dded correctly (manually)<br>
+=C2=A0 if &#39;${bindir}&#39; in value:<br>
+=C2=A0 =C2=A0 # Pass it directly<br>
+=C2=A0 =C2=A0 if value not in old_manifest[&#39;core&#39;][&#39;files&#39;=
]:<br>
+=C2=A0 =C2=A0 =C2=A0 old_manifest[&#39;core&#39;][&#39;files&#39;].<wbr>ap=
pend(value)<br>
+=C2=A0 =C2=A0 continue<br>
+=C2=A0 # Ignore empty values<br>
+=C2=A0 if value =3D=3D &#39;&#39;:<br>
+=C2=A0 =C2=A0 continue<br>
+=C2=A0 if &#39;${includedir}&#39; in value:<br>
+=C2=A0 =C2=A0 if value not in old_manifest[&#39;core&#39;][&#39;files&#39;=
]:<br>
+=C2=A0 =C2=A0 =C2=A0 old_manifest[&#39;core&#39;][&#39;files&#39;].<wbr>ap=
pend(value)<br>
+=C2=A0 =C2=A0 continue<br>
+=C2=A0 # Get module name , shouldnt be affected by libdir/bindir<br>
+=C2=A0 value =3D os.path.splitext(os.path.<wbr>basename(os.path.normpath(<=
wbr>value)))[0]<br>
+<br>
+<br>
+=C2=A0 # Launch separate task for each module for deterministic behavior<b=
r>
+=C2=A0 # Each module will only import what is necessary for it to work in =
specific<br>
+=C2=A0 print (&#39;Getting dependencies for module: %s&#39; % value)<br>
+=C2=A0 output =3D subprocess.check_output([sys.<wbr>executable, &#39;get_m=
odule_deps2.py&#39;, &#39;%s&#39; % value])<br>
+=C2=A0 for item in output.split():<br>
+=C2=A0 =C2=A0 # We append it so it doesnt hurt what we currently have:<br>
+=C2=A0 =C2=A0 if item not in old_manifest[&#39;core&#39;][&#39;files&#39;]=
:<br>
+=C2=A0 =C2=A0 =C2=A0 old_manifest[&#39;core&#39;][&#39;files&#39;].<wbr>ap=
pend(item)<br>
+<br>
+# We check which packages include folders<br>
+for key in old_manifest:<br>
+=C2=A0 =C2=A0 for value in old_manifest[key][&#39;files&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore folders, since we don&#39;t import th=
ose, difficult to handle multilib<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isFolder(value):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print (&#39;%s is a folder&#39; =
% value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if key not in hasfolders:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasfolders.append(=
key)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value not in allfolders:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allfolders.append(=
value)<br>
+<br>
+for key in old_manifest:<br>
+=C2=A0 =C2=A0 # Use an empty dict as data structure to hold data for each =
package and fill it up<br>
+=C2=A0 =C2=A0 new_manifest[key]=3D{}<br>
+=C2=A0 =C2=A0 new_manifest[key][&#39;files&#39;]=3D[]<br>
+=C2=A0 =C2=A0 new_manifest[key][&#39;rdepends&#39;]=3D<wbr>[]<br>
+=C2=A0 =C2=A0 # All packages should depend on core<br>
+=C2=A0 =C2=A0 if key !=3D &#39;core&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_manifest[key][&#39;rdepends&#39;].<w=
br>append(&#39;core&#39;)<br>
+=C2=A0 =C2=A0 new_manifest[key][&#39;summary&#39;]=3D<wbr>old_manifest[key=
][&#39;summary&#39;]<br>
+<br>
+=C2=A0 =C2=A0 # Handle special cases, we assume that when they were manual=
ly added<br>
+=C2=A0 =C2=A0 # to the manifest we knew what we were doing.<br>
+=C2=A0 =C2=A0 print (&#39;Handling package %s&#39; % key)<br>
+=C2=A0 =C2=A0 special_packages=3D[&#39;misc&#39;, &#39;modules&#39;, &#39;=
dev&#39;]<br>
+=C2=A0 =C2=A0 if key in special_packages or &#39;staticdev&#39; in key:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;Passing %s package directly&#39; % =
key)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_manifest[key]=3Dold_<wbr>manifest[key]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 for value in old_manifest[key][&#39;files&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We already handled core on the first pass<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if key =3D=3D &#39;core&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_manifest[key][&#39;files&#39=
;].<wbr>append(value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore folders, since we don&#39;t import th=
ose, difficult to handle multilib<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isFolder(value):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass folders directly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_manifest[key][&#39;files&#39=
;].<wbr>append(value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore binaries, since we don&#39;t import t=
hose<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;${bindir}&#39; in value:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass it directly to the new ma=
nifest data structure<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value not in new_manifest[key=
][&#39;files&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_manifest[key][=
&#39;files&#39;].<wbr>append(value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore empty values<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if value =3D=3D &#39;&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;${includedir}&#39; in value:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value not in new_manifest[key=
][&#39;files&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_manifest[key][=
&#39;files&#39;].<wbr>append(value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get module name , shouldnt be affected by li=
bdir/bindir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D os.path.splitext(os.path.<wbr>basena=
me(os.path.normpath(<wbr>value)))[0]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Launch separate task for each module for det=
erministic behavior<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Each module will only import what is necessa=
ry for it to work in specific<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print (&#39;Getting dependencies for module: %=
s&#39; % value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D subprocess.check_output([sys.<wbr>e=
xecutable, &#39;get_module_deps2.py&#39;, &#39;%s&#39; % value])<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can print dependencies for debugging purp=
oses<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #print (output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Output will have all dependencies<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in output.split():<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Warning: This first part is ug=
ly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # One of the dependencies that w=
as found, could be inside of one of the folders included by another package=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to check if this happe=
ns so we can add the package containing the folder as an RDEPENDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # e.g. Folder encodings containe=
d in codecs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This would be solved if no pac=
kages included any folders<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This can be done in two ways:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # 1 - We assume that if we take =
out the filename from the path we would get<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0the folder string,=
 then we would check if folder string is in the list of folders<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0This would not wor=
k if a package contains a folder which contains another folder<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0e.g. path/folder1/=
folder2/filename=C2=A0 folder_string=3D path/folder1/folder2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0folder_string woul=
d not match any value contained in the list of folders<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # 2 - We do it the other way aro=
und, checking if the folder is contained in the path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0e.g. path/folder1/=
folder2/filename=C2=A0 folder_string=3D path/folder1/folder2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0is folder_string i=
nside path/folder1/folder2/filename?<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0Yes, it works, but=
 we waste a couple of milliseconds.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inFolders=3DFalse<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for folder in allfolders:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if folder in item:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inFo=
lders =3D True # Did we find a folder?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fold=
erFound =3D False # Second flag to break inner for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Lo=
op only through packages which contain folders<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for =
keyfolder in hasfolders:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (folderFound =3D=3D False):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 #print(&quot;Checking folder %s on package %s&quot=
; % (item,keyfolder))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 for file_folder in old_manifest[keyfolder][&#39;<w=
br>files&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if file_folder=3D=3Dfolder:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print (&#39;%s found i=
n %s&#39; % (folder, keyfolder))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 folderFound =3D True<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if keyfolder not in ne=
w_manifest[key][&#39;rdepends&#39;] and keyfolder !=3D key:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_mani=
fest[key][&#39;rdepends&#39;].<wbr>append(keyfolder)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # A folder was found so we&#39;r=
e done with this item, we can go on<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if inFolders:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We might already have it on th=
e dictionary since it could depend on a (previously checked) module<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if item not in new_manifest[key]=
[&#39;files&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Handle core as a=
 special package, we already did it so we pass it to NEW data structure dir=
ectly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if key=3D=3D&#39;c=
ore&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;=
Adding %s to %s FILES&#39; % (item, key))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if item.end=
swith(&#39;*&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 wildcards.append(item)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_manifes=
t[key][&#39;files&#39;].<wbr>append(item)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check for=
 repeated files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if item not=
 in allfiles:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 allfiles.append(item)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 repeated.append(item)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ch=
eck if this dependency is already contained on another package, so we add i=
t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # as=
 an RDEPENDS, or if its not, it means it should be contained on the current=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # pa=
ckage, so we should add it to FILES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for =
newkey in old_manifest:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # Debug<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 #print(&quot;Checking %s &quot; % item + &quot; in %s&quot; % ne=
wkey)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if item in old_manifest[newkey][&#39;files&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Since were nesting, we need to che=
ck its not the same key<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(newkey!=3Dkey):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if newkey not in new_m=
anifest[key][&#39;rdepends&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Add it =
to the new manifest data struct<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Debug<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#3=
9;Adding %s to %s RDEPENDS, because it contains %s&#39; % (newkey, key, ite=
m))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_manif=
est[key][&#39;rdepends&#39;].<wbr>append(newkey)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # Debug<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 print(&#39;Adding %s to %s FILES&#39; % (item, key))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # Since it wasnt found on another package, its not an RDEP, so add it t=
o FILES for this package<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 new_manifest[key][&#39;files&#39;].<wbr>append(item)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if item.endswith(&#39;*&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 wildcards.append(item)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if item not in allfiles:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 allfiles.append(item)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 repeated.append(item)<br>
+<br>
+print (&#39;The following files are repeated (contained in more than one p=
ackage), please check which package should get it:&#39;)<br>
+print (repeated)<br>
+print(&#39;The following files contain wildcards, please check they are ne=
cessary&#39;)<br>
+print(wildcards)<br>
+print(&#39;The following files contain folders, please check they are nece=
ssary&#39;)<br>
+print(hasfolders)<br>
+<br>
+# Sort it just so it looks nice<br>
+for key in new_manifest:<br>
+=C2=A0 =C2=A0 new_manifest[key][&#39;files&#39;].<wbr>sort()<br>
+=C2=A0 =C2=A0 new_manifest[key][&#39;rdepends&#39;].<wbr>sort()<br>
+<br>
+# Create the manifest from the data structure that was built<br>
+with open(&#39;python2-manifest.json.<wbr>new&#39;,&#39;w&#39;) as outfile=
:<br>
+=C2=A0 =C2=A0 json.dump(new_manifest,<wbr>outfile,sort_keys=3DTrue, indent=
=3D4)<br>
diff --git a/meta/recipes-devtools/<wbr>python/python/get_module_<wbr>deps2=
.py b/meta/recipes-devtools/<wbr>python/python/get_module_<wbr>deps2.py<br>
new file mode 100644<br>
index 0000000..73e7c6f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>python/python/get_module_<wbr>deps2.py<br>
@@ -0,0 +1,112 @@<br>
+# This script is launched on separate task for each python module<br>
+# It checks for dependencies for that specific module and prints<br>
+# them out, the output of this execution will have all dependencies<br>
+# for a specific module, which will be parsed an dealt on create_manifest.=
py<br>
+#<br>
+# Author: Alejandro Enedino Hernandez Samaniego &quot;aehs29&quot; &lt;<a =
href=3D"mailto:aehs29@gmail.com">aehs29@gmail.com</a>&gt;<br>
+<br>
+<br>
+# We can get a log per module, for all the dependencies that were found, b=
ut its messy.<br>
+debug=3DFalse<br>
+<br>
+import sys<br>
+<br>
+# We can get a list of the modules which are currently required to run pyt=
hon<br>
+# so we run python-core and get its modules, we then import what we need<b=
r>
+# and check what modules are currently running, if we substract them from =
the<br>
+# modules we had initially, we get the dependencies for the module we impo=
rted.<br>
+<br>
+# We use importlib to achieve this, so we also need to know what modules i=
mportlib needs<br>
+import importlib<br>
+<br>
+core_deps=3Dset(sys.modules)<br>
+<br>
+def fix_path(dep_path):<br>
+=C2=A0 =C2=A0 import os<br>
+=C2=A0 =C2=A0 # We DONT want the path on our HOST system<br>
+=C2=A0 =C2=A0 pivot=3D&#39;recipe-sysroot-native&#39;<br>
+=C2=A0 =C2=A0 dep_path=3Ddep_path[dep_path.<wbr>find(pivot)+len(pivot):]<b=
r>
+<br>
+=C2=A0 =C2=A0 if &#39;/usr/bin&#39; in dep_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_path =3D dep_path.replace(&#39;/usr/bin&#3=
9;&#39;${<wbr>bindir}&#39;)<br>
+<br>
+=C2=A0 =C2=A0 # Handle multilib, is there a better way?<br>
+=C2=A0 =C2=A0 if &#39;/usr/lib32&#39; in dep_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_path =3D dep_path.replace(&#39;/usr/lib32&=
#39;,<wbr>&#39;${libdir}&#39;)<br>
+=C2=A0 =C2=A0 if &#39;/usr/lib64&#39; in dep_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_path =3D dep_path.replace(&#39;/usr/lib64&=
#39;,<wbr>&#39;${libdir}&#39;)<br>
+=C2=A0 =C2=A0 if &#39;/usr/lib&#39; in dep_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_path =3D dep_path.replace(&#39;/usr/lib&#3=
9;,&#39;$<wbr>{libdir}&#39;)<br>
+=C2=A0 =C2=A0 if &#39;/usr/include&#39; in dep_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_path =3D dep_path.replace(&#39;/usr/<wbr>i=
nclude&#39;,&#39;${includedir}&#39;)<br>
+=C2=A0 =C2=A0 if &#39;__init__.&#39; in dep_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_path =3D=C2=A0 os.path.split(dep_path)[0]<=
br>
+<br>
+=C2=A0 =C2=A0 # If a *.pyc file was imported, we replace it with *.py (sin=
ce we deal with PYCs on create_manifest)<br>
+=C2=A0 =C2=A0 if &#39;.pyc&#39; in dep_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_path =3D dep_path.replace(&#39;.pyc&#39;,&=
#39;.py&#39;)<br>
+<br>
+=C2=A0 =C2=A0 return dep_path<br>
+<br>
+# Module to import was passed as an argument<br>
+current_module =3D=C2=A0 str(sys.argv[1]).rstrip()<br>
+if(debug=3D=3DTrue):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0log =3D open(&#39;log_%s&#39; % current_module,=
&#39;w&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 log.write(&#39;Module %s generated the followi=
ng dependencies:\n&#39; % current_module)<br>
+try:<br>
+=C2=A0 =C2=A0 importlib.import_module(&#39;%s&#39; % current_module)<br>
+except ImportError as e:<br>
+=C2=A0 =C2=A0 if (debug=3D=3DTrue):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 log.write(&#39;Module was not found&#39;)<br>
+=C2=A0 =C2=A0 pass<br>
+<br>
+<br>
+# Get current module dependencies, dif will contain a list of specific dep=
s for this module<br>
+module_deps=3Dset(sys.modules)<br>
+<br>
+# We handle the core package (1st pass on create_manifest.py) as a special=
 case<br>
+if current_module =3D=3D &#39;python-core-package&#39;:<br>
+=C2=A0 =C2=A0 dif =3D core_deps<br>
+else:<br>
+=C2=A0 =C2=A0 dif =3D module_deps-core_deps<br>
+<br>
+<br>
+# Check where each dependency came from<br>
+for item in dif:<br>
+=C2=A0 =C2=A0 dep_path=3D&#39;&#39;<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (debug=3D=3DTrue):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.write(&#39;Calling: sys.modu=
les[&#39; + &#39;%s&#39; % item + &#39;].__file__\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_path =3D sys.modules[&#39;%s&#39; % item].=
__file__<br>
+=C2=A0 =C2=A0 except AttributeError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Deals with thread (builtin module) not havin=
g __file__ attribute<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug=3D=3DTrue:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.write(item + &#39; &#39;)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.write(str(e))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log.write(&#39;\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 except NameError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Deals with NameError: name &#39;dep_path&#39=
; is not defined<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # because module is not found (wasn&#39;t comp=
iled?), e.g. bddsm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (debug=3D=3DTrue):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.write(item+&#39; &#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.write(str(e))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
+=C2=A0 =C2=A0 # Site-customize is a special case since we (OpenEmbedded) p=
ut it there manually<br>
+=C2=A0 =C2=A0 if &#39;sitecustomize&#39; in dep_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_path =3D &#39;${libdir}/python2.7/<wbr>sit=
ecustomize.py&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Prints out result, which is what will be use=
d by create_manifest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print (dep_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 dep_path =3D fix_path(dep_path)<br>
+<br>
+=C2=A0 =C2=A0 if (debug=3D=3DTrue):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 log.write(dep_path+&#39;\n&#39;)<br>
+<br>
+=C2=A0 =C2=A0 # Prints out result, which is what will be used by create_ma=
nifest<br>
+=C2=A0 =C2=A0 print (dep_path)<br>
+<br>
+if debug=3D=3DTrue:<br>
+=C2=A0 =C2=A0 log.close()<br>
diff --git a/meta/recipes-devtools/<wbr>python/python/python2-<wbr>manifest=
.json b/meta/recipes-devtools/<wbr>python/python/python2-<wbr>manifest.json=
<br>
new file mode 100644<br>
index 0000000..8ebc715<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>python/python/python2-<wbr>manifest.json<b=
r>
@@ -0,0 +1,1032 @@<br>
+{<br>
+=C2=A0 =C2=A0 &quot;2to3&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/2to3&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib2to=
3&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python automated Py=
thon 2 to 3 code translator&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;argparse&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/argpar=
se.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codecs&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python command line=
 argument parser&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;audio&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/audiod=
ev.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/chunk.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/audioop.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/ossaudiodev.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sndhdr=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sunau.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sunaud=
io.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/toaiff=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/wave.p=
y&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Audio Handli=
ng&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;bsddb&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/bsddb&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_bsddb.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python bindings for=
 the Berkeley Database&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;codecs&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/gettex=
t.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_codecs_cn.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_codecs_hk.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_codecs_iso2022.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_codecs_jp.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_codecs_kr.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_codecs_tw.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_multibytecodec.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/unicodedata.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/locale=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>s=
tringprep.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/xdrlib=
.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python codec&quot;<=
br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;compile&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>c=
ompileall.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/py_<wb=
r>compile.py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python bytecode com=
pilation support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;compiler&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/compil=
er&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python compiler sup=
port&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;compression&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/gzip.p=
y&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/bz2.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/tarfil=
e.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/zipfil=
e.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shell&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unixadmin&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;zlib&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python high-level c=
ompression support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;contextlib&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>c=
ontextlib.py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python utilities fo=
r with-statementcontexts.&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;core&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python*&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${includedir}/python2.7/<w=
br>pyconfig*.h&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>C=
onfigParser.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/UserDi=
ct.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/UserLi=
st.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>U=
serString.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/__futu=
re_<wbr>_.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/_abcol=
l.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/_<wbr>=
sysconfigdata.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/_<wbr>=
weakrefset.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/abc.py=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/ast.py=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/atexit=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/codecs=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>c=
ollections.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/copy.p=
y&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/copy_r=
eg.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>e=
ncodings&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>e=
ncodings/aliases.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>e=
ncodings/utf_8.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>g=
enericpath.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/getopt=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/heapq.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>i=
mportlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/keywor=
d.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_collections.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_heapq.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_locale.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_struct.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/binascii.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/itertools.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/operator.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/readline.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/strop.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/time.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/xreadlines.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>l=
inecache.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/new.py=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/os.py&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/platfo=
rm.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>p=
osixpath.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/re.py&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>r=
lcompleter.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/site.p=
y&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>s=
itecustomize.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sre_<w=
br>compile.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sre_<w=
br>constants.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sre_<w=
br>parse.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/stat.p=
y&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/string=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/struct=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>s=
ysconfig.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>t=
raceback.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/types.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/warnin=
gs.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/weakre=
f.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python interpreter =
and core modules&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;crypt&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/hashli=
b.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_hashlib.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/crypt.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/md5.py=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sha.py=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python basic crypto=
graphic and hashing support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;ctypes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/ctypes=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_ctypes.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_ctypes_test.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python C types supp=
ort&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;curses&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/curses=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_curses.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_curses_panel.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python curses suppo=
rt&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;datetime&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/_<wbr>=
strptime.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/calend=
ar.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/datetime.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codecs&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python calendar and=
 time support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;db&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/anydbm=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/dbhash=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/dumbdb=
m.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/dbm.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/whichd=
b.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bsddb&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;gdbm&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python file-based d=
atabase support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;debugger&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/bdb.py=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/pdb.py=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pprint&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shell&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python debugger&quo=
t;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;dev&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${base_libdir}/*.a&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${base_libdir}/*.o&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${datadir}/aclocal&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${datadir}/pkgconfig&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${includedir}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/*.a&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/*.la&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/*.o&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/lib*${SOLIBSDEV}=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pkgconfig&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/config=
/<wbr>Makefile&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python development =
package&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;difflib&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/diffli=
b.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python helpers for =
computing deltas between objects&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;distutils&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/config=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>d=
istutils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Distribution=
 Utilities&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;distutils-staticdev&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/config=
/<wbr>lib*.a&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;distutils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python distribution=
 utilities (static libraries)&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;doctest&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/doctes=
t.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;debugger&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;difflib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pprint&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shell&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unittest&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python framework fo=
r running examples in docstrings&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;email&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/email&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/imapli=
b.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;contextlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pickle&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;subprocess&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python email suppor=
t&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;fcntl&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/fcntl.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python&#39;s fcntl =
interface&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;gdbm&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/gdbm.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python GNU database=
 support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;hotshot&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/hotsho=
t&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_hotshot.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python hotshot perf=
ormance profiler&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;html&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>H=
TMLParser.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>f=
ormatter.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>h=
tmlentitydefs.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/htmlli=
b.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>m=
arkupbase.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sgmlli=
b.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python HTML process=
ing support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;idle&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/idle&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/idleli=
b&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Integrated D=
evelopment Environment&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;image&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/colors=
ys.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/imghdr=
.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python graphical im=
age handling&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;io&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/String=
IO.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/_pyio.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/io.py&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_io.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_socket.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_ssl.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/cStringIO.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/select.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/termios.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/pipes.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/socket=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/ssl.py=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/tempfi=
le.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;contextlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python low-level I/=
O&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;json&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/json&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_json.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python JSON support=
&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;lang&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/bisect=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/code.p=
y&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/codeop=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/dis.py=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>f=
unctools.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/inspec=
t.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_bisect.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_functools.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/array.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/parser.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/opcode=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/repr.p=
y&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/symbol=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/token.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/tokeni=
ze.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python low-level la=
nguage support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;logging&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/loggin=
g&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;threading&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python logging supp=
ort&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;mailbox&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/mailbo=
x.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codecs&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;contextlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;datetime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;email&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python mailbox form=
at support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;math&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_random.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/cmath.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/math.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/random=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sets.p=
y&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python math support=
&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;mime&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>M=
imeWriter.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>m=
imetools.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>m=
imetypes.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/quopri=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/rfc822=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/uu.py&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;contextlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python MIME handlin=
g APIs&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;mmap&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/mmap.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python memory-mappe=
d file support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;modules&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;2to3&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;argparse&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;audio&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bsddb&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codecs&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;compile&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;compiler&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;compression&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;contextlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ctypes&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;curses&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;datetime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;db&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;debugger&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;difflib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;distutils&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;doctest&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;email&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;gdbm&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hotshot&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;html&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;idle&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;image&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;json&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;logging&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mailbox&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mmap&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;multiprocessing&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netserver&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;numbers&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pickle&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pkgutil&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;plistlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pprint&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;profile&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pydoc&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;re&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;resource&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;robotparser&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shell&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;smtpd&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sqlite3&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sqlite3&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringold&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;subprocess&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;syslog&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;terminal&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;threading&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tkinter&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unittest&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unixadmin&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;xml&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;xmlrpc&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;zlib&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;All Python modules&=
quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;multiprocessing&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_multiprocessing.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>m=
ultiprocessing&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pickle&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;subprocess&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;threading&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python multiprocess=
ing support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;netclient&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/Cookie=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/_<wbr>=
LWPCookieJar.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/_<wbr>=
MozillaCookieJar.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/base64=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>c=
ookielib.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/ftplib=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/hmac.p=
y&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/httpli=
b.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/nntpli=
b.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/poplib=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/smtpli=
b.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>t=
elnetlib.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/urllib=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/urllib=
2.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/urlpar=
se.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/uuid.p=
y&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codecs&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;contextlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ctypes&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;datetime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;email&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pickle&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;subprocess&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;threading&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Internet Pro=
tocol clients&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;netserver&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>B=
aseHTTPServer.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>C=
GIHTTPServer.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>S=
impleHTTPServer.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>S=
ocketServer.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/cgi.py=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;contextlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shell&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;threading&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unixadmin&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Internet Pro=
tocol servers&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;numbers&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/decima=
l.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>f=
ractions.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/number=
s.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codecs&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;threading&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python number APIs&=
quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;pickle&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/cPickle.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/pickle=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>p=
ickletools.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/shelve=
.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python serialisatio=
n/persistence support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;pkgutil&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/pkguti=
l.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python package exte=
nsion utility support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;plistlib&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/plistl=
ib.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;datetime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Generate and parse =
Mac OS X .plist files&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;pprint&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/pprint=
.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python pretty-print=
 support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;profile&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/cProfi=
le.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_lsprof.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/profil=
e.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/pstats=
.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codecs&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;resource&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python basic perfor=
mance profiling support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;pydoc&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/pydoc&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/pydoc.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/pydoc_=
<wbr>data&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codecs&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pkgutil&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python interactive =
help support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;re&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sre.py=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Regular Expr=
ession APIs&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;resource&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/resource.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python resource con=
trol interface&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;robotparser&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>r=
obotparser.py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;contextlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python robots.txt p=
arser&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;shell&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/cmd.py=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/comman=
ds.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/dircac=
he.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/fnmatc=
h.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/glob.p=
y&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/popen2=
.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/shlex.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/shutil=
.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unixadmin&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python shell-like f=
unctionality&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;smtpd&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/smtpd.py&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/asynch=
at.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/asynco=
re.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/smtpd.=
py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Simple Mail =
Transport Daemon&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;sqlite3&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_sqlite3.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Sqlite3 data=
base support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;sqlite3-tests&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/sqlite=
3/<wbr>test&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tests&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Sqlite3 data=
base support tests&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;stringold&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>s=
tringold.py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python string APIs =
[deprecated]&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;subprocess&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>s=
ubprocess.py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pickle&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python subprocess s=
upport&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;syslog&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/syslog.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python syslog inter=
face&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;terminal&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/pty.py=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/tty.py=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python terminal con=
trolling support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;tests&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/test&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python tests&quot;<=
br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;textutils&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/csv.py=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_csv.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/optpar=
se.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/textwr=
ap.<wbr>py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codecs&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python option parsi=
n&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;threading&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/Queue.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/_<wbr>=
threading_local.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/dummy_=
<wbr>thread.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/dummy_=
<wbr>threading.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/mutex.=
py&quot;<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>t=
hreading.py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python threading &a=
mp; synchronization support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;tkinter&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-tk=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Tcl/Tk bindi=
ngs&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;unittest&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/unitte=
st&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;difflib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pprint&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shell&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python unit testing=
 framework&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;unixadmin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/getpas=
s.<wbr>py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/grp.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/nis.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python Unix adminis=
tration support&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;xml&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/_elementtree.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/pyexpat.so&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/xml&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python basic XML su=
pport&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;xmlrpc&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>D=
ocXMLRPCServer.py&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/<wbr>S=
impleXMLRPCServer.py&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;codecs&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;compression&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;contextlib&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crypt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;datetime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fcntl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lang&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;math&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netserver&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pkgutil&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pydoc&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;textutils&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;threading&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;xml&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;zlib&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python XML-RPC supp=
ort&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;zlib&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python2.7/lib-<w=
br>dynload/zlib.so&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python zlib compres=
sion support&quot;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
\ No newline at end of file<br>
diff --git a/meta/recipes-devtools/<wbr>python/python/sitecustomize.py b/me=
ta/recipes-devtools/<wbr>python/python/sitecustomize.py<br>
index 2739018..4c8b5e2 100644<br>
--- a/meta/recipes-devtools/<wbr>python/python/sitecustomize.py<br>
+++ b/meta/recipes-devtools/<wbr>python/python/sitecustomize.py<br>
@@ -27,19 +27,11 @@ def __enableReadlineSupport():<br>
=C2=A0 =C2=A0 =C2=A0except IOError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
-def __enableDefaultEncoding():<br>
-=C2=A0 =C2=A0 import sys<br>
-=C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.setdefaultencoding( &quot;utf8&quot; )<br>
-=C2=A0 =C2=A0 except LookupError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
-<br>
=C2=A0import sys<br>
=C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0import rlcompleter, readline<br>
=C2=A0except ImportError:<br>
=C2=A0 =C2=A0 =C2=A0pass<br>
=C2=A0else:<br>
-=C2=A0 =C2=A0 __enableDefaultEncoding()<br>
=C2=A0 =C2=A0 =C2=A0__registerExitHandler()<br>
=C2=A0 =C2=A0 =C2=A0__enableReadlineSupport()<br>
diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python_2.7=
.13.bb" rel=3D"noreferrer" target=3D"_blank">python_2.7.13.bb</a> b/meta/re=
cipes-devtools/<wbr>python/<a href=3D"http://python_2.7.13.bb" rel=3D"noref=
errer" target=3D"_blank">python_2.7.13.bb</a><br>
index 754c029..dbafb95 100644<br>
--- a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python_2.7.13.bb"=
 rel=3D"noreferrer" target=3D"_blank">python_2.7.13.bb</a><br>
+++ b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python_2.7.13.bb"=
 rel=3D"noreferrer" target=3D"_blank">python_2.7.13.bb</a><br>
@@ -1,5 +1,7 @@<br>
=C2=A0require python.inc<br>
+<br>
=C2=A0DEPENDS =3D &quot;python-native libffi bzip2 gdbm openssl readline sq=
lite3 zlib&quot;<br>
+<br>
=C2=A0PR =3D &quot;${INC_PR}&quot;<br>
<br>
=C2=A0DISTRO_SRC_URI ?=3D &quot;file://sitecustomize.py&quot;<br>
@@ -145,11 +147,9 @@ py_package_preprocess () {<br>
=C2=A0 =C2=A0 =C2=A0python -m py_compile ${PKGD}/${libdir}/python${<wbr>PYT=
HON_MAJMIN}/_sysconfigdata.<wbr>py<br>
=C2=A0}<br>
<br>
-require python-${PYTHON_MAJMIN}-<wbr>manifest.inc<br>
<br>
=C2=A0# manual dependency additions<br>
=C2=A0RPROVIDES_${PN}-core =3D &quot;${PN}&quot;<br>
-RRECOMMENDS_${PN}-core =3D &quot;${PN}-readline&quot;<br>
=C2=A0RRECOMMENDS_${PN}-core_append_<wbr>class-nativesdk =3D &quot; natives=
dk-python-modules&quot;<br>
=C2=A0RRECOMMENDS_${PN}-crypt =3D &quot;openssl&quot;<br>
<br>
@@ -193,3 +193,87 @@ FILES_${PN}-man =3D &quot;${datadir}/man&quot;<br>
=C2=A0RDEPENDS_${PN}-modules_remove =3D &quot;${@bb.utils.contains(&#39;<wb=
r>PACKAGECONFIG&#39;, &#39;bdb&#39;, &#39;&#39;, &#39;${PN}-bsddb&#39;, d)}=
&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
+<br>
+RPROVIDES_${PN} +=3D &quot;${PN}-modules&quot;<br>
+<br>
+# We want bytecode precompiled .py files (.pyc&#39;s) by default<br>
+# but the user may set it on their own conf<br>
+<br>
+INCLUDE_PYCS ?=3D &quot;1&quot;<br>
+<br>
+python(){<br>
+<br>
+=C2=A0 =C2=A0 pythondir =3D d.getVar(&#39;THISDIR&#39;,True)<br>
+<br>
+=C2=A0 =C2=A0 # Read JSON manifest<br>
+=C2=A0 =C2=A0 import json<br>
+=C2=A0 =C2=A0 with open(pythondir+&#39;/python/<wbr>python2-manifest.json&=
#39;) as manifest_file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_manifest=3Djson.load(<wbr>manifest_file=
)<br>
+<br>
+=C2=A0 =C2=A0 include_pycs =3D d.getVar(&#39;INCLUDE_PYCS&#39;)<br>
+<br>
+=C2=A0 =C2=A0 packages =3D d.getVar(&#39;PACKAGES&#39;).split()<br>
+=C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
+<br>
+<br>
+=C2=A0 =C2=A0 newpackages=3D[]<br>
+<br>
+=C2=A0 =C2=A0 for key in python_manifest:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pypackage=3D pn + &#39;-&#39; + key<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pypackage not in packages:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to prepend, otherwise =
python-misc gets everything<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # so we use a new variable<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newpackages.append(pypackage)<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;Build&quot; python&#39;s manifest FILE=
S, RDEPENDS and SUMMARY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;FILES_&#39; + pypackage, &#39;&#=
39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for value in python_manifest[key][&#39;files&#=
39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;FILES_&#39; + p=
ypackage, &#39; &#39; + value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if include_pycs =3D=3D &#39;1&#3=
9;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value.endswith(=
&#39;.py&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.ap=
pendVar(&#39;FILES_&#39; + pypackage, &#39; &#39; + value + &#39;c&#39;)<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;RDEPENDS_&#39; + pypackage, &#39=
;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for value in python_manifest[key][&#39;<wbr>rd=
epends&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Make it work with or without $=
PN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;${PN}&#39; in value:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value=3Dvalue.spli=
t(&#39;-&#39;)[1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; =
+ pypackage, &#39; &#39; + pn + &#39;-&#39; + value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;SUMMARY_&#39; + pypackage, pytho=
n_manifest[key][&#39;summary&#39;<wbr>])<br>
+<br>
+=C2=A0 =C2=A0 # We need to ensure staticdev packages match for files first=
 so we sort in reverse<br>
+=C2=A0 =C2=A0 newpackages.sort(reverse=3DTrue)<br>
+=C2=A0 =C2=A0 # Prepending so to avoid python-misc getting everything<br>
+=C2=A0 =C2=A0 packages =3D newpackages + packages<br>
+=C2=A0 =C2=A0 d.setVar(&#39;PACKAGES&#39;, &#39; &#39;.join(packages))<br>
+=C2=A0 =C2=A0 d.setVar(&#39;ALLOW_EMPTY_${PN}-<wbr>modules&#39;, &#39;1&#3=
9;)<br>
+}<br>
+<br>
+do_split_packages[file-<wbr>checksums] +=3D &quot;${THISDIR}/python/python=
2-<wbr>manifest.json:True&quot;<br>
+<br>
+# Files needed to create a new manifest<br>
+SRC_URI +=3D &quot;file://create_manifest2.py file://get_module_deps2.py f=
ile://python2-manifest.json&quot;<br>
+<br>
+do_create_manifest() {<br>
+<br>
+# This task should be run with every new release of Python.<br>
+# We must ensure that PACKAGECONFIG enables everything when creating<br>
+# a new manifest, this is to base our new manifest on a complete<br>
+# native python build, containing all dependencies, otherwise the task<br>
+# wont be able to find the required files.<br>
+# e.g. BerkeleyDB is an optional build dependency so it may or may not<br>
+# be present, we must ensure it is.<br>
+<br>
+cd ${WORKDIR}<br>
+# This needs to be executed by python-native and NOT by HOST&#39;s python<=
br>
+nativepython create_manifest2.py<br>
+cp python2-manifest.json.new ${THISDIR}/python/python2-<wbr>manifest.json<=
br>
+}<br>
+<br>
+# bitbake python -c create_manifest<br>
+addtask do_create_manifest<br>
+<br>
+# Make sure we have native python ready when we create a new manifest<br>
+do_create_manifest[depends] +=3D &quot;python:do_prepare_recipe_<wbr>sysro=
ot&quot;<br>
+do_create_manifest[depends] +=3D &quot;python:do_patch&quot;<br>
diff --git a/scripts/contrib/python/<a href=3D"http://generate-manifest-2.7=
.py" rel=3D"noreferrer" target=3D"_blank">gener<wbr>ate-manifest-2.7.py</a>=
 b/scripts/contrib/python/<a href=3D"http://generate-manifest-2.7.py" rel=
=3D"noreferrer" target=3D"_blank">gener<wbr>ate-manifest-2.7.py</a><br>
deleted file mode 100755<br>
index ee75403..0000000<br>
--- a/scripts/contrib/python/<a href=3D"http://generate-manifest-2.7.py" re=
l=3D"noreferrer" target=3D"_blank">gener<wbr>ate-manifest-2.7.py</a><br>
+++ /dev/null<br>
@@ -1,426 +0,0 @@<br>
-#!/usr/bin/env python<br>
-<br>
-# generate Python Manifest for the OpenEmbedded build system<br>
-# (C) 2002-2010 Michael &#39;Mickey&#39; Lauer &lt;<a href=3D"mailto:mlaue=
r@vanille-media.de">mlauer@vanille-media.de</a>&gt;<br>
-# (C) 2007 Jeremy Laine<br>
-# licensed under MIT, see COPYING.MIT<br>
-#<br>
-# June 22, 2011 -- Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.c=
om">mark.hatle@windriver.com</a>&gt;<br>
-#=C2=A0 * Updated to no longer generate special -dbg package, instead use =
the<br>
-#=C2=A0 =C2=A0 single system -dbg<br>
-#=C2=A0 * Update version with &quot;.1&quot; to indicate this change<br>
-#<br>
-# February 26, 2017 -- Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external=
.atlascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
-#=C2=A0 * Updated to support generating manifest for native python<br>
-<br>
-import os<br>
-import sys<br>
-import time<br>
-import argparse<br>
-<br>
-VERSION =3D &quot;2.7.2&quot;<br>
-<br>
-__author__ =3D &quot;Michael &#39;Mickey&#39; Lauer &lt;<a href=3D"mailto:=
mlauer@vanille-media.de">mlauer@vanille-media.de</a>&gt;&quot;<br>
-__version__ =3D &quot;20110222.2&quot;<br>
-<br>
-class MakefileMaker:<br>
-<br>
-=C2=A0 =C2=A0 def __init__( self, outfile, isNative ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;initialize&quot;&quot;&quot;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.packages =3D {}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.excluded_pkgs =3D []<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.targetPrefix =3D &quot;${libdir}/python%s=
/&quot; % VERSION[:3]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.isNative =3D isNative<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.output =3D outfile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &quot;&quot;&quot;<br>
-# WARNING: This file is AUTO GENERATED: Manual edits will be lost next tim=
e I regenerate the file.<br>
-# Generator: &#39;%s%s&#39; Version %s (C) 2002-2010 Michael &#39;Mickey&#=
39; Lauer &lt;<a href=3D"mailto:mlauer@vanille-media.de">mlauer@vanille-med=
ia.de</a>&gt;<br>
-&quot;&quot;&quot; % ( sys.argv[0], &#39; --native&#39; if isNative else &=
#39;&#39;, __version__ ) )<br>
-<br>
-=C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 # helper functions<br>
-=C2=A0 =C2=A0 #<br>
-<br>
-=C2=A0 =C2=A0 def out( self, data ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;print a line to the output f=
ile&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.output.write( &quot;%s\n&quot; % data )<b=
r>
-<br>
-=C2=A0 =C2=A0 def setPrefix( self, targetPrefix ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;set a file prefix for addPac=
kage files&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.targetPrefix =3D targetPrefix<br>
-<br>
-=C2=A0 =C2=A0 def doProlog( self ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &quot;&quot;&quot; &quot;&quot;&quot=
; )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &quot;&quot; )<br>
-<br>
-=C2=A0 =C2=A0 def addPackage( self, name, description, dependencies, filen=
ames, mod_exclude =3D False ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;add a package to the Makefil=
e&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if type( filenames ) =3D=3D type( &quot;&quot;=
 ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filenames =3D filenames.split()<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fullFilenames =3D []<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for filename in filenames:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if filename[0] !=3D &quot;$&quot=
;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fullFilenames.appe=
nd( &quot;%s%s&quot; % ( self.targetPrefix, filename ) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fullFilenames.appe=
nd( filename )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if mod_exclude:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.excluded_pkgs.append( name =
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.packages[name] =3D description, dependenc=
ies, fullFilenames<br>
-<br>
-=C2=A0 =C2=A0 def doBody( self ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;generate body of Makefile&qu=
ot;&quot;&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 global VERSION<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # generate rprovides line for native<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.isNative:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkglist =3D []<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in [&#39;${PN}-modules&=
#39;] + sorted(self.packages):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkglist.append(&#3=
9;%s-native&#39; % name.replace(&#39;${PN}&#39;, &#39;python&#39;))<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out(&#39;RPROVIDES +=3D &qu=
ot;%s&quot;&#39; % &quot; &quot;.join(pkglist))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # generate provides line<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 provideLine =3D &#39;PROVIDES+=3D&quot; \\\n&#=
39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in sorted(self.packages):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 provideLine +=3D &quot;=C2=A0 %s=
 \\\n&quot; % name<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 provideLine +=3D &#39;&quot;&#39;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( provideLine )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &quot;&quot; )<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # generate package line<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 packageLine =3D &#39;PACKAGES=3D&quot; \\\n&#3=
9;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 packageLine +=3D &#39;=C2=A0 ${PN}-dbg \\\n&#3=
9;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in sorted(self.packages):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name.startswith(&quot;${PN}-<=
wbr>distutils&quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name =3D=3D &qu=
ot;${PN}-distutils&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pack=
ageLine +=3D &quot;=C2=A0 %s-staticdev %s \\\n&quot; % (name, name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif name !=3D &#39;${PN}-dbg&#3=
9;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 packageLine +=3D &=
quot;=C2=A0 %s \\\n&quot; % name<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 packageLine +=3D &#39;=C2=A0 ${PN}-modules\\\n=
&quot;&#39;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( packageLine )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &quot;&quot; )<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # generate package variables<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for name, data in sorted(self.packages.items()=
):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc, deps, files =3D data<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # write out the description, rev=
ision and dependencies<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &#39;SUMMARY_%s=3D&quo=
t;%s&quot;&#39; % ( name, desc ) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &#39;RDEPENDS_%s=3D&qu=
ot;%s&quot;&#39; % ( name, deps ) )<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D &#39;FILES_%s=3D&quot; =
\\\n&#39; % name<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # check which directories to mak=
e in the temporary directory<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirset =3D {} # if python had a =
set-datatype this would be sufficient. for now, we&#39;re using a dict inst=
ead.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for target in files:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dirset[os.path.dir=
name( target )] =3D True<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # generate which files to copy f=
or the target (-dfR because whole directories are also allowed)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for target in files:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line +=3D &quot;=
=C2=A0 =C2=A0 %s \\\n&quot; % target<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line +=3D &#39;&quot;&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( line )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &quot;&quot; )<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &#39;SUMMARY_${PN}-modules=3D&quot;A=
ll Python modules&quot;&#39; )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D &#39;RDEPENDS_${PN}-modules=3D&quot; =
\\\n&#39;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for name, data in sorted(self.packages.items()=
):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name not in [&#39;${PN}-dev&#=
39;, &#39;${PN}-distutils-staticdev&#39;] and name not in self.excluded_pkg=
s:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line +=3D &quot;=
=C2=A0 %s \\\n&quot; % name<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 line +=3D &#39;&quot;&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( line )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &#39;ALLOW_EMPTY_${PN}-modules =3D &=
quot;1&quot;&#39; )<br>
-<br>
-=C2=A0 =C2=A0 def doEpilog( self ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &quot;&quot;&quot;&quot;&quot;&quot;=
 )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.out( &quot;&quot; )<br>
-<br>
-=C2=A0 =C2=A0 def make( self ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.doProlog()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.doBody()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.doEpilog()<br>
-<br>
-if __name__ =3D=3D &quot;__main__&quot;:<br>
-=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser( description=3D&#39;gener=
ate python manifest&#39; )<br>
-=C2=A0 =C2=A0 parser.add_argument( &#39;-n&#39;, &#39;--native&#39;, help=
=3D&#39;generate manifest for native python&#39;, action=3D&#39;store_true&=
#39; )<br>
-=C2=A0 =C2=A0 parser.add_argument( &#39;outfile&#39;, metavar=3D&#39;OUTPU=
T_FILE&#39;, nargs=3D&#39;?&#39;, default=3D&#39;&#39;, help=3D&#39;Output =
file (defaults to stdout)&#39; )<br>
-=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
-<br>
-=C2=A0 =C2=A0 if args.outfile:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.unlink( args.outfile )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exc_clear()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D open( args.outfile, &quot;w&quot; =
)<br>
-=C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D sys.stdout<br>
-<br>
-=C2=A0 =C2=A0 m =3D MakefileMaker( outfile, args.native )<br>
-<br>
-=C2=A0 =C2=A0 # Add packages here. Only specify dlopen-style library depen=
dencies here, no ldd-style dependencies!<br>
-=C2=A0 =C2=A0 # Parameters: revision, name, description, dependencies, fil=
enames<br>
-=C2=A0 =C2=A0 #<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-core&quot;, &quot;Python interpret=
er and core modules&quot;, &quot;${PN}-lang ${PN}-re&quot;,<br>
-=C2=A0 =C2=A0 &quot;__future__.* _abcoll.* abc.* ast.* copy.* copy_reg.* C=
onfigParser.* &quot; +<br>
-=C2=A0 =C2=A0 &quot;genericpath.* getopt.* linecache.* new.* &quot; +<br>
-=C2=A0 =C2=A0 &quot;os.* posixpath.* struct.* &quot; +<br>
-=C2=A0 =C2=A0 &quot;warnings.* site.* stat.* &quot; +<br>
-=C2=A0 =C2=A0 &quot;UserDict.* UserList.* UserString.* &quot; +<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/binascii.so lib-dynload/_struct.so lib-dyn=
load/time.so &quot; +<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/xreadlines.so types.* platform.* ${bindir}=
/python* &quot;=C2=A0 +<br>
-=C2=A0 =C2=A0 &quot;_weakrefset.* sysconfig.* _sysconfigdata.* &quot; +<br=
>
-=C2=A0 =C2=A0 &quot;${includedir}/python${PYTHON_<wbr>MAJMIN}/pyconfig*.h =
&quot; +<br>
-=C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_<wbr>MAJMIN}/sitecustomize.py=
 &quot;)<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-dev&quot;, &quot;Python developmen=
t package&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;${includedir} &quot; +<br>
-=C2=A0 =C2=A0 &quot;${libdir}/lib*${SOLIBSDEV} &quot; +<br>
-=C2=A0 =C2=A0 &quot;${libdir}/*.la &quot; +<br>
-=C2=A0 =C2=A0 &quot;${libdir}/*.a &quot; +<br>
-=C2=A0 =C2=A0 &quot;${libdir}/*.o &quot; +<br>
-=C2=A0 =C2=A0 &quot;${libdir}/pkgconfig &quot; +<br>
-=C2=A0 =C2=A0 &quot;${base_libdir}/*.a &quot; +<br>
-=C2=A0 =C2=A0 &quot;${base_libdir}/*.o &quot; +<br>
-=C2=A0 =C2=A0 &quot;${datadir}/aclocal &quot; +<br>
-=C2=A0 =C2=A0 &quot;${datadir}/pkgconfig &quot; +<br>
-=C2=A0 =C2=A0 &quot;config/Makefile &quot;)<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-2to3&quot;, &quot;Python automated=
 Python 2 to 3 code translator&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;${bindir}/2to3 lib2to3&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-idle&quot;, &quot;Python Integrate=
d Development Environment&quot;, &quot;${PN}-core ${PN}-tkinter&quot;,<br>
-=C2=A0 =C2=A0 &quot;${bindir}/idle idlelib&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-pydoc&quot;, &quot;Python interact=
ive help support&quot;, &quot;${PN}-core ${PN}-lang ${PN}-stringold ${PN}-r=
e&quot;,<br>
-=C2=A0 =C2=A0 &quot;${bindir}/pydoc pydoc.* pydoc_data&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-smtpd&quot;, &quot;Python Simple M=
ail Transport Daemon&quot;, &quot;${PN}-core ${PN}-netserver ${PN}-email ${=
PN}-mime&quot;,<br>
-=C2=A0 =C2=A0 &quot;${bindir}/smtpd.* smtpd.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-audio&quot;, &quot;Python Audio Ha=
ndling&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.so lib=
-dynload/audioop.so audiodev.* sunaudio.* sunau.* toaiff.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-bsddb&quot;, &quot;Python bindings=
 for the Berkeley Database&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;bsddb lib-dynload/_bsddb.so&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-codecs&quot;, &quot;Python codecs,=
 encodings &amp; i18n support&quot;, &quot;${PN}-core ${PN}-lang&quot;,<br>
-=C2=A0 =C2=A0 &quot;codecs.* encodings gettext.* locale.* lib-dynload/_loc=
ale.so lib-dynload/_codecs* lib-dynload/_multibytecodec.so lib-dynload/unic=
odedata.so stringprep.* xdrlib.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-compile&quot;, &quot;Python byteco=
de compilation support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;py_compile.* compileall.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-compiler&quot;, &quot;Python compi=
ler support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;compiler&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-compression&quot;, &quot;Python hi=
gh-level compression support&quot;, &quot;${PN}-core ${PN}-zlib&quot;,<br>
-=C2=A0 =C2=A0 &quot;gzip.* zipfile.* tarfile.* lib-dynload/bz2.so&quot; )<=
br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-crypt&quot;, &quot;Python basic cr=
yptographic and hashing support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;hashlib.* md5.* sha.* lib-dynload/crypt.so lib-dynload=
/_hashlib.so lib-dynload/_sha256.so lib-dynload/_sha512.so&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-textutils&quot;, &quot;Python opti=
on parsing, text wrapping and CSV support&quot;, &quot;${PN}-core ${PN}-io =
${PN}-re ${PN}-stringold&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/_csv.so csv.* optparse.* textwrap.*&quot; =
)<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-curses&quot;, &quot;Python curses =
support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;curses lib-dynload/_curses.so lib-dynload/_curses_pane=
l.so&quot; ) # directory + low level module<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-ctypes&quot;, &quot;Python C types=
 support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;ctypes lib-dynload/_ctypes.so lib-dynload/_ctypes_test=
.so&quot; ) # directory + low level module<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-datetime&quot;, &quot;Python calen=
dar and time support&quot;, &quot;${PN}-core ${PN}-codecs&quot;,<br>
-=C2=A0 =C2=A0 &quot;_strptime.* calendar.* lib-dynload/datetime.so&quot; )=
<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-db&quot;, &quot;Python file-based =
database support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;anydbm.* dumbdbm.* whichdb.* &quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-debugger&quot;, &quot;Python debug=
ger&quot;, &quot;${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${=
PN}-shell ${PN}-pprint&quot;,<br>
-=C2=A0 =C2=A0 &quot;bdb.* pdb.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-difflib&quot;, &quot;Python helper=
s for computing deltas between objects&quot;, &quot;${PN}-lang ${PN}-re&quo=
t;,<br>
-=C2=A0 =C2=A0 &quot;difflib.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-distutils-staticdev&quot;, &quot;P=
ython distribution utilities (static libraries)&quot;, &quot;${PN}-distutil=
s&quot;,<br>
-=C2=A0 =C2=A0 &quot;config/lib*.a&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-distutils&quot;, &quot;Python Dist=
ribution Utilities&quot;, &quot;${PN}-core ${PN}-email&quot;,<br>
-=C2=A0 =C2=A0 &quot;config distutils&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-doctest&quot;, &quot;Python framew=
ork for running examples in docstrings&quot;, &quot;${PN}-core ${PN}-lang $=
{PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib&quot;,<br>
-=C2=A0 =C2=A0 &quot;doctest.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-email&quot;, &quot;Python email su=
pport&quot;, &quot;${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN=
}-image ${PN}-netclient&quot;,<br>
-=C2=A0 =C2=A0 &quot;imaplib.* email&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-fcntl&quot;, &quot;Python&#39;s fc=
ntl interface&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/fcntl.so&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-hotshot&quot;, &quot;Python hotsho=
t performance profiler&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;hotshot lib-dynload/_hotshot.so&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-html&quot;, &quot;Python HTML proc=
essing support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;formatter.* htmlentitydefs.* htmllib.* markupbase.* sg=
mllib.* HTMLParser.* &quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-importlib&quot;, &quot;Python impo=
rt implementation library&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;importlib&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-gdbm&quot;, &quot;Python GNU datab=
ase support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/gdbm.so&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-image&quot;, &quot;Python graphica=
l image handling&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload=
/rgbimg.so&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-io&quot;, &quot;Python low-level I=
/O&quot;, &quot;${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient ${PN}=
-contextlib&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/_socket.so lib-dynload/_io.so lib-dynload/=
_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.=
so &quot; +<br>
-=C2=A0 =C2=A0 &quot;pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyi=
o.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-json&quot;, &quot;Python JSON supp=
ort&quot;, &quot;${PN}-core ${PN}-math ${PN}-re ${PN}-codecs&quot;,<br>
-=C2=A0 =C2=A0 &quot;json lib-dynload/_json.so&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-lang&quot;, &quot;Python low-level=
 language support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/_bisect.so lib-dynload/_collections.so lib=
-dynload/_heapq.so lib-dynload/_weakref.so lib-dynload/_functools.so &quot;=
 +<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/array.so lib-dynload/itertools.so lib-dynl=
oad/operator.so lib-dynload/parser.so &quot; +<br>
-=C2=A0 =C2=A0 &quot;atexit.* bisect.* code.* codeop.* collections.* dis.* =
functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* &q=
uot; +<br>
-=C2=A0 =C2=A0 &quot;tokenize.* traceback.* weakref.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-logging&quot;, &quot;Python loggin=
g support&quot;, &quot;${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-st=
ringold&quot;,<br>
-=C2=A0 =C2=A0 &quot;logging&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-mailbox&quot;, &quot;Python mailbo=
x format support&quot;, &quot;${PN}-core ${PN}-mime&quot;,<br>
-=C2=A0 =C2=A0 &quot;mailbox.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-math&quot;, &quot;Python math supp=
ort&quot;, &quot;${PN}-core ${PN}-crypt&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/cmath.so lib-dynload/math.so lib-dynload/_=
random.so random.* sets.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-mime&quot;, &quot;Python MIME hand=
ling APIs&quot;, &quot;${PN}-core ${PN}-io&quot;,<br>
-=C2=A0 =C2=A0 &quot;mimetools.* uu.* quopri.* rfc822.* MimeWriter.*&quot; =
)<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-mmap&quot;, &quot;Python memory-ma=
pped file support&quot;, &quot;${PN}-core ${PN}-io&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/mmap.so &quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-multiprocessing&quot;, &quot;Pytho=
n multiprocessing support&quot;, &quot;${PN}-core ${PN}-io ${PN}-lang ${PN}=
-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/_multiprocessing.<wbr>so multiprocessing&q=
uot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-netclient&quot;, &quot;Python Inte=
rnet Protocol clients&quot;, &quot;${PN}-core ${PN}-crypt ${PN}-datetime ${=
PN}-io ${PN}-lang ${PN}-logging ${PN}-mime&quot;,<br>
-=C2=A0 =C2=A0 &quot;*Cookie*.* &quot; +<br>
-=C2=A0 =C2=A0 &quot;base64.* cookielib.* ftplib.* gopherlib.* hmac.* httpl=
ib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.=
* urlparse.* uuid.* rfc822.* mimetools.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-netserver&quot;, &quot;Python Inte=
rnet Protocol servers&quot;, &quot;${PN}-core ${PN}-netclient ${PN}-shell $=
{PN}-threading&quot;,<br>
-=C2=A0 =C2=A0 &quot;cgi.* *HTTPServer.* SocketServer.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-numbers&quot;, &quot;Python number=
 APIs&quot;, &quot;${PN}-core ${PN}-lang ${PN}-re&quot;,<br>
-=C2=A0 =C2=A0 &quot;decimal.* fractions.* numbers.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-pickle&quot;, &quot;Python seriali=
sation/persistence support&quot;, &quot;${PN}-core ${PN}-codecs ${PN}-io ${=
PN}-re&quot;,<br>
-=C2=A0 =C2=A0 &quot;pickle.* shelve.* lib-dynload/cPickle.so pickletools.*=
&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-pkgutil&quot;, &quot;Python packag=
e extension utility support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;pkgutil.*&quot;)<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-plistlib&quot;, &quot;Generate and=
 parse Mac OS X .plist files&quot;, &quot;${PN}-core ${PN}-datetime ${PN}-i=
o&quot;,<br>
-=C2=A0 =C2=A0 &quot;plistlib.*&quot;)<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-pprint&quot;, &quot;Python pretty-=
print support&quot;, &quot;${PN}-core ${PN}-io&quot;,<br>
-=C2=A0 =C2=A0 &quot;pprint.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-profile&quot;, &quot;Python basic =
performance profiling support&quot;, &quot;${PN}-core ${PN}-textutils&quot;=
,<br>
-=C2=A0 =C2=A0 &quot;profile.* pstats.* cProfile.* lib-dynload/_lsprof.so&q=
uot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-re&quot;, &quot;Python Regular Exp=
ression APIs&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;re.* sre.* sre_compile.* sre_constants* sre_parse.*&qu=
ot; ) # _sre is builtin<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-readline&quot;, &quot;Python readl=
ine support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/readline.so rlcompleter.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-resource&quot;, &quot;Python resou=
rce control interface&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/resource.so&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-shell&quot;, &quot;Python shell-li=
ke functionality&quot;, &quot;${PN}-core ${PN}-re&quot;,<br>
-=C2=A0 =C2=A0 &quot;cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* =
shlex.* shutil.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-robotparser&quot;, &quot;Python ro=
bots.txt parser&quot;, &quot;${PN}-core ${PN}-netclient&quot;,<br>
-=C2=A0 =C2=A0 &quot;robotparser.*&quot;)<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-runpy&quot;, &quot;Python script f=
or locating/executing scripts in module namespace&quot;, &quot;${PN}-core $=
{PN}-pkgutil&quot;,<br>
-=C2=A0 =C2=A0 &quot;runpy.*&quot;)<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-subprocess&quot;, &quot;Python sub=
process support&quot;, &quot;${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}=
-pickle&quot;,<br>
-=C2=A0 =C2=A0 &quot;subprocess.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-sqlite3&quot;, &quot;Python Sqlite=
3 database support&quot;, &quot;${PN}-core ${PN}-datetime ${PN}-lang ${PN}-=
crypt ${PN}-io ${PN}-threading ${PN}-zlib&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/_sqlite3.so sqlite3/dbapi2.* sqlite3/__ini=
t__.* sqlite3/dump.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-sqlite3-tests&quot;, &quot;Python =
Sqlite3 database support tests&quot;, &quot;${PN}-core ${PN}-sqlite3&quot;,=
<br>
-=C2=A0 =C2=A0 &quot;sqlite3/test&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-stringold&quot;, &quot;Python stri=
ng APIs [deprecated]&quot;, &quot;${PN}-core ${PN}-re&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/strop.so string.* stringold.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-syslog&quot;, &quot;Python syslog =
interface&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/syslog.so&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-terminal&quot;, &quot;Python termi=
nal controlling support&quot;, &quot;${PN}-core ${PN}-io&quot;,<br>
-=C2=A0 =C2=A0 &quot;pty.* tty.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-tests&quot;, &quot;Python tests&qu=
ot;, &quot;${PN}-core ${PN}-modules&quot;,<br>
-=C2=A0 =C2=A0 &quot;test&quot;, True ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-threading&quot;, &quot;Python thre=
ading &amp; synchronization support&quot;, &quot;${PN}-core ${PN}-lang&quot=
;,<br>
-=C2=A0 =C2=A0 &quot;_threading_local.* dummy_thread.* dummy_threading.* mu=
tex.* threading.* Queue.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-tkinter&quot;, &quot;Python Tcl/Tk=
 bindings&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/_tkinter.so lib-tk&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-unittest&quot;, &quot;Python unit =
testing framework&quot;, &quot;${PN}-core ${PN}-stringold ${PN}-lang ${PN}-=
io ${PN}-difflib ${PN}-pprint ${PN}-shell&quot;,<br>
-=C2=A0 =C2=A0 &quot;unittest/&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-unixadmin&quot;, &quot;Python Unix=
 administration support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/nis.so lib-dynload/grp.so lib-dynload/pwd.=
so getpass.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-xml&quot;, &quot;Python basic XML =
support&quot;, &quot;${PN}-core ${PN}-re&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/_elementtree.so lib-dynload/pyexpat.so xml=
 xmllib.*&quot; ) # package<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-xmlrpc&quot;, &quot;Python XML-RPC=
 support&quot;, &quot;${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang&quot;=
,<br>
-=C2=A0 =C2=A0 &quot;xmlrpclib.* SimpleXMLRPCServer.* DocXMLRPCServer.*&quo=
t; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-zlib&quot;, &quot;Python zlib comp=
ression support&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;lib-dynload/zlib.so&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-mailbox&quot;, &quot;Python mailbo=
x format support&quot;, &quot;${PN}-core ${PN}-mime&quot;,<br>
-=C2=A0 =C2=A0 &quot;mailbox.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-argparse&quot;, &quot;Python comma=
nd line argument parser&quot;, &quot;${PN}-core ${PN}-codecs ${PN}-textutil=
s&quot;,<br>
-=C2=A0 =C2=A0 &quot;argparse.*&quot; )<br>
-<br>
-=C2=A0 =C2=A0 m.addPackage( &quot;${PN}-contextlib&quot;, &quot;Python uti=
lities for with-statement&quot; +<br>
-=C2=A0 =C2=A0 &quot;contexts.&quot;, &quot;${PN}-core&quot;,<br>
-=C2=A0 =C2=A0 &quot;${libdir}/python${PYTHON_<wbr>MAJMIN}/contextlib.*&quo=
t; )<br>
-<br>
-=C2=A0 =C2=A0 m.make()<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>

--089e082b0df0b5714a0563458b5c--
