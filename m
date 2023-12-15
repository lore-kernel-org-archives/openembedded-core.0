Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6372EC4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 10:00:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.59575.1702634401483555066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 02:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=khRBQWTv;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702634401; x=1734170401;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I9YdO7nsfQRjxRg9ZTB1PqGisaqjp8QgG6pxmOwLTVM=;
  b=khRBQWTv5biEVbCWZcVlpNKvCuY1tJXr81gLDStsHVwxkeinHZL0B+zE
   wyrqoSgZ+wdJCDfAw5lwHYqKkXEJFtjkSGDvq5BMJf6FQXihkhspm5aXm
   cL08CZ+qvilf0Um34iEUnFVmTk7npeA4G4TD0uaOxo7E7AESJtbZYOCLD
   goXTdge4IOvCrnBHZRh94s4L1zrMYSkl9oNsZe5wnDhdWUJQ78Jp+/WR0
   Jj0qsqWQz/uuXMH8nD3GSnEysLgAM0vCmK8Wes4FEVEtCZ2QRznWo/3Tq
   GaBnpHq3Fa5SswuFIhhcpbn/ZxUEMAfDwBrDUocpMzPbKZ5s+lgSryTME
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="399091561"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="399091561"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 02:00:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1106071564"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="1106071564"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga005.fm.intel.com with ESMTP; 15 Dec 2023 01:59:59 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: update to 8.5.0
Date: Fri, 15 Dec 2023 17:40:21 +0800
Message-Id: <20231215094021.391568-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 10:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192423

From: Lee Chee Yang <chee.yang.lee@intel.com>

update include fix for CVE-2023-46218.

skip test 1477 which check that libcurl-errors.3 and the public
header files have the same set of error codes.
Notes: This test is not included in the source tarball.
https://github.com/curl/curl/issues/12462

Release Notes:
curl and libcurl 8.5.0

 Public curl releases:         253
 Command line options:         258
 curl_easy_setopt() options:   303
 Public functions in libcurl:  93
 Contributors:                 3039

This release includes the following changes:

 o gnutls: support CURLSSLOPT_NATIVE_CA [31]
 o HTTP3: ngtcp2 builds are no longer experimental [77]

