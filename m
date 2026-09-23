Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79EFC982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:33 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2913.1790154689507539489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yI68tUwH;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so3842515e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154688; x=1790759488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F65lNaWK8n1jyPnDlSRoNuXuSmGjAvkamxfjkdnPEuc=;
        b=yI68tUwHopaFDQd8H7gWRJ6D2syrXioGl4imcJAl8kEqmQBPTouXDs2I/5UaNG8jF9
         NeNDt6jAdGujORvHYw8NEASHJ7zSqC6Eled+GtFAg44w5IgyPEDiy02F2Dy2YJLZuuCP
         O6ne5toh27PQBppQI0lzjQgeDUo7ZMBxfC1Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154688; x=1790759488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F65lNaWK8n1jyPnDlSRoNuXuSmGjAvkamxfjkdnPEuc=;
        b=IgMUyajefkCC5OaC3Mkx6BYfnE+TsDx6GtmLqpBsviRoR8jU64zoamfNu+z+uLrSfV
         CEz+3WNJSpijPmIH3877KAOrCe0uXJrYeWq6lgwFCR1oRuzRpK6YY7YvxubOkLsZNuf/
         0aBLts2xGiTet5N3SOUkUj7KKXleRaIiHnX7FvPHXbixQcJdGt3lkkUHf/3m+dKteyp3
         QnyN4Prl+m741RxklYgCReBPljQeMGN29hxoBG4X6PwjKyyF1kZIs9PnXO/EqXpEzko6
         m0DlqVdEfCxcDLcaq9516ELpdVEE2JKM84CNSU/5nyp546FIqrCSVTst2CFN+qGQlipF
         nu2A==
X-Gm-Message-State: AFuF++kfitLmZsOpSrgD/c1tRKoBEYr2VI6CWxUKmZ7eb8PKbAvRP2bn
	wif1JgYr1paxiQiRJ4WHBTt5DRzBCpMdpOCojIRYq1UAzXVY6bnGc+h1+FvECufN2pBuI2BsQez
	hzShTn/w=
X-Gm-Gg: AYBFou0LZ1KslPcNWfVtKf/sjjrYpNa+tPWz/l4wVU+N616N5w9MoyAwj99r7Z/fMj+
	PWfNaDrbYp737C6YjtEO6dqlnk6yyb1fHuPBaALM8088k1g/lIxMbzURqdt8u+y11QuGnJ+hv2d
	LuPZkS0fKmkypsbh0ahbaTj/2TEwM4MjBkYcBd7vMeIteNUFb0fUQZbypaPPTPDC8e82a/sjXvt
	LGuG0w46xFfNC4yujmvJ3BGE1jotxb0+1WzHL+CmJ808nlMAaY61tQn3GhTR8S1tM3Sl6A5Vx1I
	RTDnnbTZXeR85Efu5Wa1aPgG1E3lnapbpAoFU7p6nhi5z3nYHePKLbY1HCWTsHcU/PJV+ce3PPk
	rg79okVRoXu/YiYohW9dggrsZsgVsLgICXyYnB//bhCCDOSF/s36hMf9yRpWKFR+omTWTAzmDUb
	NozuXa+OTbsfIRYhCIksRdgXyfXdjOWUi53UTS+9smXDhD+SiTHfXsisLBeheAxRuz4LL8vfuZn
	tsYtQ5BdgSuY7hg2DFuXrPIOmJLR8XidgmqOLeKZdqzhEuXjs+EkRaxohiDBIjOffTWsfaf
X-Received: by 2002:a05:600d:8643:20b0:49f:bc0d:2e9 with SMTP id 5b1f17b1804b1-49fdfd90205mr15431085e9.0.1790154687559;
        Wed, 23 Sep 2026 02:11:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/48] python3-pip: Fix CVE-2026-13346
Date: Wed, 23 Sep 2026 11:10:11 +0200
Message-ID: <e0dde773c4329bc1d44e57ac67151cca388f19f7.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246471

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in
[2], using the commit shown in [1].

[1] https://github.com/pypa/pip/commit/10dfb6b90054
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-13346

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-pip/CVE-2026-13346.patch   | 223 ++++++++++++++++++
 .../python/python3-pip_24.0.bb                |   1 +
 2 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch
