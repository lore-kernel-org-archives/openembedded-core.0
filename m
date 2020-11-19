Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.78])
 by mx.groups.io with SMTP id smtpd.web11.3007.1605748693523068610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 17:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LmuSXsiw;
 spf=pass (domain: windriver.com, ip: 40.107.94.78, mailfrom: li.zhou@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGF+AQKhLm4VBqTHzRJMPWyQl5Dzsv5t1JoZlGGTTrWDktY1HfYl3V232u25alhF5KX/DmEavyJwv4Evw6LXBXI9trWN1dhMYeIMPdDvYexZW71ok6x8yfGlgaaWrc1uSMOmCwGO2NKjvr5vgzog9Hoy4OFAffHRRUNxVfGsekBBSg4VQkbcIW11kpmZvK16QO9zfRDfrbzTqBvdlADR4KEXDxS+hPAAn2sH72EBR7iCFF/1rJxZ6cPz5QuUAJMVYXGGNhjWgHrQ6m7OS1le38RdMd3BqBfgn2ohTYu0WNnS/2lzGp/Tiu0cG7XjARm0TAwrESML2VtSMadO5W3Diw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N357N7/13fR9IIhN422i+7mg+Q3H+IkpxJp7ChWMdG0=;
 b=d7QopEvfFaCW8dDww2mh1LxH6bPcewiWftTltpf05OEhpJYg6AVz5XiAUwzIzOdx3hdse6Vbr0nNwoFVlJCZ7iPpo0kJGinVGO8uvQJo/DAWXO0h1ikzU/iZEW+9sUz2ffukQnVcUjqXxssh1kZyekWNzlZMMmfGKfm1cpwRM5MoOKlMK0OVNNiGinApNT+NvVrSoGbREadFd3MksVlr+fRbVG4LA/F4wPmisXgG8ZbtbmgRfRebRWTqgoJnogCr9LEt5v6qqBkc4szSTG/scUMK4VXM75NUh3C++IyBTKdeSWvSXkB/WzLyWmtktWDIUJa44XFbjbBmFCvMAF4ZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N357N7/13fR9IIhN422i+7mg+Q3H+IkpxJp7ChWMdG0=;
 b=LmuSXsiwa2OKTX1n//g4/oYOkYdTfQua26q7RY4ydymyTI6UMaGNFvlPkchb2RE3Q3yL+Goge5JQerLaZfjBOnoqWKeq6J7mqjQfi1FYJ7qdoMOZbBsFoogHfoDuLyaWzDb11Qy4v+bHNJd4iB0+/VyztGfKJpQs8pBKNJ+Y6Tc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14) by MWHPR11MB1264.namprd11.prod.outlook.com
 (2603:10b6:300:27::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 01:18:10 +0000
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::5936:ced6:9bda:1ab4]) by MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::5936:ced6:9bda:1ab4%5]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 01:18:09 +0000
Subject: Re: [OE-core] [oe][zeus][PATCH] go: Security Advisory - go - CVE-2020-28366
To: openembedded-core@lists.openembedded.org
References: <164837A6030793E3.5807@lists.openembedded.org>
From: "Li Zhou" <li.zhou@windriver.com>
Message-ID: <f68bb979-a692-7885-891d-b8af3daa2851@windriver.com>
Date: Thu, 19 Nov 2020 09:17:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
In-Reply-To: <164837A6030793E3.5807@lists.openembedded.org>
X-Originating-IP: [147.11.103.217]
X-ClientProxiedBy: HK2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:202:2e::13) To MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14)
Return-Path: li.zhou@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [0.0.0.0] (147.11.103.217) by HK2PR06CA0001.apcprd06.prod.outlook.com (2603:1096:202:2e::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 01:18:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64248807-b455-48f8-d817-08d88c28f9a6
X-MS-TrafficTypeDiagnostic: MWHPR11MB1264:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB126476197E883EF4E6F138EFF8E00@MWHPR11MB1264.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lr00Gha7mS3rhYheNy6upnu54yxPjMm6EYy/NdhgQWVsaW593YCPFYwwTxO33WHTnB/mUNpMLIpfxHAyh65JMKxeQclpzQarFzztWav6Ol1eFCdcFplTNli2CgCKBkFrNvfN9I9LGs2svP3LU0kCXWJijCGlGdrzySfbtoq+lQikDUJWKSMwuTs+gD0oLo53wh90RBRFoGNPFtExpbBFD8MPi49LlFpgCZfoAVs00yUfdihFP27LXOKxht5kXpDf8Cnq3zG0HDZl6j1essFcy6/xeDA+H6X2r8ZND9iLTEXPSq49TaxX+xoKksWjORVXpH87u9pziBhjOBS9R/nZBjCxgw+RZX7hxcbzZSoDKYkmHvrTdgMap/nTgbbLplWYEerJMXs4zqzp6SOLbNJAzfFwNRl5bqF9dijZu5u93pBFlAU/AbczVQOCQap9jRC0FHOMfkpkdlhBE4Pmhez1YB8RZUjNgkplLMkBqSigKFM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(66556008)(956004)(6666004)(2616005)(966005)(8676002)(478600001)(31696002)(83380400001)(16526019)(166002)(6486002)(66946007)(53546011)(31686004)(8936002)(33964004)(26005)(66476007)(186003)(30864003)(15650500001)(52116002)(36756003)(2906002)(6706004)(86362001)(6916009)(316002)(16576012)(5660300002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Y5HVqTr3DrtUZZtuVmrZQ3vNm3fYlN9vSz3loOoitXO7ZCJtBACIjMpld4UTU4ge4ZN4q5sYHR0affItE2UryFNyUCIIio6HBTRiUvWw/7y8zjbi9z+8FMUOT/6anTxWRFgi2KDNL6O4jDPHv9X8qUGNYRM7dHV+QFOh884FlcS6lycsbpRZEApDHaXS4Qo9/luF0RvdHRLv0wHKhimx9DpzWT4hf3kI2Nbd3gmX3qGqdtqOccZfrJcgnAkIS1jyQpwYfalJM5Exnj5sPTRz6b1pgtUSwOwoexTgyPr0PC6Y4vYTnnb/Ysa3QsHYgnjHCf+fv1VvqinfmAFYMmYtDUPoUx5ph7b+DZx6H5MThwVxWPouHlnrAYnjE/2czyzIBtO9iz0v0xEkxg3pM1s075JoQ6Cscur+WQNdQ0Ro5bVaDQkrmdNCL0FulTnvhaihzMcMQpNtd+m+aKRnnoIUl9XMex1utfwqP9opCQbFa3GYA7jUdlXqG5r5NZijcSENhWMXh13PzoCuMho5XLLBFMY1VQA7XK0+nzf6OzNkOnTEUuBf+HWYnLTgyOK7FMIbSHugpOVYJE2Kv8GRwPBGzI58351+jYV6s24OtESv+VGttzcmm/SfzeOlNckeyUAObKtubujohSLqC3O4ULkS/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64248807-b455-48f8-d817-08d88c28f9a6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 01:18:09.7012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWzTKGLKuiA8lRdfBfLFDjmjbEiUcfBK2MKQPBeN/tqn6h5kw17AHucN4zEWJ81gaC/rOSbKsNYy4jEbxLPdpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1264
Content-Type: multipart/alternative;
 boundary="------------22AEA44B206DE312155C7C30"
Content-Language: en-US

--------------22AEA44B206DE312155C7C30
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Please omit this patch. Thank you.

On 11/17/20 2:26 PM, Li Zhou wrote:
> Backport commit from <https://github.com/golang/go/commit/
> 32159824698a82a174b60a6845e8494ae3243102> to solve CVE-2020-28366.
> Adapted the patch to solve context issues.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>   meta/recipes-devtools/go/go-1.12.inc               |   1 +
>   .../go/go-1.12/CVE-2020-28366.patch                | 410 +++++++++++++++++++++
>   2 files changed, 411 insertions(+)
>   create mode 100644 meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
> index 2a0680a..ecf26c6 100644
> --- a/meta/recipes-devtools/go/go-1.12.inc
> +++ b/meta/recipes-devtools/go/go-1.12.inc
> @@ -22,6 +22,7 @@ SRC_URI += "\
>       file://CVE-2020-16845.patch \
>       file://0001-net-http-cgi-rename-a-test-file-to-be-less-cute.patch \
>       file://CVE-2020-24553.patch \
> +    file://CVE-2020-28366.patch \
>   "
>   SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
>   
> diff --git a/meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch b/meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch
> new file mode 100644
> index 0000000..bcc70ce
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch
> @@ -0,0 +1,410 @@
> +From 655749e7aff89bcee89d179b4cebdcfd770d1a8f Mon Sep 17 00:00:00 2001
> +From: Li Zhou <li.zhou@windriver.com>
> +Date: Mon, 16 Nov 2020 09:15:51 +0000
> +Subject: [PATCH] [release-branch.go1.15-security] cmd/go, cmd/cgo: don't let
> + bogus symbol set cgo_ldflag
> +
> +A hand-edited object file can have a symbol name that uses newline and
> +other normally invalid characters. The cgo tool will generate Go files
> +containing symbol names, unquoted. That can permit those symbol names
> +to inject Go code into a cgo-generated file. If that Go code uses the
> +//go:cgo_ldflag pragma, it can cause the C linker to run arbitrary
> +code when building a package. If you build an imported package we
> +permit arbitrary code at run time, but we don't want to permit it at
> +package build time. This CL prevents this in two ways.
> +
> +In cgo, reject invalid symbols that contain non-printable or space
> +characters, or that contain anything that looks like a Go comment.
> +
> +In the go tool, double check all //go:cgo_ldflag directives in
> +generated code, to make sure they follow the existing LDFLAG restrictions.
> +
> +Thanks to Chris Brown and Tempus Ex for reporting this.
> +
> +Fixes CVE-2020-28366
> +
> +Change-Id: Ia1ad8f3791ea79612690fa7d26ac451d0f6df7c1
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/895832
> +Reviewed-by: Than McIntosh <thanm@google.com>
> +Reviewed-by: Cherry Zhang <cherryyz@google.com>
> +(cherry picked from commit 6bc814dd2bbfeaafa41d314dd4cc591b575dfbf6)
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/901056
> +Reviewed-by: Filippo Valsorda <valsorda@google.com>
> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2020-28366
> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +---
> + misc/cgo/errors/badsym_test.go   | 216 +++++++++++++++++++++++++++++++
> + src/cmd/cgo/out.go               |  24 ++++
> + src/cmd/go/internal/work/exec.go |  60 +++++++++
> + 3 files changed, 300 insertions(+)
> + create mode 100644 misc/cgo/errors/badsym_test.go
> +
> +diff --git a/misc/cgo/errors/badsym_test.go b/misc/cgo/errors/badsym_test.go
> +new file mode 100644
> +index 0000000..b2701bf
> +--- /dev/null
> ++++ b/misc/cgo/errors/badsym_test.go
> +@@ -0,0 +1,216 @@
> ++// Copyright 2020 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++package errorstest
> ++
> ++import (
> ++	"bytes"
> ++	"io/ioutil"
> ++	"os"
> ++	"os/exec"
> ++	"path/filepath"
> ++	"strings"
> ++	"testing"
> ++	"unicode"
> ++)
> ++
> ++// A manually modified object file could pass unexpected characters
> ++// into the files generated by cgo.
> ++
> ++const magicInput = "abcdefghijklmnopqrstuvwxyz0123"
> ++const magicReplace = "\n//go:cgo_ldflag \"-badflag\"\n//"
> ++
> ++const cSymbol = "BadSymbol" + magicInput + "Name"
> ++const cDefSource = "int " + cSymbol + " = 1;"
> ++const cRefSource = "extern int " + cSymbol + "; int F() { return " + cSymbol + "; }"
> ++
> ++// goSource is the source code for the trivial Go file we use.
> ++// We will replace TMPDIR with the temporary directory name.
> ++const goSource = `
> ++package main
> ++
> ++// #cgo LDFLAGS: TMPDIR/cbad.o TMPDIR/cbad.so
> ++// extern int F();
> ++import "C"
> ++
> ++func main() {
> ++	println(C.F())
> ++}
> ++`
> ++
> ++func TestBadSymbol(t *testing.T) {
> ++	dir := t.TempDir()
> ++
> ++	mkdir := func(base string) string {
> ++		ret := filepath.Join(dir, base)
> ++		if err := os.Mkdir(ret, 0755); err != nil {
> ++			t.Fatal(err)
> ++		}
> ++		return ret
> ++	}
> ++
> ++	cdir := mkdir("c")
> ++	godir := mkdir("go")
> ++
> ++	makeFile := func(mdir, base, source string) string {
> ++		ret := filepath.Join(mdir, base)
> ++		if err := ioutil.WriteFile(ret, []byte(source), 0644); err != nil {
> ++			t.Fatal(err)
> ++		}
> ++		return ret
> ++	}
> ++
> ++	cDefFile := makeFile(cdir, "cdef.c", cDefSource)
> ++	cRefFile := makeFile(cdir, "cref.c", cRefSource)
> ++
> ++	ccCmd := cCompilerCmd(t)
> ++
> ++	cCompile := func(arg, base, src string) string {
> ++		out := filepath.Join(cdir, base)
> ++		run := append(ccCmd, arg, "-o", out, src)
> ++		output, err := exec.Command(run[0], run[1:]...).CombinedOutput()
> ++		if err != nil {
> ++			t.Log(run)
> ++			t.Logf("%s", output)
> ++			t.Fatal(err)
> ++		}
> ++		if err := os.Remove(src); err != nil {
> ++			t.Fatal(err)
> ++		}
> ++		return out
> ++	}
> ++
> ++	// Build a shared library that defines a symbol whose name
> ++	// contains magicInput.
> ++
> ++	cShared := cCompile("-shared", "c.so", cDefFile)
> ++
> ++	// Build an object file that refers to the symbol whose name
> ++	// contains magicInput.
> ++
> ++	cObj := cCompile("-c", "c.o", cRefFile)
> ++
> ++	// Rewrite the shared library and the object file, replacing
> ++	// magicInput with magicReplace. This will have the effect of
> ++	// introducing a symbol whose name looks like a cgo command.
> ++	// The cgo tool will use that name when it generates the
> ++	// _cgo_import.go file, thus smuggling a magic //go:cgo_ldflag
> ++	// pragma into a Go file. We used to not check the pragmas in
> ++	// _cgo_import.go.
> ++
> ++	rewrite := func(from, to string) {
> ++		obj, err := ioutil.ReadFile(from)
> ++		if err != nil {
> ++			t.Fatal(err)
> ++		}
> ++
> ++		if bytes.Count(obj, []byte(magicInput)) == 0 {
> ++			t.Fatalf("%s: did not find magic string", from)
> ++		}
> ++
> ++		if len(magicInput) != len(magicReplace) {
> ++			t.Fatalf("internal test error: different magic lengths: %d != %d", len(magicInput), len(magicReplace))
> ++		}
> ++
> ++		obj = bytes.ReplaceAll(obj, []byte(magicInput), []byte(magicReplace))
> ++
> ++		if err := ioutil.WriteFile(to, obj, 0644); err != nil {
> ++			t.Fatal(err)
> ++		}
> ++	}
> ++
> ++	cBadShared := filepath.Join(godir, "cbad.so")
> ++	rewrite(cShared, cBadShared)
> ++
> ++	cBadObj := filepath.Join(godir, "cbad.o")
> ++	rewrite(cObj, cBadObj)
> ++
> ++	goSourceBadObject := strings.ReplaceAll(goSource, "TMPDIR", godir)
> ++	makeFile(godir, "go.go", goSourceBadObject)
> ++
> ++	makeFile(godir, "go.mod", "module badsym")
> ++
> ++	// Try to build our little package.
> ++	cmd := exec.Command("go", "build", "-ldflags=-v")
> ++	cmd.Dir = godir
> ++	output, err := cmd.CombinedOutput()
> ++
> ++	// The build should fail, but we want it to fail because we
> ++	// detected the error, not because we passed a bad flag to the
> ++	// C linker.
> ++
> ++	if err == nil {
> ++		t.Errorf("go build succeeded unexpectedly")
> ++	}
> ++
> ++	t.Logf("%s", output)
> ++
> ++	for _, line := range bytes.Split(output, []byte("\n")) {
> ++		if bytes.Contains(line, []byte("dynamic symbol")) && bytes.Contains(line, []byte("contains unsupported character")) {
> ++			// This is the error from cgo.
> ++			continue
> ++		}
> ++
> ++		// We passed -ldflags=-v to see the external linker invocation,
> ++		// which should not include -badflag.
> ++		if bytes.Contains(line, []byte("-badflag")) {
> ++			t.Error("output should not mention -badflag")
> ++		}
> ++
> ++		// Also check for compiler errors, just in case.
> ++		// GCC says "unrecognized command line option".
> ++		// clang says "unknown argument".
> ++		if bytes.Contains(line, []byte("unrecognized")) || bytes.Contains(output, []byte("unknown")) {
> ++			t.Error("problem should have been caught before invoking C linker")
> ++		}
> ++	}
> ++}
> ++
> ++func cCompilerCmd(t *testing.T) []string {
> ++	cc := []string{goEnv(t, "CC")}
> ++
> ++	out := goEnv(t, "GOGCCFLAGS")
> ++	quote := '\000'
> ++	start := 0
> ++	lastSpace := true
> ++	backslash := false
> ++	s := string(out)
> ++	for i, c := range s {
> ++		if quote == '\000' && unicode.IsSpace(c) {
> ++			if !lastSpace {
> ++				cc = append(cc, s[start:i])
> ++				lastSpace = true
> ++			}
> ++		} else {
> ++			if lastSpace {
> ++				start = i
> ++				lastSpace = false
> ++			}
> ++			if quote == '\000' && !backslash && (c == '"' || c == '\'') {
> ++				quote = c
> ++				backslash = false
> ++			} else if !backslash && quote == c {
> ++				quote = '\000'
> ++			} else if (quote == '\000' || quote == '"') && !backslash && c == '\\' {
> ++				backslash = true
> ++			} else {
> ++				backslash = false
> ++			}
> ++		}
> ++	}
> ++	if !lastSpace {
> ++		cc = append(cc, s[start:])
> ++	}
> ++	return cc
> ++}
> ++
> ++func goEnv(t *testing.T, key string) string {
> ++	out, err := exec.Command("go", "env", key).CombinedOutput()
> ++	if err != nil {
> ++		t.Logf("go env %s\n", key)
> ++		t.Logf("%s", out)
> ++		t.Fatal(err)
> ++	}
> ++	return strings.TrimSpace(string(out))
> ++}
> +diff --git a/src/cmd/cgo/out.go b/src/cmd/cgo/out.go
> +index 0cf8b17..338cb82 100644
> +--- a/src/cmd/cgo/out.go
> ++++ b/src/cmd/cgo/out.go
> +@@ -22,6 +22,7 @@ import (
> + 	"regexp"
> + 	"sort"
> + 	"strings"
> ++	"unicode"
> + )
> +
> + var (
> +@@ -296,6 +297,8 @@ func dynimport(obj string) {
> + 			if s.Version != "" {
> + 				targ += "#" + s.Version
> + 			}
> ++			checkImportSymName(s.Name)
> ++			checkImportSymName(targ)
> + 			fmt.Fprintf(stdout, "//go:cgo_import_dynamic %s %s %q\n", s.Name, targ, s.Library)
> + 		}
> + 		lib, _ := f.ImportedLibraries()
> +@@ -311,6 +314,7 @@ func dynimport(obj string) {
> + 			if len(s) > 0 && s[0] == '_' {
> + 				s = s[1:]
> + 			}
> ++			checkImportSymName(s)
> + 			fmt.Fprintf(stdout, "//go:cgo_import_dynamic %s %s %q\n", s, s, "")
> + 		}
> + 		lib, _ := f.ImportedLibraries()
> +@@ -325,6 +329,8 @@ func dynimport(obj string) {
> + 		for _, s := range sym {
> + 			ss := strings.Split(s, ":")
> + 			name := strings.Split(ss[0], "@")[0]
> ++			checkImportSymName(name)
> ++			checkImportSymName(ss[0])
> + 			fmt.Fprintf(stdout, "//go:cgo_import_dynamic %s %s %q\n", name, ss[0], strings.ToLower(ss[1]))
> + 		}
> + 		return
> +@@ -336,6 +342,7 @@ func dynimport(obj string) {
> + 			fatalf("cannot load imported symbols from XCOFF file %s: %v", obj, err)
> + 		}
> + 		for _, s := range sym {
> ++			checkImportSymName(s.Name)
> + 			fmt.Fprintf(stdout, "//go:cgo_import_dynamic %s %s %q\n", s.Name, s.Name, s.Library)
> + 		}
> + 		lib, err := f.ImportedLibraries()
> +@@ -351,6 +358,23 @@ func dynimport(obj string) {
> + 	fatalf("cannot parse %s as ELF, Mach-O, PE or XCOFF", obj)
> + }
> +
> ++// checkImportSymName checks a symbol name we are going to emit as part
> ++// of a //go:cgo_import_dynamic pragma. These names come from object
> ++// files, so they may be corrupt. We are going to emit them unquoted,
> ++// so while they don't need to be valid symbol names (and in some cases,
> ++// involving symbol versions, they won't be) they must contain only
> ++// graphic characters and must not contain Go comments.
> ++func checkImportSymName(s string) {
> ++	for _, c := range s {
> ++		if !unicode.IsGraphic(c) || unicode.IsSpace(c) {
> ++			fatalf("dynamic symbol %q contains unsupported character", s)
> ++		}
> ++	}
> ++	if strings.Index(s, "//") >= 0 || strings.Index(s, "/*") >= 0 {
> ++		fatalf("dynamic symbol %q contains Go comment")
> ++	}
> ++}
> ++
> + // Construct a gcc struct matching the gc argument frame.
> + // Assumes that in gcc, char is 1 byte, short 2 bytes, int 4 bytes, long long 8 bytes.
> + // These assumptions are checked by the gccProlog.
> +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
> +index 3f7e51e..aab093c 100644
> +--- a/src/cmd/go/internal/work/exec.go
> ++++ b/src/cmd/go/internal/work/exec.go
> +@@ -2638,6 +2638,66 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
> + 		noCompiler()
> + 	}
> +
> ++	// Double check the //go:cgo_ldflag comments in the generated files.
> ++	// The compiler only permits such comments in files whose base name
> ++	// starts with "_cgo_". Make sure that the comments in those files
> ++	// are safe. This is a backstop against people somehow smuggling
> ++	// such a comment into a file generated by cgo.
> ++	if cfg.BuildToolchainName == "gc" && !cfg.BuildN {
> ++		var flags []string
> ++		for _, f := range outGo {
> ++			if !strings.HasPrefix(filepath.Base(f), "_cgo_") {
> ++				continue
> ++			}
> ++
> ++			src, err := ioutil.ReadFile(f)
> ++			if err != nil {
> ++				return nil, nil, err
> ++			}
> ++
> ++			const cgoLdflag = "//go:cgo_ldflag"
> ++			idx := bytes.Index(src, []byte(cgoLdflag))
> ++			for idx >= 0 {
> ++				// We are looking at //go:cgo_ldflag.
> ++				// Find start of line.
> ++				start := bytes.LastIndex(src[:idx], []byte("\n"))
> ++				if start == -1 {
> ++					start = 0
> ++				}
> ++
> ++				// Find end of line.
> ++				end := bytes.Index(src[idx:], []byte("\n"))
> ++				if end == -1 {
> ++					end = len(src)
> ++				} else {
> ++					end += idx
> ++				}
> ++
> ++				// Check for first line comment in line.
> ++				// We don't worry about /* */ comments,
> ++				// which normally won't appear in files
> ++				// generated by cgo.
> ++				commentStart := bytes.Index(src[start:], []byte("//"))
> ++				commentStart += start
> ++				// If that line comment is //go:cgo_ldflag,
> ++				// it's a match.
> ++				if bytes.HasPrefix(src[commentStart:], []byte(cgoLdflag)) {
> ++					// Pull out the flag, and unquote it.
> ++					// This is what the compiler does.
> ++					flag := string(src[idx+len(cgoLdflag) : end])
> ++					flag = strings.TrimSpace(flag)
> ++					flag = strings.Trim(flag, `"`)
> ++					flags = append(flags, flag)
> ++				}
> ++				src = src[end:]
> ++				idx = bytes.Index(src, []byte(cgoLdflag))
> ++			}
> ++		}
> ++		if err := checkLinkerFlags("LDFLAGS", "go:cgo_ldflag", flags); err != nil {
> ++			return nil, nil, err
> ++		}
> ++	}
> ++
> + 	return outGo, outObj, nil
> + }
> +
> +--
> +2.23.0
> +
>
> 
>
-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


--------------22AEA44B206DE312155C7C30
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Please omit this patch. Thank you.<br>
    </p>
    <div class="moz-cite-prefix">On 11/17/20 2:26 PM, Li Zhou wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:164837A6030793E3.5807@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Backport commit from <a class="moz-txt-link-rfc2396E" href="https://github.com/golang/go/commit/32159824698a82a174b60a6845e8494ae3243102">&lt;https://github.com/golang/go/commit/
32159824698a82a174b60a6845e8494ae3243102&gt;</a> to solve CVE-2020-28366.
Adapted the patch to solve context issues.

Signed-off-by: Li Zhou <a class="moz-txt-link-rfc2396E" href="mailto:li.zhou@windriver.com">&lt;li.zhou@windriver.com&gt;</a>
---
 meta/recipes-devtools/go/go-1.12.inc               |   1 +
 .../go/go-1.12/CVE-2020-28366.patch                | 410 +++++++++++++++++++++
 2 files changed, 411 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 2a0680a..ecf26c6 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -22,6 +22,7 @@ SRC_URI += &quot;\
     <a class="moz-txt-link-freetext" href="file://CVE-2020-16845.patch">file://CVE-2020-16845.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0001-net-http-cgi-rename-a-test-file-to-be-less-cute.patch">file://0001-net-http-cgi-rename-a-test-file-to-be-less-cute.patch</a> \
     <a class="moz-txt-link-freetext" href="file://CVE-2020-24553.patch">file://CVE-2020-24553.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://CVE-2020-28366.patch">file://CVE-2020-28366.patch</a> \
 &quot;
 SRC_URI_append_libc-musl = <a class="moz-txt-link-rfc2396E" href="file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch">&quot; file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch&quot;</a>
 
diff --git a/meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch b/meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch
new file mode 100644
index 0000000..bcc70ce
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.12/CVE-2020-28366.patch
@@ -0,0 +1,410 @@
+From 655749e7aff89bcee89d179b4cebdcfd770d1a8f Mon Sep 17 00:00:00 2001
+From: Li Zhou <a class="moz-txt-link-rfc2396E" href="mailto:li.zhou@windriver.com">&lt;li.zhou@windriver.com&gt;</a>
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
+Reviewed-on: <a class="moz-txt-link-freetext" href="https://team-review.git.corp.google.com/c/golang/go-private/+/895832">https://team-review.git.corp.google.com/c/golang/go-private/+/895832</a>
+Reviewed-by: Than McIntosh <a class="moz-txt-link-rfc2396E" href="mailto:thanm@google.com">&lt;thanm@google.com&gt;</a>
+Reviewed-by: Cherry Zhang <a class="moz-txt-link-rfc2396E" href="mailto:cherryyz@google.com">&lt;cherryyz@google.com&gt;</a>
+(cherry picked from commit 6bc814dd2bbfeaafa41d314dd4cc591b575dfbf6)
+Reviewed-on: <a class="moz-txt-link-freetext" href="https://team-review.git.corp.google.com/c/golang/go-private/+/901056">https://team-review.git.corp.google.com/c/golang/go-private/+/901056</a>
+Reviewed-by: Filippo Valsorda <a class="moz-txt-link-rfc2396E" href="mailto:valsorda@google.com">&lt;valsorda@google.com&gt;</a>
+Reviewed-by: Roland Shoemaker <a class="moz-txt-link-rfc2396E" href="mailto:bracewell@google.com">&lt;bracewell@google.com&gt;</a>
+
+Upstream-Status: Backport
+CVE: CVE-2020-28366
+Signed-off-by: Li Zhou <a class="moz-txt-link-rfc2396E" href="mailto:li.zhou@windriver.com">&lt;li.zhou@windriver.com&gt;</a>
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
++	&quot;bytes&quot;
++	&quot;io/ioutil&quot;
++	&quot;os&quot;
++	&quot;os/exec&quot;
++	&quot;path/filepath&quot;
++	&quot;strings&quot;
++	&quot;testing&quot;
++	&quot;unicode&quot;
++)
++
++// A manually modified object file could pass unexpected characters
++// into the files generated by cgo.
++
++const magicInput = &quot;abcdefghijklmnopqrstuvwxyz0123&quot;
++const magicReplace = &quot;\n//go:cgo_ldflag \&quot;-badflag\&quot;\n//&quot;
++
++const cSymbol = &quot;BadSymbol&quot; + magicInput + &quot;Name&quot;
++const cDefSource = &quot;int &quot; + cSymbol + &quot; = 1;&quot;
++const cRefSource = &quot;extern int &quot; + cSymbol + &quot;; int F() { return &quot; + cSymbol + &quot;; }&quot;
++
++// goSource is the source code for the trivial Go file we use.
++// We will replace TMPDIR with the temporary directory name.
++const goSource = `
++package main
++
++// #cgo LDFLAGS: TMPDIR/cbad.o TMPDIR/cbad.so
++// extern int F();
++import &quot;C&quot;
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
++	cdir := mkdir(&quot;c&quot;)
++	godir := mkdir(&quot;go&quot;)
++
++	makeFile := func(mdir, base, source string) string {
++		ret := filepath.Join(mdir, base)
++		if err := ioutil.WriteFile(ret, []byte(source), 0644); err != nil {
++			t.Fatal(err)
++		}
++		return ret
++	}
++
++	cDefFile := makeFile(cdir, &quot;cdef.c&quot;, cDefSource)
++	cRefFile := makeFile(cdir, &quot;cref.c&quot;, cRefSource)
++
++	ccCmd := cCompilerCmd(t)
++
++	cCompile := func(arg, base, src string) string {
++		out := filepath.Join(cdir, base)
++		run := append(ccCmd, arg, &quot;-o&quot;, out, src)
++		output, err := exec.Command(run[0], run[1:]...).CombinedOutput()
++		if err != nil {
++			t.Log(run)
++			t.Logf(&quot;%s&quot;, output)
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
++	cShared := cCompile(&quot;-shared&quot;, &quot;c.so&quot;, cDefFile)
++
++	// Build an object file that refers to the symbol whose name
++	// contains magicInput.
++
++	cObj := cCompile(&quot;-c&quot;, &quot;c.o&quot;, cRefFile)
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
++			t.Fatalf(&quot;%s: did not find magic string&quot;, from)
++		}
++
++		if len(magicInput) != len(magicReplace) {
++			t.Fatalf(&quot;internal test error: different magic lengths: %d != %d&quot;, len(magicInput), len(magicReplace))
++		}
++
++		obj = bytes.ReplaceAll(obj, []byte(magicInput), []byte(magicReplace))
++
++		if err := ioutil.WriteFile(to, obj, 0644); err != nil {
++			t.Fatal(err)
++		}
++	}
++
++	cBadShared := filepath.Join(godir, &quot;cbad.so&quot;)
++	rewrite(cShared, cBadShared)
++
++	cBadObj := filepath.Join(godir, &quot;cbad.o&quot;)
++	rewrite(cObj, cBadObj)
++
++	goSourceBadObject := strings.ReplaceAll(goSource, &quot;TMPDIR&quot;, godir)
++	makeFile(godir, &quot;go.go&quot;, goSourceBadObject)
++
++	makeFile(godir, &quot;go.mod&quot;, &quot;module badsym&quot;)
++
++	// Try to build our little package.
++	cmd := exec.Command(&quot;go&quot;, &quot;build&quot;, &quot;-ldflags=-v&quot;)
++	cmd.Dir = godir
++	output, err := cmd.CombinedOutput()
++
++	// The build should fail, but we want it to fail because we
++	// detected the error, not because we passed a bad flag to the
++	// C linker.
++
++	if err == nil {
++		t.Errorf(&quot;go build succeeded unexpectedly&quot;)
++	}
++
++	t.Logf(&quot;%s&quot;, output)
++
++	for _, line := range bytes.Split(output, []byte(&quot;\n&quot;)) {
++		if bytes.Contains(line, []byte(&quot;dynamic symbol&quot;)) &amp;&amp; bytes.Contains(line, []byte(&quot;contains unsupported character&quot;)) {
++			// This is the error from cgo.
++			continue
++		}
++
++		// We passed -ldflags=-v to see the external linker invocation,
++		// which should not include -badflag.
++		if bytes.Contains(line, []byte(&quot;-badflag&quot;)) {
++			t.Error(&quot;output should not mention -badflag&quot;)
++		}
++
++		// Also check for compiler errors, just in case.
++		// GCC says &quot;unrecognized command line option&quot;.
++		// clang says &quot;unknown argument&quot;.
++		if bytes.Contains(line, []byte(&quot;unrecognized&quot;)) || bytes.Contains(output, []byte(&quot;unknown&quot;)) {
++			t.Error(&quot;problem should have been caught before invoking C linker&quot;)
++		}
++	}
++}
++
++func cCompilerCmd(t *testing.T) []string {
++	cc := []string{goEnv(t, &quot;CC&quot;)}
++
++	out := goEnv(t, &quot;GOGCCFLAGS&quot;)
++	quote := '\000'
++	start := 0
++	lastSpace := true
++	backslash := false
++	s := string(out)
++	for i, c := range s {
++		if quote == '\000' &amp;&amp; unicode.IsSpace(c) {
++			if !lastSpace {
++				cc = append(cc, s[start:i])
++				lastSpace = true
++			}
++		} else {
++			if lastSpace {
++				start = i
++				lastSpace = false
++			}
++			if quote == '\000' &amp;&amp; !backslash &amp;&amp; (c == '&quot;' || c == '\'') {
++				quote = c
++				backslash = false
++			} else if !backslash &amp;&amp; quote == c {
++				quote = '\000'
++			} else if (quote == '\000' || quote == '&quot;') &amp;&amp; !backslash &amp;&amp; c == '\\' {
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
++	out, err := exec.Command(&quot;go&quot;, &quot;env&quot;, key).CombinedOutput()
++	if err != nil {
++		t.Logf(&quot;go env %s\n&quot;, key)
++		t.Logf(&quot;%s&quot;, out)
++		t.Fatal(err)
++	}
++	return strings.TrimSpace(string(out))
++}
+diff --git a/src/cmd/cgo/out.go b/src/cmd/cgo/out.go
+index 0cf8b17..338cb82 100644
+--- a/src/cmd/cgo/out.go
++++ b/src/cmd/cgo/out.go
+@@ -22,6 +22,7 @@ import (
+ 	&quot;regexp&quot;
+ 	&quot;sort&quot;
+ 	&quot;strings&quot;
++	&quot;unicode&quot;
+ )
+ 
+ var (
+@@ -296,6 +297,8 @@ func dynimport(obj string) {
+ 			if s.Version != &quot;&quot; {
+ 				targ += &quot;#&quot; + s.Version
+ 			}
++			checkImportSymName(s.Name)
++			checkImportSymName(targ)
+ 			fmt.Fprintf(stdout, &quot;//go:cgo_import_dynamic %s %s %q\n&quot;, s.Name, targ, s.Library)
+ 		}
+ 		lib, _ := f.ImportedLibraries()
+@@ -311,6 +314,7 @@ func dynimport(obj string) {
+ 			if len(s) &gt; 0 &amp;&amp; s[0] == '_' {
+ 				s = s[1:]
+ 			}
++			checkImportSymName(s)
+ 			fmt.Fprintf(stdout, &quot;//go:cgo_import_dynamic %s %s %q\n&quot;, s, s, &quot;&quot;)
+ 		}
+ 		lib, _ := f.ImportedLibraries()
+@@ -325,6 +329,8 @@ func dynimport(obj string) {
+ 		for _, s := range sym {
+ 			ss := strings.Split(s, &quot;:&quot;)
+ 			name := strings.Split(ss[0], &quot;@&quot;)[0]
++			checkImportSymName(name)
++			checkImportSymName(ss[0])
+ 			fmt.Fprintf(stdout, &quot;//go:cgo_import_dynamic %s %s %q\n&quot;, name, ss[0], strings.ToLower(ss[1]))
+ 		}
+ 		return
+@@ -336,6 +342,7 @@ func dynimport(obj string) {
+ 			fatalf(&quot;cannot load imported symbols from XCOFF file %s: %v&quot;, obj, err)
+ 		}
+ 		for _, s := range sym {
++			checkImportSymName(s.Name)
+ 			fmt.Fprintf(stdout, &quot;//go:cgo_import_dynamic %s %s %q\n&quot;, s.Name, s.Name, s.Library)
+ 		}
+ 		lib, err := f.ImportedLibraries()
+@@ -351,6 +358,23 @@ func dynimport(obj string) {
+ 	fatalf(&quot;cannot parse %s as ELF, Mach-O, PE or XCOFF&quot;, obj)
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
++			fatalf(&quot;dynamic symbol %q contains unsupported character&quot;, s)
++		}
++	}
++	if strings.Index(s, &quot;//&quot;) &gt;= 0 || strings.Index(s, &quot;/*&quot;) &gt;= 0 {
++		fatalf(&quot;dynamic symbol %q contains Go comment&quot;)
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
++	// starts with &quot;_cgo_&quot;. Make sure that the comments in those files
++	// are safe. This is a backstop against people somehow smuggling
++	// such a comment into a file generated by cgo.
++	if cfg.BuildToolchainName == &quot;gc&quot; &amp;&amp; !cfg.BuildN {
++		var flags []string
++		for _, f := range outGo {
++			if !strings.HasPrefix(filepath.Base(f), &quot;_cgo_&quot;) {
++				continue
++			}
++
++			src, err := ioutil.ReadFile(f)
++			if err != nil {
++				return nil, nil, err
++			}
++
++			const cgoLdflag = &quot;//go:cgo_ldflag&quot;
++			idx := bytes.Index(src, []byte(cgoLdflag))
++			for idx &gt;= 0 {
++				// We are looking at //go:cgo_ldflag.
++				// Find start of line.
++				start := bytes.LastIndex(src[:idx], []byte(&quot;\n&quot;))
++				if start == -1 {
++					start = 0
++				}
++
++				// Find end of line.
++				end := bytes.Index(src[idx:], []byte(&quot;\n&quot;))
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
++				commentStart := bytes.Index(src[start:], []byte(&quot;//&quot;))
++				commentStart += start
++				// If that line comment is //go:cgo_ldflag,
++				// it's a match.
++				if bytes.HasPrefix(src[commentStart:], []byte(cgoLdflag)) {
++					// Pull out the flag, and unquote it.
++					// This is what the compiler does.
++					flag := string(src[idx+len(cgoLdflag) : end])
++					flag = strings.TrimSpace(flag)
++					flag = strings.Trim(flag, `&quot;`)
++					flags = append(flags, flag)
++				}
++				src = src[end:]
++				idx = bytes.Index(src, []byte(cgoLdflag))
++			}
++		}
++		if err := checkLinkerFlags(&quot;LDFLAGS&quot;, &quot;go:cgo_ldflag&quot;, flags); err != nil {
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
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">
-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511</pre>
  </body>
</html>

--------------22AEA44B206DE312155C7C30--
