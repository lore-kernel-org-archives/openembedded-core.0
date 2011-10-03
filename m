Received: from smtp21.4emm.com ([69.18.222.6])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RAYdp-0005Oz-K4
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 04:52:29 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB21.4emm.local ([::1]) with mapi id 14.01.0289.001; Sun, 2 Oct 2011
	22:46:58 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Problem building gcc-cross-initial with latest linaro patches.
Thread-Index: AcyBdW3EAFRrhFolRvKbyBPHL5SDZA==
Date: Mon, 3 Oct 2011 02:46:57 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF19BD42@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Problem building gcc-cross-initial with latest linaro patches.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2011 02:52:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm getting the following build error with gcc-cross-initial:

NOTE: package gcc-cross-initial-4.6.1+svnr178924-r16: task do_patch: Starte=
d
ERROR: Error executing a python function in /home/james/oe/sources/oe-core/=
meta/recipes-devtools/gcc/gcc-cross-initial_4.6.bb:
AttributeError: 'module' object has no attribute 'domain'

ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "patch_do_patch", line 136, in <module>
ERROR:=20
ERROR:   File "patch_do_patch", line 133, in patch_do_patch
ERROR:=20
ERROR:   File "/home/james/oe/sources/oe-core/meta/lib/oe/patch.py", line 3=
79, in Resolve
ERROR:     bb.msg.fatal(bb.msg.domain.Build, ("Cannot proceed with manual p=
atch resolution - '%s' not found. " \
ERROR:=20
ERROR: The code that was being executed was:
ERROR:      0132:                       raise bb.build.FuncFailed(str(sys.e=
xc_value))
ERROR:      0133:               resolver.Resolve()
ERROR:      0134:
ERROR:      0135:
ERROR:  *** 0136:patch_do_patch(d)
ERROR:      0137:
ERROR: (file: 'patch_do_patch', lineno: 136, function: <module>)
ERROR:      0129:                       patchset.Import({"file":local, "rem=
ote":url, "strippath": striplevel}, True)
ERROR:      0130:               except Exception:
ERROR:      0131:                       import sys
ERROR:      0132:                       raise bb.build.FuncFailed(str(sys.e=
xc_value))
ERROR:  *** 0133:               resolver.Resolve()
ERROR:      0134:
ERROR:      0135:
ERROR:      0136:patch_do_patch(d)
ERROR:      0137:
ERROR: (file: 'patch_do_patch', lineno: 133, function: patch_do_patch)
ERROR: Function 'patch_do_patch' failed
ERROR: Logfile of failure stored in: /home/james/oe/build/tmp-eglibc/work-s=
hared/gcc-4.6.1+svnr178924-r16/temp/log.do_patch.15960
Log data follows:
| NOTE: Applying patch 'gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch' (sources/oe-=
core/meta/recipes-devtools/gcc/gcc-4.6/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patc=
h)
| NOTE: Applying patch '100-uclibc-conf.patch' (sources/oe-core/meta/recipe=
s-devtools/gcc/gcc-4.6/100-uclibc-conf.patch)
| NOTE: Applying patch 'gcc-uclibc-locale-ctype_touplow_t.patch' (sources/o=
e-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-uclibc-locale-ctype_touplow_t.=
patch)
| NOTE: Applying patch 'cache-amnesia.patch' (sources/oe-core/meta/recipes-=
devtools/gcc/gcc-4.6/cache-amnesia.patch)
| NOTE: Applying patch 'gcc-flags-for-build.patch' (sources/oe-core/meta/re=
cipes-devtools/gcc/gcc-4.6/gcc-flags-for-build.patch)
| NOTE: Applying patch '103-uclibc-conf-noupstream.patch' (sources/oe-core/=
meta/recipes-devtools/gcc/gcc-4.6/103-uclibc-conf-noupstream.patch)
| NOTE: Applying patch '200-uclibc-locale.patch' (sources/oe-core/meta/reci=
pes-devtools/gcc/gcc-4.6/200-uclibc-locale.patch)
| NOTE: Applying patch '203-uclibc-locale-no__x.patch' (sources/oe-core/met=
a/recipes-devtools/gcc/gcc-4.6/203-uclibc-locale-no__x.patch)
| NOTE: Applying patch '204-uclibc-locale-wchar_fix.patch' (sources/oe-core=
/meta/recipes-devtools/gcc/gcc-4.6/204-uclibc-locale-wchar_fix.patch)
| NOTE: Applying patch '205-uclibc-locale-update.patch' (sources/oe-core/me=
ta/recipes-devtools/gcc/gcc-4.6/205-uclibc-locale-update.patch)
| NOTE: Applying patch '301-missing-execinfo_h.patch' (sources/oe-core/meta=
/recipes-devtools/gcc/gcc-4.6/301-missing-execinfo_h.patch)
| NOTE: Applying patch '302-c99-snprintf.patch' (sources/oe-core/meta/recip=
es-devtools/gcc/gcc-4.6/302-c99-snprintf.patch)
| NOTE: Applying patch '303-c99-complex-ugly-hack.patch' (sources/oe-core/m=
eta/recipes-devtools/gcc/gcc-4.6/303-c99-complex-ugly-hack.patch)
| NOTE: Applying patch '304-index_macro.patch' (sources/oe-core/meta/recipe=
s-devtools/gcc/gcc-4.6/304-index_macro.patch)
| NOTE: Applying patch '305-libmudflap-susv3-legacy.patch' (sources/oe-core=
/meta/recipes-devtools/gcc/gcc-4.6/305-libmudflap-susv3-legacy.patch)
| NOTE: Applying patch '306-libstdc++-namespace.patch' (sources/oe-core/met=
a/recipes-devtools/gcc/gcc-4.6/306-libstdc++-namespace.patch)
| NOTE: Applying patch '740-sh-pr24836.patch' (sources/oe-core/meta/recipes=
-devtools/gcc/gcc-4.6/740-sh-pr24836.patch)
| NOTE: Applying patch '800-arm-bigendian.patch' (sources/oe-core/meta/reci=
pes-devtools/gcc/gcc-4.6/800-arm-bigendian.patch)
| NOTE: Applying patch '904-flatten-switch-stmt-00.patch' (sources/oe-core/=
meta/recipes-devtools/gcc/gcc-4.6/904-flatten-switch-stmt-00.patch)
| NOTE: Applying patch 'arm-nolibfloat.patch' (sources/oe-core/meta/recipes=
-devtools/gcc/gcc-4.6/arm-nolibfloat.patch)
| NOTE: Applying patch 'arm-softfloat.patch' (sources/oe-core/meta/recipes-=
devtools/gcc/gcc-4.6/arm-softfloat.patch)
| NOTE: Applying patch 'zecke-xgcc-cpp.patch' (sources/oe-core/meta/recipes=
-devtools/gcc/gcc-4.6/zecke-xgcc-cpp.patch)
| NOTE: Applying patch 'gcc-poison-system-directories.patch' (sources/oe-co=
re/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-system-directories.patch)
| NOTE: Applying patch 'gcc-poison-dir-extend.patch' (sources/oe-core/meta/=
recipes-devtools/gcc/gcc-4.6/gcc-poison-dir-extend.patch)
| NOTE: Applying patch 'gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch' (sources=
/oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TAR=
GET.patch)
| NOTE: Applying patch '64bithack.patch' (sources/oe-core/meta/recipes-devt=
ools/gcc/gcc-4.6/64bithack.patch)
| NOTE: Applying patch 'optional_libstdc.patch' (sources/oe-core/meta/recip=
es-devtools/gcc/gcc-4.6/optional_libstdc.patch)
| NOTE: Applying patch 'disable_relax_pic_calls_flag.patch' (sources/oe-cor=
e/meta/recipes-devtools/gcc/gcc-4.6/disable_relax_pic_calls_flag.patch)
| NOTE: Applying patch 'GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch' (sources/=
oe-core/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroo=
t.patch)
| NOTE: Applying patch 'COLLECT_GCC_OPTIONS.patch' (sources/oe-core/meta/re=
cipes-devtools/gcc/gcc-4.6/COLLECT_GCC_OPTIONS.patch)
| NOTE: Applying patch 'volatile_access_backport.patch' (sources/oe-core/me=
ta/recipes-devtools/gcc/gcc-4.6/volatile_access_backport.patch)
| NOTE: Applying patch 'use-defaults.h-and-t-oe-in-B.patch' (sources/oe-cor=
e/meta/recipes-devtools/gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch)
| NOTE: Applying patch 'powerpc-e5500.patch' (sources/oe-core/meta/recipes-=
devtools/gcc/gcc-4.6/powerpc-e5500.patch)
| NOTE: Applying patch 'fix-for-ice-50099.patch' (sources/oe-core/meta/reci=
pes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch)
| NOTE: Applying patch 'gcc-with-linker-hash-style.patch' (sources/oe-core/=
meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106720.patch' (sources/meta-oe/meta=
-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106723.patch' (sources/meta-oe/meta=
-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106723.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106729.patch' (sources/meta-oe/meta=
-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106729.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106733.patch' (sources/meta-oe/meta=
-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106737.patch' (sources/meta-oe/meta=
-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106738.patch' (sources/meta-oe/meta=
-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106739.patch' (sources/meta-oe/meta=
-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106740.patch' (sources/meta-oe/meta=
-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106740.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106741.patch' (sources/meta-oe/meta=
-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch)
| xterm Xt error: Can't open display:
| xterm:  DISPLAY is not set
| ERROR: Error executing a python function in /home/james/oe/sources/oe-cor=
e/meta/recipes-devtools/gcc/gcc-cross-initial_4.6.bb:
| AttributeError: 'module' object has no attribute 'domain'
|=20
| ERROR: The stack trace of python calls that resulted in this exception/fa=
ilure was:
| ERROR:   File "patch_do_patch", line 136, in <module>
| ERROR:
| ERROR:   File "patch_do_patch", line 133, in patch_do_patch
| ERROR:
| ERROR:   File "/home/james/oe/sources/oe-core/meta/lib/oe/patch.py", line=
 379, in Resolve
| ERROR:     bb.msg.fatal(bb.msg.domain.Build, ("Cannot proceed with manual=
 patch resolution - '%s' not found. " \
| ERROR:
| ERROR: The code that was being executed was:
| ERROR:      0132:                     raise bb.build.FuncFailed(str(sys.e=
xc_value))
| ERROR:      0133:             resolver.Resolve()
| ERROR:      0134:
| ERROR:      0135:
| ERROR:  *** 0136:patch_do_patch(d)
| ERROR:      0137:
| ERROR: (file: 'patch_do_patch', lineno: 136, function: <module>)
| ERROR:      0129:                     patchset.Import({"file":local, "rem=
ote":url, "strippath": striplevel}, True)
| ERROR:      0130:             except Exception:
| ERROR:      0131:                     import sys
| ERROR:      0132:                     raise bb.build.FuncFailed(str(sys.e=
xc_value))
| ERROR:  *** 0133:             resolver.Resolve()
| ERROR:      0134:
| ERROR:      0135:
| ERROR:      0136:patch_do_patch(d)
| ERROR:      0137:
| ERROR: (file: 'patch_do_patch', lineno: 133, function: patch_do_patch)
| ERROR: Function 'patch_do_patch' failed
NOTE: package gcc-cross-initial-4.6.1+svnr178924-r16: task do_patch: Failed
ERROR: Task 2 (/home/james/oe/sources/oe-core/meta/recipes-devtools/gcc/gcc=
-cross-initial_4.6.bb, do_patch) failed with exit code '1'
ERROR: '/home/james/oe/sources/oe-core/meta/recipes-devtools/gcc/gcc-cross-=
initial_4.6.bb' failed
=A0=A0

I'm not sure why the manual patch resolution isn't working - does it work f=
or other people?
When I try to apply the patch manually, I get the following hunk failure in=
 gcc/combine.c:

***************
*** 5629,5635 ****
  	{
  	  /* Try to simplify the expression further.  */
  	  rtx tor =3D simplify_gen_binary (IOR, mode, XEXP (x, 0), XEXP (x, 1));
- 	  temp =3D combine_simplify_rtx (tor, mode, in_dest);
 =20
  	  /* If we could, great.  If not, do not go ahead with the IOR
  	     replacement, since PLUS appears in many special purpose
--- 5635,5641 ----
  	{
  	  /* Try to simplify the expression further.  */
  	  rtx tor =3D simplify_gen_binary (IOR, mode, XEXP (x, 0), XEXP (x, 1));
+ 	  temp =3D combine_simplify_rtx (tor, mode, in_dest, 0);
 =20
  	  /* If we could, great.  If not, do not go ahead with the IOR
  	     replacement, since PLUS appears in many special purpose

Which again is a bit confusing - I can't see any reason why the patch shoul=
dn't apply.

Regards,
James Limbouris



