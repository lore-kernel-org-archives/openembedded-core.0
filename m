Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DE4C5DF8F
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 05:46:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1325.1787291157553059688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 22:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MGT4rQly;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KDAX+JEk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a022dac069-0d502ab1-04b7-41cb-b352-a8ab95fc0e9c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787291156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=70l/1B7vgQiFJ6C0H5rZa94q961NrKRZM85WsWBCctU=;
	b=MGT4rQlyz3ma0tYCuf75u1aZwd3s2anPgDykL6jmj3tFOu/hDeAKDfs7PHO5gEGW
	VfiCg1RsMm4qR99qdzSJ8qqAFIE7P5OvTW7FOz8pO5b7U6kIFqGB7zrYlzQh3uShkPj
	JWNzcZ3sq4hul4ACVwUz8TCyo7inO7E3/NwkOLFM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787291156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=70l/1B7vgQiFJ6C0H5rZa94q961NrKRZM85WsWBCctU=;
	b=KDAX+JEk0RfA/PIybgb+EH1lwQn3jIZKJX+90uoqmZ+vxlOyViYsrmNBLJaJIfat
	Sdb4WX/VqKxUWvGSDs0TihMVnGQ8buocXhBkMTNAeTJ/ltlbyYZnBANoJKpM0We5wQw
	gg/i0D3d6nRgudvtJeM1KrHFNHeeGIxQmdL7fxRk=
Content-Type: multipart/mixed; boundary="===============5636847547151258859=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 6.1.0 FAILED
Message-ID: <010101a022dac069-0d502ab1-04b7-41cb-b352-a8ab95fc0e9c-000000@us-west-2.amazonses.com>
Date: Fri, 21 Aug 2026 05:45:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.21-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 05:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243891

--===============5636847547151258859==
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
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1985 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-fe71e10ac32df11ab0cd37821b94b3d0d1291664"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:fe71e10ac32df11ab0cd37821b94b3d0d1291664"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
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
Auto-merging tests/pinned/rpmlibver.txt
CONFLICT (content): Merge conflict in tests/pinned/rpmlibver.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_6.1.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/rpm.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5636847547151258859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rpm-changelog.txt"

