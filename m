Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RAZ4x-0006AW-6C
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 05:20:31 +0200
Received: by pzd13 with SMTP id 13so10851447pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2011 20:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Zyyd3bL1kXuttz0VByjMIFlRVNSTVc4jxxDAr6ZhUB4=;
	b=ErFThizUTUCPDwzG4P3uaYejKPi2opPaYSqXk6ykmGsJZRPUQUM4z7E9X+f3mzrkoR
	dXxMekANuXcmHVbLnCZ6q1b/j9EZHlliMtDphWTj1YwQqv2toGToxMkEaTHY7dCgo+s1
	pTU8y5wYzL7a0TtLrqSuMfbPBMopeINxbzlBo=
MIME-Version: 1.0
Received: by 10.68.32.73 with SMTP id g9mr24050217pbi.56.1317611698042; Sun,
	02 Oct 2011 20:14:58 -0700 (PDT)
Received: by 10.68.49.129 with HTTP; Sun, 2 Oct 2011 20:14:58 -0700 (PDT)
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF19BD42@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF19BD42@MBX20.4emm.local>
Date: Sun, 2 Oct 2011 20:14:58 -0700
Message-ID: <CAMKF1soAt6UMSO+_M-S4Fgc4f5HU=wYQWnz-YMxdHa94222NVQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem building gcc-cross-initial with latest linaro patches.
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
X-List-Received-Date: Mon, 03 Oct 2011 03:20:31 -0000
Content-Type: multipart/alternative; boundary=bcaec520f14736b69c04ae5c617b

--bcaec520f14736b69c04ae5c617b
Content-Type: text/plain; charset=UTF-8

