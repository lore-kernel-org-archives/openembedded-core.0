Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31641.1794845360735889736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ukGFRoGO;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 148DB1A169D
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D33B46023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17FBB11BC118D;
	Mon, 16 Nov 2026 17:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845358; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8qEAWc2cWQzSh223RxAqSrZFaQW5qUKJl3lWFC82Bxs=;
	b=ukGFRoGO4vbvbD9tTi+Iwq/92rRS9zeclbJ+KE7NlZ/Zst0OaGqPSxUx22nFTVjYsniqEx
	Xy5bGn2LEA8Wjvczaas8q4HcFaKm5g8PY91xqWvOP7KMuHgM7YiamqIueXRNxnPmyyRw8R
	oWo3vaELNwhqJQoNPSAS7gxsojdbCUPhTM54+fuFX1XLuuNxBfj3ZVguVjNWO/3xPZ/Sd9
	LvuReuZqlDAMnNdvObTaDgLVAENZRQTGCAwOnUtV2C+E73sMlVUrTKhB0B6OyFXHqhYSbK
	TIRVtBhKWYieInWfljFm/KDeaZTNOv23cQ0tI/oQTgh9lby23UBNUGxLDIQMgw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:10 +0100
Subject: [PATCH 12/13] lib/oe/utils: improve docstrings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-12-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16208;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RraaA46hyYsoYJKNW3lBdXrM1Q4O1h9BUXHyYDZQ8yA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqgEJ61S+rF3Wf+ZyFYvmaPZA8eFCQ9AuPIL
 JfhIhJ+SY+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqoAAKCRDRgEFAKaOo
 NugBD/941/NXwk2a3tlQ+1FM19gLA6zlAdgu/kH01B9Mz/XFtheidkueDA6sdmHZCxLshUnep7c
 R275QCgvS5x9XdJ8H9ogPR+Ai8BDxFnIJPYuB6csCEKPgug1Wb5UUXoSQNGQKBWrPVO1bE8C84Y
 C+mFgBrErQt7Bxc3quho8/YacDtBMegzkZVbKU3sMfO0cUVyLO7BHXFoMFiPgRBUeTOqoSVhwZ1
 7s1hCmM/jLYTfaN1ZEYexmK1X09rrTySE1LkrdWz2mii4S5mOR/fsQ/KpfQSPxWr0spHNkBHhXO
 wNTJgd6ou5oid0nLJoeZQPVXSdSQKNWRm61VX+ohgxn3AWcmCblqTfcTm9ZqhAt/M49bRn1nS4H
 oixNgsk3e0tcVFxH92WlXd3xfCeP1Fm/wu+kc2Imo7HjRQ/fqcMJCUxq/IK0Ywv4DkXXu18/+xT
 rPyx3rYNElaz1B/b4541IdzShZ+kWrQMbgr7lKNU/zSd4/LJNukuWTLfmqwMZZOQl1iNOB8JtTZ
 RH71liyCfqUp711wQcwWaf4rcwZgPkk+XDAorq2o/OK08FnohWAh2kB1OPvMmYU0pSbdPmRTMkg
 lyPRT5gPC9IF+hMhRgetdKnkEw3T/cRt5rf+cYZTZ95wWPwYGMwkIFHylcne0MKKBi0H/yR21Qy
 TV9QP8JamOo0eRQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250362

Improve docstrings by detailing the parameters and return values of
functions in this module, or adding the docstring entirely when it
wasn't present and it made sense to document this function.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/utils.py | 235 +++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 190 insertions(+), 45 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a17938803e..caa4dd4301 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -13,6 +13,11 @@ import bb.parse
 from bb import multiprocessing
 
 def read_file(filename):
+    """
+    Read a file under the path ``filename`` and return the content of the
+    file. In case of :py:class:`IOError`, return an empty string. In case
+    of other exceptions, return ``None``.
+    """
     try:
         f = open( filename, "r" )
     except IOError as reason:
@@ -24,18 +29,32 @@ def read_file(filename):
     return None
 
 def ifelse(condition, iftrue = True, iffalse = False):
+    """
+    If ``condition`` is ``True``, return the value of ``iftrue``, else
+    return the value of ``iffalse``.
+    """
     if condition:
         return iftrue
     else:
         return iffalse
 
 def conditional(variable, checkvalue, truevalue, falsevalue, d):
+    """
+    If the value of ``variable`` (obtained using ``d``, the :term:`datastore`)
+    equals the value of ``checkvalue``, return the value of ``truevalue``, else
+    return the value of ``falsevalue``.
+    """
     if d.getVar(variable) == checkvalue:
         return truevalue
     else:
         return falsevalue
 
 def vartrue(var, iftrue, iffalse, d):
