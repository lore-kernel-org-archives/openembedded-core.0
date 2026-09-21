Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5F4C982F0
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:40:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42911.1789969211027980883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 22:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IbDoWkLH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fKN6ZsjO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0c27a9aba-98d51d43-06dd-46cd-ba77-02fbfe496271-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789969210;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+ipwcItY9M+RJZ7L6HsWxhkTcbRON15b5wtrG//5DaU=;
	b=IbDoWkLHL0G5nP4HtjFSFMwisuNfXBpnbqkmV4WtBSY11+x1gAlLnK/MVm8rKdWo
	r5FmUSw5cDuD/2E7zLLJ1BM+lAs6ktJJWYDhGoQ13wtgPBQDWAzN/1kqk1lYdL1B8wp
	3vaLe+NN92ry7qgcR/S0U81XODEzReIYc1mcmm9g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789969210;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+ipwcItY9M+RJZ7L6HsWxhkTcbRON15b5wtrG//5DaU=;
	b=fKN6ZsjOQR/6CvKlnnvGYTHCim42cScHzSN+U7DDqjebGZlmcfcmJvqWzZ1feKLx
	0B8lUPe0oFEtS4kV7Il7uZZZ0/vv/AGNc/uQXZdRrCnZkIy0hWL1LIml/Iaawg9qp9y
	J5L2vJuJjGn8cNgXnE1U3dtEmyfmiEJgt+JJnULQ=
Content-Type: multipart/mixed; boundary="===============5889079258632179768=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sumanth Gavini <sumanth.gavini@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 6.1.0 FAILED
Message-ID: <010101a0c27a9aba-98d51d43-06dd-46cd-ba77-02fbfe496271-000000@us-west-2.amazonses.com>
Date: Mon, 21 Sep 2026 05:40:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.21-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246281

--===============5889079258632179768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm* to *6.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-06cee827bd22979de556b1e62eed88747ef44413"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:06cee827bd22979de556b1e62eed88747ef44413"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto f832c7e69945248dd5bcfcacfd10c176ee300fa2
WARNING: Command 'git rebase f832c7e69945248dd5bcfcacfd10c176ee300fa2' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt
Auto-merging tests/pinned/rpmsigdig.txt
CONFLICT (content): Merge conflict in tests/pinned/rpmsigdig.txt
Auto-merging tests/pinned/rpmsigdig6.txt
CONFLICT (content): Merge conflict in tests/pinned/rpmsigdig6.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_6.1.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/rpm.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5889079258632179768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rpm-changelog.txt"

Changelog for rpm: 6.0.2 -> 6.1.0