On Sunday, October 2, 2011, James Limbouris <james@digitalmatter.com.au>
wrote:
> Hi,
>
> I'm getting the following build error with gcc-cross-initial:
>
> NOTE: package gcc-cross-initial-4.6.1+svnr178924-r16: task do_patch:
Started
> ERROR: Error executing a python function in
/home/james/oe/sources/oe-core/meta/recipes-devtools/gcc/
gcc-cross-initial_4.6.bb:
> AttributeError: 'module' object has no attribute 'domain'
>
> ERROR: The stack trace of python calls that resulted in this
exception/failure was:
> ERROR:   File "patch_do_patch", line 136, in <module>
> ERROR:
> ERROR:   File "patch_do_patch", line 133, in patch_do_patch
> ERROR:
> ERROR:   File "/home/james/oe/sources/oe-core/meta/lib/oe/patch.py", line
379, in Resolve
> ERROR:     bb.msg.fatal(bb.msg.domain.Build, ("Cannot proceed with manual
patch resolution - '%s' not found. " \
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0132:                       raise
bb.build.FuncFailed(str(sys.exc_value))
> ERROR:      0133:               resolver.Resolve()
> ERROR:      0134:
> ERROR:      0135:
> ERROR:  *** 0136:patch_do_patch(d)
> ERROR:      0137:
> ERROR: (file: 'patch_do_patch', lineno: 136, function: <module>)
> ERROR:      0129:                       patchset.Import({"file":local,
"remote":url, "strippath": striplevel}, True)
> ERROR:      0130:               except Exception:
> ERROR:      0131:                       import sys
> ERROR:      0132:                       raise
bb.build.FuncFailed(str(sys.exc_value))
> ERROR:  *** 0133:               resolver.Resolve()
> ERROR:      0134:
> ERROR:      0135:
> ERROR:      0136:patch_do_patch(d)
> ERROR:      0137:
> ERROR: (file: 'patch_do_patch', lineno: 133, function: patch_do_patch)
> ERROR: Function 'patch_do_patch' failed
> ERROR: Logfile of failure stored in:
/home/james/oe/build/tmp-eglibc/work-shared/gcc-4.6.1+svnr178924-r16/temp/log.do_patch.15960
> Log data follows:
> | NOTE: Applying patch 'gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch)
> | NOTE: Applying patch '100-uclibc-conf.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/100-uclibc-conf.patch)
> | NOTE: Applying patch 'gcc-uclibc-locale-ctype_touplow_t.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-uclibc-locale-ctype_touplow_t.patch)
> | NOTE: Applying patch 'cache-amnesia.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/cache-amnesia.patch)
> | NOTE: Applying patch 'gcc-flags-for-build.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-flags-for-build.patch)
> | NOTE: Applying patch '103-uclibc-conf-noupstream.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/103-uclibc-conf-noupstream.patch)
> | NOTE: Applying patch '200-uclibc-locale.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/200-uclibc-locale.patch)
> | NOTE: Applying patch '203-uclibc-locale-no__x.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/203-uclibc-locale-no__x.patch)
> | NOTE: Applying patch '204-uclibc-locale-wchar_fix.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/204-uclibc-locale-wchar_fix.patch)
> | NOTE: Applying patch '205-uclibc-locale-update.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/205-uclibc-locale-update.patch)
> | NOTE: Applying patch '301-missing-execinfo_h.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/301-missing-execinfo_h.patch)
> | NOTE: Applying patch '302-c99-snprintf.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/302-c99-snprintf.patch)
> | NOTE: Applying patch '303-c99-complex-ugly-hack.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/303-c99-complex-ugly-hack.patch)
> | NOTE: Applying patch '304-index_macro.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/304-index_macro.patch)
> | NOTE: Applying patch '305-libmudflap-susv3-legacy.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/305-libmudflap-susv3-legacy.patch)
> | NOTE: Applying patch '306-libstdc++-namespace.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/306-libstdc++-namespace.patch)
> | NOTE: Applying patch '740-sh-pr24836.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/740-sh-pr24836.patch)
> | NOTE: Applying patch '800-arm-bigendian.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/800-arm-bigendian.patch)
> | NOTE: Applying patch '904-flatten-switch-stmt-00.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/904-flatten-switch-stmt-00.patch)
> | NOTE: Applying patch 'arm-nolibfloat.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/arm-nolibfloat.patch)
> | NOTE: Applying patch 'arm-softfloat.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/arm-softfloat.patch)
> | NOTE: Applying patch 'zecke-xgcc-cpp.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/zecke-xgcc-cpp.patch)
> | NOTE: Applying patch 'gcc-poison-system-directories.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-system-directories.patch)
> | NOTE: Applying patch 'gcc-poison-dir-extend.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-dir-extend.patch)
> | NOTE: Applying patch 'gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch)
> | NOTE: Applying patch '64bithack.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch)
> | NOTE: Applying patch 'optional_libstdc.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/optional_libstdc.patch)
> | NOTE: Applying patch 'disable_relax_pic_calls_flag.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/disable_relax_pic_calls_flag.patch)
> | NOTE: Applying patch 'GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch)
> | NOTE: Applying patch 'COLLECT_GCC_OPTIONS.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/COLLECT_GCC_OPTIONS.patch)
> | NOTE: Applying patch 'volatile_access_backport.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/volatile_access_backport.patch)
> | NOTE: Applying patch 'use-defaults.h-and-t-oe-in-B.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch)
> | NOTE: Applying patch 'powerpc-e5500.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/powerpc-e5500.patch)
> | NOTE: Applying patch 'fix-for-ice-50099.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch)
> | NOTE: Applying patch 'gcc-with-linker-hash-style.patch'
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch)
> | NOTE: Applying patch 'gcc-4.6-linaro-r106720.patch'
(sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch)
> | NOTE: Applying patch 'gcc-4.6-linaro-r106723.patch'
(sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106723.patch)
> | NOTE: Applying patch 'gcc-4.6-linaro-r106729.patch'
(sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106729.patch)
> | NOTE: Applying patch 'gcc-4.6-linaro-r106733.patch'
(sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch)
> | NOTE: Applying patch 'gcc-4.6-linaro-r106737.patch'
(sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch)
> | NOTE: Applying patch 'gcc-4.6-linaro-r106738.patch'
(sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch)
> | NOTE: Applying patch 'gcc-4.6-linaro-r106739.patch'
(sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch)
> | NOTE: Applying patch 'gcc-4.6-linaro-r106740.patch'
(sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106740.patch)
> | NOTE: Applying patch 'gcc-4.6-linaro-r106741.patch'
(sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch)
> | xterm Xt error: Can't open display:
> | xterm:  DISPLAY is not set
> | ERROR: Error executing a python function in
/home/james/oe/sources/oe-core/meta/recipes-devtools/gcc/
gcc-cross-initial_4.6.bb:
> | AttributeError: 'module' object has no attribute 'domain'
> |
> | ERROR: The stack trace of python calls that resulted in this
exception/failure was:
> | ERROR:   File "patch_do_patch", line 136, in <module>
> | ERROR:
> | ERROR:   File "patch_do_patch", line 133, in patch_do_patch
> | ERROR:
> | ERROR:   File "/home/james/oe/sources/oe-core/meta/lib/oe/patch.py",
line 379, in Resolve
> | ERROR:     bb.msg.fatal(bb.msg.domain.Build, ("Cannot proceed with
manual patch resolution - '%s' not found. " \
> | ERROR:
> | ERROR: The code that was being executed was:
> | ERROR:      0132:                     raise
bb.build.FuncFailed(str(sys.exc_value))
> | ERROR:      0133:             resolver.Resolve()
> | ERROR:      0134:
> | ERROR:      0135:
> | ERROR:  *** 0136:patch_do_patch(d)
> | ERROR:      0137:
> | ERROR: (file: 'patch_do_patch', lineno: 136, function: <module>)
> | ERROR:      0129:                     patchset.Import({"file":local,
"remote":url, "strippath": striplevel}, True)
> | ERROR:      0130:             except Exception:
> | ERROR:      0131:                     import sys
> | ERROR:      0132:                     raise
bb.build.FuncFailed(str(sys.exc_value))
> | ERROR:  *** 0133:             resolver.Resolve()
> | ERROR:      0134:
> | ERROR:      0135:
> | ERROR:      0136:patch_do_patch(d)
> | ERROR:      0137:
> | ERROR: (file: 'patch_do_patch', lineno: 133, function: patch_do_patch)
> | ERROR: Function 'patch_do_patch' failed
> NOTE: package gcc-cross-initial-4.6.1+svnr178924-r16: task do_patch:
Failed
> ERROR: Task 2 (/home/james/oe/sources/oe-core/meta/recipes-devtools/gcc/
gcc-cross-initial_4.6.bb, do_patch) failed with exit code '1'
> ERROR: '/home/james/oe/sources/oe-core/meta/recipes-devtools/gcc/
gcc-cross-initial_4.6.bb' failed
>
>
> I'm not sure why the manual patch resolution isn't working - does it work
for other people?
> When I try to apply the patch manually, I get the following hunk failure
in gcc/combine.c:
>
> ***************
> *** 5629,5635 ****
>        {
>          /* Try to simplify the expression further.  */
>          rtx tor = simplify_gen_binary (IOR, mode, XEXP (x, 0), XEXP (x,
1));
> -         temp = combine_simplify_rtx (tor, mode, in_dest);
>
>          /* If we could, great.  If not, do not go ahead with the IOR
>             replacement, since PLUS appears in many special purpose
> --- 5635,5641 ----
>        {
>          /* Try to simplify the expression further.  */
>          rtx tor = simplify_gen_binary (IOR, mode, XEXP (x, 0), XEXP (x,
1));
> +         temp = combine_simplify_rtx (tor, mode, in_dest, 0);
>
>          /* If we could, great.  If not, do not go ahead with the IOR
>             replacement, since PLUS appears in many special purpose
>
> Which again is a bit confusing - I can't see any reason why the patch
shouldn't apply.

I have posted a patch for meta-oe which you should cherry pick. The oe-core
gcc has been updated and meta oe needed to be adjusted too
>
> Regards,
> James Limbouris
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec520f14736b69c04ae5c617b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, October 2, 2011, James Limbouris &lt;<a href=3D"mailto:j=
ames@digitalmatter.com.au">james@digitalmatter.com.au</a>&gt; wrote:<br>&gt=
; Hi,<br>&gt;<br>&gt; I&#39;m getting the following build error with gcc-cr=
oss-initial:<br>
&gt;<br>&gt; NOTE: package gcc-cross-initial-4.6.1+svnr178924-r16: task do_=
patch: Started<br>&gt; ERROR: Error executing a python function in /home/ja=
mes/oe/sources/oe-core/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cros=
s-initial_4.6.bb">gcc-cross-initial_4.6.bb</a>:<br>
&gt; AttributeError: &#39;module&#39; object has no attribute &#39;domain&#=
39;<br>&gt;<br>&gt; ERROR: The stack trace of python calls that resulted in=
 this exception/failure was:<br>&gt; ERROR: =C2=A0 File &quot;patch_do_patc=
h&quot;, line 136, in &lt;module&gt;<br>
&gt; ERROR:<br>&gt; ERROR: =C2=A0 File &quot;patch_do_patch&quot;, line 133=
, in patch_do_patch<br>&gt; ERROR:<br>&gt; ERROR: =C2=A0 File &quot;/home/j=
ames/oe/sources/oe-core/meta/lib/oe/patch.py&quot;, line 379, in Resolve<br=
>&gt; ERROR: =C2=A0 =C2=A0 bb.msg.fatal(bb.msg.domain.Build, (&quot;Cannot =
proceed with manual patch resolution - &#39;%s&#39; not found. &quot; \<br>
&gt; ERROR:<br>&gt; ERROR: The code that was being executed was:<br>&gt; ER=
ROR: =C2=A0 =C2=A0 =C2=A00132: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.build.FuncFailed(str(sys.exc_va=
lue))<br>&gt; ERROR: =C2=A0 =C2=A0 =C2=A00133: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 resolver.Resolve()<br>
&gt; ERROR: =C2=A0 =C2=A0 =C2=A00134:<br>&gt; ERROR: =C2=A0 =C2=A0 =C2=A001=
35:<br>&gt; ERROR: =C2=A0*** 0136:patch_do_patch(d)<br>&gt; ERROR: =C2=A0 =
=C2=A0 =C2=A00137:<br>&gt; ERROR: (file: &#39;patch_do_patch&#39;, lineno: =
136, function: &lt;module&gt;)<br>&gt; ERROR: =C2=A0 =C2=A0 =C2=A00129: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
atchset.Import({&quot;file&quot;:local, &quot;remote&quot;:url, &quot;strip=
path&quot;: striplevel}, True)<br>
&gt; ERROR: =C2=A0 =C2=A0 =C2=A00130: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 except Exception:<br>&gt; ERROR: =C2=A0 =C2=A0 =C2=A00131: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 import sys<br>&gt; ERROR: =C2=A0 =C2=A0 =C2=A00132: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.build.=
FuncFailed(str(sys.exc_value))<br>&gt; ERROR: =C2=A0*** 0133: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resolver.Resolve()<br>
&gt; ERROR: =C2=A0 =C2=A0 =C2=A00134:<br>&gt; ERROR: =C2=A0 =C2=A0 =C2=A001=
35:<br>&gt; ERROR: =C2=A0 =C2=A0 =C2=A00136:patch_do_patch(d)<br>&gt; ERROR=
: =C2=A0 =C2=A0 =C2=A00137:<br>&gt; ERROR: (file: &#39;patch_do_patch&#39;,=
 lineno: 133, function: patch_do_patch)<br>&gt; ERROR: Function &#39;patch_=
do_patch&#39; failed<br>
&gt; ERROR: Logfile of failure stored in: /home/james/oe/build/tmp-eglibc/w=
ork-shared/gcc-4.6.1+svnr178924-r16/temp/log.do_patch.15960<br>&gt; Log dat=
a follows:<br>&gt; | NOTE: Applying patch &#39;gcc-4.3.1-ARCH_FLAGS_FOR_TAR=
GET.patch&#39; (sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-4.3.1=
-ARCH_FLAGS_FOR_TARGET.patch)<br>
&gt; | NOTE: Applying patch &#39;100-uclibc-conf.patch&#39; (sources/oe-cor=
e/meta/recipes-devtools/gcc/gcc-4.6/100-uclibc-conf.patch)<br>&gt; | NOTE: =
Applying patch &#39;gcc-uclibc-locale-ctype_touplow_t.patch&#39; (sources/o=
e-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-uclibc-locale-ctype_touplow_t.=
patch)<br>
&gt; | NOTE: Applying patch &#39;cache-amnesia.patch&#39; (sources/oe-core/=
meta/recipes-devtools/gcc/gcc-4.6/cache-amnesia.patch)<br>&gt; | NOTE: Appl=
ying patch &#39;gcc-flags-for-build.patch&#39; (sources/oe-core/meta/recipe=
s-devtools/gcc/gcc-4.6/gcc-flags-for-build.patch)<br>
&gt; | NOTE: Applying patch &#39;103-uclibc-conf-noupstream.patch&#39; (sou=
rces/oe-core/meta/recipes-devtools/gcc/gcc-4.6/103-uclibc-conf-noupstream.p=
atch)<br>&gt; | NOTE: Applying patch &#39;200-uclibc-locale.patch&#39; (sou=
rces/oe-core/meta/recipes-devtools/gcc/gcc-4.6/200-uclibc-locale.patch)<br>
&gt; | NOTE: Applying patch &#39;203-uclibc-locale-no__x.patch&#39; (source=
s/oe-core/meta/recipes-devtools/gcc/gcc-4.6/203-uclibc-locale-no__x.patch)<=
br>&gt; | NOTE: Applying patch &#39;204-uclibc-locale-wchar_fix.patch&#39; =
(sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/204-uclibc-locale-wchar_=
fix.patch)<br>
&gt; | NOTE: Applying patch &#39;205-uclibc-locale-update.patch&#39; (sourc=
es/oe-core/meta/recipes-devtools/gcc/gcc-4.6/205-uclibc-locale-update.patch=
)<br>&gt; | NOTE: Applying patch &#39;301-missing-execinfo_h.patch&#39; (so=
urces/oe-core/meta/recipes-devtools/gcc/gcc-4.6/301-missing-execinfo_h.patc=
h)<br>
&gt; | NOTE: Applying patch &#39;302-c99-snprintf.patch&#39; (sources/oe-co=
re/meta/recipes-devtools/gcc/gcc-4.6/302-c99-snprintf.patch)<br>&gt; | NOTE=
: Applying patch &#39;303-c99-complex-ugly-hack.patch&#39; (sources/oe-core=
/meta/recipes-devtools/gcc/gcc-4.6/303-c99-complex-ugly-hack.patch)<br>
&gt; | NOTE: Applying patch &#39;304-index_macro.patch&#39; (sources/oe-cor=
e/meta/recipes-devtools/gcc/gcc-4.6/304-index_macro.patch)<br>&gt; | NOTE: =
Applying patch &#39;305-libmudflap-susv3-legacy.patch&#39; (sources/oe-core=
/meta/recipes-devtools/gcc/gcc-4.6/305-libmudflap-susv3-legacy.patch)<br>
&gt; | NOTE: Applying patch &#39;306-libstdc++-namespace.patch&#39; (source=
s/oe-core/meta/recipes-devtools/gcc/gcc-4.6/306-libstdc++-namespace.patch)<=
br>&gt; | NOTE: Applying patch &#39;740-sh-pr24836.patch&#39; (sources/oe-c=
ore/meta/recipes-devtools/gcc/gcc-4.6/740-sh-pr24836.patch)<br>
&gt; | NOTE: Applying patch &#39;800-arm-bigendian.patch&#39; (sources/oe-c=
ore/meta/recipes-devtools/gcc/gcc-4.6/800-arm-bigendian.patch)<br>&gt; | NO=
TE: Applying patch &#39;904-flatten-switch-stmt-00.patch&#39; (sources/oe-c=
ore/meta/recipes-devtools/gcc/gcc-4.6/904-flatten-switch-stmt-00.patch)<br>
&gt; | NOTE: Applying patch &#39;arm-nolibfloat.patch&#39; (sources/oe-core=
/meta/recipes-devtools/gcc/gcc-4.6/arm-nolibfloat.patch)<br>&gt; | NOTE: Ap=
plying patch &#39;arm-softfloat.patch&#39; (sources/oe-core/meta/recipes-de=
vtools/gcc/gcc-4.6/arm-softfloat.patch)<br>
&gt; | NOTE: Applying patch &#39;zecke-xgcc-cpp.patch&#39; (sources/oe-core=
/meta/recipes-devtools/gcc/gcc-4.6/zecke-xgcc-cpp.patch)<br>&gt; | NOTE: Ap=
plying patch &#39;gcc-poison-system-directories.patch&#39; (sources/oe-core=
/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-system-directories.patch)<br>
&gt; | NOTE: Applying patch &#39;gcc-poison-dir-extend.patch&#39; (sources/=
oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-dir-extend.patch)<br>&=
gt; | NOTE: Applying patch &#39;gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch&#=
39; (sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/gcc-4.3.3-SYSROOT_CF=
LAGS_FOR_TARGET.patch)<br>
&gt; | NOTE: Applying patch &#39;64bithack.patch&#39; (sources/oe-core/meta=
/recipes-devtools/gcc/gcc-4.6/64bithack.patch)<br>&gt; | NOTE: Applying pat=
ch &#39;optional_libstdc.patch&#39; (sources/oe-core/meta/recipes-devtools/=
gcc/gcc-4.6/optional_libstdc.patch)<br>
&gt; | NOTE: Applying patch &#39;disable_relax_pic_calls_flag.patch&#39; (s=
ources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/disable_relax_pic_calls_fl=
ag.patch)<br>&gt; | NOTE: Applying patch &#39;GPLUSPLUS_INCLUDE_DIR_with_sy=
sroot.patch&#39; (sources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPL=
US_INCLUDE_DIR_with_sysroot.patch)<br>
&gt; | NOTE: Applying patch &#39;COLLECT_GCC_OPTIONS.patch&#39; (sources/oe=
-core/meta/recipes-devtools/gcc/gcc-4.6/COLLECT_GCC_OPTIONS.patch)<br>&gt; =
| NOTE: Applying patch &#39;volatile_access_backport.patch&#39; (sources/oe=
-core/meta/recipes-devtools/gcc/gcc-4.6/volatile_access_backport.patch)<br>
&gt; | NOTE: Applying patch &#39;use-defaults.h-and-t-oe-in-B.patch&#39; (s=
ources/oe-core/meta/recipes-devtools/gcc/gcc-4.6/use-defaults.h-and-t-oe-in=
-B.patch)<br>&gt; | NOTE: Applying patch &#39;powerpc-e5500.patch&#39; (sou=
rces/oe-core/meta/recipes-devtools/gcc/gcc-4.6/powerpc-e5500.patch)<br>
&gt; | NOTE: Applying patch &#39;fix-for-ice-50099.patch&#39; (sources/oe-c=
ore/meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch)<br>&gt; | NO=
TE: Applying patch &#39;gcc-with-linker-hash-style.patch&#39; (sources/oe-c=
ore/meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch)<br>
&gt; | NOTE: Applying patch &#39;gcc-4.6-linaro-r106720.patch&#39; (sources=
/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720=
.patch)<br>&gt; | NOTE: Applying patch &#39;gcc-4.6-linaro-r106723.patch&#3=
9; (sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-lin=
aro-r106723.patch)<br>
&gt; | NOTE: Applying patch &#39;gcc-4.6-linaro-r106729.patch&#39; (sources=
/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106729=
.patch)<br>&gt; | NOTE: Applying patch &#39;gcc-4.6-linaro-r106733.patch&#3=
9; (sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-lin=
aro-r106733.patch)<br>
&gt; | NOTE: Applying patch &#39;gcc-4.6-linaro-r106737.patch&#39; (sources=
/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737=
.patch)<br>&gt; | NOTE: Applying patch &#39;gcc-4.6-linaro-r106738.patch&#3=
9; (sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-lin=
aro-r106738.patch)<br>
&gt; | NOTE: Applying patch &#39;gcc-4.6-linaro-r106739.patch&#39; (sources=
/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739=
.patch)<br>&gt; | NOTE: Applying patch &#39;gcc-4.6-linaro-r106740.patch&#3=
9; (sources/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-lin=
aro-r106740.patch)<br>
&gt; | NOTE: Applying patch &#39;gcc-4.6-linaro-r106741.patch&#39; (sources=
/meta-oe/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741=
.patch)<br>&gt; | xterm Xt error: Can&#39;t open display:<br>&gt; | xterm: =
=C2=A0DISPLAY is not set<br>
&gt; | ERROR: Error executing a python function in /home/james/oe/sources/o=
e-core/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_4.6.bb=
">gcc-cross-initial_4.6.bb</a>:<br>&gt; | AttributeError: &#39;module&#39; =
object has no attribute &#39;domain&#39;<br>
&gt; |<br>&gt; | ERROR: The stack trace of python calls that resulted in th=
is exception/failure was:<br>&gt; | ERROR: =C2=A0 File &quot;patch_do_patch=
&quot;, line 136, in &lt;module&gt;<br>&gt; | ERROR:<br>&gt; | ERROR: =C2=
=A0 File &quot;patch_do_patch&quot;, line 133, in patch_do_patch<br>
&gt; | ERROR:<br>&gt; | ERROR: =C2=A0 File &quot;/home/james/oe/sources/oe-=
core/meta/lib/oe/patch.py&quot;, line 379, in Resolve<br>&gt; | ERROR: =C2=
=A0 =C2=A0 bb.msg.fatal(bb.msg.domain.Build, (&quot;Cannot proceed with man=
ual patch resolution - &#39;%s&#39; not found. &quot; \<br>
&gt; | ERROR:<br>&gt; | ERROR: The code that was being executed was:<br>&gt=
; | ERROR: =C2=A0 =C2=A0 =C2=A00132: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.build.FuncFailed(str(sys.exc_value=
))<br>&gt; | ERROR: =C2=A0 =C2=A0 =C2=A00133: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 resolver.Resolve()<br>
&gt; | ERROR: =C2=A0 =C2=A0 =C2=A00134:<br>&gt; | ERROR: =C2=A0 =C2=A0 =C2=
=A00135:<br>&gt; | ERROR: =C2=A0*** 0136:patch_do_patch(d)<br>&gt; | ERROR:=
 =C2=A0 =C2=A0 =C2=A00137:<br>&gt; | ERROR: (file: &#39;patch_do_patch&#39;=
, lineno: 136, function: &lt;module&gt;)<br>&gt; | ERROR: =C2=A0 =C2=A0 =C2=
=A00129: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 patchset.Import({&quot;file&quot;:local, &quot;remote&quot;:url, &quot;=
strippath&quot;: striplevel}, True)<br>
&gt; | ERROR: =C2=A0 =C2=A0 =C2=A00130: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 except Exception:<br>&gt; | ERROR: =C2=A0 =C2=A0 =C2=A00131: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import sys<b=
r>&gt; | ERROR: =C2=A0 =C2=A0 =C2=A00132: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.build.FuncFailed(str(sys.ex=
c_value))<br>&gt; | ERROR: =C2=A0*** 0133: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 resolver.Resolve()<br>
&gt; | ERROR: =C2=A0 =C2=A0 =C2=A00134:<br>&gt; | ERROR: =C2=A0 =C2=A0 =C2=
=A00135:<br>&gt; | ERROR: =C2=A0 =C2=A0 =C2=A00136:patch_do_patch(d)<br>&gt=
; | ERROR: =C2=A0 =C2=A0 =C2=A00137:<br>&gt; | ERROR: (file: &#39;patch_do_=
patch&#39;, lineno: 133, function: patch_do_patch)<br>&gt; | ERROR: Functio=
n &#39;patch_do_patch&#39; failed<br>
&gt; NOTE: package gcc-cross-initial-4.6.1+svnr178924-r16: task do_patch: F=
ailed<br>&gt; ERROR: Task 2 (/home/james/oe/sources/oe-core/meta/recipes-de=
vtools/gcc/<a href=3D"http://gcc-cross-initial_4.6.bb">gcc-cross-initial_4.=
6.bb</a>, do_patch) failed with exit code &#39;1&#39;<br>
&gt; ERROR: &#39;/home/james/oe/sources/oe-core/meta/recipes-devtools/gcc/<=
a href=3D"http://gcc-cross-initial_4.6.bb">gcc-cross-initial_4.6.bb</a>&#39=
; failed<br>&gt; =C2=A0=C2=A0<br>&gt;<br>&gt; I&#39;m not sure why the manu=
al patch resolution isn&#39;t working - does it work for other people?<br>
&gt; When I try to apply the patch manually, I get the following hunk failu=
re in gcc/combine.c:<br>&gt;<br>&gt; ***************<br>&gt; *** 5629,5635 =
****<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Try to simplify the expression further. =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx tor =3D simplify_gen_binary (IOR=
, mode, XEXP (x, 0), XEXP (x, 1));<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 te=
mp =3D combine_simplify_rtx (tor, mode, in_dest);<br>&gt;<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we could, great. =C2=A0If not, do not go a=
head with the IOR<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacement, since PLUS appe=
ars in many special purpose<br>&gt; --- 5635,5641 ----<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0{<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try to simp=
lify the expression further. =C2=A0*/<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rtx tor =3D simplify_gen_binary (IOR, mode, XEXP (x, 0), XEXP (x, 1))=
;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 temp =3D combine_simplify_rtx (tor, mode=
, in_dest, 0);<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we c=
ould, great. =C2=A0If not, do not go ahead with the IOR<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacement, since PLUS appears in many spe=
cial purpose<br>
&gt;<br>&gt; Which again is a bit confusing - I can&#39;t see any reason wh=
y the patch shouldn&#39;t apply.<br><br>I have posted a patch for meta-oe w=
hich you should cherry pick. The oe-core gcc has been updated and meta oe n=
eeded to be adjusted too<br>
&gt;<br>&gt; Regards,<br>&gt; James Limbouris<br>&gt;<br>&gt;<br>&gt; _____=
__________________________________________<br>&gt; Openembedded-core mailin=
g list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">=
Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--bcaec520f14736b69c04ae5c617b--
