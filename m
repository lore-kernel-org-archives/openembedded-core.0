Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31000.1794845361462592564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q0QavLs1;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CE64B1A169E
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C92C6023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B39E111BC1D5B;
	Mon, 16 Nov 2026 17:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845359; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K9vqxC7/GR8rrcO0d73uqh9wtkq3wV5GlDaFBnc9bQo=;
	b=Q0QavLs1HjvxtbimdMjxQpaCz6v5mum/GT0sOezyMRFfUYimrTTwgGvdQaodWIPTeHDUbG
	C0tiGusbXzNDerJlLFvLFkSV2xL+Mz/ysPxGqnWaMnSlTWVHP5A6I0GNKngSqoTnghaWSH
	gnDXr475MHsD1sxX2KH9Tum09WrmMqv9AfgA8MjJ+uO4t3TFno52PsUgjX6/0vYE/JkQJS
	UWeE2lZ8B+rRjT1jsRdbc/e2xyf7QAX/Tpaar6YtkEw7Lrz+bwUNVywLnffW84t7yahivp
	S/29UJjv3aQxs71Uv65iDtiH2YvneBT5pVPVSFk45ifQbeZN6X4spDuIZgYi5w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:11 +0100
Subject: [PATCH 13/13] lib/oe/types: improve docstrings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-13-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6165;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EquptDBtbWWTWm35qxhC54W6EXdjj3ku2SES4CUs9Ac=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqgZeVbc1S+wH07kHMrAxpSfkX4GVa0QT1bz
 egYyJhJDbGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqoAAKCRDRgEFAKaOo
 NuClEACwkvD4apW6y2m9QqlfVtsVG5+jmnFNwlwKwYLdFzY3Svoka0MnTJcX6Gwn64DivPAQAOs
 /fcyS6qvJHO7vehL1fWId3+IiDMldPWrwQ2Yl0BpOcAIwXyU6Tc5qx6SgRPDnZ5xT3ZPWy2UABm
 YjT4WG2vXj0AUdJaG9L9kamY47ymYpSRFoUqqKyA3LatLdDk2J0sXGzO6z5cs8fP1pxu7q1UWwC
 3zoOAftwBG6iLHfRqd1tx4sDGhllHAFzUGfRq2oqBIvT12c5TyeDlSWQU7PbIvPMJIVbciQtV3s
 6Avy/KnovsFq8445iZh3nxNY3K10HO9yqK74T2DRAdLr0n9V0Dc16JK1NAzqasAHCRzt+DcA+77
 +MwYjgV45HD86s4K5AyXtiB65PjP0bppShAQZjutyR2/38HKhuWGkh6gSlFXxwdKJkiCD+nsqDp
 fcWTY/NHE37vZ8z1BO2Mo/fMAYkjoeSxHEfZmO/ZYl2s/1h5NOFwpbMOGAhiskX4hg1cNQHbEhl
 QdckJbkDMYawhz1vqj/EHqLdojL2k90+1EwLNyLZnfxt9XlU1BdbghBxa/QfMr4R2iQXDe5rdYS
 +UYNyo8egds0ZvaOJqos5r7kzz0mOcJUsn+CyspXtSFH9WQT4+TUHsNo3AdA6ezWNgd1Qfs4ThN
 qThb7fBDhiJLJlA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250363

Improve docstrings by detailing the parameters and return values of
OpenEmbedded types. Give usage examples for each of the type.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/types.py | 143 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 127 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index c4b338921b..7fe9e9d8a4 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -75,14 +75,34 @@ class NoMatch(object):
 NoMatch = NoMatch()
 
 def regex(value, regexflags=None):
-    """OpenEmbedded 'regex' type
+    """
+    OpenEmbedded 'regex' type.
 
     Acts as a regular expression, returning the pre-compiled regular
-    expression pattern object.  To use this type, set the variable type flag
-    to 'regex', and optionally, set the 'regexflags' type to a space separated
-    list of the flags to control the regular expression matching (e.g.
-    FOO[regexflags] += 'ignorecase').  See the python documentation on the
-    're' module for a list of valid flags."""
+    expression pattern object from the string ``value``.
+
+    To use this type, set a BitBake variable ``type`` flag
+    to ``regex``, and optionally, set the ``regexflags`` flag to a space-separated
+    list of the flags to control the regular expression matching.
+
+    The variable can then be used with :py:func:`oe.data.typed_value`.
+
+    For example::
+
+        FOO = "^foo[0-9]+$"
+        FOO[type] = "regex"
+        FOO[regexflags] += "ignorecase"
+
+    Then:
+
+    .. code-block:: python
+
+       if re.match(oe.data.typed_value("FOO", d), somevalue):
+           ...
+
+    See the Python documentation on the :py:mod:`re` module for a list of
+    valid flags.
+    """
 
     flagval = 0
     if regexflags:
