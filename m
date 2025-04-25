Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8ABC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 04:50:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.557.1745556634588495656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 21:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6210c7caee=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P3U3I3028185
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:50:33 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh639jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:50:33 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 24 Apr 2025 21:50:31 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 24 Apr 2025 21:50:30 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-setuptools: Fix CVE-2024-6345
Date: Fri, 25 Apr 2025 04:50:26 +0000
Message-ID: <20250425045026.118647-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BBZoFrSV8BxaTUs3OoAeG-QDhFpL6mVE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAzMyBTYWx0ZWRfX2MGjQUZthKrh Jo7Z15FbHCN4QmLQ6rVXLvhErXD8/XPlc9WtWTXcwFE//UDE95USepMKj7TsKac0HpSWQ7aUrko RhkPujb3/pLoO4VeJaFJHwbAg4/rrlhYctjVWsl5Xx0rwm+P9cva/T8ZU1fjbPf/9nt6Kxl+hqG
 TXiVLWkWnBrsIVJoAIyfDjfeQ6fzy9IAame0oD4u3Ciem/KDTLH3prSYzkC264t2+tHamIi9vCm nzcMomXNrQTPvNOXrM7WLgeOE7WpfaNa63/jOyLgWbAhhwlFOr46IzTV0cHdO4tVRSMEdz9AG2s Zgz8U9ok18HnLMJEav2CBCQOHjLocOVOSZanSolTDXL3AceZmw/nGR1sc+1jsKNGWS4ADQJY/xw
 vkKM6/prG75KeVb4AN5aomcgT18n+M/ts9BHy5n6H5t/QaQ7JLmcxDr0PswBqcrkn7ava32Q
X-Authority-Analysis: v=2.4 cv=Lu+Symdc c=1 sm=1 tr=0 ts=680b1499 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=fxJcL_dCAAAA:8 a=NEAV23lmAAAA:8 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8 a=0DMlDUsRAAAA:8
 a=-VEQcbrZAAAA:8 a=traSILyw6sbKmsHmj9UA:9 a=s5zKW874KtQA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=168rQcPrDVj8xHztDHWJ:22 a=-CJt7n-APeOCVU92nYHP:22
X-Proofpoint-ORIG-GUID: BBZoFrSV8BxaTUs3OoAeG-QDhFpL6mVE
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215414

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability in the package_index module of pypa/setuptools versions up to 69.1.1
allows for remote code execution via its download functions. These functions, which
are used to download packages from URLs provided by users or retrieved from package
index servers, are susceptible to code injection. If these functions are exposed to
user-controlled inputs, such as package URLs, they can execute arbitrary commands on
the system. The issue is fixed in version 70.0.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-6345
https://ubuntu.com/security/CVE-2024-6345

Upstream patch:
https://github.com/pypa/setuptools/commit/88807c7062788254f654ea8c03427adc859321f0

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-setuptools/CVE-2024-6345.patch    | 353 ++++++++++++++++++
 .../python/python3-setuptools_59.5.0.bb       |   1 +
 2 files changed, 354 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch
new file mode 100644
index 0000000000..958ddf559b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch
@@ -0,0 +1,353 @@
+From 88807c7062788254f654ea8c03427adc859321f0 Mon Sep 17 00:00:00 2001
+From: Jason R. Coombs <jaraco@jaraco.com>
+Date: Mon Apr 29 20:01:38 2024 -0400
+Subject: [PATCH] Merge pull request #4332 from pypa/debt/package-index-vcs
+
+Modernize package_index VCS handling
+
+Source: https://git.launchpad.net/ubuntu/+source/setuptools/tree/debian/patches/CVE-2024-6345.patch?h=applied/ubuntu/jammy-devel
+
+CVE: CVE-2024-6345
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/88807c7062788254f654ea8c03427adc859321f0]
+
+Note: Cannot do exact upstream patch backport as the code changed.
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ setup.cfg                             |   1 +
+ setuptools/package_index.py           | 145 +++++++++++++++-----------
+ setuptools/tests/test_packageindex.py |  78 +++++++-------
+ 3 files changed, 123 insertions(+), 101 deletions(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index 0bc0101..b8585d7 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -56,6 +56,7 @@ testing =
+ 	jaraco.envs>=2.2
+ 	pytest-xdist
+ 	sphinx
++	pytest-subprocess
+ 	jaraco.path>=3.2.0
+ docs = 
+ 	sphinx
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index e93fcc6..3a893df 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -1,5 +1,6 @@
+ """PyPI and direct package downloading"""
+ import sys
++import subprocess
+ import os
+ import re
+ import io
+@@ -566,7 +567,7 @@ class PackageIndex(Environment):
+             scheme = URL_SCHEME(spec)
+             if scheme:
+                 # It's a url, download it to tmpdir
+-                found = self._download_url(scheme.group(1), spec, tmpdir)
++                found = self._download_url(spec, tmpdir)
+                 base, fragment = egg_info_for_url(spec)
+                 if base.endswith('.py'):
+                     found = self.gen_setup(found, fragment, tmpdir)
+@@ -785,7 +786,7 @@ class PackageIndex(Environment):
+                 raise DistutilsError("Download error for %s: %s"
+                                      % (url, v)) from v
+ 
+-    def _download_url(self, scheme, url, tmpdir):
++    def _download_url(self, url, tmpdir):
+         # Determine download filename
+         #
+         name, fragment = egg_info_for_url(url)
+@@ -800,19 +801,57 @@ class PackageIndex(Environment):
+ 
+         filename = os.path.join(tmpdir, name)
+ 
+-        # Download the file
+-        #
+-        if scheme == 'svn' or scheme.startswith('svn+'):
+-            return self._download_svn(url, filename)
+-        elif scheme == 'git' or scheme.startswith('git+'):
+-            return self._download_git(url, filename)
+-        elif scheme.startswith('hg+'):
+-            return self._download_hg(url, filename)
+-        elif scheme == 'file':
+-            return urllib.request.url2pathname(urllib.parse.urlparse(url)[2])
+-        else:
+-            self.url_ok(url, True)  # raises error if not allowed
+-            return self._attempt_download(url, filename)
++        return self._download_vcs(url, filename) or self._download_other(url, filename)
++
++    @staticmethod
++    def _resolve_vcs(url):
++        """
++        >>> rvcs = PackageIndex._resolve_vcs
++        >>> rvcs('git+http://foo/bar')
++        'git'
++        >>> rvcs('hg+https://foo/bar')
++        'hg'
++        >>> rvcs('git:myhost')
++        'git'
++        >>> rvcs('hg:myhost')
++        >>> rvcs('http://foo/bar')
++        """
++        scheme = urllib.parse.urlsplit(url).scheme
++        pre, sep, post = scheme.partition('+')
++        # svn and git have their own protocol; hg does not
++        allowed = set(['svn', 'git'] + ['hg'] * bool(sep))
++        return next(iter({pre} & allowed), None)
++
++    def _download_vcs(self, url, spec_filename):
++        vcs = self._resolve_vcs(url)
++        if not vcs:
++            return
++        if vcs == 'svn':
++            return self._download_svn(url, spec_filename)
++
++        filename, _, _ = spec_filename.partition('#')
++        url, rev = self._vcs_split_rev_from_url(url)
++
++        self.info(f"Doing {vcs} clone from {url} to {filename}")
++        subprocess.check_call([vcs, 'clone', '--quiet', url, filename])
++
++        co_commands = dict(
++            git=[vcs, '-C', filename, 'checkout', '--quiet', rev],
++            hg=[vcs, '--cwd', filename, 'up', '-C', '-r', rev, '-q'],
++        )
++        if rev is not None:
++            self.info(f"Checking out {rev}")
++            subprocess.check_call(co_commands[vcs])
++
++        return filename
++
++    def _download_other(self, url, filename):
++        scheme = urllib.parse.urlsplit(url).scheme
++        if scheme == 'file':  # pragma: no cover
++            return urllib.request.url2pathname(urllib.parse.urlparse(url).path)
++        # raise error if not allowed
++        self.url_ok(url, True)
++        return self._attempt_download(url, filename)
+ 
+     def scan_url(self, url):
+         self.process_url(url, True)
+@@ -842,7 +881,7 @@ class PackageIndex(Environment):
+     def _download_svn(self, url, filename):
+         warnings.warn("SVN download support is deprecated", UserWarning)
+         url = url.split('#', 1)[0]  # remove any fragment for svn's sake
+-        creds = ''
++        creds = []
+         if url.lower().startswith('svn:') and '@' in url:
+             scheme, netloc, path, p, q, f = urllib.parse.urlparse(url)
+             if not netloc and path.startswith('//') and '/' in path[2:]:
+@@ -851,65 +890,49 @@ class PackageIndex(Environment):
+                 if auth:
+                     if ':' in auth:
+                         user, pw = auth.split(':', 1)
+-                        creds = " --username=%s --password=%s" % (user, pw)
++                        creds.extend(["--username", user, "--password", pw])
+                     else:
+-                        creds = " --username=" + auth
++                        creds.extend(["--username", auth])
+                     netloc = host
+                     parts = scheme, netloc, url, p, q, f
+                     url = urllib.parse.urlunparse(parts)
+         self.info("Doing subversion checkout from %s to %s", url, filename)
+-        os.system("svn checkout%s -q %s %s" % (creds, url, filename))
++        cmd = ["svn", "checkout", "-q"] + creds + [url, filename]
++        subprocess.check_call(cmd)
++
+         return filename
+ 
+     @staticmethod
+-    def _vcs_split_rev_from_url(url, pop_prefix=False):
+-        scheme, netloc, path, query, frag = urllib.parse.urlsplit(url)
++    def _vcs_split_rev_from_url(url):
++        """
++        Given a possible VCS URL, return a clean URL and resolved revision if any.
++
++        >>> vsrfu = PackageIndex._vcs_split_rev_from_url
++        >>> vsrfu('git+https://github.com/pypa/setuptools@v69.0.0#egg-info=setuptools')
++        ('https://github.com/pypa/setuptools', 'v69.0.0')
++        >>> vsrfu('git+https://github.com/pypa/setuptools#egg-info=setuptools')
++        ('https://github.com/pypa/setuptools', None)
++        >>> vsrfu('http://foo/bar')
++        ('http://foo/bar', None)
++        """
++        parts = urllib.parse.urlsplit(url)
+ 
+-        scheme = scheme.split('+', 1)[-1]
++        clean_scheme = parts.scheme.split('+', 1)[-1]
+ 
+         # Some fragment identification fails
+-        path = path.split('#', 1)[0]
+-
+-        rev = None
+-        if '@' in path:
+-            path, rev = path.rsplit('@', 1)
++        no_fragment_path, _, _ = parts.path.partition('#')
+ 
+-        # Also, discard fragment
+-        url = urllib.parse.urlunsplit((scheme, netloc, path, query, ''))
++        pre, sep, post = no_fragment_path.rpartition('@')
++        clean_path, rev = (pre, post) if sep else (post, None)
+ 
+-        return url, rev
+-
+-    def _download_git(self, url, filename):
+-        filename = filename.split('#', 1)[0]
+-        url, rev = self._vcs_split_rev_from_url(url, pop_prefix=True)
+-
+-        self.info("Doing git clone from %s to %s", url, filename)
+-        os.system("git clone --quiet %s %s" % (url, filename))
+-
+-        if rev is not None:
+-            self.info("Checking out %s", rev)
+-            os.system("git -C %s checkout --quiet %s" % (
+-                filename,
+-                rev,
+-            ))
++        resolved = parts._replace(
++            scheme=clean_scheme,
++            path=clean_path,
++            # discard the fragment
++            fragment='',
++        ).geturl()
+ 
+-        return filename
+-
+-    def _download_hg(self, url, filename):
+-        filename = filename.split('#', 1)[0]
+-        url, rev = self._vcs_split_rev_from_url(url, pop_prefix=True)
+-
+-        self.info("Doing hg clone from %s to %s", url, filename)
+-        os.system("hg clone --quiet %s %s" % (url, filename))
+-
+-        if rev is not None:
+-            self.info("Updating to %s", rev)
+-            os.system("hg --cwd %s up -C -r %s -q" % (
+-                filename,
+-                rev,
+-            ))
+-
+-        return filename
++        return resolved, rev
+ 
+     def debug(self, msg, *args):
+         log.debug(msg, *args)
+diff --git a/setuptools/tests/test_packageindex.py b/setuptools/tests/test_packageindex.py
+index 8e9435e..cc7e86c 100644
+--- a/setuptools/tests/test_packageindex.py
++++ b/setuptools/tests/test_packageindex.py
+@@ -6,7 +6,6 @@ import urllib.request
+ import urllib.error
+ import http.client
+ 
+-import mock
+ import pytest
+ 
+ import setuptools.package_index
+@@ -193,61 +192,60 @@ class TestPackageIndex:
+             assert dists[0].version == ''
+             assert dists[1].version == vc
+ 
+-    def test_download_git_with_rev(self, tmpdir):
++    def test_download_git_with_rev(self, tmp_path, fp):
+         url = 'git+https://github.example/group/project@master#egg=foo'
+         index = setuptools.package_index.PackageIndex()
+ 
+-        with mock.patch("os.system") as os_system_mock:
+-            result = index.download(url, str(tmpdir))
++        expected_dir = tmp_path / 'project@master'
++        fp.register([
++            'git',
++            'clone',
++            '--quiet',
++            'https://github.example/group/project',
++            expected_dir,
++        ])
++        fp.register(['git', '-C', expected_dir, 'checkout', '--quiet', 'master'])
+ 
+-        os_system_mock.assert_called()
++        result = index.download(url, tmp_path)
+ 
+-        expected_dir = str(tmpdir / 'project@master')
+-        expected = (
+-            'git clone --quiet '
+-            'https://github.example/group/project {expected_dir}'
+-        ).format(**locals())
+-        first_call_args = os_system_mock.call_args_list[0][0]
+-        assert first_call_args == (expected,)
++        assert result == str(expected_dir)
++        assert len(fp.calls) == 2
+ 
+-        tmpl = 'git -C {expected_dir} checkout --quiet master'
+-        expected = tmpl.format(**locals())
+-        assert os_system_mock.call_args_list[1][0] == (expected,)
+-        assert result == expected_dir
+-
+-    def test_download_git_no_rev(self, tmpdir):
++    def test_download_git_no_rev(self, tmp_path, fp):
+         url = 'git+https://github.example/group/project#egg=foo'
+         index = setuptools.package_index.PackageIndex()
+ 
+-        with mock.patch("os.system") as os_system_mock:
+-            result = index.download(url, str(tmpdir))
+-
+-        os_system_mock.assert_called()
++        expected_dir = tmp_path / 'project'
++        fp.register([
++            'git',
++            'clone',
++            '--quiet',
++            'https://github.example/group/project',
++            expected_dir,
++        ])
++        result = index.download(url, tmp_path)
+ 
+-        expected_dir = str(tmpdir / 'project')
+-        expected = (
+-            'git clone --quiet '
+-            'https://github.example/group/project {expected_dir}'
+-        ).format(**locals())
+-        os_system_mock.assert_called_once_with(expected)
++        assert result == str(expected_dir)
++        assert len(fp.calls) == 1
+ 
+-    def test_download_svn(self, tmpdir):
++    def test_download_svn(self, tmp_path, fp):
+         url = 'svn+https://svn.example/project#egg=foo'
+         index = setuptools.package_index.PackageIndex()
+ 
+-        with pytest.warns(UserWarning):
+-            with mock.patch("os.system") as os_system_mock:
+-                result = index.download(url, str(tmpdir))
+-
+-        os_system_mock.assert_called()
++        expected_dir = tmp_path / 'project'
++        fp.register([
++            'svn',
++            'checkout',
++            '-q',
++            'svn+https://svn.example/project',
++            expected_dir,
++        ])
+ 
+-        expected_dir = str(tmpdir / 'project')
+-        expected = (
+-            'svn checkout -q '
+-            'svn+https://svn.example/project {expected_dir}'
+-        ).format(**locals())
+-        os_system_mock.assert_called_once_with(expected)
++        with pytest.warns(UserWarning, match="SVN download support is deprecated"):
++            result = index.download(url, tmp_path)
+ 
++        assert result == str(expected_dir)
++        assert len(fp.calls) == 1
+ 
+ class TestContentCheckers:
+     def test_md5(self):
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index 5f2676a04a..0c0f1e9d81 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -12,6 +12,7 @@ SRC_URI += "\
     file://0001-change-shebang-to-python3.patch \
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
     file://0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch \
+    file://CVE-2024-6345.patch \
 "
 
 SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
-- 
2.40.0


