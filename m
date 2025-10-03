Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00ACCAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 21:30:05 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.1788.1759527004174303750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 14:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WpUmXNcA;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b48d8deafaeso530854466b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 14:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759527002; x=1760131802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxmIu8T0cnFBh+2OS8AWS6LcVt87zwKQ/PQfB+y29RI=;
        b=WpUmXNcAw0jjql4bQd1u2RiDfB8AjmflPnIRpMazOA3cMHVSJ9cF0P+ezZ5z4vZrY9
         cYAtJE3P9rx1w2Mx0iehWVy2Yjz0kCzH4Cb1uBUpP1CdERLR9Mkt1lAJ68/PVPd4ev1d
         WXsbHM8rWJOgU1/nWpZiyNam3uX2Dpvmtn42awbpqLnm4giT2tuhMLebt6Z6HYK55X7Q
         iijGoa0Rp4RyIs1Rg90/tpg2cErOT+8StOZv3/FBNZy6FSERWqN2ssGD6H7T+YoU8fh1
         1b3hErgL1W5KKWjLj2x8Ir7N8wzSBxfnoA7yEv1M+8NgvRbQ24xbZEALi2Pbkpozfu9t
         irmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527002; x=1760131802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxmIu8T0cnFBh+2OS8AWS6LcVt87zwKQ/PQfB+y29RI=;
        b=bz/7cF3bsMqXO/d/qaixixQZUk5waQtZVxKOSVNhtlOnKiDP8bQwk1UQ9pi8Q9AZL2
         5QL5GLoBCSF0QBaBMk5hHLhrVIBBBhX+u3052k7JYoR6KdmyVia4r17sO/3ARevp7QQX
         WHhARFoDen7ez0XfCt3z9EgNAcCUSMkxEkOWxRw3gBI5elidXSSeAGyFQuImbIn7egET
         rZ61RK5Kgly+y6EaIOprO3+zMJY6y0bSW2lq0RrZxM04mHx/DZYfCoXvaNC/0llzBI3H
         adFFfC1kzU8DkRMrbGYZMpMnW9MfUzbKLAfyDMLP54BG0Lx3chgwFeiDLFBD6B12qxAr
         TQEw==
X-Gm-Message-State: AOJu0YwmsPu8qFGhkn9Tugfdd/KwWl0jfC1wKTPvVNMh5JDvOJP6ESWX
	V5AttM6wPN8X8b/W+juAhq0e0Hl5ATN6MtYhHcPR2PlTRdmFiSowvEX/H9I2gA==
X-Gm-Gg: ASbGncuz/wzlHvHBShJXWrua+kyY9yqGeDSinKK015gLjzUwkGGkcKiVkcuq4mDhwhS
	QAtn9G125DDfVLKrbsxH9sBpzcpwdcDKH8xT7OBim45gAFzc85F8+bJLIOejMV7JILD6XdS6bKm
	4UkhJiEIw0QI+mgyBpLEv2fCmGPol4KwMKY75SDtCJcVxfsBEZj6L/r1K+uaGtDHrv2BXlPl5BU
	K1sMnqaCeaCYqF4/rNrncLrlFlZbg9pQ9eDvbxDMmwOAZiKq4eRuK5YsjQlxtf02gdeF3+sYdcU
	5q4x86TUxgeEQZnRynqKrHsBxszlRVfe1PIFdQMl0I1pw7Aoe2c3BPEn09Dt17AFMGLkfQBDZCn
	llTgkwKOmJKS7J25Ii18UVAplq5Vqq5QuYW4BJTTbbQi3+nGTvv+5Sesc0Lw7U04Sog==
X-Google-Smtp-Source: AGHT+IG4ExhW116nyPWfaHskPFGOMHiYKozewd5rZ4zmVZiwjB66Ur1bKvCzJaOWlBM/fYfdASepYA==
X-Received: by 2002:a17:906:4fce:b0:b40:98b1:7457 with SMTP id a640c23a62f3a-b49c4cde268mr457577266b.47.1759527002311;
        Fri, 03 Oct 2025 14:30:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2basm530363466b.51.2025.10.03.14.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:30:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [RFC PATCH] cargo_common.bbclass: use source replacement instead of dependency patching
