Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30997.1794845359175366255
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vOdDwV+s;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 883311A169F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C0D46023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65B7E11BC183B;
	Mon, 16 Nov 2026 17:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845356; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jsA2sGlT1Y5arjPXNvX/ATEa0+ks+/GOb75cYJZlWfI=;
	b=vOdDwV+st07x09iOrrzGl7VlMaHVei6rPlwW9rGKEH2ORj/P0n1sOA8Vb0xuVJw/Q9yuIz
	Hoj8OT/csfQ7Gh5N+Qt02djZuizWHxbrIHFvW3Qa/3L225yoewpgylHtPkaCAwIsW33mdU
	C7EsT5T8yXwvCc0fWisWQptkN6eBpoFNYmuE7DNvq6GL6FiwBNq5hmDnN5YlPkJ9IegEs+
	5VDJcSnnKEwVTKdW/zxhqh3kgmZHbJIvSHtmOHP3L8N6W9tXbRyNeAitfI6PvrUTPDecEA
	MBGThlTxPvoTmttz7GRcdrEDvZNncyn0yA7UPs/Yi06bNrCCoQrP0gDMBJu4FA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:08 +0100
Subject: [PATCH 10/13] lib/oe/path: improve docstrings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-10-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10208;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=OnkJrvIfB1HI3QOthLDmNOZbc+smthWPpwTdOfVo+KI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqf4Y7niR3lh52I9w8lrTiR5ZQ+UltCpuSD/
 X0wpe684NiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqnwAKCRDRgEFAKaOo
 NiMnD/4nXKaPX6xkrTYsg/BnqN/2Ps9UjoTaogq6zyfExOdtJgym0S/ndkt9qRphBcR09mNvbcy
 HPuZ38pc7xwUzDwH+8irsowbL01FLyrPj6dAw6twTWId9E6wxKMGRR3D9seZqtH+wnoJaiUoRbk
 QXpdRCiLSvXMVVtHf+f5/opjpNcOjx2LU5hUytXbTgwR09MrBK8eUCD64c8aS16++r0sAVmdc15
 oWk3J1dmGp9Im1/8EfkSx8c10485fA1LSEV21i2/yiugD0eB0CH/PbboPXI2YXUNhAsbDf3TCtU
 KsUEJ6ujapTlGfG0lmv+Rvbq8wYfA+DeggwGPRTAKRoQBr0e62lOFmvlZc21sG2E89Ltk+60WeL
 IF7pBUx/lWDiUNvEv/9XUkJhVOfsscEWk2XHSHuxFle2syQvsg9sHQ2CxevWLkgJPgXDXVstGvc
 CP3nKknjw9GVwwSdefAFqkCVDVpgPPBVh5NNrZDIzjenw4lpUb0ulIhBFizySGXDkC30aj8iYaC
 /i32BvsOkrc0Qe5Qw/dZYjvlvEbSK+5c+K6eeoJPaagz6fvMyouOUA56ood4vy+mwkrtRGk717W
 Dcb6X6BN96/bczJrAm4hRMfaLPmQ9/pbP6am+fy42Q6dAjhOONu1bikuhO/4t7GqMFT8O/BZlXi
 ZpAH2vhl0lKLPAQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250360

Improve docstrings by detailing the parameters and return values of
functions in this module. Give examples when possible to make the
understanding easier.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/path.py | 148 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 112 insertions(+), 36 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 366ab9720a..5122fcb08e 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -14,26 +14,54 @@ import os.path
 import bb.parse
 
 def join(*paths):
-    """Like os.path.join but doesn't treat absolute RHS specially"""
+    """
+    Like :py:func:`os.path.join` but do not treat absolute RHS specially.
+    Use :py:func:`os.path.normpath` after joining paths with slashes (``/``).
+
+    Take ``*paths`` which represent the paths to join and return the joined
+    paths as a string.
+    """
     return os.path.normpath("/".join(paths))
 
 def relative(src, dest):
-    """ Return a relative path from src to dest.
+    """
+    Return a relative path from ``src`` to ``dest``.
+
+    Examples:
+
+    .. code-block:: python
 
-    >>> relative("/usr/bin", "/tmp/foo/bar")
-    ../../tmp/foo/bar
+       >>> oe.path.relative("/usr/bin", "/tmp/foo/bar")
+       ../../tmp/foo/bar
 
