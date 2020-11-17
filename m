Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.50])
 by mx.groups.io with SMTP id smtpd.web12.4454.1605594452501298116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 22:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SGpCJvmt;
 spf=pass (domain: windriver.com, ip: 40.107.92.50, mailfrom: li.zhou@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoTjmFJDAygV6tKXVpCnvNikElUAzIAbNG6/9uyM8CHEwUjwnoOuuJqA1F0dqP7BcPFG2r+Dh1++EiMP0EMZreilpYpCAFgj9Ojjbl1/+e/6lKmPuO9DLCXGAIerS2OKH2NADRSxfv6jeM0gNcw1D/mrgQ9f1Aj+pdhQbEAaZP8OWvmpEOKuCmC+rZlUBcKzbSF1es/UCMAJ89mcz0dxCgfosAIprkVXMi0wV31CbYSfcHdgDvkRQrzl8s+COoYLJEhMEXoCQ3BYzqLbd4mI1NyXJV/YA1dAmIrquPiiEqkgWdX8hHMbUgw0E3cwdNCNCX97iuiEpdyaWkKDEDuTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPNXQye1c1/vTXkR8qZNqbKDYNLcssjs4VU+3m772G8=;
 b=Xn4c84Ksh/knQUfLvUxrE5KisjAOzAUesZcFDq3tgsFPYv18Xz0ypHoCpQU1tOa4GiEgpjxhpk7BAV/0wkfmHR29qMdkPtQ4QQ3pP+imk51KtBLduiTnx39iH00zJW7yPS1rKDQQEnik0hpIdZtnu1/0UjTAQwrcEnv+xBEF8OBk1ZadS/oiDFTSCNCGXBklBfqKf6F9IiKZWpAsU1AkbLNXa1SJnmFQTCYHauVgkxpkA5MA4XF5mpTXCt/CQgYh2UjaaC7nd/RrV5hTnGNmCTqnXKt3GlcMJdJVfv+QGvCIZ+VlTG1n4q6NmwIIHnU3tBhLR6SoZw0PeNp3rPbn5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPNXQye1c1/vTXkR8qZNqbKDYNLcssjs4VU+3m772G8=;
 b=SGpCJvmtHLd5M+3OLxaNr6DXVmSMx/9/lactovyIoxN69LjV4MAhTI/cOShcbs8p5CFzPGMbeWjcRSqTjkoYwLL8Qm2g0lwOJs2uxXMOibYQi2axENa5NqHvdPFpcr+gfmNarv5/9vMJ2nx8WZ1hZ0lKNhrFjmEDafMAqEbzL4A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14) by MWHPR11MB1373.namprd11.prod.outlook.com
 (2603:10b6:300:25::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 17 Nov
 2020 06:27:29 +0000
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::5936:ced6:9bda:1ab4]) by MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::5936:ced6:9bda:1ab4%5]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 06:27:29 +0000
From: "Li Zhou" <li.zhou@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe][zeus][PATCH] go: Security Advisory - go - CVE-2020-28366
Date: Tue, 17 Nov 2020 14:26:27 +0800
Message-Id: <1605594387-202135-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0046.apcprd03.prod.outlook.com
 (2603:1096:202:17::16) To MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14)