+    """
+    Check if the value of ``var`` (obtained using ``d``, the :term:`datastore`)
+    passed to :py:func:`oe.types.boolean` returns ``True`` and return the value
+    of ``iftrue`` if it does, otherwise return the value of ``iffalse``.
+    """
     import oe.types
     if oe.types.boolean(d.getVar(var)):
         return iftrue
@@ -43,12 +62,25 @@ def vartrue(var, iftrue, iffalse, d):
         return iffalse
 
 def less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
+    """
+    Check if the value of ``variable`` (obtained using ``d``, the
+    :term:`datastore`) is inferior or equal to ``checkvalue``, and return the
+    value of ``truevalue`` if it is, otherwise return the value of
+    ``falsevalue``. Both ``checkvalue`` and the value of ``variable`` are
+    converted to :py:type:`float` numbers before comparison.
+    """
     if float(d.getVar(variable)) <= float(checkvalue):
         return truevalue
     else:
         return falsevalue
 
 def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
+    """
+    Check if the value of ``variable`` (obtained using ``d``, the
+    :term:`datastore`) is inferior or equal to ``checkvalue`` using
+    :py:func:`oe.utils.vercmp_string`, and return the value of
+    ``truevalue`` if it is, otherwise return the value of ``falsevalue``.
+    """
     result = bb.utils.vercmp_string(d.getVar(variable), checkvalue)
     if result <= 0:
         return truevalue
@@ -56,6 +88,13 @@ def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
         return falsevalue
 
 def both_contain(variable1, variable2, checkvalue, d):
+    """
+    Check whether the value of the variables ``variable1`` and ``variable2``
+    (obtained using ``d``, the :term:`datastore`) both contain all the values in
+    ``checkvalue``. ``variable1``, ``variable2`` and ``checkvalue`` are
+    treated as space-separated lists (``checkvalue`` can be a space-separated
+    string, or directly a Python list).
+    """
     val1 = d.getVar(variable1)
     val2 = d.getVar(variable2)
     val1 = set(val1.split())
@@ -71,14 +110,21 @@ def both_contain(variable1, variable2, checkvalue, d):
 
 def set_intersect(variable1, variable2, d):
     """
-    Expand both variables, interpret them as lists of strings, and return the
-    intersection as a flattened string.
+    Take the values of ``variable1`` and ``variable2`` (obtained using ``d``,
+    the :term:`datastore`), convert them from space-separated lists to Python
+    sets, and return the intersection as a space-separated list.
+
+    For example::
+
+       FOO = "a b c"
+       BAR = "b c d"
+
+    Then:
 
-    For example:
-    s1 = "a b c"
-    s2 = "b c d"
-    s3 = set_intersect(s1, s2)
-    => s3 = "b c"
+    .. code-block:: python
+
+       >>> oe.utils.set_intersect("FOO", "BAR", d)
+       "b c"
     """
     val1 = set(d.getVar(variable1).split())
     val2 = set(d.getVar(variable2).split())
@@ -86,21 +132,37 @@ def set_intersect(variable1, variable2, d):
 
 def set_difference(variable1, variable2, d):
     """
-    Expand both variables, interpret them as lists of strings, and return the
-    difference as a flattened string.
+    Take the values of ``variable1`` and ``variable2`` (obtained using ``d``,
+    the :term:`datastore`), convert them from space-separated lists to Python
+    sets, and return a space-separated list of the elements in ``variable1``
+    that are not in ``variable2``.
+
+    For example::
+
+       FOO = "a b c"
+       BAR = "b c d"
+
+    Then:
+
+    .. code-block:: python
+
+       >>> oe.utils.set_difference("FOO", "BAR", d)
+       "a"
+
+    If "*" is present in the value of ``variable2`` (not part of a larger 
+    identifier), this is interpreted as "remove all entries":
+
+    For example::
+
+       FOO = "a b c"
+       BAR = "*"
 
-    For example:
-    s1 = "a b c"
-    s2 = "b c d"
-    s3 = set_difference(s1, s2)
-    => s3 = "a"
+    Then:
 
-    If '*' is present as a separate token (not part of a larger identifier) in
-    the second operand, this is interpreted as "remove all entries":
-    s1 = "a b c"
-    s2 = "*"
-    s3 = set_difference(s1, s2)
-    => s3 = ""
+    .. code-block:: python
+
+       >>> oe.utils.set_difference("FOO", "BAR", d)
+       ""
     """
     val1 = d.getVar(variable1)
     if not val1:
@@ -120,8 +182,12 @@ def set_difference(variable1, variable2, d):
     return " ".join(sorted(val1 - val2))
 
 def prune_suffix(var, suffixes, d):