-    >>> relative("/usr/bin", "/usr/lib")
-    ../lib
+    .. code-block:: python
 
-    >>> relative("/tmp", "/tmp/foo/bar")
-    foo/bar
+       >>> oe.path.relative("/usr/bin", "/usr/lib")
+       ../lib
+
+    .. code-block:: python
+
+       >>> oe.path.relative("/tmp", "/tmp/foo/bar")
+       foo/bar
     """
 
     return os.path.relpath(dest, src)
 
 def make_relative_symlink(path):
-    """ Convert an absolute symlink to a relative one """
+    """
+    Convert an absolute symbolic link ``path`` and convert it to a relative one.
+
+    No return value.
+
+    For example, if ``/path/to/dir/link`` points to ``/path/to/other/target``,
+    then:
+
+    .. code-block:: python
+
+       >>> oe.path.make_relative_symlink("/path/to/dir/link")
+
+    Converts the symlink to ``../other/file``.
+    """
     if not os.path.islink(path):
         return
     link = os.readlink(path)
@@ -61,10 +89,12 @@ def make_relative_symlink(path):
 
 def replace_absolute_symlinks(basedir):
     """
-    Walk basedir looking for absolute symlinks and replacing them with relative ones.
-    The absolute links are assumed to be relative to basedir
-    (compared to make_relative_symlink above which tries to compute common ancestors
-    using pattern matching instead)
+    Walk ``basedir`` looking for absolute symlinks and replacing them with relative ones.
+    The absolute links are assumed to be relative to ``basedir``.
+    (compared to :py:func:`oe.path.make_relative_symlink` which tries to compute
+    common ancestors using pattern matching instead).
+
+    No return value.
     """
     for walkroot, dirs, files in os.walk(basedir):
         for file in files + dirs:
@@ -82,7 +112,13 @@ def replace_absolute_symlinks(basedir):
 
 @bb.parse.vardepsexclude("TOPDIR")
 def format_display(path, d):
-    """ Prepare a path for display to the user. """
+    """
+    Prepare ``path`` for display to the user: the path is converted to be
+    relative to :term:`TOPDIR`, which is obtained thanks to ``d`` (the
+    :term:`datastore`).
+
+    Return the formatted path as a string.
+    """
     rel = relative(d.getVar("TOPDIR"), path)
     if len(rel) > len(path):
         return path
@@ -100,7 +136,13 @@ def copytree(src, dst):
     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 def copyhardlinktree(src, dst):
-    """Make a tree of hard links when possible, otherwise copy."""
+    """
+    Replicate the ``src`` directory into ``dst`` and replace files with
+    hardlinks when possible, otherwise copy them (some filesystems do not
+    support hardlinks).
+
+    No return value.
+    """
     bb.utils.mkdirhier(dst)
     if os.path.isdir(src) and not len(os.listdir(src)):
         return
@@ -141,7 +183,12 @@ def copyhardlinktree(src, dst):
         copytree(src, dst)
 
 def copyhardlink(src, dst):
-    """Make a hard link when possible, otherwise copy."""
+    """
+    Make a hard link of ``src`` into ``dst`` when possible, otherwise copy
+    (some filesystems do not support hardlinks).
+
+    No return value.
+    """
 
     try:
         os.link(src, dst)
@@ -150,12 +197,15 @@ def copyhardlink(src, dst):
 
 def remove(path, recurse=True):
     """
-    Equivalent to rm -f or rm -rf
+    Equivalent to ``rm -f`` or ``rm -rf`` (when ``recurse`` is ``True``).
+
     NOTE: be careful about passing paths that may contain filenames with
     wildcards in them (as opposed to passing an actual wildcarded path) -
-    since we use glob.glob() to expand the path. Filenames containing
+    since we use :py:func:`glob.glob` to expand the path. Filenames containing
     square brackets are particularly problematic since the they may not
     actually expand to match the original filename.
