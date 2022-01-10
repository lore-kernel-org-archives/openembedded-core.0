Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4514BC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:03:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.31883.1641823418498736300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZDNyssob;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641823416; i=@fujitsu.com;
	bh=B9FpqqeM1O+mRFlg90QG+fAWSYYDpK+XGsyzAeGjczI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZDNyssob7RvZjOgnJJBylVgTVlzAwdVeSolj0wmx9NQTgFffnGaS+OuwjRNAMIPgj
	 PdZs5xlrNHRqPADVdgA0KuL87fZ1tr03Q4MhzSWa2/QFqpyhMKCujjV4cNkh9nvY4r
	 O8EcDWSuahfL5mCCgx1hojdHpTx9RT9LbOasSJ78jL54JWPazX7kPHAYqATGnaySoe
	 0iKs0AzBVV5o2ZsxGgNpJ3aAmYQJ0Nw/tK7mhaSpskx86QlSaaNL7k61X2v+S+JNn+
	 90PkAzBkqYyxCMW5Gbj+5BIKKZEf9m2KD7ngooWaQOcFcK24u0i1YXgQceRooVsFNp
	 RqtJLhoKtSLKw==
Received: from [100.115.38.11] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id DF/CD-23453-8BC3CD16;
 Mon, 10 Jan 2022 14:03:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxRXeSzZ1
  EgyPnpS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxppzcwF7SaV0y/sYutgfGbfhcjF4eQwAwm
  iaOrFzNCOCcYJY7uvM7cxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg4SFBSwl/
  t1RAAmzCKhKPF3dzwRi8wo4SRzqmwBmSwgoSEx5+B5sIqeAs8SD/pksIK1CQDXf3udDlAtKnJ
  z5hAViuoTEwRcvmCFaFSVmX25mgbArJGbNamOawMg/C0nLLCQtCxiZVjFaJxVlpmeU5CZm5ug
  aGhjoGhqa6hqb6hpamOglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgQGZEqx
  8o4djG2rfuodYpTkYFIS5X1ifCdRiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvgiVQTrAoNT21I
  i0zBxgdMGkJDh4lEV4NkDRvcUFibnFmOkTqFKMuR/Ok5duZhVjy8vNSpcR5ea2BigRAijJK8+
  BGwCL1EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3gKQVTyZeSVwm14BHcEEdEQyx22QI0o
  SEVJSDUzCfaL6bFH7eS4XdHNvmbc24v2N1Y5tQnLTshrY7jSEWuvPPjN5+YHLNdt/XNITFtr7
  95iHxhkf4acN6yddv1NvM8lUwTfk5pMK+YiumMd7TrTeU9F5tfuE57MZCs4xivud256nJERK7
  WboOux6x02c5WO/dtDluuyypyWHnxv6KBi+PDNJdvPthjMhld9i7llOrV/aUhew/vNGnpkWMW
  9OFx/v3ZOqsZxjWcjjydVp3m5XHiR2KXCFqcxd577d6oqUeEio/IuqSwksHNVlC6TNV6q5cLL
  E+wYtW7Xt8x7lxWpHvracWj7zkT6/hOaH9WrBjQ/X1zvzupQbuj/1tHgUeK270UTEaXtF0p/1
  mUosxRmJhlrMRcWJACPEMCpPAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1641823378!24194!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21132 invoked from network); 10 Jan 2022 14:02:58 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 14:02:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20AE2qdG000637
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:02:58 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 14:02:50 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] curl: upgrade 7.80.0 -> 7.81.0
Date: Mon, 10 Jan 2022 22:02:31 +0800
Message-ID: <1641823351-62709-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641823351-62709-1-git-send-email-wangmy@fujitsu.com>
References: <1641823351-62709-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:03:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160358

Changelog:
=========
Changes:
---------------
mime: use percent-escaping for multipart form field and file names