new file mode 100644
index 00000000000..246f587a149
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch
@@ -0,0 +1,223 @@
+From e743e63ca083402fe0a344c4837cc6acf3081987 Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Tue, 30 Jun 2026 21:52:39 -0400
+Subject: [PATCH] Fix Link.filename decoding URL path twice (#14110)
+
+Link already percent-decodes the URL path into `self._path`, but
+`Link.filename` decoded the basename again, so a doubly-encoded
+separator was decoded twice: `%252F` became `%2F` in `__init__`, then
+`/` in `filename`, turning the single component `a%2Fb.whl` into
+`a/b.whl`.
+
+Drop the second decode, and add a `join_within_directory` helper so the
+download-path joins treat the name as a single path component.
+
+CVE: CVE-2026-13346
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/10dfb6b9005484578b386f64b9f36982e3dc6679]
+
+Backport Changes:
+- Adapted imports and download call sites to pip 24.0.
+- Secured pip 24.0 separate BatchDownloader path.
+- Omitted tests absent from the pip 24.0 source archive.
+
+(cherry picked from commit 10dfb6b9005484578b386f64b9f36982e3dc6679)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ news/14110.bugfix.rst                   |  1 +
+ src/pip/_internal/models/link.py        | 63 ++++++++++++++++++++-----
+ src/pip/_internal/network/download.py   | 20 +++++---
+ src/pip/_internal/operations/prepare.py |  6 +--
+ 4 files changed, 69 insertions(+), 21 deletions(-)
+ create mode 100644 news/14110.bugfix.rst
+
+diff --git a/news/14110.bugfix.rst b/news/14110.bugfix.rst
+new file mode 100644
+index 000000000..f7d4f7888
+--- /dev/null
++++ b/news/14110.bugfix.rst
+@@ -0,0 +1 @@
++Fix ``Link.filename`` decoding the URL path twice.
+diff --git a/src/pip/_internal/models/link.py b/src/pip/_internal/models/link.py
+index 73041b864..e4bd559bf 100644
+--- a/src/pip/_internal/models/link.py
++++ b/src/pip/_internal/models/link.py
+@@ -13,6 +13,7 @@ from typing import (
+     List,
+     Mapping,
+     NamedTuple,
++    NewType,
+     Optional,
+     Tuple,
+     Union,
+@@ -36,6 +37,49 @@ if TYPE_CHECKING:
+ logger = logging.getLogger(__name__)
+ 
+ 
++# A single path component: percent-decoded once and reduced to a basename, so it
++# contains no path separator and is not a ``.`` or ``..`` reference. The empty
++# string means "no component".
++PathComponent = NewType("PathComponent", str)
++
++
++def _to_path_component(name: str) -> PathComponent:
++    """Reduce ``name`` to a single path component, or ``""`` if it has none.
++
++    ``os.path.basename`` drops any directory part, drive letter, or separator;
++    a ``.``, ``..``, or empty result is not a component and becomes ``""``.
++    """
++    name = os.path.basename(name)
++    if name in ("", os.curdir, os.pardir):
++        return PathComponent("")
++
++    return PathComponent(name)
++
++
++def as_path_component(name: str) -> PathComponent:
++    """Like ``_to_path_component`` but reject the empty result.
++
++    Use where a file is about to be written, so a missing name is an error
++    rather than a silent fallback to the directory itself.
++    """
++    component = _to_path_component(name)
++    if not component:
++        raise ValueError(f"Unexpected file name derived from URL: {name!r}")
++
++    return component
++
++
++def join_within_directory(directory: str, component: PathComponent) -> str:
++    """Join a single path ``component`` onto ``directory``.
++
++    ``component`` is a :data:`PathComponent`, so by type it has no separator and
++    is not a ``.`` or ``..`` reference; the result can never escape ``directory``.
++    Requiring ``PathComponent`` rather than ``str`` lets the type checker enforce
++    at the call site that the name was reduced to a safe component beforehand.
++    """
++    return os.path.join(directory, component)
++
++
+ # Order matters, earlier hashes have a precedence over later hashes for what
+ # we will pick to use.
+ _SUPPORTED_HASHES = ("sha512", "sha384", "sha256", "sha224", "sha1", "md5")
+@@ -380,18 +424,13 @@ class Link(KeyBasedCompareMixin):
+         return self._url
+ 
+     @property
+-    def filename(self) -> str:
+-        path = self.path.rstrip("/")
+-        name = posixpath.basename(path)
+-        if not name:
+-            # Make sure we don't leak auth information if the netloc
+-            # includes a username and password.
+-            netloc, user_pass = split_auth_from_netloc(self.netloc)
+-            return netloc
+-
+-        name = urllib.parse.unquote(name)
+-        assert name, f"URL {self._url!r} produced no filename"
+-        return name
++    def filename(self) -> PathComponent:
++        name = _to_path_component(posixpath.basename(self.path.rstrip("/")))
++        if name:
++            return name
++
++        # No component in the path; fall back to the netloc, dropping any auth.
++        return _to_path_component(split_auth_from_netloc(self.netloc)[0])
+ 
+     @property
+     def file_path(self) -> str:
+diff --git a/src/pip/_internal/network/download.py b/src/pip/_internal/network/download.py
+index d1d43541e..3aec97e84 100644
+--- a/src/pip/_internal/network/download.py
++++ b/src/pip/_internal/network/download.py
+@@ -11,7 +11,12 @@ from pip._vendor.requests.models import CONTENT_CHUNK_SIZE, Response
+ from pip._internal.cli.progress_bars import get_download_progress_renderer
+ from pip._internal.exceptions import NetworkConnectionError
+ from pip._internal.models.index import PyPI
+-from pip._internal.models.link import Link
++from pip._internal.models.link import (
++    Link,
++    PathComponent,
++    as_path_component,
++    join_within_directory,
++)
+ from pip._internal.network.cache import is_from_cache
+ from pip._internal.network.session import PipSession
+ from pip._internal.network.utils import HEADERS, raise_for_status, response_chunks
+@@ -91,11 +96,14 @@ def parse_content_disposition(content_disposition: str, default_filename: str) -
+     return filename or default_filename
+ 
+ 
+-def _get_http_response_filename(resp: Response, link: Link) -> str:
++def _get_http_response_filename(resp: Response, link: Link) -> PathComponent:
+     """Get an ideal filename from the given HTTP response, falling back to
+     the link filename if not provided.
++
++    The result is validated as a single path component, so it can be joined onto
++    a download directory without escaping it.
+     """
+-    filename = link.filename  # fallback
++    filename: str = link.filename  # fallback
+     # Have a look at the Content-Disposition header for a better guess
+     content_disposition = resp.headers.get("content-disposition")
+     if content_disposition:
+@@ -109,7 +117,7 @@ def _get_http_response_filename(resp: Response, link: Link) -> str:
+         ext = os.path.splitext(resp.url)[1]
+         if ext:
+             filename += ext
+-    return filename
++    return as_path_component(filename)
+ 
+ 
+ def _http_get_download(session: PipSession, link: Link) -> Response:
+@@ -140,7 +148,7 @@ class Downloader:
+             raise
+ 
+         filename = _get_http_response_filename(resp, link)
+-        filepath = os.path.join(location, filename)
++        filepath = join_within_directory(location, filename)
+ 
+         chunks = _prepare_download(resp, link, self._progress_bar)
+         with open(filepath, "wb") as content_file:
+@@ -176,7 +184,7 @@ class BatchDownloader:
+                 raise
+ 
+             filename = _get_http_response_filename(resp, link)
+-            filepath = os.path.join(location, filename)
++            filepath = join_within_directory(location, filename)
+ 
+             chunks = _prepare_download(resp, link, self._progress_bar)
+             with open(filepath, "wb") as content_file:
+diff --git a/src/pip/_internal/operations/prepare.py b/src/pip/_internal/operations/prepare.py
+index 956717d1e..0a9b39332 100644
+--- a/src/pip/_internal/operations/prepare.py
++++ b/src/pip/_internal/operations/prepare.py
+@@ -26,7 +26,7 @@ from pip._internal.exceptions import (
+ from pip._internal.index.package_finder import PackageFinder
+ from pip._internal.metadata import BaseDistribution, get_metadata_distribution
+ from pip._internal.models.direct_url import ArchiveInfo
+-from pip._internal.models.link import Link
++from pip._internal.models.link import Link, join_within_directory
+ from pip._internal.models.wheel import Wheel
+ from pip._internal.network.download import BatchDownloader, Downloader
+ from pip._internal.network.lazy_wheel import (
+@@ -189,7 +189,7 @@ def _check_download_dir(
+     """Check download_dir for previously downloaded file with correct hash
+     If a correct file is found return its path else None
+     """
+-    download_path = os.path.join(download_dir, link.filename)
++    download_path = join_within_directory(download_dir, link.filename)
+ 
+     if not os.path.exists(download_path):
+         return None
+@@ -666,7 +666,7 @@ class RequirementPreparer:
+             # No distribution was downloaded for this requirement.
+             return
+ 
+-        download_location = os.path.join(self.download_dir, link.filename)
++        download_location = join_within_directory(self.download_dir, link.filename)
+         if not os.path.exists(download_location):
+             shutil.copy(req.local_file_path, download_location)
+             download_path = display_path(download_location)
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
index 709ec9f2b6c..818c92d8cd2 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -36,6 +36,7 @@ SRC_URI += "file://no_shebang_mangling.patch \
             file://CVE-2026-8643.patch \
             file://CVE-2026-8643-regression_p1.patch \
             file://CVE-2026-8643-regression_p2.patch \
+            file://CVE-2026-13346.patch \
            "
 
 SRC_URI[sha256sum] = "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b718fe6f593aba2"