f832c7e69 Preparing for 6.1.0 release
1f159ae03 tests: Update tests to work with PQC-capable rpm-sequoia
5a4cb7230 Preparing for 6.1.0 rc2
6aaa1b0cd Harden the ndb implementation against integer overflows
cc234f04f Add a test for CVE-2026-44605
2503eccc1 rpmsign: handle _file_sign_key_id values greater than i32::MAX
c54e0e4ba Use rpm's own allocator instead of malloc() almost everywhere
864379ca2 Fix a dumb regression from introducing %define options
90fcbd29b Fix typo in add_sysuser ternary
54f3956e2 Add a test for the manual "%add_sysuser m" use
852aa4baf Fix rubygem extract regression from b8b54f92c65bca7bfdd80c3ecf717d5c48b02e91
661c1c7af Add a test for Ruby gem extraction
694511944 Prevent command injection in rpmuncompress(1)
3aa0d952d Workaround a broken %_passwd_path (and group) override in nss-altfiles
54c6b4904 Fix installation of 7zip in Dockerfile
e7f457f1f Revert file trigger STL refactoring for further investigation
cce603f96 Preparing for 6.1.0 rc1
c4d803c07 Bump CI to Fedora 44
5dddf66d1 Add compat links for rpmuncompress and rpm-setup-autosign
5c56e69e5 Bump rpm-sequoia requirement to >= 1.10.2
f2ac80b80 Implement -e(xpand) and -g(lobal) options to %define
85ec789b5 Fix regression when parsing macro define with an empty body
7e0f77353 Fix regression running Lua scripts from non-rpm generated packages
b6f2cc52f Prevent buffer overruns in findPreambleTag() for language string
b186b739b rpmsign: enable signing files with PKCS11 tokens
37636202f Implement a separate lock for the keystore
1cef3bbf3 Refactor rpmtxn lock initialization a bit to make it more generic
47c4ff980 Test actual regular user query instead of lock file presence
7c7b9e50e Refactor rpmdb rebuild test to separate RPMTEST_CHECK cases for clarity
efc1e0ba5 Add some tests for rpm access from scriptlets
fdc5a6e41 Emit a specific error on modifiers incompatible with parametric macros
abb90366d Implement one-shot macro modifier <o>
9289453b5 Clarify the macro stack behavior in the manual
5e3240a07 Render macro modifiers in --showrc output
1dd828f02 Fix signature alignment in --info output
0a45aefa0 Only execute psm_pre and psm_post for the main package operation
bfefc137e Add + use an internal macro for determining script-only install goals
9ae0c253c Fix rpmkeys result wrapping around, potentially returning 0 on fail
099128396 Use a sane identity string for syslog
bbba5b986 Fix wrong operation names used in the syslog plugin
035a4f71c Document rpmkeys output and the overall verify policy in some detail
9da412204 Use our central system.h include for Lua posix extension too
0e2e0885b Remove upper bound on locale filename length
a698d1b6b Move rpmuncompress to the standard binary directory
1f554d12f Move rpm-setup-autosign to a standard path
ab98d0a87 Use close_range() to set close-on-exec on all fds
975fbf197 Fix missing TOOLCHAIN ARG in second image stage
a29a78c42 Take advantage of literal modifier in our query format related macros
ddcd6fae5 Support defining literal macros via new <l> modifier syntax
827dc101f Use C++ string primitives for macro option parsing
ab1991084 Refactor macro definition parsing to utilize C++ strings a bit
976dab089 Minimally adjust doDefine() to take a C++ string as the string to parse
fa8d131f1 Refactor doArgvDefine() to use a C++ string for formatting the args
213adde18 Add a test for the "name { body }" macro syntax.
cc0622091 Revert AI submissions
47b005e67 Fix rpm --undefine and Lua rpm.undefine() bypassing sanity checks
ecd797509 Add rpmUndefineMacro() for %undefine API counterpart
fa336cbbf Fix/clarify rpmDefineMacro() documentation
00059c1ec docs: document repeated -f option for %files
50400a917 docs: add SHA3-256 header digest to signatures_digests
cb45566ce docs: document %end marker for spec file sections
f713e791c Fix some wording in sysusers man page
02aca1603 Fix section reference in sysusers man page
8019d9071 Add a man page for rpm sysusers integration
e0a547b7a docs: fix SHA256 tag value from 272 to 273
6475b0008 Fix user argument placeholder notation in rpm-lua(7) manual
4ea8622a8 rpmuncompress: Add support for CAR files
f838ef83a Validate the IO engine specified in Fdopen() mode string
501526cf3 tests: Adjust policy for current sequoia
2b937dbd4 tests: Add test case with unknown key type and signatures
6f23918af tests: Add MLDSA87 key and signed RPM
f8d680849 tests: Test case with untrusted signature type
672982bb9 tests: Pull new rpm-sequoia to build image
46fcf36b3 tests; Use quay containere registry
d7611817d Enable -Werror in the dev-clang preset
7936381dc Eliminate variable length array (VLA) use in spec %files parsing
e1e1240b8 Eliminate variable length array (VLA) use in spec file addition
6f4ea08c2 Eliminate variable length array (VLA) use in %files lang parsing
0c8bf5ca4 Eliminate variable length array (VLA) use in rpmuncompress gem handling
f556b1d80 Eliminate variable length array (VLA) use in cpio strntoul()
c09593f61 Eliminate variable length array (VLA) use in cli query filter parsing
554e2452c Eliminate variable length array (VLA) use in rpmdb label parsing
f94b85764 Eliminate variable length array (VLA) use in rpmtriggers
18a4d495e Eliminate variable length array (VLA) use in headerFormat()
7b863abd3 Eliminate variable length array (VLA) use in various temp buffers
7989767af Eliminate variable length array (VLA) use in rpmvercmp()
6fcca9ee3 Eliminate variable length array (VLA) uses in the macro engine
aaa94d345 Extend rpmdb query test to cover tag=value mire patterns
480ad2864 Eliminate a pointless variable length array from cpio name reading
e1851928e Eliminate an academic variable length array from cpio payload write
6f8dee378 Fix an ancient & vs && issue lurking in selinux policy parsing
1c2df419b Help Clang recognize a compile-time static value
33ac20e4d Silence a Clang warning about unused return value in fsm
e9136ae86 Fix leftover enum type mismatch in xml-formatting switch-case
50c78caa8 Add a cmake preset for Clang and enable it in CI
587d1a199 Add a cmake preset for GCC
7369ea4de Parametrize the toolchain in mktree
8ef1af91d Add a rudimentary cmake-presets(7) file
9b439b2da ifdef out unused static inline functions in ndb
b9348c339 Fix ndb-related double definition warnings from clang
961023328 Fix delete_key_compat() friend definition
cc6499701 Refactor file download out of the big install loop
50dd5d2a4 Rework the rpm cli install and download routine for sanity
a077677c5 Drop redundant relocations member from rpmEIU struct
b82f32f21 Refactor argument globbing out of rpmInstall()
24d9e902b Add some tests for installations from remote urls
9296d05a3 Reflect pgpPubKeyLint() error code in rpmtxnImportPubkey() return
8e9e7487f Add a test for rpmtsImportPubkey() return codes
9bacc7960 COPYING: Add SPDX identifier clarification
bb9397395 Add GitLeaks whitelist for our test-suite keys
be09b776b Fix broken link to rpm-dependency-generators.7 man page
4ce1359eb Add back support for NSS based user/group lookups
e175a9a92 Fix regression in group name lookup
37bed1c7c Update tests for user/group lookup via NSS
6052d5060 Honor alternate root in system user/group provides
2530a42e4 Fix "package X does not verify: (null)" output in some configurations
a34f5cb11 Fix "No patch/source number X" not returning an error code regression
3ce878e8b Add tests for missing patch/source errors in %prep
5bb0e1884 Allow tag extensions to be used in db pattern matching
6e1d59163 Add more database iterator pattern match tests
428332d19 Eliminate the now redundant rpmtriggers wrapper struct
15dfb472a Convert file trigger structures minimally to an STL set
65212d915 Document that overriding declarative sections is possible and dangerous
294b68b87 Fix transaction verification output as well
349bb010d Move signature lints output to post-verification where we know the result
8da92f9cf Introduce yet another variant of rpmKeyringVerifySig() for returning lints
5db51df43 Split some tests to individual RPMTEST_CHECK cases for readability
11dc680bd Drop NOTFOUNDs output for items that are disabled in rpm config
9a68128a6 Fix bogus verify output in some order dependent cases
6f56982a2 Split <corrupted signed> 4 test to separate CHECK cases for readability
75f8c69d2 Add tests for non-verbose rpmkeys operation with multiple signatures
dad07208a Verify all types in transaction verify again
4a9b7b590 Add tests for user/group lookup via NSS
524084c49 Fix RPM self-destruction in Dockerfile
e7ed26032 Print shortened ftype in package color listing
f55d5b829 Refactor the package color check
0bdab1a03 Print outlier files not matching package color
810352d6d Show NEVRA in package color mismatch log message
f8f33d2ad Move package color checks to rpmfc module
6bbbf823e Add tests for rpmbuild package color checks
b5de0f8c7 Add generic program name handlers
a62d8508e Add portability wrappers for program name handling
a8ac96550 Standardize on stdin/stdout/stderr use in manuals
54fd7a441 Add entry about %caps to spec manual
3617d160e Let the system runtime environment provide users and groups
b3d5f0aab Document that rpmtsOrder() output depends on package addition order
afd90dc98 AIX: Fix compilation error due to __errno_location
9db75f10d Fix up RPMVSF_ entries in man page
759c696a2 Add some missing RPMVSF_ values to the manual and Python bindings
49cc41439 Fix file triggers running twice from add/remove elements on upgrade
470f5d683 Lift the transfiletrigger skip logic to a helper function
0131b1183 Add tests for %transfiletriggerun as well, missing since 2017. Uff.
2b334c3d6 Reproducer tests for #4030
9900d729d Drop percent sign from mkbuilddir script name
906db4228 Add BUILD PROCESS section to rpmbuild(1)
8557f2303 Add remaining tunables to rpmbuild-config(5)
d5cd89849 Fix some typos in rpmbuild-config(5)
35099525e Fix a typo/thinko in verify element sorting per algorithms
04799ffc5 Don't assume all digests we look for can be found during signing
2e36269a9 Fix typo in tsort doc
a594a1233 Ignore NOTTRUSTED returns in verification
7760e5466 Explicitly require at least one success and no failures for verify pass
cd525381d Add test cases for multi signature verification with disabled algos
282e7af03 Refactor some install verify tests to separate RPMTEST_CHECK blocks
d7fdc39b6 Dump the build environment info at beginning of a build
9b874d090 Export build script environment information to a well known location
cab027d1d Emit warning instead of error on failed key read
75de4f3eb Improve error handling on keystore load
08e30d8ab Bump CI to Fedora 43
f5d60e431 Honor rpmtsSetScriptFd() in Lua scriptlets
8470aa40a Add an internal API for (temporarily) overriding Lua output stream
c0e3681d3 Add a testcase for scriptlet output redirection
60ce7d140 Add a switch for redirecting script output to prpm.py
ffdb9e73d docs/man: codespell fixes (all simple typos)
dc1e8c763 manual: codespell judgement calls
8884a8997 Codespell fixes in docs/manual/
68b470cee manual: '32 bit' / '64 bit' => '32-bit' / '64-bit'
5f072e81e Convert + rename philosophy.md to rpm-design(7) man page
88a029728 Add extra tests to ensure all file-related arrays are the same size
371673e1a Fix FILEDEPENDSX size regression in 6.0
9cdd8a453 Add support for %check as a specific build stage in rpmbuild (-bk/-tk/-rk)
299dfd15b Fix -bf --short-circuit to not execute %generate_buildrequires
1100cb0d4 Add --short-circuit variants to the spec stepping test
7216d453e Work around misleading indentation in if-block (cosmetic)
3ef93e901 Fix CMake 3.31 normalized path warning
2c66cbd47 Point obsolete rpm operation aliases to the right direction
6f030d92b Add a BUGS section to rpm-common(8), noting some exceptions
cad54d84a Honor rpm-common(8) options in rpmuncompress
e360ca338 Use a friend function in delete_key()
cdf390bdd Fix rpmkeys --delete regression for short keyids
c66ec9ff5 Obtain fingerprint from rpmPubkey directly
04c7e4ae7 Fix a relocation related crash in fingerprinting
0c4faeb86 Update rpmdeps(1) to use the documented <operation> style
e889f997c Document use of <operation> in the man template
57a193e23 Add a man page for elfdeps(1)
3cb5f661b Document our testing and documentation requirements
7df09750e Chainsaw the coding bits out of CONTRIBUTING.md
dd3fe7cad Don't run CI on any documentation update
17940c254 Refactor path lists in YAML files
81f91556a Drop -Wno-sign-compare from rpmio/ too while at it
943b11192 Fix a bunch of signed/unsigned issues in string pool
f083f2790 Drop -Wno-sign-compare from sign/ as well
f674e996f Drop -Wno-sign-compare from tools/ as well
68338a930 Drop -Wno-sign-compare from librpmbuild build options
ac5589703 Add + use a helper function to make ptr distance strlen() compatible
f3ef0fa31 Use unsigned integers for number of files, part II
68b2d73b9 Fix mixed signedness comparisons in generateBuildIDs()
357db4fdb Trivial signed/unsigned type fixups for Fread()/Fwrite() return
b97328b8a Use unsigned int for the for-loop index
eb6fe72cc Use unsigned integer for number of files
08f5e8c65 Drop a redundant .resize() on vector before .insert()
a485b71ef Move -Wno-sign-compare to individual target_compile_options()
28daadde0 Fix wrong macro in rpmsign(1) example
7c8745e00 Make EXAMPLE sections in man pages more consistent
943b68fec Use proper man page references
92068c4fb Pull manual.rb plugin when building site
49e1e11f3 Fix a trivial documentation mistake
4e3309e5b Fix a trivial documentation mistake
502e7e88a Fix missing link to dependency generator documentation
8d804bf4c Remove dot from docs
eb404d827 Make rpm-plugins(8) more discoverable and drop outdated note from it
213d79c8c Fix URL in rpm-queryformat(7)
68d0c2dd7 Fix doubled words in man pages
644829c76 Fix man page index filtering
1584898f7 Update scriptlet terminology in rpm-queryformat(7)
f1dde3c20 Use preferred terms as per man-pages(7)
9d8fb82ea Fix layout field in man page redirects
8b1b8b59c Fix broken redirects to man pages, volume II
8ef270e81 Add an rpm-scriptlets(7) man page for all our scriptlet types
c14f07c7d Add man page linter workflow file
4e141c313 Don't run CI on docs-only changes
467f62191 Fix broken redirects to man pages
4d4a9b7ee Document that --rmsource does not affect NoSource and NoPatch
b23190601 Add API docs for pgpDigParamsSalt()
aadbe7d61 Fix build regression on WITH_SEQUOIA=OFF
266bdeeaf rpmio/lposix.cc: remove LUALIB_API in luaopen_posix() definition
08a1fa443 Add a man page for RPM dependency generators
2a03180e0 Add support for "singlefile" depgen protocol name
11b5715b9 Add lower version boundary to man template
eb4998108 Rename _find_debuginfo_extra_opts to _find_debuginfo_vendor_opts
6dfd4d2bb Add the ability for other macro files to pass options to the find_debuginfo script via a new variable: _find_debuginfo_extra_opts
179f329af Drop the lone, leftover comment about rpm 3.0.2 built packages
d9d615b29 Refactor rpmds rich dependency parsing to use C++ strings internally
0530cfff3 Refactor rpmds to store DNEVR strings as C++ strings internally
c829c96ca Refactor rpmdsNewDNEVR() to operate on an STL string internally
abd4dec73 Simplify rpmdsFilterTi() a bit, no functional changes
26cd2b208 Refactor rpmds N, EVR and Flags arrays to STL vectors
dfc336728 Refactor rpmds trigger indices to an STL vector
df0756624 Refactor rpmds Color array to an STL vector.
acf804f57 Fix typos in man pages
25f45d3e8 Fix typo in rpmsign man page
50587eea1 Update po module again for the latest translations
8cb3e63ef `rpmfcFileDep::operator<` should be `const`
8f1aee58e Remove duplicated include
094c78c6f Updating rpmbuild(1) man page to the new style
b3b87f803 Fix rpmds segfault(s) + memleaks on incomplete header data
db08639d0 Fix rpmdsTag*() to behave as per documentation on invalid values
05836afcd Fix rpmdsTi() invalid value confusion
62be8046e Fix rpmds trigger index to be optional as originally intended
a27a30ec8 Add Python binding for rpmdsTi() and a test
3de02de64 Add Python API tests for rpmds colors
9f35a358c Specify overridden member functions as `override`
daac712c8 Add a man page for rpmuncompress(1)
66f2f8b92 Ignore legacy signature tags in v6 packages
c00cdab05 Add hdrblobIsEntry() for testing tag presence from hdrblob level
cd08363eb Refactor header blob entry finding to a helper function
30ad28e0d Add test-cases for v3 signatures in v6 packages
d63e1c5b9 Update rpmgraph(1) man page to the new style
b0bb95db8 Update rpmdeps(1) man page to the new style, enchancing it a bit as well
5163de00d Drop outdated --nodirtokens from rpmbuild
1616b40d0 Match rpm2archive man page to what it really does
fbf316149 Use `std::any_of` instead of a raw loop
76cc20bc2 Use .cpio suffix for cpio output files
c06fabc1a Add one space per line to --info format
ff863b43b Fix the randomly failing dependency generator tests
7d8280930 Close file on all paths to prevent resource leak
d3ed13a97 Remember to update the po commit point on rpm side too
470195da5 Add test cases for rpmgraph
1ad1924f5 rpmgraph: Use our own argv code
982ce6014 rpmgraph: Drop unnecessary variable and fix error message
4db8dd386 rpmgraph: Prevent memory leaks in error handling
be3f8d180 Fix segfault in rpmgraph
5a66f4c2a Add --hash, --precent and --test for rpm --restore
6b9690d2d Update gendiff(1) to the new man page style
d877862a1 Minor tweaks to rpm2cpio(1) to better align with rpm2archive.
427c05667 Convert rpm2archive man page to the new style + many other refinements
ff7fc79af Add a bunch of examples to the rpm(8) man page.
293ee5173 Make the #3890 %buildsubdir issue reproducer more realistic
d145f9e47 Build the website manually, with native Jekyll
56e924b3a Refactor WITH_WEBSITE and PODMAN handlers
a90983e17 Fetch website template from rpm-web, don't bundle
2d90f4ff3 Split the earlier --restore test in two to test for the result code too
1f2cd8de4 Fix "--restore --all" regression when the rpmdb contains gpg-pubkey headers
a0c78f5ca Add a rpm-version(7) man page for the rpm versioning system
a8f256bde Elaborate a bit on our contribution acceptance criteria
ba9ac3c8a Fix missing delimiter in tags page
4743ea8fb Create transaction lock file after rebuilddb
aeb410f0a rpmrc: Drop left over free()
94fbe3ac1 Ignore macrofiles directives in rpmrc
2c7933db5 Add E2K architecture support
fe5445bc7 rpmrc.in: Move 'arch_compat: loongarch64' closer to similar lines
d8b9bd44f Don't use heredoc in Dockerfile
62c8462ec Bump version to 6.0.90 to begin the 6.1 devel cycle
bb20c4218 Add a test-case for %buildsubdir in Buildsystem, expected to fail now

--===============5889079258632179768==--