This release includes the following bugfixes:

 o appveyor: make VS2008-built curl tool runnable [93]
 o asyn-thread: use pipe instead of socketpair for IPC when available [4]
 o autotools: accept linker flags via `CURL_LDFLAGS_{LIB,BIN}` [128]
 o autotools: avoid passing `LDFLAGS` twice to libcurl [127]
 o autotools: delete LCC compiler support bits [137]
 o autotools: fix/improve gcc and Apple clang version detection [136]
 o autotools: stop setting `-std=gnu89` with `--enable-warnings` [135]
 o autotools: update references to deleted `crypt-auth` option [46]
 o BINDINGS: add V binding [54]
 o build: add `src/.checksrc` to source tarball [1]
 o build: add more picky warnings and fix them [172]
 o build: always revert `#pragma GCC diagnostic` after use [143]
 o build: delete `HAVE_STDINT_H` and `HAVE_INTTYPES_H` [107]
 o build: delete support bits for obsolete Windows compilers [106]
 o build: fix 'threadsafe' feature detection for older gcc [19]
 o build: fix builds that disable protocols but not digest auth [174]
 o build: fix compiler warning with auths disabled [85]
 o build: fix libssh2 + `CURL_DISABLE_DIGEST_AUTH` + `CURL_DISABLE_AWS` [120]
 o build: picky warning updates [125]
 o build: require Windows XP or newer [86]
 o cfilter: provide call to tell connection to forget a socket [65]
 o checksrc.pl: support #line instructions
 o CI: add autotools, out-of-tree, debug build to distro check job [14]
 o CI: ignore test 286 on Appveyor gcc 9 build [6]
 o cmake: add `CURL_DISABLE_BINDLOCAL` option [146]
 o cmake: add test for `DISABLE` options, add `CURL_DISABLE_HEADERS_API` [138]
 o cmake: dedupe Windows system libs [114]
 o cmake: fix `HAVE_H_ERRNO_ASSIGNABLE` detection [2]
 o cmake: fix CURL_DISABLE_GETOPTIONS [12]
 o cmake: fix multiple include of CURL package [96]
 o cmake: fix OpenSSL quic detection in quiche builds [56]
 o cmake: option to disable install & drop `curlu` target when unused [72]
 o cmake: pre-fill rest of detection values for Windows [50]
 o cmake: replace `check_library_exists_concat()` [23]
 o cmake: speed up threads setup for Windows [68]
 o cmake: speed up zstd detection [69]
 o config-win32: set `HAVE_SNPRINTF` for mingw-w64 [123]
 o configure: better --disable-http [80]
 o configure: check for the fseeko declaration too [55]
 o conncache: use the closure handle when disconnecting surplus connections [173]
 o content_encoding: make Curl_all_content_encodings allocless [101]
 o cookie: lowercase the domain names before PSL checks [160]
 o curl.h: delete Symbian OS references [162]
 o curl.h: on FreeBSD include sys/param.h instead of osreldate.h [21]
 o curl.rc: switch out the copyright symbol for plain ASCII [167]
 o curl: improved IPFS and IPNS URL support [87]
 o curl_easy_duphandle.3: clarify how HSTS and alt-svc are duped [99]
 o Curl_http_body: cleanup properly when Curl_getformdata errors [152]
 o curl_setup: disallow Windows IPv6 builds missing getaddrinfo [57]
 o curl_sspi: support more revocation error names in error messages [95]
 o CURLINFO_PRETRANSFER_TIME_T.3: fix time explanation [181]
 o CURLMOPT_MAX_CONCURRENT_STREAMS: make sure the set value is within range [165]
 o CURLOPT_CAINFO_BLOB.3: explain what CURL_BLOB_COPY does [113]
 o CURLOPT_WRITEFUNCTION.3: clarify libcurl returns for CURL_WRITEFUNC_ERROR [45]
 o CURPOST_POSTFIELDS.3: add CURLOPT_COPYPOSTFIELDS in SEE ALSO
 o docs/example/keepalive.c: show TCP keep-alive options [73]
 o docs/example/localport.c: show off CURLOPT_LOCALPORT [83]
 o docs/examples/interface.c: show CURLOPT_INTERFACE use [84]
 o docs/libcurl: fix three minor man page format mistakes [26]
 o docs/libcurl: SYNSOPSIS cleanup [150]
 o docs: add supported version for the json write-out [92]
 o docs: clarify that curl passes on input unfiltered [47]
 o docs: fix function typo in curl_easy_option_next.3 [36]
 o docs: KNOWN_BUGS cleanup
 o docs: make all examples in all libcurl man pages compile [175]
 o docs: preserve the modification date when copying the prebuilt man page [89]
 o docs: remove bold from some man page SYNOPSIS sections [90]
 o docs: use SOURCE_DATE_EPOCH for generated manpages [16]
 o doh: provide better return code for responses w/o addresses [133]
 o doh: use PIPEWAIT when HTTP/2 is attempted [63]
 o duphandle: also free 'outcurl->cookies' in error path [122]
 o duphandle: make dupset() not return with pointers to old alloced data [109]
 o duphandle: use strdup to clone *COPYPOSTFIELDS if size is not set [132]
 o easy: in duphandle, init the cookies for the new handle [131]
 o easy: remove duplicate wolfSSH init call [37]
 o easy_lock: add a pthread_mutex_t fallback [13]
 o examples/rtsp-options.c: add [157]
 o fopen: create new file using old file's mode [153]
 o fopen: create short(er) temporary file name [155]
 o getenv: PlayStation doesn't have getenv() [41]
 o GHA: move mod_h2 version in CI to v2.0.25 [43]
 o hostip: show the list of IPs when resolving is done [35]
 o hostip: silence compiler warning `-Wparentheses-equality` [62]
 o hsts: skip single-dot hostname [67]
 o HTTP/2, HTTP/3: handle detach of onoing transfers [134]
 o http2: header conversion tightening [33]
 o http2: provide an error callback and failf the message [53]
 o http2: safer invocation of populate_binsettings [8]
 o http: allow longer HTTP/2 request method names [112]
 o http: avoid Expect: 100-continue if Upgrade: is used [15]
 o http: consider resume with CURLOPT_FAILONERRROR and 416 to be fine [81]
 o http: fix `-Wunused-parameter` with no auth and no proxy [149]
 o http: fix `-Wunused-variable` compiler warning [115]
 o http: fix empty-body warning [76]
 o http_aws_sigv4: canonicalise valueless query params [88]
 o hyper: temporarily remove HTTP/2 support [139]
 o INSTALL: update list of ports and CPU archs
 o IPFS: fix IPFS_PATH and file parsing [119]
 o keylog: disable if unused [145]
 o lib: add and use Curl_strndup() [97]
 o lib: apache style infof and trace macros/functions [71]
 o lib: fix gcc warning in printf call [7]
 o libcurl-errors.3: sync with current public headers [156]
 o libcurl-thread.3: simplify the TLS section [79]
 o Makefile.am: drop vc10, vc11 and vc12 projects from dist [103]
 o Makefile.mk: fix `-rtmp` option for non-Windows
 o mime: store "form escape" as a single bit [170]
 o misc: fix -Walloc-size warnings [118]
 o msh3: error when built with CURL_DISABLE_SOCKETPAIR set [61]
 o multi: during ratelimit multi_getsock should return no sockets [182]
 o multi: use pipe instead of socketpair to *wakeup() [18]
 o ngtcp2: fix races in stream handling [178]
 o ngtcp2: ignore errors on unknown streams [158]
 o ntlm_wb: use pipe instead of socketpair when possible [44]
 o openldap: move the alloc of ldapconninfo to *connect() [29]
 o openldap: set the callback argument in oldap_do [30]
 o openssl: avoid BN_num_bits() NULL pointer derefs [9]
 o openssl: fix building with v3 `no-deprecated` + add CI test [161]
 o openssl: fix infof() to avoid compiler warning for %s with null [70]
 o openssl: identify the "quictls" backend correctly [82]
 o openssl: include SIG and KEM algorithms in verbose [52]
 o openssl: make CURLSSLOPT_NATIVE_CA import Windows intermediate CAs [58]
 o openssl: two multi pointer checks should probably rather be asserts [91]
 o openssl: when a session-ID is reused, skip OCSP stapling [142]
 o page-footer: clarify exit code 25 [51]
 o projects: add VC14.20 project files [104]
 o pytest: use lower count in repeat tests [98]
 o quic: make eyeballers connect retries stop at weird replies [140]
 o quic: manage connection idle timeouts [5]
 o quiche: use quiche_conn_peer_transport_params() [116]
 o rand: fix build error with autotools + LibreSSL [111]
 o resolve.d: drop a multi use-sentence [100]
 o RTSP: improved RTP parser [32]
 o rustls: implement connect_blocking [154]
 o sasl: fix `-Wunused-function` compiler warning [124]
 o schannel: add CA cache support for files and memory blobs [121]
 o setopt: check CURLOPT_TFTP_BLKSIZE range on set [171]
 o setopt: remove outdated cookie comment [64]
 o setopt: remove superfluous use of ternary expressions [169]
 o socks: better buffer size checks for socks4a user and hostname [20]
 o socks: make SOCKS5 use the CURLOPT_IPRESOLVE choice [38]
 o symbols-in-versions: the CLOSEPOLICY options are deprecated
 o test1683: remove commented-out check alternatives
 o test3103: add missing quotes around a test tag attribute
 o test613: stop showing an error on missing output file
 o tests/README: SOCKS tests are not using OpenSSH, it has its own server [48]
 o tests/server: add more SOCKS5 handshake error checking [27]
 o tests: Fix Windows test helper tool search & use it for handle64 [17]
 o tidy-up: casing typos, delete unused Windows version aliases [144]
 o tool: fix --capath when proxy support is disabled [28]
 o tool: support bold headers in Windows [117]
 o tool_cb_hdr: add an additional parsing check [129]
 o tool_cb_prg: make the carriage return fit for wide progress bars [159]
 o tool_cb_wrt: fix write output for very old Windows versions [24]
 o tool_getparam: limit --rate to be smaller than number of ms [3]
 o tool_operate: do not mix memory models [108]
 o tool_operate: fix links in ipfs errors [22]
 o tool_parsecfg: make warning output propose double-quoting [164]
 o tool_urlglob: fix build for old gcc versions [25]
 o tool_urlglob: make multiply() bail out on negative values [11]
 o tool_writeout_json: fix JSON encoding of non-ascii bytes [179]
 o transfer: abort pause send when connection is marked for closing [183]
 o transfer: avoid calling the read callback again after EOF [130]
 o transfer: only reset the FTP wildcard engine in CLEAR state [42]
 o url: don't touch the multi handle when closing internal handles [40]
 o url: find scheme with a "perfect hash" [141]
 o url: fix `-Wzero-length-array` with no protocols [147]
 o url: fix builds with `CURL_DISABLE_HTTP` [148]
 o url: protocol handler lookup tidy-up [66]
 o url: proxy ssl connection reuse fix [94]
 o urlapi: avoid null deref if setting blank host to url encode [75]
 o urlapi: skip appending NULL pointer query [74]
 o urlapi: when URL encoding the fragment, pass in the right length [59]
 o urldata: make maxconnects a 32 bit value [166]
 o urldata: move async resolver state from easy handle to connectdata [34]
 o urldata: move cookielist from UserDefined to UrlState [126]
 o urldata: move hstslist from 'set' to 'state' [105]
 o urldata: move the 'internal' boolean to the state struct [39]
 o vssh: remove the #ifdef for Curl_ssh_init, use empty macro
 o vtls: cleanup SSL config management [78]
 o vtls: consistently use typedef names for OpenSSL structs [176]
 o vtls: late clone of connection ssl config [60]
 o vtls: use ALPN "http/1.1" for HTTP/1.x, including HTTP/1.0 [102]
 o VULN-DISCLOSURE-POLICY: escape sequences are not a security flaw [110]
 o windows: use built-in `_WIN32` macro to detect Windows [163]
 o wolfssh: remove redundant static prototypes [168]
 o wolfssl: add default case for wolfssl_connect_step1 switch [49]
 o wolfssl: require WOLFSSL_SYS_CA_CERTS for loading system CA [10]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-support/curl/curl/disable-tests               | 3 ++-
 meta/recipes-support/curl/{curl_8.4.0.bb => curl_8.5.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_8.4.0.bb => curl_8.5.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
index fdac795662..833c640001 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -7,8 +7,9 @@
 1119
 1132
 1135
-# These CRL tests are scnning headers
+# These CRL tests are scanning headers
 1167
+1477
 # These CRL tests are scanning man pages
 1139
 1140
diff --git a/meta/recipes-support/curl/curl_8.4.0.bb b/meta/recipes-support/curl/curl_8.5.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.4.0.bb
rename to meta/recipes-support/curl/curl_8.5.0.bb
index 5f97730bf4..115ec7189f 100644
--- a/meta/recipes-support/curl/curl_8.4.0.bb
+++ b/meta/recipes-support/curl/curl_8.5.0.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "16c62a9c4af0f703d28bda6d7bbf37ba47055ad3414d70dec63e2e6336f2a82d"
+SRC_URI[sha256sum] = "42ab8db9e20d8290a3b633e7fbb3cec15db34df65fd1015ef8ac1e4723750eeb"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.37.3


