Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16499.1792647344288478877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 22:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uFiC7voy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k04RjBU6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1621bacad-0f3c2143-1df5-487b-9fab-a5a7acc2e190-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792647343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qNIogn8qckLYFz7cLZAhwURhZDUne5yrXIFo7uEedbs=;
	b=uFiC7voymNDPgfYQOeeVEbxj07+h/+62fRxwo05je3f8nl2W+a+y4J5S2qRxQ2rq
	xxZBQUA1Q49mNmFrRvciqBWJnWf66E9n4+1AkphvOla7bM3ssSqL+QF+PT0VBr3EaQo
	8Ia2wFh3q68CFuIW5nVOA0ETzr8I0Rjo29xcfqFM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792647343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qNIogn8qckLYFz7cLZAhwURhZDUne5yrXIFo7uEedbs=;
	b=k04RjBU6+AAqYrUYz1iX3Rwd5kefDrXwNl2IYAKXMfcR+M5TO6lhEVtcL6Pvb0H1
	G5bXssLD2LvqfypUs+Y4srDTj3vhSoE9+OQblBIFpK+MhYWTPrVYj7mqmx0aww5ze0J
	Up+AlW0vfSgwWWYY+sZNUUou75b3MtYcq8euFDbk=
Content-Type: multipart/mixed; boundary="===============7637346698298070675=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sumanth Gavini <sumanth.gavini@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 6.1.0 FAILED
Message-ID: <010101a1621bacad-0f3c2143-1df5-487b-9fab-a5a7acc2e190-000000@us-west-2.amazonses.com>
Date: Thu, 22 Oct 2026 05:35:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.22-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 05:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248415

--===============7637346698298070675==
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
Loaded 1993 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-cbcd9c29295083efc4dfc06d08f4328a855dfc3a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:cbcd9c29295083efc4dfc06d08f4328a855dfc3a"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
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
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/rpm.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7637346698298070675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rpm-changelog.txt"