Return-Path: li.zhou@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp2.wrs.com (60.247.85.82) by HK2PR03CA0046.apcprd03.prod.outlook.com (2603:1096:202:17::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.12 via Frontend Transport; Tue, 17 Nov 2020 06:27:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bce17f88-79d4-49f9-a85b-08d88ac1db73
X-MS-TrafficTypeDiagnostic: MWHPR11MB1373:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1373D8DB68D213054FEBE19CF8E20@MWHPR11MB1373.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:451;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	urYrgxqMLgr579VvdjNUZoI5Xl2Nlg1nnvEEjukHa4W8SfG2NyOtuf855oibKU53x/CkW4e+hiW5xKMIbdecOXyZRQuuvcSW/s/gM1Coool/Lmt1IDH4CZeslr2vubQjSiXGM+YCdcORvwJ9cR1iLBJVLUphT9I+epm3L3WiwslsdLvQbcHCkTsuPxD16i2nYrkckZORlFafdPBiQQ1Lc2/eTmcTMhc1Cf2oCTevE8u8RzHqtNfcSC5yha7RUzdm0Gx8oX0MrpgI707eeWuHF0nMpkAS4kVrZQ6WPryqgLq+3ZLyzOXNWwjtcPTFufGKgFfxXVvPmLUwlJ6IaklvMef7hV0Ip/3tvL+SU0bAbf2AIRTAK07Tw35Rt1wpOMh9qqvrGLtM3dx3KiSS2fa5Qw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(136003)(346002)(396003)(376002)(15650500001)(8676002)(36756003)(86362001)(6512007)(6486002)(956004)(8936002)(6916009)(186003)(966005)(26005)(316002)(66476007)(6506007)(66556008)(2616005)(83380400001)(30864003)(44832011)(52116002)(2906002)(66946007)(478600001)(5660300002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ruhFJvAmRRi2U1pst7/8m1HrE5fZqt7czfEGFfZm4P+6sEOEjJXGqLKH9Q0nqjwK89GQjud11wS4ZXEBegog8JgKdn0yY30HbJ/dbzfAVabvbzA0ZyH6C5CeyTc/eprNIX4I3JjQHLicq8tYATHy6wmOrSah9vJhW5r54lctToIRyUhZ9PoqllzuG97/a37snPgB1S5BKZhydX5Eftdot0D2RjjQFjT8stOavu9zuU6azAZKjZpKbY8AgvNM1ulSNONtS7V13bT2WyJsUFjq/p//f7G3jNcQB1/LUOa5okbmsQ3uj9BeilH3x+1P4N40S6+9+fxkXG9YzCyHq0cBGqdg/HxEY9vB+ciYKrUGvfj0DM4ypAlIkUQM8wCf4lG91Jyj75IEvji8PmI8X1d0HL9w2bn4Bjw+mWAYODWq4WRQuYfY8LO4VESmDUaW1XfZNtxvrovvIhqA1t67ttVWKJvxenVyGCWTevqHuRNth+ZgsPG2ddVPc7zJ0jg4IUvyDGa+1bUQXkaigC23aABEhWVPllb9gplazeT6CDzoaCgjDlI3QnxpW0yc/8E5TtFv4NgUzOb1+VAyXmRTIOxaZnOZkI7q7p/V90ot8E4m9A36dE5EMfaLdHW0YprPVmn974SeylwoV/8jQVyERCprMQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce17f88-79d4-49f9-a85b-08d88ac1db73
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 06:27:29.0475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96mLo/07A5AeeS4aQnL8TdJft2EsQtFFrBY89oooAk+zPHwn9n5DmzFPfJDvNSiwBdXuoZsggbfX1cG360eiDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1373
Content-Type: text/plain

Backport commit from <https://github.com/golang/go/commit/
32159824698a82a174b60a6845e8494ae3243102> to solve CVE-2020-28366.
Adapted the patch to solve context issues.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/go/go-1.12.inc               |   1 +
 .../go/go-1.12/CVE-2020-28366.patch                | 410 +++++++++++++++++++++
 2 files changed, 411 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 2a0680a..ecf26c6 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -22,6 +22,7 @@ SRC_URI += "\
     file://CVE-2020-16845.patch \
     file://0001-net-http-cgi-rename-a-test-file-to-be-less-cute.patch \
     file://CVE-2020-24553.patch \
+    file://CVE-2020-28366.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
diff --git a/meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch b/meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch
new file mode 100644
index 0000000..bcc70ce
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch
@@ -0,0 +1,410 @@
+From 655749e7aff89bcee89d179b4cebdcfd770d1a8f Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Mon, 16 Nov 2020 09:15:51 +0000
+Subject: [PATCH] [release-branch.go1.15-security] cmd/go, cmd/cgo: don't let
+ bogus symbol set cgo_ldflag
+
+A hand-edited object file can have a symbol name that uses newline and
+other normally invalid characters. The cgo tool will generate Go files
+containing symbol names, unquoted. That can permit those symbol names
+to inject Go code into a cgo-generated file. If that Go code uses the
+//go:cgo_ldflag pragma, it can cause the C linker to run arbitrary
+code when building a package. If you build an imported package we
+permit arbitrary code at run time, but we don't want to permit it at
+package build time. This CL prevents this in two ways.
+
+In cgo, reject invalid symbols that contain non-printable or space
+characters, or that contain anything that looks like a Go comment.
+
+In the go tool, double check all //go:cgo_ldflag directives in
+generated code, to make sure they follow the existing LDFLAG restrictions.
+
+Thanks to Chris Brown and Tempus Ex for reporting this.
+
+Fixes CVE-2020-28366
+
+Change-Id: Ia1ad8f3791ea79612690fa7d26ac451d0f6df7c1
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/895832
+Reviewed-by: Than McIntosh <thanm@google.com>
+Reviewed-by: Cherry Zhang <cherryyz@google.com>
+(cherry picked from commit 6bc814dd2bbfeaafa41d314dd4cc591b575dfbf6)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/901056
+Reviewed-by: Filippo Valsorda <valsorda@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-28366
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ misc/cgo/errors/badsym_test.go   | 216 +++++++++++++++++++++++++++++++
+ src/cmd/cgo/out.go               |  24 ++++
+ src/cmd/go/internal/work/exec.go |  60 +++++++++
+ 3 files changed, 300 insertions(+)
+ create mode 100644 misc/cgo/errors/badsym_test.go
+
+diff --git a/misc/cgo/errors/badsym_test.go b/misc/cgo/errors/badsym_test.go
+new file mode 100644
+index 0000000..b2701bf
+--- /dev/null
++++ b/misc/cgo/errors/badsym_test.go
+@@ -0,0 +1,216 @@
++// Copyright 2020 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package errorstest
++
++import (
++	"bytes"
++	"io/ioutil"
++	"os"
++	"os/exec"
++	"path/filepath"
++	"strings"
++	"testing"
++	"unicode"
++)
++
++// A manually modified object file could pass unexpected characters
++// into the files generated by cgo.
++
++const magicInput = "abcdefghijklmnopqrstuvwxyz0123"
++const magicReplace = "\n//go:cgo_ldflag \"-badflag\"\n//"
++
++const cSymbol = "BadSymbol" + magicInput + "Name"
++const cDefSource = "int " + cSymbol + " = 1;"
++const cRefSource = "extern int " + cSymbol + "; int F() { return " + cSymbol + "; }"
++
++// goSource is the source code for the trivial Go file we use.
++// We will replace TMPDIR with the temporary directory name.
++const goSource = `
++package main
++
++// #cgo LDFLAGS: TMPDIR/cbad.o TMPDIR/cbad.so
++// extern int F();
++import "C"
++
++func main() {
++	println(C.F())
++}
++`
++
++func TestBadSymbol(t *testing.T) {
++	dir := t.TempDir()
++
++	mkdir := func(base string) string {
++		ret := filepath.Join(dir, base)
++		if err := os.Mkdir(ret, 0755); err != nil {
++			t.Fatal(err)
++		}
++		return ret
++	}
++
++	cdir := mkdir("c")
++	godir := mkdir("go")
++
++	makeFile := func(mdir, base, source string) string {
++		ret := filepath.Join(mdir, base)
++		if err := ioutil.WriteFile(ret, []byte(source), 0644); err != nil {
++			t.Fatal(err)
++		}
++		return ret
++	}
++
++	cDefFile := makeFile(cdir, "cdef.c", cDefSource)
++	cRefFile := makeFile(cdir, "cref.c", cRefSource)
++
++	ccCmd := cCompilerCmd(t)
++
++	cCompile := func(arg, base, src string) string {
++		out := filepath.Join(cdir, base)
++		run := append(ccCmd, arg, "-o", out, src)
++		output, err := exec.Command(run[0], run[1:]...).CombinedOutput()
++		if err != nil {
++			t.Log(run)
++			t.Logf("%s", output)
++			t.Fatal(err)
++		}
++		if err := os.Remove(src); err != nil {
++			t.Fatal(err)
++		}
++		return out
++	}
++
++	// Build a shared library that defines a symbol whose name
++	// contains magicInput.
++
++	cShared := cCompile("-shared", "c.so", cDefFile)
++
++	// Build an object file that refers to the symbol whose name
++	// contains magicInput.
++
++	cObj := cCompile("-c", "c.o", cRefFile)
++
++	// Rewrite the shared library and the object file, replacing
++	// magicInput with magicReplace. This will have the effect of
++	// introducing a symbol whose name looks like a cgo command.
++	// The cgo tool will use that name when it generates the
++	// _cgo_import.go file, thus smuggling a magic //go:cgo_ldflag
++	// pragma into a Go file. We used to not check the pragmas in
++	// _cgo_import.go.
++
++	rewrite := func(from, to string) {
++		obj, err := ioutil.ReadFile(from)
++		if err != nil {
++			t.Fatal(err)
++		}
++
++		if bytes.Count(obj, []byte(magicInput)) == 0 {
++			t.Fatalf("%s: did not find magic string", from)
++		}
++
++		if len(magicInput) != len(magicReplace) {
++			t.Fatalf("internal test error: different magic lengths: %d != %d", len(magicInput), len(magicReplace))
++		}
++
++		obj = bytes.ReplaceAll(obj, []byte(magicInput), []byte(magicReplace))
++
++		if err := ioutil.WriteFile(to, obj, 0644); err != nil {
++			t.Fatal(err)
++		}
++	}
++
++	cBadShared := filepath.Join(godir, "cbad.so")
++	rewrite(cShared, cBadShared)
++
++	cBadObj := filepath.Join(godir, "cbad.o")
++	rewrite(cObj, cBadObj)
++
++	goSourceBadObject := strings.ReplaceAll(goSource, "TMPDIR", godir)
++	makeFile(godir, "go.go", goSourceBadObject)
++
++	makeFile(godir, "go.mod", "module badsym")
++
++	// Try to build our little package.
++	cmd := exec.Command("go", "build", "-ldflags=-v")
++	cmd.Dir = godir
++	output, err := cmd.CombinedOutput()
++
++	// The build should fail, but we want it to fail because we
++	// detected the error, not because we passed a bad flag to the
++	// C linker.
++
++	if err == nil {
++		t.Errorf("go build succeeded unexpectedly")
++	}
++
++	t.Logf("%s", output)
++
++	for _, line := range bytes.Split(output, []byte("\n")) {
++		if bytes.Contains(line, []byte("dynamic symbol")) && bytes.Contains(line, []byte("contains unsupported character")) {
++			// This is the error from cgo.
++			continue
++		}
++
++		// We passed -ldflags=-v to see the external linker invocation,
++		// which should not include -badflag.
++		if bytes.Contains(line, []byte("-badflag")) {
++			t.Error("output should not mention -badflag")
++		}
++
++		// Also check for compiler errors, just in case.
++		// GCC says "unrecognized command line option".
++		// clang says "unknown argument".
++		if bytes.Contains(line, []byte("unrecognized")) || bytes.Contains(output, []byte("unknown")) {
++			t.Error("problem should have been caught before invoking C linker")
++		}
++	}
++}
++
++func cCompilerCmd(t *testing.T) []string {
++	cc := []string{goEnv(t, "CC")}
++
++	out := goEnv(t, "GOGCCFLAGS")
++	quote := '\000'
++	start := 0
++	lastSpace := true
++	backslash := false
++	s := string(out)
++	for i, c := range s {
++		if quote == '\000' && unicode.IsSpace(c) {
++			if !lastSpace {
++				cc = append(cc, s[start:i])
++				lastSpace = true
++			}
++		} else {
++			if lastSpace {
++				start = i
++				lastSpace = false
++			}
++			if quote == '\000' && !backslash && (c == '"' || c == '\'') {
++				quote = c
++				backslash = false
++			} else if !backslash && quote == c {
++				quote = '\000'
++			} else if (quote == '\000' || quote == '"') && !backslash && c == '\\' {
++				backslash = true
++			} else {
++				backslash = false
++			}
++		}
++	}
++	if !lastSpace {
++		cc = append(cc, s[start:])
++	}
++	return cc
++}
++
++func goEnv(t *testing.T, key string) string {
++	out, err := exec.Command("go", "env", key).CombinedOutput()
++	if err != nil {
++		t.Logf("go env %s\n", key)
++		t.Logf("%s", out)
++		t.Fatal(err)
++	}
++	return strings.TrimSpace(string(out))
++}
+diff --git a/src/cmd/cgo/out.go b/src/cmd/cgo/out.go
+index 0cf8b17..338cb82 100644
+--- a/src/cmd/cgo/out.go
++++ b/src/cmd/cgo/out.go
+@@ -22,6 +22,7 @@ import (
+ 	"regexp"
+ 	"sort"
+ 	"strings"
++	"unicode"
+ )
+ 
+ var (
+@@ -296,6 +297,8 @@ func dynimport(obj string) {
+ 			if s.Version != "" {
+ 				targ += "#" + s.Version
+ 			}
++			checkImportSymName(s.Name)
++			checkImportSymName(targ)
+ 			fmt.Fprintf(stdout, "//go:cgo_import_dynamic %s %s %q\n", s.Name, targ, s.Library)
+ 		}
+ 		lib, _ := f.ImportedLibraries()
+@@ -311,6 +314,7 @@ func dynimport(obj string) {
+ 			if len(s) > 0 && s[0] == '_' {
+ 				s = s[1:]
+ 			}
++			checkImportSymName(s)
+ 			fmt.Fprintf(stdout, "//go:cgo_import_dynamic %s %s %q\n", s, s, "")
+ 		}
+ 		lib, _ := f.ImportedLibraries()
+@@ -325,6 +329,8 @@ func dynimport(obj string) {
+ 		for _, s := range sym {
+ 			ss := strings.Split(s, ":")
+ 			name := strings.Split(ss[0], "@")[0]
++			checkImportSymName(name)
++			checkImportSymName(ss[0])
+ 			fmt.Fprintf(stdout, "//go:cgo_import_dynamic %s %s %q\n", name, ss[0], strings.ToLower(ss[1]))
+ 		}
+ 		return
+@@ -336,6 +342,7 @@ func dynimport(obj string) {
+ 			fatalf("cannot load imported symbols from XCOFF file %s: %v", obj, err)
+ 		}
+ 		for _, s := range sym {
++			checkImportSymName(s.Name)
+ 			fmt.Fprintf(stdout, "//go:cgo_import_dynamic %s %s %q\n", s.Name, s.Name, s.Library)
+ 		}
+ 		lib, err := f.ImportedLibraries()
+@@ -351,6 +358,23 @@ func dynimport(obj string) {
+ 	fatalf("cannot parse %s as ELF, Mach-O, PE or XCOFF", obj)
+ }
+ 
++// checkImportSymName checks a symbol name we are going to emit as part
++// of a //go:cgo_import_dynamic pragma. These names come from object
++// files, so they may be corrupt. We are going to emit them unquoted,
++// so while they don't need to be valid symbol names (and in some cases,
++// involving symbol versions, they won't be) they must contain only
++// graphic characters and must not contain Go comments.
++func checkImportSymName(s string) {
++	for _, c := range s {
++		if !unicode.IsGraphic(c) || unicode.IsSpace(c) {
++			fatalf("dynamic symbol %q contains unsupported character", s)
++		}
++	}
++	if strings.Index(s, "//") >= 0 || strings.Index(s, "/*") >= 0 {
++		fatalf("dynamic symbol %q contains Go comment")
++	}
++}
++
+ // Construct a gcc struct matching the gc argument frame.
+ // Assumes that in gcc, char is 1 byte, short 2 bytes, int 4 bytes, long long 8 bytes.
+ // These assumptions are checked by the gccProlog.
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 3f7e51e..aab093c 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -2638,6 +2638,66 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
+ 		noCompiler()
+ 	}
+ 
++	// Double check the //go:cgo_ldflag comments in the generated files.
++	// The compiler only permits such comments in files whose base name
++	// starts with "_cgo_". Make sure that the comments in those files
++	// are safe. This is a backstop against people somehow smuggling
++	// such a comment into a file generated by cgo.
++	if cfg.BuildToolchainName == "gc" && !cfg.BuildN {
++		var flags []string
++		for _, f := range outGo {
++			if !strings.HasPrefix(filepath.Base(f), "_cgo_") {
++				continue
++			}
++
++			src, err := ioutil.ReadFile(f)
++			if err != nil {
++				return nil, nil, err
++			}
++
++			const cgoLdflag = "//go:cgo_ldflag"
++			idx := bytes.Index(src, []byte(cgoLdflag))
++			for idx >= 0 {
++				// We are looking at //go:cgo_ldflag.
++				// Find start of line.
++				start := bytes.LastIndex(src[:idx], []byte("\n"))
++				if start == -1 {
++					start = 0
++				}
++
++				// Find end of line.
++				end := bytes.Index(src[idx:], []byte("\n"))
++				if end == -1 {
++					end = len(src)
++				} else {
++					end += idx
++				}
++
++				// Check for first line comment in line.
++				// We don't worry about /* */ comments,
++				// which normally won't appear in files
++				// generated by cgo.
++				commentStart := bytes.Index(src[start:], []byte("//"))
++				commentStart += start
++				// If that line comment is //go:cgo_ldflag,
++				// it's a match.
++				if bytes.HasPrefix(src[commentStart:], []byte(cgoLdflag)) {
++					// Pull out the flag, and unquote it.
++					// This is what the compiler does.
++					flag := string(src[idx+len(cgoLdflag) : end])
++					flag = strings.TrimSpace(flag)
++					flag = strings.Trim(flag, `"`)
++					flags = append(flags, flag)
++				}
++				src = src[end:]
++				idx = bytes.Index(src, []byte(cgoLdflag))
++			}
++		}
++		if err := checkLinkerFlags("LDFLAGS", "go:cgo_ldflag", flags); err != nil {
++			return nil, nil, err
++		}
++	}
++
+ 	return outGo, outObj, nil
+ }
+ 
+-- 
+2.23.0
+
-- 
1.9.1