+
+    No return value.
     """
     for name in glob.glob(path):
         try:
@@ -167,7 +217,12 @@ def remove(path, recurse=True):
                 raise
 
 def symlink(source, destination, force=False):
-    """Create a symbolic link"""
+    """
+    Create a symbolic link ``destination`` pointing to ``source``.
+    Optionally force it with ``force=True``.
+
+    No return value.
+    """
     try:
         if force:
             # Remove the exact destination path. Do not route this through
@@ -191,8 +246,12 @@ def relsymlink(target, name, force=False):
     symlink(os.path.relpath(target, os.path.dirname(name)), name, force=force)
 
 def find(dir, **walkoptions):
-    """ Given a directory, recurses into that directory,
-    returning all files as absolute paths. """
+    """
+    Given a directory ``dir``, recurse into that directory,
+    ``yield``'ing all files as absolute paths.
+
+    No return value.
+    """
 
     for root, dirs, files in os.walk(dir, **walkoptions):
         for file in files:
@@ -251,12 +310,15 @@ def __realpath(file, root, loop_cnt, assume_dir):
     return (file, is_dir)
 
 def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False):
-    """ Returns the canonical path of 'file' with assuming a
-    toplevel 'root' directory. When 'use_physdir' is set, all
-    preceding path components of 'file' will be resolved first;
+    """
+    Return the canonical path of ``file`` with assuming a
+    toplevel ``root`` directory. When ``use_physdir`` is set, all
+    preceding path components of ``file`` will be resolved first;
     this flag should be set unless it is guaranteed that there is
-    no symlink in the path. When 'assume_dir' is not set, missing
-    path components will raise an ENOENT error"""
+    no symlink in the path. When ``assume_dir`` is not set, missing
+    path components will raise an ``ENOENT`` error. Limit the recursion to
+    ``loop_cnt`` when recursively resolving paths.
+    """
 
     root = os.path.normpath(root)
     file = os.path.normpath(file)
@@ -288,10 +350,11 @@ def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False)
 
 def is_path_parent(possible_parent, *paths):
     """
-    Return True if a path is the parent of another, False otherwise.
+    Return ``True`` if one or more paths (passed with ``*paths``) have
+    ``possible_parent`` as their parent, ``False`` otherwise.
     Multiple paths to test can be specified in which case all
     specified test paths must be under the parent in order to
-    return True.
+    return ``True``.
     """
     def abs_path_trailing(pth):
         pth_abs = os.path.abspath(pth)
@@ -309,12 +372,23 @@ def is_path_parent(possible_parent, *paths):
     return True
 
 def which_wild(pathname, path=None, mode=os.F_OK, *, reverse=False, candidates=False):
-    """Search a search path for pathname, supporting wildcards.
+    """
+    Search a search ``path`` for ``pathname``, supporting wildcards.
 
-    Return all paths in the specific search path matching the wildcard pattern
-    in pathname, returning only the first encountered for each file. If
-    candidates is True, information on all potential candidate paths are
-    included.
+    ``path`` should be a colon-separated list of paths. If not passed, the
+    ``PATH`` environment is used.
+
+    Return all paths as a list in the specific search path matching the wildcard pattern
+    in ``pathname``, returning only the first encountered for each file.
+
+    If ``candidates`` is True, information on all potential candidate paths are
+    included as two-element tuples: first element is the matched candidates,
+    second element is the list of other matches.
+
+    ``mode`` is passed to :py:func:`os.access` to control what the matched
+    files should have as attributes (executable, readable, etc.).
+
+    When ``reverse`` is ``True``, reverse the search path before iterating.
     """
     paths = (path or os.environ.get('PATH', os.defpath)).split(':')
     if reverse:
@@ -342,9 +416,11 @@ def which_wild(pathname, path=None, mode=os.F_OK, *, reverse=False, candidates=F
     return files
 
 def canonicalize(paths, sep=','):
-    """Given a string with paths (separated by commas by default), expand
-    each path using os.path.realpath() and return the resulting paths as a
-    string (separated using the same separator a the original string).
+    """
+    Given a string with paths ``paths`` (separated by commas by default, but
+    controllable by ``sep``), expand each path using :py:func:`os.path.realpath`
+    and return the resulting paths as a string (separated using the same
+    separated as the original string).
     """
     # Ignore paths containing "$" as they are assumed to be unexpanded bitbake
     # variables. Normally they would be ignored, e.g., when passing the paths

-- 
2.56.0