Changelog for rpm: 4.20.1 -> 6.1.0

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
1c815d352 Fix a missed article in the identical sig. warning
b015dcce4 Refactor legacy signature presence checks
5986d5f11 Fail when adding a legacy signature and one exists
3b8c35b3b Drop tests for unsupported v3 sign combos
2a136bcf7 Add SHA512 payload digest to appease CNSA 2.0
35475eae4 Make it explicit that rpm v3 signatures can only be added to v4 packages
0d6d4bbc1 Add rpm-manifest(5) man page for the rpm package manifest file format
ac944c1e1 Fix fingerprinting regression from 08a6a5e848f007c2e8d83fc1df8712d1a43229f4
8f840313a Add a minimal testcase for shared directory erasure from #3762
0632d9120 Fix rpmsign possibly adding multiple legacy tags
efb2dcc1f Add more tests for legacy signature addition
5ed1e4671 Apparently link texts can't have embedded `` formatting
dddaab18c Docs: Link to %setup from %autosetup
f323d5572 Fix rpmsign possibly copying a OpenPGP v6 signature into legacy tag
9f92bbc3b Refactor the signing code to allow decisions where we need them
d9efdf871 Add a test for signing v4 packages with v6 RSA key (#3851)
d4e22da91 Fix regression on signature size reservation not being used
724e81aca Fix brp-strip-comment-note execution failed
5f27041f7 Don't segfault on dependency generator output
9675213ab Lua: Return empty result for no matches for glob()
ead95a015 tests: Verify corrupted signatures make verification fail
d4092051a Fix alternatives mechanism unintentionally kicking in for signatures
5fdfafed0 Only ever call pgpDigParamsSalt() on signatures
6abcc465f Store Sources (and Patches) as they are declared
4537a6abd Drop pre-4.6 rpmlib() dependencies from v6 packages
ef948df97 Make the test image toolbox-ready
1e0f6092f Populate DESTDIR separately on image build
152e74884 Fix up prpm.py installation path
99e8e6735 Add test for RPMTAG_SOURCERPM on dynamic subpkgs
e0add9796 doc: Deprecate rpmkeys --delete
8c7368f4c tests: Enable the sha3 signatures test
c36c717f4 Support OpenPGP v6 signature pre-salting
28e4f05c7 Support updating individual IDs in a digest bundle
1a1a05c0f Version bump for beta release
2b8b72f2b Print out file offsets from rpmdump
47cc6cf0a Run Python tests with ASAN
09a680763 Ensure header object is cleaned even in case of an error
32352098d Fix doubled word in man page
2659fb1fb Add algorithm ID's for PQC public key algorithms from the current draft
79ba4a3c4 Drop irrepairable pkgid and hdrid tag aliases, rename SOURCEPKGID to go
6ce5a3834 Realize rpm-payloadflags is not section 5 material
7075d8b2c Fail package install/erase on %triggerprein/%triggerun failure
927367b8e Don't add SOURCENEVR into v4 packages
dd8bfb8d4 Python module isolation: Remove global state
83e621b18 Python module isolation: Get the module state
b80f02483 Python module isolation: Add accessors for the module state
69f6144f2 Python module isolation: Associate the module with the types
5995b02ab Python module isolation: Add modstate declaration to individual files
7f773db2a Python module isolation: Use module state
ae3ccd01c Python module isolation: Visit PyObject* members in tp_visit hooks
dc5ffd065 Python module isolation: Convert to GC objects
2bbd6bd88 Python module isolation: Use the type allocation function in rpmfiles-py.c
dec7245d9 Python module isolation: Add runtime Python version
425c77bf8 Python module isolation: Bump minimum Python version to 3.10
91e9c1c77 Python module isolation: Move Python wrapper types to module state struct
d4eebe7c4 Python module isolation: Switch Python wrapper to multi-phase init
4044c3f2a Add test for fileattr depgen file sort
2f60a1041 Add a rpm-lua(7) man page for the embedded Lua interpreter
5631c4827 scripts/sysusers: Make sure $ROOT is passed to usermod
8a5e2003a Remove `md_dict` from all rpmfoo_Type's
bc0b94026 Sort files before passing to file attribute dependency generators
586f9a709 Reflect all scriptlet errors in rpmtsRun() return code
b1f783eff Add failure tests for all trigger and file trigger types
bc77b117f Add a testcase for sysusers scriptlet error failing the package install
c16e7799c Add a missing sysusers keyword to couple of tests
c8f416092 Split scriptlet failure tests to separate RPMTEST_CHECK() cases
a26e7d985 Rename rpm-macroproc(7) (back to) rpm-macros(7)
99d80a22d Default to v6 package format
8368aec31 Tidy up + improve the --verify output section of rpm(8)
f8fb06905 Add a SHA3 header digest to v6 packages
325757e70 Add guidance on referring to the RPM project in the man template
727ab804b Fix a couple of leftover references to the working name rpm-macros(7)
862b3d2e3 Fix an invalid reference to EXPRESSION in the macro man page
30b3526c7 Add rpm-macroproc(7) man page for the rpm macro processor
83d2c1701 Don't bold example descriptions, ugh
e14502834 CMakeLists.txt: Improve checking for CFLAGS
ca6a6b1b4 Add a man page for rpm queryformat
70db7976d Avoid Python reference leaks
76171304e Don't print empty return of --eval macro expansion
459864270 Quote ${ASANLIB} to prevent problems when it's undefined
924407e26 Run the configured Python interpreter
e60c7e5f9 Ignore stderr on the sourcerpm test to avoid bogus failures
c08f0194e Argh. It's SHA256PAYLOAD, not SHA256. Argh.
304df9aec Fix forgotten payload digest reference in rpm-config(5)
a396f10d6 Add SHA3 payload digest and -alt variant to v6 packages
9b4c74850 Tiny refactor to delete dummy header entries centrally at build
4d1276ac5 Allow underscores in RPMTAG names
d8f2cdd41 Drop PAYLOADSHA256ALGO from v6 packages
f14557cd5 Rename PAYLOADDIGEST tags to PAYLOADSHA256 to match reality
33ddefb0e Avoid commas in RPMTEST_SETUP_RW() title, it gets broken up
0320d6119 Add test to ensure RPMTAG_SOURCERPM on debuginfo
1483a8024 Add notation for "feature added in version" to the man template
f2a5fc462 Add man page section 7 to index page
befaf8336 Require use of internal dependency generator for v6 packages
b5ea66400 Add tests for internal/external dependency generator behavior
a707d0095 Try to honor rpm install prefix in the legacy depgen scripts
73e1c149c Require all queriable tags to have a have a declared type, doh
5fee5c13e Add redirected.html layout for Jekyll
f1f425953 Use cmake variable for rpm version in docs
9f251cc41 Document rpm v6 signatures in the format and signature summary docs
1ca57c6cf Make API docs part of the reference manual
bc194341d Clean up the docs index page
0bec95bd9 Add RPM version to Jekyll site's config
0b30b1263 Use regular Jekyll pages for HTML man pages
00fc92f40 Add a manual for build-side configurables
c9cae75bc Fix a bogus comment, there's no PAD signature tag anywhere in sight
d8de849e0 Fix a regression on rpmbuild -rs failure on non-existent directory
841709321 Eliminate uses of the non-portable signal(2) API
2533e0276 Consolidate payload flags documentation to rpm-payloadflags(5) man page
550f35b89 Drop leftover remark about Lua being optional
1c6856594 Add some signature tag level tests around signing
bb028ef5d Teach rpmdump about RPMSIGTAG_OPENPGP
1dccba412 Fix some cases issues in rpmdump signature tag names
9b5da35db build: record source package information
24d6973fa Fix bad descriptions in buildprocess.md
bde8be8c8 Fix a typo in the rpm2cpio manual
e0233f7a2 Fix a couple of shellcheck warnings
060409b6e Make rpmkeys key lookup case insensitive
ad114b017 Fix rpm v6 signing with algorithms not supported by rpm v4 signatures
7822410ab Don't try to verify key id/fingerprint lengths in rpmkeys
bffdc56ef Add OpenPGP v6 test keys
8b1de0bd9 Bump rpm-sequoia requirement to 1.8 for OpenPGP v6 support
74065ae54 Bump CI to Fedora 42, drop support for EOL'ed Fedora 40
0c92d7643 Rework the way rpm package format version is passed around
49285ea6f INSTALL: Add C++ 20 requirement
0db2180a0 Fix various minor issues in the man pages
492ff071d Fix a regression when calling rpmReadPackageFile() with NULL ts
4fc1e0ca9 docs/manual/macros.md: Fix minor syntax issue
16eca3199 Docs: Link to lua docs, in macros manual
f20e789f3 Add an API for per-package verify level control + python bindings
55d22df4c Avoid duplicating package digests with yum/dnf
f08348247 Add a mini rpm in python for testing purposes + some tests
ea313467f Fix colon separated lists in rpm-config(5)
a333eaa3f Fix a refactoring regression in rich dep and rpmdb set calculations
107fd9dab Add rudimentary rpmspec --shell test
7931850da Add a test-case for update failure error code (#3718)
c1b33879a Revert "Drop redundant argument from rpmcliTransaction()"
96fe05627 Fix memory leak in rpmspec --shell
46418a2a9 Add rpm version to man pages
a41a2c30c Store configurable digest(s) on packages from verification into the rpmdb
49844e90b Add a tag format extension for displaying hash algorithm names
cdf8ac7f0 Add simple internal means for rpmte's for storing auxiliary data in headers
c0d84d40a Refactor individual package verification to a helper function
0ecca60d5 Handle fdSize() failure in rpmSign()
063427c5f Return -1 from fdSize() for non-regular files
2e4b7d7d1 Add an AI-policy to contributing guidelines
c532394b4 Bump library version to 10.6.0 in preparation of 6.0 alpha
c69a14521 Rename rpmtsRebuildKeystore to rpmtxnRebuildKeystore()
292d931b4 Fix up references to non-existent rpm.common and rpm.config manuals
703fe5062 Add man pages to explain rpm runtime macro configuration
4e166c153 Add note on optional doxygen dependency to INSTALL
38baafa27 Make our dist tarballs pristine and reproducible
760a63880 Minimally fix C++ one definition rule violation in the rpmdb backends
9d0535b33 Fix some tests assuming that sqlite rpmdb is the default
24b6b18ea Introduce %{span:...} macro for multiline macro sanity
e4a6dd45b Add missing linebreak to rpm-setup-autosign(1)
d48afcb9a Split autosigning setup to a standalone script, enhance
e3cbd3405 Make a few signature/key tests to be less sensitive to the environment
46c51e46b Drop obsolete RPMTEST_INIT calls
cffb05897 Add missing manual pages to cmake list
65178e0cc Check RPATH and RUNPATH separately in check-rpaths
e60800b68 Adapt GitHub Pages workflow file
28d66f3dc Add stock GitHub Pages workflow file
60c8e9801 Add man page summaries to index
6435043ec Fix NAME summaries in some manuals
05769a6f6 Split tools by man sections in index
204c6d3af Auto-generate man page index on Jekyll site
fc7d9d955 Generate HTML pages from scdoc files
0dcd49c81 Add support for per-page css in Jekyll layout
c6d272c9f Fix indents in rpm-common(8)
31ca734d9 Drop redundant ENABLE_JEKYLL cmake option
27492f026 Configure Jekyll site in a separate directory
04f1a554b Add missing entry to site_files variable
d685438b7 Use docs/Containerfile from source dir
572844039 Add a man page for the rpm macrofile format
8580b386c Fix --addsign/--resign help text to match new behavior
336cda555 Mark a few internal classes as such
ec6cf4bd7 Add forgotten "static" to a some internal-only symbols
4028ec9bf Mark a bunch of internal functions thus
049ddc746 Fix a violation of C++ one definition rule in callback data types
5ec107cd8 Drop leftover C extern guard from internal cliutils header
845aa4720 Mark all rpmChroot*() functions internal
9c50530dc Mark all rpmcpio* functions internal
cde518d3c Update rpmdb, rpmlua, rpmsign and rpmspec manuals to the new man style
24c4f2971 Add explicit instructions to delete redundant man sections
9011a45ee Disable new usages of Lua posix.fork() family of calls in >= 6.x
e1d7046ba Fix check_c_compiler_flag cmake tests
eb1ee05c6 Make %_passwd_path and %_group_path lists
6cf15a362 Never gpg sign git commits in macros gpg may prompt for a password which will hold up any package from building
e8fb8531d Add "make site" target for building Jekyll site
1a50aa60b Configure Jekyll pages with cmake
3e4bb0d44 Fix link to API docs in index page
4740d43f4 Add Gemfile for docs
663bc135e rpmkeys(8): Correct a typo in _keyringpath macro name
cdfc6380d Suggest imperative style in the man page template
44af79651 Convert main rpm(8) man page to the new style, more-or-less
8f32f1fd7 Move common options and operations to a new rpm-common(8) man page
16e4c27dd Document install-relevant options in the main manual install options
9d9575f71 --noglob and --nomanifest are package selection options, move them there
48f7f34de Add a template man page with style guidance
f37e8462f Add %{xdg:...} macro for evaluating XDG base directory paths
c2f760188 Add new tag and algorithm ID's and descriptions from RFC-9580
e07341097 Fix OpenPGP packet (tag 17) name & description
48b817736 spec.md: fix changelog toc item to point to the anchor
e219a5c04 Use stderr for %dump (#3648)
25eb141e0 Reformat rpmkeys manual to show the new man-page standard
7fc9383e1 Use files instead of redirects in test case
b3398aed9 Check architecture before building
75de02219 Fix empty password field in passwd/group causing entry to be ignored
81d598aed Make built-in macros usable before explicit initialization
bf5edf43a Fix buildsys specific %prep section not accepted
6c4d979e3 Implement rpmkeys --rebuild
287fdaee2 Add keystore::delete_store()
4aaeac403 Open rpmdb when accessing the rpmdb keystore
18205012d Move getKeystore to keystore module
4c144d082 Add a brief note on exceptions, esp std::bad_alloc, to contrib guidelines
42d5aa2a0 Move most rpm command man pages to section 1
aab013a8a Drop invalid -d/--debug switch from rpm-misc(8)
46dcc7942 Drop couple of duplicates from rpm-misc(8)
578241ec0 Document rpm --specfile as obsolete, point to rpmspec
5c1a8e8d9 Drop subsections from rpmbuild synopsis to make it clearer
8f7666dae Drop legacy note on executing rpmbuild, this is 20 years obsolete
a9701628d Remove bolding from option placeholders like [select-options]
c72b90e4e Use underlines when referring to file names in manuals
5fe18a86a Use underlines for user-input parts in man pages, like deity intended
074902c69 Only bold the option names in man pages, not the surrounding constructs
b043604b9 Fix RPM version introducing u! in docs
06b853bd4 rpm-plugin-dbus-announce.8.scd: Correct how D-Bus is written in the man page
c6ff20d03 plugins: Add D-Bus interface definition file for dbus_announce plugin
e01bbf0f5 dbus_announce: Provide information about packages in the transaction
4c67bc00a dbus_announce: Split send_ts_message() into two functions
c8cc0e977 Mass rename man page sources to .scd to reflect the actual format
929dd3979 Convert man pages to specialist tooling: scdoc
061a51396 Convert other elfdeps data structure strings to STL strings
d8de305d3 Use an STL string for temporary soname storages
6e77ce463 Handle dependency tokens as STL strings inside add*Dep()
2877925ac Use a C++ string for skipSoname() convenience
2ba3ae9bf Convert elfdeps dependency storage to STL containers
08c5262b3 Isolate dependency additions elfdeps behind addDep()
93f763376 Natively allocate elfdeps main structure
69be1de25 Fix regression on buildarchtranslate overrides
54b323e51 Fix a copy-paste help description of rpmbuild -rf and -tf
ea73d6d12 Fix missing GITHUB_TOKEN permission setting
5ed753563 Remove AUTHORS sections from man pages
0f9a89c9a Replace custom myprint() with print() from Python's stdlib
b9bcfa381 Enable enforcing signature checking by default
9ee7294c1 Use a more specific grep for various rpmsign tests
b1207d61a Add --nosignature to all tests using unsigned pre-built packages
978884596 Don't make assumptions about default pkgverify level in tests
3ff9f13b4 Generate release tarballs via GitHub Actions
3e24aeb2f Support automatic signing on build when %_openpgp_autosign_id is set
6d863706c Convert package build priority calculation to STL
f4fa3394f Check that ds.Count emits deprecation warning
a4b809d18 Switch test-suite to the openpgp keyring by default
93757aa21 Put temporary macro overrides to the central macros.testenv file
86ab946f6 Fix rpmsign --keyid regression from the signing macro rename
219f241f0 Move output on signing success away from the librpmsign to the tool
aa778ec6c rpmte: Don't use list of tags
e1eb24680 Add tests for HDRID, PKGID and SOURCEPKGID
8dcb40db7 Add package format detail tests for source packages too
67b7e1e51 Build both binary and source in package format + repro tests
f764704b5 Drop read-only source guard from CI, it causes test irregularities
e426de95e Document libarchive dependency in INSTALL
a7af54b9f Drop WITH_ARCHIVE build option leftoevers
b0b6f03d6 rpmte: Move dependencies into an unordered_map
147de53e5 Add a safe-guard to the test-image setup script
07b34a076 Drop the pretense of supporting $DESTDIR in test-suite setup
311a4428f Bump CI runner to Ubuntu 24.04
7b1eefb4e Use runuser instead of sudo for test-suite user changes
efae07c50 Demonstrate oneliner bcond syntax
c86f42448 Move test-suite dbpath setup to macros.testenv too
a02543516 manual/autosetup: fix typo in %autosetup desc
76576080a Drop now obsolete runroot_other test-suite helper
78c21f4ed Set test-suite %_tmppath centrally from macros.testenv
39a3fcf84 Eliminate the need for explicit RPMTEST_INIT
e43a66c8e Only try to unmount test snapshot if previously mounted
dfa02ba45 Clean up irregularities in a couple of test-cases
0774f647e Refactor test snapshot mount and umount into separate macros
15119459d Add RPMTEST_SKIP_IF as a wrapper for AT_SKIP_IF and use it everywhere
ad3367068 Add note on ASAN/UBSAN affecting test performance
1a99ef7b5 Explicitly separate test-suite rpmdb reset from test initialization
6e80bdbd8 Split testsuite rpmdb reset to a macro of its own
5dae33c3d Add RPMTEST_SETUP as a wrapper for AT_SETUP and use it in all tests
cad23aedc Rename RPMTEST_SETUP to RPMTEST_INIT to make room for manouvering
05ae9b7a6 Fix sq signing using invalid cli switch if %_sq_path is defined
5901f166c Bump the C++ standard version to C++20
d83db607c Avoid bitwise or'ing of different enum types
28db83594 Avoid using C++20 reserved keyword 'requires'
766192aaf Prevent base images from accidental prune
d00870b45 Add a mktree command to actually tag the image
f06029da8 Truly separate test images from each other
add3e0676 Run test-suite environment setup inside the image
23d64740b Merge the keys directly in the keyring
aec3d1d09 Migrate "personal" config in tests to new-style XDG config dir
53a3667b2 Move keyring configuration in tests out of root's ~/.rpmmacros
ecef50184 Move test-suite build config out of root's ~/.rpmmacros
c17cc6915 Drop the %_dbpath override in root's ~/.rpmmacros from our test-container
e8c7443b5 Fix a few rpmdb tests relying on test-image system rpmdb
e5759c3ac Fix some keyring tests making assumptions about system rpmdb location
370c5b5b5 Create $SYSCONFDIR/rpm directory on "make install"
9b26f4264 Update sequoia-sq to 1.0 for CLI switch stability
d319c79c6 Drop Spec syntax related pages from index
55453a055 Add table of contents to Spec page in manual
e09a79afb Downgrade headings of examples
105c5e832 Ignore EPERM for root when setting IMA signature xattr
3755fca7b Give the main IMA tests a more descriptive name and a distinct keyword
eea34122b Move the src.rpm IMA signing test to the main IMA test group
3a093929a Document ways to declare sources and patches
97185d58a Fix various issues with the man pages
ada818784 rpmdb.8.md: Talk about rpmdb instead of rpm
b3e0c41ed Fix race condition in rpmioMkpath
675216616 urlOpen: Set errno to ENOENT on error
7082585a8 Fix formatting in man pages
528ceb93f Lock the GitHub CI runner to a specific Ubuntu version
87e45cfa2 Fix thinko in sysusers macro enablement comment
5a5347037 Add missing documentation for attributes. (#3488)
cae8ef521 Set RPM_PLUGINDIR in top level CMakeLists.txt
4d621e48e Convert rpmrc variable storage to STL unordered_maps and strings
34a7b88bb Convert rpmrc cache to STL unordered_map + strings
64aa66b9a Convert equivs table to STL vector + strings
387a2ca6e Refactor equiv-table printing to a helper function
e4836c189 Convert rpmrc canons table to STL unordered_map and strings
7be4b7958 Convert rpmrc defaults table to STL unordered_map + strings
e72bc5e08 Add tests for the arch compat info on --showrc and /etc/rpm/platform
04fb405ea Make prefix-aware sysconf location available to the test-suite
a28bf667a Add a simple archscore test
5b2abeae2 Fix regression causing a build directory left behind on rpmbuild -bs
258fd692d Update index of man pages
0a8a0ed5f Fix brp-strip when using regex-unsafe build root
f9f124a67 Don't run plugins on src.rpm unpacking (RhBug:2316785)
f7142bf89 Don't let src.rpm packages be file signed
19d68b5bc Fix simultaneous source and binary package install
78f304423 Check actual unpacked files in src.rpm tests
8ae5f1d0d Typo in the expression.cc file in error message
234706084 Support new u! command in sysusers files
581a96142 Set v6 default payload compression to w19.zstdio
aa722431c Ensure gpg-pubkey packages not having OS and ARCH
35a639056 Don't allow installing gpg-pubkey packages
788a9be70 Add test case for missing mandatory tags
b92bd1b9f Don't allow installing packages without ARCH or OS
4e1433df6 Test rpm -e gpg-pubkey
6232bd376 Add tests for IMA signature deletion too
1847fd6be Fix possible package corruption on --delsign/resign/addsign
b86d972c2 Add a test for deleting a misplaced IMA signature
9344367ed Add support for SHA3-256 and SHA3-512
71e88ec08 Make the signing macros parametric
18c1f3071 Sanitize %__foo_sign_cmd macros
56c37fc73 Make macros::define() take the argument as a C++ string
97d9ea3e9 Make macros::load() take file name as C++ string
b4c9de2db Make macros::push() and push_aux() take name and body as C++ strings
8cf06f9a4 Make macros::pop() take name as a C++ string
4cbd2a922 Make macros is_defined() and is_parametric() take the name as a C++ string
6b52c76c5 Make macros::init() take the macro path as C++ string
e4dd38ec4 Make expand_this() take C++ string as the name argument
3d8ff74be And C++ native version of macro findEntry()
ef5b53820 Use RPMTAG_RPMFORMAT for rpm format detection in the signing code
ea46f4fd8 Add tag extension for rpm format version detection
2d0404ba1 Add missing documentation for RPMTAG_RPMFORMAT tag
e3e280ca8 Sanity check the requested %_rpmformat, fall back to sane default
85cf0fdbc Rename the rpm format selection macro to %_rpmformat
ee651ac2b Support passing an alternative home to Sequoia signing too
828f9b549 Drop the broken and unused %__openpgp_sign_path
aa19e2cdc Clarify %_gpg_path explanation in the main macros file
7f2c7136a Handle %_gpg_path in the %__gpg_sign_cmd macro already
1a86a89fa Tell sequoia-sq to create binary signatures too
0f3635919 Listen to stderr on Sequoia signing tests too
fe9a91478 Fix regression on build-id generation from compressed ELF files
5612c775b Update CI to Fedora 41, disable updates by default
41120de0f Skip IMA test when built without IMA support
a48cc0465 Detect missing file signatures in IMA test
93f2d3000 Use imaevm_signhash if available
4806340cb Add test case for ima file signatures
593d94ddc Update GPL and LGPL in COPYING
bea8f4557 Add support for multiple OpenPGP signatures per package, part 2/2
5630cf4bc Add support for multiple OpenPGP signatures per package, part 1/2
0cc0e055e Avoid trailing whitespace when outputing relocations in --info query
41552eee5 Simplify the v3 signature logic a bit
b760b9ca1 Refactor signature insertion to a helper function
51446f475 Drop unused header arguments, update comments in signing internals
8ace91ee4 Make macros::expand_numeric return int64_t
5d3a6c41c Vacuum the sqlite rpmdb if necessary
109d8aaf1 Document %autopatch -q in the manual too
3006c8455 Eliminate bunch of now unnecessary runroot_other() uses
d4125a341 Eliminate another bunch of now unnecessary runroot() uses
a3d164a0d Eliminate a bunch of now unnecessary runroot() uses
dd279b6d8 Eliminate all uses of the now redundant run() in test-suite
405a7ec20 Eliminate the last --define from test-suite run() function
356230d94 Drop apparently redundant rpmdb related defines from test run() wrapper
c2d87086c Move environment setup to RPMTEST_CHECK* directly
2ad6b87f8 Start moving test-suite macro config from --defines to .rpmmacros
0c18d64e8 Don't override root's .rpmmacros in tests
8c1fdcbbb Add test to ensure buildhost inside test-suite is what we expect
4a67189f3 Drop redundant --dbpath from --exportdb/--importdb test
aa5fb1e1f Drop leftover buildhost override from pinned tests
4c99a010b Don't delete delete
abb6ab1c4 Rename rpmkeys --delete to rpmkeys --erase
35cfb7de9 Add short CLI commands to rpmkeys
010564afe Eliminate use of rpmCleanPath() in relocation code
87e151b2e Eliminate uses of rpmCleanPath() in librpmbuild
56bd048a4 Add internal C++ counterparts for path manipulation functions
aa3c4b9f2 Don't try to redefine isblank()
b0c361e5d Remove rpm-plugin-ima in Dockerfile on F41
64ef32aff Drop support for F39 in Dockerfile
7713b8f94 Always build with -fhardened if the compiler supports it
69306a971 Oops, use same optimization level etc on C and C++ compilers in CI
de987cafc Handle error return from audit_log_user_comm_message()
09fb83a75 Kludge around removeSBITS() not properly checking errors for now
0738222a8 Fix invalid use of open(..., O_CREAT) in openpgp.cert.d
5dc1663be Test reading openpgpg backend with sq
69ac8ff01 Add missing code fences in tests README
3d26688fc Add note about square brackets to tests README
6e19c1602 Implement openpgp.cert.d based keystore
360c96e50 Refactor s backend into shared helper functions
bd907b0c5 Fixes + cleanups to rpmkeys manual
c43225b20 Use rpmkeys --list in test cases
56c441481 Call header+payload signatures and digests legacy
637580233 Add "OpenPGP" to all signature verification related messages
117e6b5ea Sanitize rpmsign --addsign/--delsign output
dd819c389 Run all signing tests with runroot since we now can
d8992bd13 Add -Wformat-security to our default build flags
95a66c698 Fix build regression with -Wformat-security
0dda395cb fix rpmdump output
3c06b9efe Fix rpmsign --key-id regression
02f09b321 Use consistent case in signature and key messages
ac25837ef Convert a couple of rpmExpand() usages to the C++ versions
439a60143 Replace macro locking with an internal RAII-style C++ API
7e9a80dd8 Return C++ string from macro expansion internals
47faf99c7 Use rpmlogOnce() in handleHdrVS
547ba0893 Add rpmlogOnce() and rpmlogReset()
40c53b6aa Fix a horrible performance regression caused by missing &
78cecdc3a Support Fedora 41 in Dockerfile
bf2c1c3cc Silence extra output on rpmspec query on Buildsystem specs
ebc406862 Make flags an optional argument to keystore->import_key
2e5730c89 Turn keystore into an interface class
43f372003 Return rpmRC from rpmKeystoreLoad() too
79b26f1ac Make keystore read protected by transaction lock too
c680d5e80 Move keystore type detection back to rpmts side
781bf3bc0 Drill pubkeys one level deeper into the keystore APIs
63e3061fa Require macro filenames to end in alphanum char
c0e43f81f Handle subkeys in rpmKeyringModify
ad461ce20 Simplify rpmKeyringModify(RPMKEYRING_REPLACE)
09510e413 rpmKeyring: Support keys with the same key ID
b133cd13e Refactor the subkey handling to a keystore helper function
364d28459 Split keystore handling to a separate source
5e5e6144b Refactor lower level keystore load to separate function
16ef3ee18 Refactor lower level keystore delete to separate function
a23edf0c6 Add + use pubkey based keystore delete functions
0e6875a38 Refactor the keystore level import to a helper function
c591a121d Drop unused subkey arguments to makePubkeyHeader()
14fcc9ebc Rename keystore load functions to rpmts prefix
30db42249 Add some internal APIs around rpmtxn, use in keystore operations
669938822 Use full keyid for the unknown keyid warning message tracking
027ef640b Fix FA_TOUCH'ed files getting removed on failed update
39068c228 Migrate from short keyid to fingerprint on key update
f81278f3a Use full key fingerprint for gpg-pubkey version and keystore
4c61c1f61 Drop subkey gpg(keyid) provides from gpg-pubkey headers
760d2a59a Pass rpmPubkeys one layer down when creating the gpg-pubkey headers
0e8c3dfca Default to test-suite disabled in cmake
c4c3d79d5 Drop mutex locking from keys, they are immutable
47f6b0e07 Return the fingerprint as const pointer from rpmPubkeyFingerprintAsHex()
c5ad88c94 Return the keyid as a const pointer from rpmPubkeyKeyIDAsHex()
d376e4513 Add rpmkeys --export
b02d648d2 Add rpmPubkeyArmorWrap()
118154406 Pass rpmPubkey instance to rpmtxnDeletePubkey
9618fcdbc Improve matchingKeys
e575fac7c Make rpmkeys --list accept short key IDs
5ffd0d886 rpmkeys: Match error message of --list to --delete
d66688362 Having no keys imported is not an error
5f5a016b0 Convert tests from gpg-pubkey to rpmkeys --list where possible/meaningful
bed3f113c Make the use of rpmdb keystore explicit for gpg-pubkey tests
a69577604 rpmKeyring and rpmstrPool nrefs to atomic_int
d173d6abe Turn FD_t->nrefs into atomic_int
2bd76a182 Turn rpmts->nrefs into atomic_int
a783fcb58 Turn nrefs into atomic_int
b2fd4eb86 Fix formatting in the rpmsort man page.
c2cc3c376 Fix rpmdb --exportdb from database on read-only media
93c0c1fd2 Honor read-only transaction lock mode
66e024ca9 Add an optional lockmode argument to the internal rpmlock API
4b830f7b5 Fix a memory leak on rpmdb --importdb
42985d548 Use keyring to implement rpmkeys --list
c20a40a74 Add rpmPubkeyKeyIDAsHex
9ad5eefcb Add a rpmKeyring iterator
a715e7e73 Update rpmkeys to use rpmtxnDeletePubkey() for --delete
9469bf8f6 Add rpmtxnDeletePubkey() API for deleting keys from keystore
0de0ce4bc Make the hex validator helper function internally available
e5a19bdd8 Move hex data length minimum length assumption out of validHex()
0c69d6173 Refactor fs keystore pubkey deletion to its own internal function
3abbfda57 Refactor rpmdb pubkey deletion to its own internal function
15241dfe0 Add caller-locked pubkey import API rpmtxnImportPubkey()
38ab926fa Update rpmtsImportPubkey() API docs to match current reality
81e71919e Add test for key update behavior
4ed184476 Ensure the keyring directory exists when importing to fs keyring
4168b1f97 Lock key during rpmGetSubkeys()
0e17cb8a5 Add Macros section to Spec page
ed929b7e0 Add forgotten %dnl description to macros page
a45134e7d Mass rename C++ sources to .cc/.hh extension
826339518 Fix up rpmuncompress not being compiled as C++
332edb78f Failed signatures print fingerprints, too
3b1f013c1 Don't print key ID if we have the key fingerprint
2af804626 Add Key Fingerprints to rpmsinfoMsg()
dbbb79603 Add rpmKeyringVerifySig2 that return the matching primary key
a78bc1ba5 Add  rpmPubkeyFingerprint and rpmPubkeyFingerprintAsHex
0fef806bd Use long PGP Key Ids in our test cases
3672e0be9 Use long PGP Key IDs for all outputs
d4e4a5bbe Link philosophy page from CONTRIBUTING file
683edbcd7 Reference Manual: RPM's Philosophy
ad48b6fb7 About Reference Manual
57791548f Document RPMDBI_SIGMD5 and RPMDBI_SHA1HEADER as obsolete
7b8ff813e Drop --pkgid and --hdrid query source cli-switches
bcf06fded Remove brp-elfperms script
61913883c Replace per-file libmagic strings with MIME types in v6 packages
82bb832bc Refactor file class tag extension to be more extensible
ed8af73f6 Add a simple --fileclass testcase
71c366d35 Fix up a c++ brainfart in file class dict generation
2d51a1810 Eliminate pthread_once in tag table preparation
493f4f7f3 Eliminate pthread_once from global config dir initialization
f9b3016eb Drop a leftover pthread.h include in rpmvs
31de9dc54 Eliminate an unnecessary round of locking from every rpmlog() call
3399065d9 Take advantage of C++ native mutex facilities for rpmrc locking
7fe204d0c Take advantage of C++ native mutex facilities for keyid tracking
e54abc75a Take advantage of C++ native mutex facilities for rpmlog
7e489edc4 Take advantage of C++ native mutex facilities for keyring and keys
a162cf10d Take advantage of C++ native mutex facilities for string pool
7f69da190 Take advantage of C++ native mutex facilities for macro locking
532e6b906 Filter Lua deprecation warnings based on the originating rpm version
dd4170021 Refactor scriptlet runner functions to take an actual rpmscript struct
af534c97b Enable C++ exceptions on the codebase
84ad2da0e Bump the lowest level file digest default to SHA256 too
adf51ae69 Add CODEOWNERS to enable automatic review-requests
1567dcbae Make sequoia signing work with sequoia-sq >= 0.38
931cb9745 Disable private mounts in chroot'ed operation in the unshare plugin
d05c4fc8e Drop self-provide retrofitting on v3 packages
fd8fbb0f7 Drop support for legacy region migration from rpmdb build
1fbf8aeb4 Enforce the same sanity checks on db add and rebuild
e484d99ca Expunge v3 headers from the rpmdb on rebuild
a76ef22c8 Drop support for installing v3 packages
a2686c55e Add some rudimentary v3 tests
948677c24 Add an "unsupported format" return code to rpmtsAddInstallElement()
937e72562 Fix memleak when process policies
5154a58b7 brp-remove-la-files: Remove symlinks, too
c8ceb9bae Don't consider header SHA1 digest for package verification by default
e4b3ffbb0 Don't consider MD5 digest for package verification by default
d9d5aa34c Add a rpmsign test where the payload is corrupted
ad661c3d1 Refactor some rpmkeys tests to subcases for easier maintenance
b65f69e0f Make vfyflags API test not depend on rpm default configuration
a492cc6ce Migrate a bunch of tests away from the early v4 hello-1.0 test packages
5a68726d5 Refresh our test foo binary, the old one was getting long in the tooth
4c1367a45 Make old redundant relocation test-case actually test something again
d99186f2e Support signing with Sequoia through a simple macro switch
82954acd4 Fix regression preventing manual %debug_package usage
ea4a98bc6 A more compatible kludge for #3278
5688de1c0 Add test for spurious %transfiletriggerpostun runs
c62a1f418 Update translations
a7784eccd Declare signCmd() static
a3cf4f674 Eliminate hardcoded GPG references from user visible messages
2c9ad2bbc Refactor sign command expand and parse out of runGPG()
3141bf74f Specify the private key in "rpm --addsign"
1087a3dfa Pull in the main p7zip package to CI image instead of p7zip-plugins
727ad8a77 Delete perl dependency generator leftovers (#3275)
8ce8afe4f Force older gdb version in CI due to index create regression in 15.1
c5878f468 Fix %pre and %post referred to as %prein and %postin in the docs
60770068f Fix %transfiletriggerpostun execution over multiple prefixes
ec5034b9b Fix inconsistencies wrt trigger priority handling
e24f7120f Add test for multiple trigger packages
3f1d05eae Add test for multiple file trigger prefixes
ce269ed5e Issue deprecation warnings for rpm.redirect2null() too, oops
fa3ec7e3d Fix rpmuncompress going interactive on re-extraction of zip / 7zip archives
01fe3476a Stabilize the new rpmuncompress -C tests
abf057616 rpmuncompress: Support -C for zip and 7zip archives
7b46a0d0c Return unique top directory iff it exists
c90733d96 Replace gcc only ? : operator usage
3b52142b0 Bump CI to Fedora 40
c19b13f12 Fix API docs build with Doxygen 1.10.0
671fc8e5d Work around unowned directories in rpmuncompress -C
6c0bf4131 Extend manual debuginfo test to cover the two other main scenarios
e0b9ffea8 Honor %__debug_package when processing files
1a9803d0f Fix %__debug_package value mismatch on -bb --short-circuit builds
b066411c4 Fix rpm.execute() return code handling
6444f7128 Add rpm.spawn() Lua API
535eacc96 Report unsafe symlinks during installation as a specific case
14516542c Refactor fsmOpenat() return style for consistency within the fsm
e0925ad6e Define --build-in-place in more clear and actually supportable way
e927be7e1 Add real-life examples of Python RPM
f4e6aecce Restore --build-in-place with --noprep functionality
c6277906d Refactor ordering Tarjan algorithm to use STL vector for it's stack
17d72b965 Refactor ordering SCC members to use an STL vector
c97744ed8 Refactor ordering SCC storage to STL vectors
973359a0f Refactor the Dijkstra algorithm innards to use a STL queue
722574dfd Refactor ordering relation storage to use STL forward_queues
19de35f5c Add a test for -qa with positional args
826cbb886 Fix -V option usage in our tests
b5f49b127 >() redirects considered harmful, part 1.5
bde179aca >() redirects considered harmful, part II
7f3488604 Make Buildsystem %conf section optional
2931cbd7b Another attempt at stabilizing posix.fork() and url retrieve tests
65fa582b5 Fix memory leak in rpmsign
05fbeb97a Fix crash on Lua file trigger exiting with return'ed data (#3029)
652ee3c88 installplatform: log when a platform file is created
e03674aae Document %__file_name and %__file_lineno
46b3e7649 Better warning for %autopatch without patches
6f08a2091 Add test case for autosetup without any patches
8e1e93596 Make the second urlhelper test much less racy
dd498cd2f Add .editorconfig, and note in CONTRIBUTING doc
308ac6067 Fix root relocation regression
31c14ba66 Make sure dirs are not relocated twice
372cf5e37 Add syntactic sugar for non-root user tests
930b146bc Build: Add include dirs to exported lib targets
02ffc5158 Fix division by zero in elfdeps (RhBug:2299414)
7ae180573 Macros doc: Fence left-hand column of macro tables
de903c9ac Macros doc: Convert expansion explanation to table
983e1de61 Macros doc: Unindent fenced code blocks
8befef343 When using rpm-sequoia, use pgpPubkeyMerge.
3f4c4d866 Fix minor memleak introduced in commit edbcb4501ce
ef87d2503 Reset recursion depth for error message
be01f0075 Undocument %patch1 (#3193)
b19395abc Properly quote REs in file attributes
4dc616746 Make "minimal" file attr more clear
a57eea879 Sort output for test case to avoid race condition
184475d40 Better error for build system issues
ea0685371 Add missing newline in sysusers Requires
d94dbcc24 Add warning for %autopatch not applying anything
775acf138 Drop our (t)rusty old hash table implementation
08a6a5e84 Replace by-fingerprint rpmFpHash with STL unordered_map
12fb8270e Detach fingerprint storage from the rpmhash internals
185036624 Eliminate the ancient, useless fingerPrint_s -> fingerPrint typedef
cd89bafc0 Convert fingerprint rpmFpEntryHash to STL
c00d8a0ed Replace typedef's with using = for new internal C++ constructs
3d2cc9fab Minimally convert transaction diskspace info to STL
09d90d401 Move the DSI struct to a header for c++ to see
8d08605eb Add a simple test for diskspace problem reporting
02a5d7702 Move DBSWAP() to bdb_ro, nothing else needs this
72a1aecfa Natively allocate database remaining backend layer structs
4d1b74014 Convert buildid id and path storage to STL strings in a vector
7175dd81d Use rpmhex() instead of manual sprintf() conversion
1028ed359 Restore --build-in-place without %setup
6aaefb201 Move build-in-place logic into librpmbuild
e8a252dca Free cmd for --dry-run too
b847608cc Pass TZ=UTC to zip in rpmuncompress
ef179d65d Make the urlhelper test prefix-agnostic
8a721b697 Explicitly enable Doxygen on our CI builds
e98aa1788 Fix doc strings
4c1f71ec9 Add error messages for url helper calls
17739baf9 Fix a subtle thinko in dbiIndexItem less-than comparison
558793e2b Convert rpmhook table and args to STL containers
50636d020 Add a testcase for Lua hook register/call/unregister
8ad361d80 Replace digest bundle static sized array with STL map
edbcb4501 Merge keys and update the database in rpmtsImportPubkey()
0c52a522e Support pubkey merging in the keyring code
66502215c Add a method to lookup a key from the keyring
2018cd4d7 Add rpmKeyringModify to change the keys of a keyring
30f9190db Split subkey initialization into its own function
3464a2cd2 Make subkeys available right away when a pubkey is imported
00a3170da Fix error handling in rpmtsImportPubkey
52f311e22 Replace dbiset internals with STL vector + algorithms
d90db6ac5 Avoid special characters from %{VERSION} in %builddir
8e1f55c70 Talk about rpmsign in the rpmsign man page
882c75b5a Check Source header for mandarory tags
016719d8d Add License tag to test SPEC files
9a21826f2 Natively allocate dbiIndexSet structs
cc1bdc8d6 Add missing rpmdb initialization to rpmbuild spec tag test
ff4be50bb Hide dbiIndexSet() implementation in C style
37882a2a1 Refactor dbiIndexSet prune and filter to common base
b7013d8d9 Use dbiIndexSetSort() rather than manual qsort() doing the same
194e337d8 Inline dbiIndexSetFilter() into the *Set() variant
e9d0adae1 Inline dbiIndexSetPrune() into the *Set() variant
2f5de301b Inline dbiIndexSetAppend() into the *Set() variant
73b399779 Avoid dbiIndexSet internals access in dbiFindMatches()
b099b4bb9 Avoid dbiIndexSet internals in ndb backend
b205b457d Avoid dbiIndexSet internals access in bdb_ro backend
4288fec3a Avoid dbiIndexSet internal access in rpmdbFilterIterator()
c5c28351e Avoid dbiIndexSet internals access in rpmdb iterator fu
49148acee Avoid direct access to dbiIndexSet in rpmdbFindByFile()
0c28d5aae Avoid direct access to dbiIndexSet in rpmdbIndexIteratorPkgOffsets()
dd887ef58 Add dbiIndexSetClear() internal API
19f089674 Eliminate the non-set variants of dbiIndexSet internal APIs
1b90b8c7d Fix potential use of uninitialized pgp struct
bff65aad8 Fix potential use of uninitialized pipe array
e69b79fa7 Fix signfiles regression from 13a02b15d6552bc8e440235b846ea5257514d397
edcdc842c Add a testcase for the undefined macro fall-through behavior
371a0a5aa Improve %{_builddir} backwards compatibility
8ab304f17 Add a testcase for the leaking quotes bug
b871b6870 Always clear the RPMEXPAND_KEEP_QUOTED flag if we do not return the resulting flags
71e71c7b9 Require %{buildsubdir} to be defined to get debuginfo packages again
67f6bc4d9 Minimally bring back %{_buildrootdir} for backwards compatibility
996b3ac32 Minimally bring back --buildroot cli switch for cpack
0310a233b Fix a %buildroot regression on an early %__spec_install_pre %global override
e0e43e937 Fix regression on subpackage debuginfo RPMTAG_SOURCERPM missing
3a14eb950 Hammer in "no debuginfo for noarch packages, damn it" rule
e464af747 Fix incomplete header on plain src.rpm build modes regression
d1075106b Make --build-in-place much less of a hack and also, work
31758e51c Drop an accidentally added duplicated test
c74ab58f0 Fix --noprep regression from introducing %mkbuilddir
a98358804 Convert triggers run tracking from local array to vector
9994bef4d Convert a local array to vector in markReplacedFiles()
b418f1143 Replace manual allocations with vectors in skipInstallFiles()
acfa76550 Use STL string for xml escaping too, it's a huge speedup
70b51a88e Use STL string for json escaping, speeds it up like 20x
2e6ecdcde Take advantage of STL string for tag name formatting in queryformat
ec6a81f17 Use STL string for header query formatting internal buffer
4bc89c300 Ensure noarch packages don't get debuginfo
080fa8942 Replace hardlink discovery rpmhash with STL
815f917dd Replace hardlink storage in rpmfi with STL
d97ce26c0 Update OpenSSL requirement in INSTALL too
3d38573b7 Convert the various dependency checking hashes from rpmhash to STL
fd056ff39 Fix a regression on dependency generator namespace directive
5e7ba2104 Use an STL string for constructing the macro in rpmfcAttrMacroV()
b22a469a3 Replace a manually allocated local array with a vector in depgen
656589180 Use STL vector file attribute types too
09776f12a Use STL vector for dependency generator file dependency storage
fac825c3c Add tests for file dependency normalization behavior
6bd1e431f Replace all ARGI_t uses with STL vector in file classifier
4a3eb7a04 Use vectors for various file classifier storages
6acc21074 Use STL string for file classifier buildroot
1c4c473d9 Use STL vector and strings for file and type in file classifier
556d514e0 Permit appending native strings to StringBuf
749f1cea9 Convert file attribute tracking hash from rpmhash to STL
7e6435ea6 Replace rpmhash with STL unordered_multimap in file rename tracking
ffa7bc8e7 Use an STL vector for spec file records storage
ed79a4b68 Natively allocate spec source and selinux policy structs
910b6602f Store trigger file info natively in STL vectors
03ae9720a Natively allocate the spec listiter macro fu
e8b944ef4 Use a C++ string for StringBuf internally
f555b7dc9 Natively allocate spec read and file stacks
143780448 Natively allocate special dir structs and related entries
84ac70dde Natively initialize the file list structure
dd4bcdb38 Natively allocate the spec and its package structs
23a0d2bf4 Natively allocate rpmfc main structures
4fc4ee91f Clean up applyAttr() and rpmfcHelper() interaction
69c837a43 Improve the debuginfo enablement backwards compatibility
54a3912e8 Free old cookie value to prevent a memory leak
ed1f2da3d Fix test-suite under Fedora 40 modern C rules
71f2ca495 cmake: move os-release parsing into oci branch
853569459 Add proper logic for debuginfo enablement
f3f9f2c7b Always create %specpartsdir on build
570f3b693 Simplify doBuildDir() and use appropriate macros as well
f69fae984 Delete leftover file trigger definitions
16759ef47 Convert orderInfo array to a vector
5cc22767b Use an STL vector for the transaction main rpmte pointer storage
0f6ed3c68 Simplify rpmfi replaced sized management
97c0889cb Replace rpmhash with STL unordered_map in headerformat cache
bbb28b3fe Replace dependency lookup cache with an STL unordered map
e7e92f209 Replace rpmhash with an STL set for basename cache
e0633683d Convert packageHash to STL unordered_map
6834c3f44 Natively allocate the main file trigger structs
247ddbacf Replace the annoying keyid stash with an STL set
058c96c26 Implement proper user/group lookup caching with STL maps
39119680d Replace home-grown hashes with STL unordered_map in rpmal
ab93126bb Use a vector for rpmal available package storage
869cd5405 Natively allocate rpmal struct itself
6b814894b Use vectors for returning multiple values from rpmalAll*()
18f7e5395 Remove C++ guards from internal headers
96467dce1 Automatically reload rpm configuration on mismatching BuildArch
b2058cea1 Don't emit target build into on --quiet
dde4fe5cf Drop architecture from %builddir path
b8d8bfab0 Fix header source/patch names disagreeing with src.rpm contents
d10b17658 Natively allocate plugin structures, use a vector for storage
8f6c05bcd Natively allocate fingerprint cache
553d8d86f Natively allocate rpmfs structs
ee3f62df5 Use an unordered map for the rpmdb verify cache
d89561b62 Use a vector for index iterator offset storage
8113f2819 Natively allocate main rpmdb related structs
87b5627f0 Natively allocate bunch of miscellaneous librpm structs
b287bdcad Natively allocate main header related structs
c20f030f7 Natively allocate rpmps and rpmprob structs, use vector for prob storage
22a4c3227 Natively allocate rpmds, rpmfiles and rpmfi mains structs
930942dc4 Natively allocate rpmts, rpmtsi, rpmtxn and tsMembers
a0e3dcfaf Natively allocate rpmte structs and temporary colors vector
1f66db345 Untangle the per-name stack from the macro entry struct
a39bb9359 Convert macro table to STL containers + native strings
e571df4b9 Add copy control and in particular, destructor to the macro context
667e32cd9 Fix spelling and grammar in conditionalbuilds.md
f23483f62 Replace temporary argv array in Lua posix.exec() with a vector
bac494c35 Replace a couple of local IO buffers with a vector
99e26b9df Replace homegrown mallocing getcwd() with filesystem::current_path()
5f7be7109 Use strings as keyid and STL map for keyring storage
e2722fd42 Take advantage of rvasprintf() in rpmlog()
695b5c252 Fix multiply defined local macros escaping scope
e6d6b49f2 Unbreak zstd compression from 7462ad4dbe215315e80323b592bfc7f455ebcd99
68d0f3119 Adapt tests to current state of the "legacy" parser
bf46dcf36 Fix build scriptlet append/prepend interaction with Buildsystem
d5c8423da Refactor build script parse calls to a helper
c97c48225 Refactor getSection() to more generally useful
317dadbdb Natively allocate expression most parser structs
7e558e3de Natively allocate keyring and pubkey structs
eb561c88b Use c++ string for rpmExpand() helper buffer
59984c66c Use a c++ string for macro expansion buffer
172196288 Use C++ constructs for rpmlog internal storage
344e837f1 Replace internal Lua printing stack with a C++ stack
9af6b4f39 Replace internal Lua print buffer with a C++ string
ad80c1761 Natively allocate internal rpmlua structs
7462ad4db Natively allocate rpmio structs
0d1071b99 Minimally convert digest code to native c++ allocation
4e9458ecc Add the "Primary Binding" pgp signature type
200c91ff7 Relax openssl version requirement
3185d47bd Parse dynamic spec parts for rpmbuild -bl
fa9b6497b Make the %rmbuild test package noarch as it should be
983dd21fa Add testcases for Ed25519 and NIST P-256
ef0afa856 Allow signing with ECDSA keys
a38582178 Fix an ancient memleak on %caps() parsing, add tests
1fe3e3594 Fix one missed explicit cast for C++ due to typo in makefiles
8c7d8d941 Remove the WITH_CXX option, this is a one-way street
e2f2982c9 Switch to C++ for the majority of codebase
37cdcc292 Add casts that C++ requires but C doesn't across cli tools
24f388e5e Add casts that C++ requires but C doesn't across librpmsign
58c3f3bc5 Add casts that C++ requires but C doesn't across librpmbuild
a8ef47798 Add casts that C++ requires but C doesn't across librpm
62840a3cd Add casts that C++ requires but C doesn't across librpmio
47974f492 Add a top-level option to compile with C++, doesn't do anything yet
ee528ce09 Take advantage of rpmdsIsSysuser() for the tag extension + psm code
5ce560483 Add rpmdsIsSysuser() function for testing and decoding sysusers provides
0a2866467 Fix int/enum mismatch in rpmtsImportPubkey() return code handling
62f7e756e Drop unnecessary initialization from a static variable
2269c6dbe Fixup enum/int mismatches in header format extensions
9a69f0b74 Make rpmTagType an integer type to avoid complications
656c8e75f Fixup missed constification in Lua readline callback
f8a72afbd Fix pointer bogosity in rpmlog callback
5231d5f54 Make rpmmacro_internal.h self-standing, ie include what you use
396c8e820 Handle Lua header C++ guards centrally in rpmlua.h
00a1b89a7 Use the actual rpmRC enum in ndb where relevant for internal APIs
56a6701cd Add c++ guard to ndb internal headers
437b5a106 Avoid jumping over variable declarations
fec1bd8d2 Add the "issuer fingerprint" subpacket type
b96abccec Don't bother including fsverity headers when not building it
76d53ab52 Unbreak build when imaevm.h is not present on the system
5b1cb92c4 Always use _free() over rfree() when assigning the return value
4174de56d Fix couple of obvious'ish signed narrowing issues in rpmio code
886631457 Fix int/enum type mixup in rpmtdType() and rpmtdClass()
689554a02 More rpmTag/rpmTagVal pedantry
fbcc57cfc Use a non-standard extension for the non-standard tagtbl file
8a141a116 Avoid char * to string literal conversions related to rpmfcExec() argv
ace5dc587 Pointer const correctness
bb24c99f5 Avoid c++ reserved keywords, part II
38b260214 readline callback const correctness
ce6c3812a Avoid c++ reserved keywords new, class and namespace
9a345d191 Use an union for the zstd compress/decompress streams instead
f75cd15f8 Wrap rpmio inner file pointer access behind typed helper function
5010191f6 Work around C++ restriction on forward declarations
7445a092f Lift %shrink out of doFoo()
3a2b04c96 Avoid relying on writable string literals in macros
401d845d9 Add c++ guards to internal headers and sources as needed
d4b066382 Introduce and use RPMRICHOP_NONE to fix int/enum mismatches
850b30171 Use proper callback types in psm notify wrapper
1e97f4498 Fix couple of RPMTAG/RPMDBI type mismatches
4d63588df Avoid rpm tag signedness issues in build tables + related code
5bf65deff signal() returns sighandler_t, not void *
7bb2dcd8d rpmTag/rpmTagVal type pedantry
9eb849064 String literals should be const char *
495552cb2 Drop a redundant helper variable
b75565ab9 Eliminate anonymous embedded struct use in filelist
6ea108209 Bring back the test of the buildtime macro
2fe4a4833 Revert the buildtime test for now
aa7c57c0b Document the build_mtime_policy macro
9059e6ab3 Add a deprecation warning for clamp_mtime_to_source_date_epoch
efdc48900 Support clamping the file mtime to the build time
bffbc1f7a Add support for a _buildtime macro for setting the build time manually
cf1c52115 Bump the rpm version in the lead to 4 for v6 packages
5a685fb5e Don't populate os and arch in the lead structure
af81cb8cc Add rpm package format version as a tag to >= v6 packages.
a40b6e9a7 Add a new unique v6-only reserved signature tag below header base
a93bf67a4 Always use long filesizes and the "new" non-cpio payload format on v6
8b25d0204 Introduce new payloadsize + alt tags in the v6 main header
c1ee38812 First commit of rpm v6: add version switch, drop obsolete signature tags
ef29c4e7c Add tests for v6 package structure and digests, equal to v4 just now
89d9873c6 Start a v6 format draft doc
7a75dc6ae Bump version to 5.99.90 to begin a new devel cycle

--===============5636847547151258859==--