@@ -106,10 +126,29 @@ def regex(value, regexflags=None):
                          (value, exc.args[0]))
 
 def boolean(value):
-    """OpenEmbedded 'boolean' type
+    """
+    OpenEmbedded 'boolean' type.
+
+    To use this type, set a BitBake variable ``type`` flag
+    to ``boolean``, and its value depending on the expected behavior:
 
-    Valid values for true: 'yes', 'y', 'true', 't', '1'
-    Valid values for false: 'no', 'n', 'false', 'f', '0', None
+    -  To return ``True``: ``yes``, ``y``, ``true``, ``t`` or ``1``.
+    -  To return ``False``: ``no``, ``n``, ``false``, ``f``, ``0`` or ``None``.
+
+    The variable can then be used with :py:func:`oe.data.typed_value`.
+
+    For example::
+
+        FOO = "yes"
+        FOO[type] = "boolean"
+
+    Then:
+
+    .. code-block:: python
+
+       if oe.data.typed_value("FOO", d):
+           # condition is met as FOO = "yes" so becomes "True"
+           ...
     """
     if value is None:
         return False
@@ -128,20 +167,56 @@ def boolean(value):
     raise ValueError("Invalid boolean value '%s'" % value)
 
 def integer(value, numberbase=10):
-    """OpenEmbedded 'integer' type
+    """
+    OpenEmbedded 'integer' type.
+
+    To use this type, set a BitBake variable ``type`` flag
+    to ``integer``, and its value to an integer string. Optionally, the
+    ``numberbase`` flag can be set (defaults to base 10).
+
+    The variable can then be used with :py:func:`oe.data.typed_value`.
+
+    For example::
+
+        FOO = "13"
+        FOO[type] = "integer"
+
+    Then:
 
-    Defaults to base 10, but this can be specified using the optional
-    'numberbase' flag."""
+    .. code-block:: python
+
+       if oe.data.typed_value("FOO", d) > 12:
+           # condition is met as FOO = "13" and 13 > 12
+           ...
+    """
 
     return int(value, int(numberbase))
 
 _float = float
 def float(value, fromhex='false'):
-    """OpenEmbedded floating point type
+    """
+    OpenEmbedded 'float' type.
+
+    To use this type, set a BitBake variable ``type`` flag
+    to ``float``, and its value to a floating number string. Optionally, the
+    ``fromhex`` flag can be set to "true" to use Python's built-in
+    :py:func:`float.fromhex` (defaults to "false").
+
+    The variable can then be used with :py:func:`oe.data.typed_value`.
+
+    For example::
 
-    To use this type, set the type flag to 'float', and optionally set the
-    'fromhex' flag to a true value (obeying the same rules as for the
-    'boolean' type) if the value is in base 16 rather than base 10."""
+        FOO = "1.23"
+        FOO[type] = "float"
+
+    Then:
+
+    .. code-block:: python
+
+       if oe.data.typed_value("FOO", d) > 1:
+           # condition is met as FOO = "1.23" and 1.23 > 1
+           ...
+    """
 
     if boolean(fromhex):
         return _float.fromhex(value)
@@ -149,6 +224,42 @@ def float(value, fromhex='false'):
         return _float(value)
 
 def path(value, relativeto='', normalize='true', mustexist='false'):
+    """
+    OpenEmbedded 'path' type.
+
+    To use this type, set a BitBake variable ``type`` flag
+    to ``path``, and its value to a path. Optionally, the following variable
+    flags can be defined:
+
+    -  ``relativeto``: another path string to join to the variable's value, with
+       :py:func:`os.path.join`:
+
+       .. code-block:: python
+
+          os.path.join(relativeto, value)
+
+    -  ``normalize``: a boolean string ("true" by default) that normalizes the
+       path with :py:func:`os.path.normpath`.
+
+    -  ``mustexist``: a boolean string ("false" by default) that ensures the
+       path to the file/directory exists, otherwise raises
+       :py:class:`ValueError`.
+
+    The variable can then be used with :py:func:`oe.data.typed_value`.
+
+    For example::
+
+        FOO = "src/pyproject.toml"
+        FOO[type] = "path"
+        FOO[relativeto] = "${S}"
+
+    Then:
+
+    .. code-block:: python
+
+       >>> print(oe.data.typed_value("FOO", d))
+       ".../path/to/source/src/pyproject.toml"
+    """
     value = os.path.join(relativeto, value)
 
     if boolean(normalize):

-- 
2.56.0