-    # See if var ends with any of the suffixes listed and
-    # remove it if found
+    """
+    See if the variable ``var`` ends with any of the suffixes listed and
+    remove it if found.
+
+    Also remove the :term:`MLPREFIX` prefix if present in ``var``.
+    """
     for suffix in suffixes:
         if suffix and var.endswith(suffix):
             var = var[:-len(suffix)]
@@ -133,19 +199,41 @@ def prune_suffix(var, suffixes, d):
     return var
 
 def str_filter(f, str):
+    """
+    Take ``str``, as a space-separated list of values, and return a
+    space-separated list of all the values matching the regular expression ``f``
+    using :py:func:`re.match`.
+    """
     from re import match
     return " ".join([x for x in str.split() if match(f, x, 0)])
 
 def str_filter_out(f, str):
+    """
+    Take ``str``, as a space-separated list of values, and return a
+    space-separated list of all the values *not* matching the regular expression ``f``
+    using :py:func:`re.match`.
+    """
     from re import match
     return " ".join([x for x in str.split() if not match(f, x, 0)])
 
 def build_depends_string(depends, task):
-    """Append a taskname to a string of dependencies as used by the [depends] flag"""
+    """
+    Append a taskname ``task`` to a space-separated list of dependencies stored in
+    ``depends`` as used by the ``[depends]`` variable flag:
+
+    .. code-block:: python
+
+       >>> oe.utils.build_depends_string("dep1 dep2 dep3", "task")
+       "dep1:task dep2:task dep3:task"
+    """
     return " ".join(dep + ":" + task for dep in depends.split())
 
 def inherits(d, *classes):
-    """Return True if the metadata inherits any of the specified classes"""
+    """
+    Return ``True`` if the metadata (obtained from ``d``, the
+    :term:`datastore`) inherits *any* of the specified classes in
+    ``*classes`` (internally uses :py:func:`bb.data.inherits_class`).
+    """
     return any(bb.data.inherits_class(cls, d) for cls in classes)
 
 def filter_default_features(varname, d):
@@ -174,10 +262,12 @@ def set_class_filter(var, features_var, filter_var, d):
 def parallel_make_value(pm):
     """
     Return the integer value for the number of parallel threads to use when
-    building, scraped out of given string. If no parallelization option is
-    found, returns empty string
+    building, scraped out of given string ``pm``. If no parallelization option is
+    found, return an empty string.
+
+    For example if ``pm`` is "-j 10", this will return 10 as an integer.
 
-    e.g. if string is "-j 10", this will return 10 as an integer.
+    This function is used by :py:func:`oe.utils.parallel_make`.
     """
     # look for '-j' and throw other options (e.g. '-l') away
     while pm:
@@ -196,10 +286,13 @@ def parallel_make_value(pm):
 def parallel_make(d, makeinst=False):
     """
     Return the integer value for the number of parallel threads to use when
-    building, scraped out of PARALLEL_MAKE. If no parallelization option is
-    found, returns empty string
+    building, scraped out of :term:`PARALLEL_MAKE`. If no parallelization option is
+    found, return an empty string.
 
-    e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an integer.
+    For example if ``PARALLEL_MAKE = "-j 10"``, this will return 10 as an integer.
+
+    The ``makeinst`` boolean can be set to ``True`` if the value should be
+    obtained from :term:`PARALLEL_MAKEINST` instead.
     """
     if makeinst:
         pm = (d.getVar('PARALLEL_MAKEINST') or '').split()
@@ -210,15 +303,19 @@ def parallel_make(d, makeinst=False):
 def parallel_make_argument(d, fmt, limit=None, makeinst=False):
     """
     Helper utility to construct a parallel make argument from the number of
-    parallel threads specified in PARALLEL_MAKE.
+    parallel threads specified in :term:`PARALLEL_MAKE`.
 
-    Returns the input format string `fmt` where a single '%d' will be expanded
-    with the number of parallel threads to use. If `limit` is specified, the
+    Return the input format string ``fmt`` where a single ``%d`` will be expanded
+    with the number of parallel threads to use. If ``limit`` is specified, the
     number of parallel threads will be no larger than it. If no parallelization
-    option is found in PARALLEL_MAKE, returns an empty string
+    option is found in :term:`PARALLEL_MAKE`, return an empty string.
+
+    For example if ``PARALLEL_MAKE = "-j 10"`` then:
 
-    e.g. if PARALLEL_MAKE = "-j 10", parallel_make_argument(d, "-n %d") will return
-    "-n 10"
+    .. code-block:: python
+
+       >>> parallel_make_argument(d, "-n %d")
+       "-n 10"
     """
     v = parallel_make(d, makeinst)
     if v:
@@ -229,8 +326,9 @@ def parallel_make_argument(d, fmt, limit=None, makeinst=False):
 
 def packages_filter_out_system(d):
     """
-    Return a list of packages from PACKAGES with the "system" packages such as
-    PN-dbg PN-doc PN-locale-eb-gb removed.
+    Return a list of packages from :term:`PACKAGES` (obtained using ``d``, the
+    :term:`datastore`) with the "system" packages such as ``${PN}-dbg``, ``${PN}-doc``,
+    or ``${PN}-locale-en-gb`` removed.
     """
     pn = d.getVar('PN')
     pkgfilter = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev', '-src', '-lic')]
@@ -248,8 +346,13 @@ def getstatusoutput(cmd):
 
 def trim_version(version, num_parts=2):
     """
-    Return just the first <num_parts> of <version>, split by periods.  For
-    example, trim_version("1.2.3", 2) will return "1.2".
+    Return just the first ``num_parts`` parts of ``version``, split by periods
+    (``.``).  For example:
+
+    .. code-block:: python
+
+       >>> oe.utils.trim_version("1.2.3", 2)
+       "1.2"
     """
     if type(version) is not str:
         raise TypeError("Version should be a string")
@@ -276,6 +379,11 @@ def execute_pre_post_process(d, cmds):
 
 @bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def get_bb_number_threads(d):
+    """
+    Return the value of :term:`BB_NUMBER_THREADS` (using ``d``, the
+    :term:`datastore`). If undefined, return the value of
+    :py:func:`os.cpu_count` or 1 if the former returns ``None``.
+    """
     return int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
 
 def multiprocess_launch(target, items, d, extraargs=None):
@@ -362,6 +470,10 @@ def multiprocess_launch_mp(target, items, max_process, extraargs=None):
     return results
 
 def squashspaces(string):
+    """
+    Return the input ``string`` with every occurrence of two or more whitespace
+    replaced by only one whitespace.
+    """
     import re
     return re.sub(r"\s+", " ", string).strip()
 
@@ -466,13 +578,16 @@ def get_multilib_datastore(variant, d):
     return localdata
 
 def sh_quote(string):
+    """
+    Return a shell-escaped version of ``string`` using :py:func:`shlex.quote`.
+    """
     import shlex
     return shlex.quote(string)
 
 def directory_size(root, blocksize=4096):
     """
-    Calculate the size of the directory, taking into account hard links,
-    rounding up every size to multiples of the blocksize.
+    Calculate and return the size of the directory ``root``, taking into account
+    hard links, rounding up every size to multiples of ``blocksize``.
     """
     def roundup(size):
         """
@@ -500,8 +615,14 @@ def directory_size(root, blocksize=4096):
         total += roundup(getsize(root))
     return total
 
-# Update the mtime of a file, skip if permission/read-only issues
+
 def touch(filename):
+    """
+    Update the ``mtime`` of a file under the path ``filename``,
+    skip if permission/read-only issues.
+
+    No return value.
+    """
     try:
         os.utime(filename, None)
     except PermissionError:
@@ -572,12 +693,21 @@ def base_set_filespath(path, d):
     return ":".join(filespath)
 
 def check_app_exists(app, d):
+    """
+    Using :py:func:`bb.utils.which`, check if the program used by the command
+    stored in ``app`` exists.
+    """
     app = d.expand(app).split()[0].strip()
     path = d.getVar('PATH')
     return bool(bb.utils.which(path, app))
 
 def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
-    """Return a string of all ${var} in all multilib tune configuration"""
+    """
+    Return a space-separated list of ``var`` in all multilib tune configurations.
+    ``unique`` removes repetitions in the string. ``need_split`` should be set
+    if the input ``var`` is a ``delim``-separated list that should be split
+    (otherwise an iterable object can be passed with ``need_split=False``).
+    """
     values = []
     variants = (d.getVar("MULTILIB_VARIANTS") or "").split() + ['']
     for item in variants:
@@ -602,7 +732,22 @@ def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = '
     return " ".join(ret)
 
 def extend_variants(d, var, extend, delim=':'):
-    """Return a string of all bb class extend variants for the given extend"""
+    """
+    Return a space-separated string of all BitBake class extend variants
+    for the given ``extend``, extracted from the ``delim``-separated entries of
+    the value of ``var`` (obtained using ``d``, the :term:`datastore`).
+
+    For example, consider the following assignment::
+
+       MULTILIBS = "multilib:lib32 multilib:lib64"
+
+    Then:
+
+    .. code-block:: python
+
+       >>> oe.utils.extend_variants(d, "MULTILIBS", "multilib")
+       "lib32 lib64"
+    """
     variants = []
     whole = d.getVar(var) or ""
     for ext in whole.split():

-- 
2.56.0