Preparing for 6.1.0 release
tests: Update tests to work with PQC-capable rpm-sequoia
Preparing for 6.1.0 rc2
Harden the ndb implementation against integer overflows
Add a test for CVE-2026-44605
rpmsign: handle _file_sign_key_id values greater than i32::MAX
Use rpm's own allocator instead of malloc() almost everywhere
Fix a dumb regression from introducing %define options
Fix typo in add_sysuser ternary
Add a test for the manual "%add_sysuser m" use
Fix rubygem extract regression from b8b54f92c65bca7bfdd80c3ecf717d5c48b02e91
Add a test for Ruby gem extraction
Prevent command injection in rpmuncompress(1)
Workaround a broken %_passwd_path (and group) override in nss-altfiles
Fix installation of 7zip in Dockerfile
Revert file trigger STL refactoring for further investigation
Preparing for 6.1.0 rc1
Bump CI to Fedora 44
Add compat links for rpmuncompress and rpm-setup-autosign
Bump rpm-sequoia requirement to >= 1.10.2
Implement -e(xpand) and -g(lobal) options to %define
Fix regression when parsing macro define with an empty body
Fix regression running Lua scripts from non-rpm generated packages
Prevent buffer overruns in findPreambleTag() for language string
rpmsign: enable signing files with PKCS11 tokens
Implement a separate lock for the keystore
Refactor rpmtxn lock initialization a bit to make it more generic
Test actual regular user query instead of lock file presence
Refactor rpmdb rebuild test to separate RPMTEST_CHECK cases for clarity
Add some tests for rpm access from scriptlets
Emit a specific error on modifiers incompatible with parametric macros
Implement one-shot macro modifier <o>
Clarify the macro stack behavior in the manual
Render macro modifiers in --showrc output
Fix signature alignment in --info output
Only execute psm_pre and psm_post for the main package operation
Add + use an internal macro for determining script-only install goals
Fix rpmkeys result wrapping around, potentially returning 0 on fail
Use a sane identity string for syslog
Fix wrong operation names used in the syslog plugin
Document rpmkeys output and the overall verify policy in some detail
Use our central system.h include for Lua posix extension too
Remove upper bound on locale filename length
Move rpmuncompress to the standard binary directory
Move rpm-setup-autosign to a standard path
Use close_range() to set close-on-exec on all fds
Fix missing TOOLCHAIN ARG in second image stage
Take advantage of literal modifier in our query format related macros
Support defining literal macros via new <l> modifier syntax
Use C++ string primitives for macro option parsing
Refactor macro definition parsing to utilize C++ strings a bit
Minimally adjust doDefine() to take a C++ string as the string to parse
Refactor doArgvDefine() to use a C++ string for formatting the args
Add a test for the "name { body }" macro syntax.
Revert AI submissions
Fix rpm --undefine and Lua rpm.undefine() bypassing sanity checks
Add rpmUndefineMacro() for %undefine API counterpart
Fix/clarify rpmDefineMacro() documentation
docs: document repeated -f option for %files
docs: add SHA3-256 header digest to signatures_digests
docs: document %end marker for spec file sections
Fix some wording in sysusers man page
Fix section reference in sysusers man page
Add a man page for rpm sysusers integration
docs: fix SHA256 tag value from 272 to 273
Fix user argument placeholder notation in rpm-lua(7) manual
rpmuncompress: Add support for CAR files
Validate the IO engine specified in Fdopen() mode string
tests: Adjust policy for current sequoia
tests: Add test case with unknown key type and signatures
tests: Add MLDSA87 key and signed RPM
tests: Test case with untrusted signature type
tests: Pull new rpm-sequoia to build image
tests; Use quay containere registry
Enable -Werror in the dev-clang preset
Eliminate variable length array (VLA) use in spec %files parsing
Eliminate variable length array (VLA) use in spec file addition
Eliminate variable length array (VLA) use in %files lang parsing
Eliminate variable length array (VLA) use in rpmuncompress gem handling
Eliminate variable length array (VLA) use in cpio strntoul()
Eliminate variable length array (VLA) use in cli query filter parsing
Eliminate variable length array (VLA) use in rpmdb label parsing
Eliminate variable length array (VLA) use in rpmtriggers
Eliminate variable length array (VLA) use in headerFormat()
Eliminate variable length array (VLA) use in various temp buffers
Eliminate variable length array (VLA) use in rpmvercmp()
Eliminate variable length array (VLA) uses in the macro engine
Extend rpmdb query test to cover tag=value mire patterns
Eliminate a pointless variable length array from cpio name reading
Eliminate an academic variable length array from cpio payload write
Fix an ancient & vs && issue lurking in selinux policy parsing
Help Clang recognize a compile-time static value
Silence a Clang warning about unused return value in fsm
Fix leftover enum type mismatch in xml-formatting switch-case
Add a cmake preset for Clang and enable it in CI
Add a cmake preset for GCC
Parametrize the toolchain in mktree
Add a rudimentary cmake-presets(7) file
ifdef out unused static inline functions in ndb
Fix ndb-related double definition warnings from clang
Fix delete_key_compat() friend definition
Refactor file download out of the big install loop
Rework the rpm cli install and download routine for sanity
Drop redundant relocations member from rpmEIU struct
Refactor argument globbing out of rpmInstall()
Add some tests for installations from remote urls
Reflect pgpPubKeyLint() error code in rpmtxnImportPubkey() return
Add a test for rpmtsImportPubkey() return codes
COPYING: Add SPDX identifier clarification
Add GitLeaks whitelist for our test-suite keys
Fix broken link to rpm-dependency-generators.7 man page
Add back support for NSS based user/group lookups
Fix regression in group name lookup
Update tests for user/group lookup via NSS
Honor alternate root in system user/group provides
Fix "package X does not verify: (null)" output in some configurations
Fix "No patch/source number X" not returning an error code regression
Add tests for missing patch/source errors in %prep
Allow tag extensions to be used in db pattern matching
Add more database iterator pattern match tests
Eliminate the now redundant rpmtriggers wrapper struct
Convert file trigger structures minimally to an STL set
Document that overriding declarative sections is possible and dangerous
Fix transaction verification output as well
Move signature lints output to post-verification where we know the result
Introduce yet another variant of rpmKeyringVerifySig() for returning lints
Split some tests to individual RPMTEST_CHECK cases for readability
Drop NOTFOUNDs output for items that are disabled in rpm config
Fix bogus verify output in some order dependent cases
Split <corrupted signed> 4 test to separate CHECK cases for readability
Add tests for non-verbose rpmkeys operation with multiple signatures
Verify all types in transaction verify again
Add tests for user/group lookup via NSS
Fix RPM self-destruction in Dockerfile
Print shortened ftype in package color listing
Refactor the package color check
Print outlier files not matching package color
Show NEVRA in package color mismatch log message
Move package color checks to rpmfc module
Add tests for rpmbuild package color checks
Add generic program name handlers
Add portability wrappers for program name handling
Standardize on stdin/stdout/stderr use in manuals
Add entry about %caps to spec manual
Let the system runtime environment provide users and groups
Document that rpmtsOrder() output depends on package addition order
AIX: Fix compilation error due to __errno_location
Fix up RPMVSF_ entries in man page
Add some missing RPMVSF_ values to the manual and Python bindings
Fix file triggers running twice from add/remove elements on upgrade
Lift the transfiletrigger skip logic to a helper function
Add tests for %transfiletriggerun as well, missing since 2017. Uff.
Reproducer tests for #4030
Drop percent sign from mkbuilddir script name
Add BUILD PROCESS section to rpmbuild(1)
Add remaining tunables to rpmbuild-config(5)
Fix some typos in rpmbuild-config(5)
Fix a typo/thinko in verify element sorting per algorithms
Don't assume all digests we look for can be found during signing
Fix typo in tsort doc
Ignore NOTTRUSTED returns in verification
Explicitly require at least one success and no failures for verify pass
Add test cases for multi signature verification with disabled algos
Refactor some install verify tests to separate RPMTEST_CHECK blocks
Dump the build environment info at beginning of a build
Export build script environment information to a well known location
Emit warning instead of error on failed key read
Improve error handling on keystore load
Bump CI to Fedora 43
Honor rpmtsSetScriptFd() in Lua scriptlets
Add an internal API for (temporarily) overriding Lua output stream
Add a testcase for scriptlet output redirection
Add a switch for redirecting script output to prpm.py
docs/man: codespell fixes (all simple typos)
manual: codespell judgement calls
Codespell fixes in docs/manual/
manual: '32 bit' / '64 bit' => '32-bit' / '64-bit'
Convert + rename philosophy.md to rpm-design(7) man page
Add extra tests to ensure all file-related arrays are the same size
Fix FILEDEPENDSX size regression in 6.0
Add support for %check as a specific build stage in rpmbuild (-bk/-tk/-rk)
Fix -bf --short-circuit to not execute %generate_buildrequires
Add --short-circuit variants to the spec stepping test
Work around misleading indentation in if-block (cosmetic)
Fix CMake 3.31 normalized path warning
Point obsolete rpm operation aliases to the right direction
Add a BUGS section to rpm-common(8), noting some exceptions
Honor rpm-common(8) options in rpmuncompress
Use a friend function in delete_key()
Fix rpmkeys --delete regression for short keyids
Obtain fingerprint from rpmPubkey directly
Fix a relocation related crash in fingerprinting
Update rpmdeps(1) to use the documented <operation> style
Document use of <operation> in the man template
Add a man page for elfdeps(1)
Document our testing and documentation requirements
Chainsaw the coding bits out of CONTRIBUTING.md
Don't run CI on any documentation update
Refactor path lists in YAML files
Drop -Wno-sign-compare from rpmio/ too while at it
Fix a bunch of signed/unsigned issues in string pool
Drop -Wno-sign-compare from sign/ as well
Drop -Wno-sign-compare from tools/ as well
Drop -Wno-sign-compare from librpmbuild build options
Add + use a helper function to make ptr distance strlen() compatible
Use unsigned integers for number of files, part II
Fix mixed signedness comparisons in generateBuildIDs()
Trivial signed/unsigned type fixups for Fread()/Fwrite() return
Use unsigned int for the for-loop index
Use unsigned integer for number of files
Drop a redundant .resize() on vector before .insert()
Move -Wno-sign-compare to individual target_compile_options()
Fix wrong macro in rpmsign(1) example
Make EXAMPLE sections in man pages more consistent
Use proper man page references
Pull manual.rb plugin when building site
Fix a trivial documentation mistake
Fix a trivial documentation mistake
Fix missing link to dependency generator documentation
Remove dot from docs
Make rpm-plugins(8) more discoverable and drop outdated note from it
Fix URL in rpm-queryformat(7)
Fix doubled words in man pages
Fix man page index filtering
Update scriptlet terminology in rpm-queryformat(7)
Use preferred terms as per man-pages(7)
Fix layout field in man page redirects
Fix broken redirects to man pages, volume II
Add an rpm-scriptlets(7) man page for all our scriptlet types
Add man page linter workflow file
Don't run CI on docs-only changes
Fix broken redirects to man pages
Document that --rmsource does not affect NoSource and NoPatch
Add API docs for pgpDigParamsSalt()
Fix build regression on WITH_SEQUOIA=OFF
rpmio/lposix.cc: remove LUALIB_API in luaopen_posix() definition
Add a man page for RPM dependency generators
Add support for "singlefile" depgen protocol name
Add lower version boundary to man template
Rename _find_debuginfo_extra_opts to _find_debuginfo_vendor_opts
Add the ability for other macro files to pass options to the find_debuginfo
script via a new variable: _find_debuginfo_extra_opts
Drop the lone, leftover comment about rpm 3.0.2 built packages
Refactor rpmds rich dependency parsing to use C++ strings internally
Refactor rpmds to store DNEVR strings as C++ strings internally
Refactor rpmdsNewDNEVR() to operate on an STL string internally
Simplify rpmdsFilterTi() a bit, no functional changes
Refactor rpmds N, EVR and Flags arrays to STL vectors
Refactor rpmds trigger indices to an STL vector
Refactor rpmds Color array to an STL vector.
Fix typos in man pages
Fix typo in rpmsign man page
Update po module again for the latest translations
`rpmfcFileDep::operator<` should be `const`
Remove duplicated include
Updating rpmbuild(1) man page to the new style
Fix rpmds segfault(s) + memleaks on incomplete header data
Fix rpmdsTag*() to behave as per documentation on invalid values
Fix rpmdsTi() invalid value confusion
Fix rpmds trigger index to be optional as originally intended
Add Python binding for rpmdsTi() and a test
Add Python API tests for rpmds colors
Specify overridden member functions as `override`
Add a man page for rpmuncompress(1)
Ignore legacy signature tags in v6 packages
Add hdrblobIsEntry() for testing tag presence from hdrblob level
Refactor header blob entry finding to a helper function
Add test-cases for v3 signatures in v6 packages
Update rpmgraph(1) man page to the new style
Update rpmdeps(1) man page to the new style, enchancing it a bit as well
Drop outdated --nodirtokens from rpmbuild
Match rpm2archive man page to what it really does
Use `std::any_of` instead of a raw loop
Use .cpio suffix for cpio output files
Add one space per line to --info format
Fix the randomly failing dependency generator tests
Close file on all paths to prevent resource leak
Remember to update the po commit point on rpm side too
Add test cases for rpmgraph
rpmgraph: Use our own argv code
rpmgraph: Drop unnecessary variable and fix error message
rpmgraph: Prevent memory leaks in error handling
Fix segfault in rpmgraph
Add --hash, --precent and --test for rpm --restore
Update gendiff(1) to the new man page style
Minor tweaks to rpm2cpio(1) to better align with rpm2archive.
Convert rpm2archive man page to the new style + many other refinements
Add a bunch of examples to the rpm(8) man page.
Make the #3890 %buildsubdir issue reproducer more realistic
Build the website manually, with native Jekyll
Refactor WITH_WEBSITE and PODMAN handlers
Fetch website template from rpm-web, don't bundle
Split the earlier --restore test in two to test for the result code too
Fix "--restore --all" regression when the rpmdb contains gpg-pubkey headers
Add a rpm-version(7) man page for the rpm versioning system
Elaborate a bit on our contribution acceptance criteria
Fix missing delimiter in tags page
Create transaction lock file after rebuilddb
rpmrc: Drop left over free()
Ignore macrofiles directives in rpmrc
Add E2K architecture support
rpmrc.in: Move 'arch_compat: loongarch64' closer to similar lines
Don't use heredoc in Dockerfile
Bump version to 6.0.90 to begin the 6.1 devel cycle
Add a test-case for %buildsubdir in Buildsystem, expected to fail now

--===============7637346698298070675==--