Date: Fri,  3 Oct 2025 23:30:00 +0200
Message-ID: <20251003213000.2256939-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 21:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224426

Cargo.toml files usually contain a list of dependencies in one of two forms:
either a crate name that can be fetched from some registry (like crates.io), or
as a source crate, which is most often fetched from a git repository.

Normally cargo handles fetching the crates from both the registry and from git,
however with Yocto this task is taken over by Bitbake.

After fetching these crates, they are made available to cargo by adding the location
to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
that can be found in the SRC_URI is added as one source crate.

This works most of the time, as long as the repository really contains one crate only.

However in case the repository is a cargo workspace, it contains multiple crates in
different subfolders, and in order to allow cargo to process them, they need to be
listed separately. This is not happening with the current implementation of cargo_common.

This change introduces the following:
- instead of patching the dependencies, use source replacement (the primary motivation for
  this was that maturin seems to ignore source crate patches from config.toml)
- the above also allows to keep the original Cargo.lock untouched (the original implementation
  deleted git repository lines from it)
- it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
  the separate crate folders are copied into this folder, and it is used as the central
  vendoring folder. This is needed for source replacements: the folder that is used for
  vendoring needs to contain the crates separately, one crate in one folder. Each folder
  has the name of the crate that it contains. Workspaces are not included here (unless the
  given manifest is a workspace AND a package at once)
- previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
  to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
  Having destsuffix is still mandatory though.

The change does not handle nested workspaces, only the top level Cargo.toml is processed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Tom Geelen <t.f.g.geelen@gmail.com>