Bugfixes:
--------------
asyn-ares: ares_getaddrinfo needs no happy eyeballs timer
azure: make the "w/o HTTP/SMTP/IMAP" build disable SSL proper
BINDINGS: add cURL client for PostgreSQL
BINDINGS: add one from Everything curl and update a link
checksrc: detect more kinds of NULL comparisons we avoid
CI: build examples for additional code verification
CI: bump job to use mbedtls 3.1.0
cmake: don't set _USRDLL on a static Windows build
cmake: prevent dev warning due to mismatched arg
cmake: private identifiers use CURL_ instead of CMAKE_ prefix
config.d: update documentation to match the path search
configure: add -lm to configure for rustls build.
configure: better diagnostics if hyper is built wrong
configure: don't enable TLS when --without-* flags are used
configure: fix runtime-lib detection on macOS
curl.1: require "see also" for every documented option
curl: improve error message for --head with -J
curl_easy_cleanup.3: remove from multi handle first
curl_easy_escape.3: call curl_easy_cleanup in example
curl_easy_unescape.3: call curl_easy_cleanup in example
curl_multi_init.3: fix EXAMPLE formatting
curl_multi_perform/socket_action.3: clarify what errors mean
curl_share_setopt.3: split out options into their own manpages
CURLOPT_STDERR.3: does not work with libcurl as a win32 DLL
digest: compute user:realm:pass digest w/o userhash
docs/checksrc: Add documentation for STRERROR
docs/cmdline-opts: do not say "protocols: all"
docs/examples: workaround broken -Wno-pedantic-ms-format
docs/HTTP3: describe how to setup a h3 reverse-proxy for testing
docs/INSTALL.md: typo fix : added missing "get" verb
docs/URL-SYNTAX.md: space is not fine in a given URL
docs: add known bugs list to HTTP3.md
docs: address proselint nits
docs: consistent manpage SYNOPSIS
docs: fix dead links, remove ECH.md
docs: fix typo in OpenSSL 3 build instructions
docs: Update the Reducing Size section
example/progressfunc: remove code for old libcurls
examples/multi-single.c: remove WAITMS()
FAQ: typo fix : "yout" -> "your"
ftp: disable warning 4706 in MSVC
gen.pl: improve example output format
github workflow: add wolfssl (removed from zuul)
github/workflows: add mbedtls and mbedtls-clang (removed from zuul)
gtls: check return code for gnutls_alpn_set_protocols
hash: lazy-alloc the table in Curl_hash_add()
http2:set_transfer_url() return early on OOM
HTTP3: update quiche build instructions
http: enable haproxy support for hyper backend
http: Fix CURLOPT_HTTP200ALIASES
http_proxy: don't close the socket (too early)
insecure.d: detail its use for SFTP and SCP as well
insecure.d: expand and clarify
libcurl-multi.3: "SOCKS proxy handshakes" are not blocking
libcurl-security.3: mention address and URL mitigations
libssh2: fix error message for sha256 mismatch
libtest: avoid "assignment within conditional expression"
lift: ignore is a deprecated config option, use ignoreRules
linkcheck.yml: add CI job that checks markdown links
m4/curl-compilers: tell clang -Wno-pointer-bool-conversion
Makefile.m32: rename -winssl option to -schannel and tidy up
mbedTLS: add support for CURLOPT_CAINFO_BLOB
mbedtls: fix CURLOPT_SSLCERT_BLOB
mbedtls: fix private member designations for v3.1.0
misc: remove unused doh flags when CURL_DISABLE_DOH is defined
misc: s/e-mail/email
multi: cleanup the socket hash when destroying it
multi: handle errors returned from socket/timer callbacks
multi: shut down CONNECT in Curl_detach_connnection
netrc.d: edit the .netrc example to look nicer
ngtcp2: verify the server cert on connect (quictls)
ngtcp2: verify the server certificate for the gnutls case
nss:set_cipher don't clobber the cipher list
openldap: implement STARTTLS
openldap: process search query response messages one by one
openldap: several minor improvements
openldap: simplify ldif generation code
openssl: check the return value of BIO_new()
openssl: define HAVE_OPENSSL_VERSION for OpenSSL 1.1.0+
openssl: remove `RSA_METHOD_FLAG_NO_CHECK` handling if unavailable
openssl: remove usage of deprecated `SSL_get_peer_certificate`
openssl: use non-deprecated API to read key parameters
page-footer: add a mention of how to report bugs to the man page
page-footer: document more environment variables
request.d: refer to 'method' rather than 'command'
retry-all-errors.d: make the example complete
runtests: make the SSH library a testable feature
rustls: read of zero bytes might be okay
rustls: remove comment about checking handshaking
rustls: remove incorrect EOF check
sha256/md5: return errors when init fails
socks5: use appropriate ATYP for numerical IP address host names
test1156: enable for hyper
test1156: fixup the stdout check for Windows
test1525: tweaked for hyper
test1526: enable for hyper
test1527: enable for hyper
test1528: enable for hyper
test1554: adjust for hyper
test1556: adjust for hyper
test302[12]: run only with the libssh2 backend
test661: enable for hyper
tests/CI.md: add more information on CI environments
tests/data/test302[12]: fix MSYS2 path conversion of hostpubsha256
tftp: mark protocol as not possible to do over CONNECT
tool_findfile: updated search for a file in the homedir
tool_operate: only set SSH related libcurl options for SSH URLs
tool_operate: warn if too many output arguments were found
url.c: fix the SIGPIPE comment for Curl_close
url: check ssl_config when re-use proxy connection
url: reduce ssl backend count for CURL_DISABLE_PROXY builds
urlapi: accept port number zero
urlapi: if possible, shorten given numerical IPv6 addresses
urlapi: provide more detailed return codes
urlapi: reject short file URLs
version_win32: Check build number and platform id
vtls/rustls: adapt to the updated rustls_version proto
writeout: fix %{http_version} for HTTP/3
x509asn1: return early on errors
zuul.d: update rustls-ffi to version 0.8.2
zuul: fix quiche build pointing to wrong Cargo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/curl/{curl_7.80.0.bb => curl_7.81.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.80.0.bb => curl_7.81.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.80.0.bb b/meta/recipes-support/curl/curl_7.81.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.80.0.bb
rename to meta/recipes-support/curl/curl_7.81.0.bb
index 7b47091933..fd4bbb55cd 100644
--- a/meta/recipes-support/curl/curl_7.80.0.bb
+++ b/meta/recipes-support/curl/curl_7.81.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
 
 SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "dd0d150e49cd950aff35e16b628edf04927f0289df42883750cf952bb858189c"
+SRC_URI[sha256sum] = "1e7a38d7018ec060f1f16df839854f0889e94e122c4cfa5d3a37c2dc56f1e258"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.25.1