---
 meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
 1 file changed, 108 insertions(+), 50 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index c9eb2d09a5..79c1351298 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -129,6 +129,44 @@ cargo_common_do_configure () {
 python cargo_common_do_patch_paths() {
     import shutil
 
+    def is_rust_crate_folder(path):
+        cargo_toml_path = os.path.join(path, 'Cargo.toml')
+        return os.path.exists(cargo_toml_path)
+
+    def load_toml_file(toml_path):
+        import tomllib
+        with open(toml_path, 'rb') as f:
+            toml = tomllib.load(f)
+        return toml
+
+    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
+        for lf_repo in lockfile_repos.keys():
+            if repo in lf_repo and lf_repo.endswith(revision):
+                lockfile_repos[lf_repo] = True
+                return lf_repo.split("#")[0]
+        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
+
+    def create_cargo_checksum(folder_path):
+        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
+        if os.path.exists(checksum_path):
+            return
+
+        import hashlib, json
+
+        checksum = {'files': {}}
+        for root, _, files in os.walk(folder_path):
+            for f in files:
+                full_path = os.path.join(root, f)
+                relative_path = os.path.relpath(full_path, folder_path)
+                if relative_path.startswith(".git/"):
+                    continue
+                with open(full_path, 'rb') as f2:
+                    file_sha = hashlib.sha256(f2.read()).hexdigest()
+                checksum["files"][relative_path] = file_sha
+
+        with open(checksum_path, 'w') as f:
+            json.dump(checksum, f)
+
     cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
     if not os.path.exists(cargo_config):
         return
@@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
     if len(src_uri) == 0:
         return
 
-    patches = dict()
+    lockfile = d.getVar("CARGO_LOCK_PATH")
+    if not os.path.exists(lockfile):
+        bb.fatal(f"{lockfile} file doesn't exist")
+
+    lockfile = load_toml_file(lockfile)
+
+    # key is the repo url, value is a boolean, which is used later
+    # to indicate if there is a matching repository in SRC_URI also
+    lockfile_git_repos = {}
+    for p in lockfile['package']:
+        if 'source' in p and p['source'].startswith('git+'):
+            lockfile_git_repos[p['source']] = False
+
+    sources = dict()
     workdir = d.getVar('UNPACKDIR')
     fetcher = bb.fetch2.Fetch(src_uri, d)
+
+    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
+
+    os.makedirs(vendor_folder)
+
     for url in fetcher.urls:
         ud = fetcher.ud[url]
-        if ud.type == 'git' or ud.type == 'gitsm':
-            name = ud.parm.get('name')
-            destsuffix = ud.parm.get('destsuffix')
-            if name is not None and destsuffix is not None:
-                if ud.user:
-                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
-                else:
-                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
-                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
-                patches.setdefault(repo, []).append(path)
+        if ud.type != 'git' and ud.type != 'gitsm':
+            continue
 
-    with open(cargo_config, "a+") as config:
-        for k, v in patches.items():
-            print('\n[patch."%s"]' % k, file=config)
-            for name in v:
-                print(name, file=config)
+        destsuffix = ud.parm.get('destsuffix')
+        crate_folder = os.path.join(workdir, destsuffix)
 
-    if not patches:
-        return
+        if destsuffix is None or not is_rust_crate_folder(crate_folder):
+            continue
 
-    # Cargo.lock file is needed for to be sure that artifacts
-    # downloaded by the fetch steps are those expected by the
-    # project and that the possible patches are correctly applied.
-    # Moreover since we do not want any modification
-    # of this file (for reproducibility purpose), we prevent it by
-    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
-    # here is better than letting cargo tell (in case the file is missing)
-    # "Cargo.lock should be modified but --frozen was given"
+        if ud.user:
+            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
+        else:
+            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
 
-    lockfile = d.getVar("CARGO_LOCK_PATH")
-    if not os.path.exists(lockfile):
-        bb.fatal(f"{lockfile} file doesn't exist")
+        sources[destsuffix] = (repo, ud.revision, crate_folder)
+
+        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
+        cargo_toml = load_toml_file(cargo_toml_path)
+
+        if 'workspace' in cargo_toml:
+            members = cargo_toml['workspace']['members']
+            for member in members:
+                member_crate_folder = os.path.join(workdir, destsuffix, member)
+                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
+                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
+                member_crate_name = member_cargo_toml['package']['name']
+                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
+
+        if 'package' in cargo_toml:
+            crate_folder = os.path.join(workdir, destsuffix)
+            crate_name = cargo_toml['package']['name']
+            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
+
+    for d in os.scandir(vendor_folder):
+        if d.is_dir():
+            create_cargo_checksum(d.path)
+
+
+    with open(cargo_config, "a+") as config:
+        print('\n[source."yocto-vendored-sources"]', file=config)
+        print('directory = "%s"' % vendor_folder, file=config)
+
+        for destsuffix, (repo, revision, repo_path) in sources.items():
+            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
+            print('\n[source."%s"]' % lockfile_repo, file=config)
+            print('git = "%s"' % repo, file=config)
+            print('rev = "%s"' % revision, file=config)
+            print('replace-with = "yocto-vendored-sources"', file=config)
+
+    # check if there are any git repos in the lock file that were not visited
+    # in the previous loop, when the source replacement was created, and warn about it
+    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
+        if not found_in_src_uri:
+            bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
 
-    # There are patched files and so Cargo.lock should be modified but we use
-    # --frozen so let's handle that modifications here.
-    #
-    # Note that a "better" (more elegant ?) would have been to use cargo update for
-    # patched packages:
-    #  cargo update --offline -p package_1 -p package_2
-    # But this is not possible since it requires that cargo local git db
-    # to be populated and this is not the case as we fetch git repo ourself.
-
-    lockfile_orig = lockfile + ".orig"
-    if not os.path.exists(lockfile_orig):
-        shutil.copy(lockfile, lockfile_orig)
-
-    newlines = []
-    with open(lockfile_orig, "r") as f:
-        for line in f.readlines():
-            if not line.startswith("source = \"git"):
-                newlines.append(line)
-
-    with open(lockfile, "w") as f:
-        f.writelines(newlines)
 }
+
 do_configure[postfuncs] += "cargo_common_do_patch_paths"
 
 do_compile:prepend () {

