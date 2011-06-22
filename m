Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZCWj-00033D-NX
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 03:46:46 +0200
Received: by pvf24 with SMTP id 24so242601pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=knqcmWEZ/Lh+VEApWKOHpkQrObF/FzRSYQHxbrDdGxU=;
	b=mM2V9Vj2t0/jnHZPmlZK42e1nQGxim54A1M7RuWbVW6DZevnQEQz+B0aPVlGBv+iUx
	FVEIEGrDM6Fgqqu9qCAeT1v23lNEQstuZeXGthQuVizFbNwr8yoyLJ1aEJ1pli54Vhyw
	EUdJaJZsRFO4sGbqI2tU6uUSUi73rNxc85ttc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=RhXVWx6dGwTNXUtyUqYGwHx/Hkj/O0ttESbChYDNTmOwMUVZ7VUpOYEc/eBp3sDQLM
	JfmZZXhVHX/LkN+d55dPZo3ypw2apf6tjMbrwMhBCHMnmfEBabYGbDO63mijv7BUXQQ/
	sd/8dbnwwsHxZEF8b73PxC2xHoCQfv40wWYew=
Received: by 10.68.15.138 with SMTP id x10mr32289pbc.437.1308706990734;
	Tue, 21 Jun 2011 18:43:10 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u6sm64657pbh.16.2011.06.21.18.43.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 18:43:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 18:43:00 -0700
Message-Id: <cover.1308706692.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH V2 0/2] Change gcc 4.6 recipes to use svn in SRC_URI
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
X-List-Received-Date: Wed, 22 Jun 2011 01:46:46 -0000

changes since V1

Separate out non gcc changes to a different pull request
Patches are not attached inline due to sheer size of them
as they might choke patchwork. The are only on the branch

The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:

  binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.6
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-4.6

Khem Raj (2):
  gcc-4.6: Switch to using svn SRC_URI for recipe
  tcmode-default.inc: use 4.6 for GCCVERSION and SDKGCCVERSION

 meta/conf/distro/include/tcmode-default.inc        |    4 +-
 .../0002-Backport-from-mainline.patch              |   70 -
 .../0003-Backport-from-mainline.patch              |  164 -
 .../0004-Backport-from-mainline.patch              |   93 -
 .../0005-Backport-from-mainline.patch              |   94 -
 .../0006-Backport-from-mainline.patch              |   58 -
 .../0007-Backport-from-mainline.patch              |   27 -
 ...26-Paolo-Carlini-paolo.carlini-oracle.com.patch |   61 -
 .../0009-Backport-from-mainline.patch              |  226 -
 ...-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |  312 -
 ...-03-28-Richard-Guenther-rguenther-suse.de.patch |  246 -
 .../gcc-4_6-branch-backports/0015-gcc.patch        |   47 -
 .../0016-Backport-from-mainline.patch              |   28 -
 .../0017-libgfortran.patch                         |  837 -
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   62 -
 ...-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch |  405 -
 .../0021-c.opt-Add-std-c-03.patch                  |   26 -
 .../gcc-4_6-branch-backports/0022-PR-c-47570.patch |   68 -
 .../gcc-4_6-branch-backports/0023-PR-c-47504.patch |   50 -
 ...ild_noexcept_spec-Call-cxx_constant_value.patch |   46 -
 .../gcc-4_6-branch-backports/0025-c-family.patch   |  181 -
 ...026-decl2.c-cp_check_const_attributes-New.patch |  117 -
 .../gcc-4_6-branch-backports/0027-Core-1148.patch  |   59 -
 .../gcc-4_6-branch-backports/0028-PR-c-48313.patch |   50 -
 .../gcc-4_6-branch-backports/0029-PR-c-47999.patch |   57 -
 ...non_dependent_expr-Keep-dereferences-outs.patch |   67 -
 ...rence_binding-Allow-direct-binding-to-an-.patch |   35 -
 .../gcc-4_6-branch-backports/0032-Core-1232.patch  |   95 -
 ...-is_valid_constexpr_fn-Specify-input-loca.patch |   71 -
 .../gcc-4_6-branch-backports/0034-PR-c-48296.patch |  102 -
 .../gcc-4_6-branch-backports/0035-PR-c-48166.patch |   43 -
 ...a-alpha.c-alpha_sr_alias_set-Don-t-define.patch |  178 -
 .../gcc-4_6-branch-backports/0038-PR-c-48319.patch |   56 -
 .../0039-PR-preprocessor-48248.patch               |   53 -
 .../0040-PR-debug-48253.patch                      |  803 -
 .../gcc-4_6-branch-backports/0042-PR-c-48265.patch |   40 -
 .../0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch        |   32 -
 .../gcc-4_6-branch-backports/0044-PR-c-48281.patch |   70 -
 .../gcc-4_6-branch-backports/0045-PR-c-48369.patch |   38 -
 .../gcc-4_6-branch-backports/0046-PR-c-48212.patch |   39 -
 ...-03-31-Richard-Guenther-rguenther-suse.de.patch |   29 -
 .../0049-PR-target-48142.patch                     |   92 -
 .../0050-PR-target-16292.patch                     |   22 -
 .../gcc-4_6-branch-backports/0051-PR-c-48280.patch |   38 -
 ...07-from-trunk-to-the-4.6-release-branch-t.patch |   48 -
 .../0054-Backport-from-mainline.patch              |   61 -
 ...fig-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch |   29 -
 ...11-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch |  111 -
 ...-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch |683525 --------------------
 ...-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch | 5800 -
 ...n.dg-bessel_6.f90-Use-dg-add-options-ieee.patch |   30 -
 ...4-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch |   57 -
 .../0065-es.po-Update.patch                        |  952 -
 ...ers-for-functions-from-the-frexp-family-w.patch |   27 -
 ...-04-05-Richard-Guenther-rguenther-suse.de.patch |   32 -
 ....c-self_referential_size-Fix-2010-07-13-c.patch |   22 -
 .../0070-de.po-Update.patch                        |  690 -
 ...ov-io.c-Use-GCC-Runtime-Library-Exception.patch |   29 -
 .../0073-Backported-from-mainline.patch            |  658 -
 .../0074-PR-debug-48466.patch                      |  113 -
 ...73-from-trunk-to-the-4.6-release-branch-t.patch |  140 -
 .../0077-Backport-from-mainline.patch              |  154 -
 .../0078-de.po-Update.patch                        |  960 -
 .../0079-PR-debug-48343.patch                      |  281 -
 .../0080-PR-fortran-48117.patch                    |   27 -
 ...-config-i386-sse.md-Update-copyright-year.patch |  224 -
 ...ure-stackalign-non-local-goto-5.c-Fix-for.patch |   24 -
 .../0084-PR-tree-optimization-48377.patch          |   68 -
 .../0085-de.po-Update.patch                        |  774 -
 .../gcc-4_6-branch-backports/0086-PR-c-48450.patch |   80 -
 ....c-finish_decltype_type-Add-complain-parm.patch |  132 -
 .../gcc-4_6-branch-backports/0088-PR-c-48452.patch |   47 -
 .../gcc-4_6-branch-backports/0089-PR-c-48468.patch |  110 -
 .../gcc-4_6-branch-backports/0090-PR-c-48500.patch |  145 -
 ...1-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch |   26 -
 .../0092-PR-testsuite-48506.patch                  |   24 -
 ...ther-than-crashing-in-array_type_nelts-if.patch |   24 -
 .../gcc-4_6-branch-backports/0095-PR-c-48528.patch |   24 -
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |   74 -
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |   75 -
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |  106 -
 .../0101-Backport-from-mainline.patch              |   37 -
 ...2-common.opt-Tbss-Tdata-Ttext-New-options.patch |   35 -
 .../gcc-4_6-branch-backports/0104-PR-c-48523.patch |   42 -
 .../gcc-4_6-branch-backports/0105-PR-c-48534.patch |   38 -
 .../gcc-4_6-branch-backports/0106-PR-c-48517.patch |   51 -
 ...011-04-12-Allan-McRae-allan-archlinux.org.patch |  255 -
 ...-v850.c-expand_prologue-Do-not-use-the-CA.patch |   43 -
 .../0109-PR-rtl-optimization-48549.patch           |  128 -
 ...-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch |  110 -
 .../0112-Fix-PR-target-48090.patch                 |   22 -
 .../0113-Fix-PR-c-48574.patch                      |   57 -
 .../gcc-4_6-branch-backports/0114-PR-c-48570.patch |  116 -
 .../0115-PR-middle-end-48591.patch                 |   93 -
 ...-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch |  182 -
 .../gcc-4_6-branch-backports/0117-PR-c-48594.patch |   75 -
 .../0118-sv.po-Update.patch                        | 1036 -
 .../0119-Backport-from-mainline.patch              |  138 -
 .../0122-PR-target-48605.patch                     |  194 -
 .../0123-PR-target-48614.patch                     |   24 -
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   46 -
 ...04-15-Takaya-Saito-gintensubaru-gmail.com.patch |  277 -
 ...15-Paolo-Carlini-paolo.carlini-oracle.com.patch |   82 -
 ...ibjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch |   26 -
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |  143 -
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |   80 -
 .../0132-PR-lto-48538.patch                        |   36 -
 ...c-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch |   54 -
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |  115 -
 .../0135-doc-passes.texi-Fill-crossref-nodes.patch |   54 -
 ...ce-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch |   23 -
 .../0138-PR-tree-optimization-48616.patch          |  242 -
 ...-04-18-Richard-Guenther-rguenther-suse.de.patch |   39 -
 ...x-weakref-trickery-breakage-on-alpha-dec-.patch |  172 -
 ...-is_redundant_typedef-Add-inline-to-proto.patch |   22 -
 .../gcc-4_6-branch-backports/0142-PR-c-48632.patch |   55 -
 .../0143-PR-middle-end-48661.patch                 |  166 -
 .../gcc-4_6-branch-backports/0144-PR-c-48537.patch |   45 -
 .../0146-PR-testsuite-48675.patch                  |   34 -
 ...-04-18-Richard-Guenther-rguenther-suse.de.patch |   26 -
 .../0149-PR-target-48678.patch                     |   49 -
 .../gcc-4_6-branch-backports/0151-PR-c-46304.patch |   38 -
 ...tstrap-lto.mk-Remove-obsolete-requirement.patch |   22 -
 ...-04-20-Richard-Guenther-rguenther-suse.de.patch |  117 -
 .../0154-Backport-from-mainline.patch              |   47 -
 .../0155-PR-tree-optimization-48611.patch          |   24 -
 .../gcc-4_6-branch-backports/0156-PR-c-48657.patch |   58 -
 .../0157-PR-target-48288.patch                     |  105 -
 .../gcc-4_6-branch-backports/0159-PR-c-48594.patch |   26 -
 ...-finish_compound_literal-Don-t-put-an-arr.patch |   36 -
 ...lk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch |   72 -
 ...-04-21-Richard-Guenther-rguenther-suse.de.patch |  147 -
 .../0163-de.po-Update.patch                        | 2596 -
 .../0164-PR-target-48708.patch                     |   63 -
 .../gcc-4_6-branch-backports/0166-PR-c-48716.patch |   87 -
 .../0167-PR-target-48723.patch                     |   48 -
 .../0168-PR-tree-optimization-48717.patch          |   69 -
 .../gcc-4_6-branch-backports/0170-Revert.patch     |   27 -
 .../gcc-4_6-branch-backports/0171-PR-c-48685.patch |   43 -
 ...616.c-dg-options-Add-fno-common-to-option.patch |   22 -
 ...-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |  776 -
 .../0174-PR-preprocessor-48740.patch               |   48 -
 ...24-Paolo-Carlini-paolo.carlini-oracle.com.patch |  142 -
 .../gcc-4_6-branch-backports/0178-PR-c-48707.patch |   46 -
 ...-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch |  192 -
 ...-04-26-Richard-Guenther-rguenther-suse.de.patch |   58 -
 .../0182-PR-tree-optimization-48734.patch          |   66 -
 .../0183-PR-debug-48768.patch                      |   81 -
 .../0184-de.po-Update.patch                        | 1411 -
 .../gcc-4_6-branch-backports/0185-PR-c-48726.patch |   53 -
 .../gcc-4_6-branch-backports/0187-PR-c-42687.patch |   49 -
 .../gcc-4_6-branch-backports/0188-PR-c-48742.patch |   47 -
 ...gcc.dg-20020312-2.c-Add-definition-for-RX.patch |   62 -
 .../gcc-4_6-branch-backports/0190-PR-c-48046.patch |   48 -
 .../0192-PR-middle-end-48597.patch                 |   27 -
 ...-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch |   51 -
 ...-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch |  305 -
 .../0195-Fix-PR-c-48656.patch                      |   58 -
 .../0196-Backport-4.7-patchtes-to-4.6.patch        |  231 -
 ...-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch |  162 -
 ...29-Paolo-Carlini-paolo.carlini-oracle.com.patch |  137 -
 .../0201-PR-tree-optimization-48809.patch          |  199 -
 ...-2011-04-30-Paul-Thomas-pault-gcc.gnu.org.patch |  198 -
 ...04-30-Jerry-DeLisle-jvdelisle-gcc.gnu.org.patch |  108 -
 ...-2011-04-30-Doug-Kwan-dougkwan-google.com.patch |   38 -
 .../0207-Backport-from-mainline.patch              |  132 -
 .../0209-PR-target-48723.patch                     |   26 -
 ...-05-03-Richard-Guenther-rguenther-suse.de.patch |   45 -
 .../0211-PR-target-48774.patch                     |   78 -
 ...03-Paolo-Carlini-paolo.carlini-oracle.com.patch |  462 -
 ...-sso_string_base.h-__sso_string_base-_M_c.patch |  178 -
 ...-i386.md-movdi_internal_rex64-TYPE_SSEMOV.patch |  244 -
 ...1-05-04-Steven-G.-Kargl-kargl-gcc.gnu.org.patch |  189 -
 .../gcc-4_6-branch-backports/0218-PR-c-48749.patch |   59 -
 .../0219-Backport-from-mainline.patch              |  145 -
 .../gcc-4_6-branch-backports/0220-gcc.patch        |   55 -
 .../0221-PR-ada-48844.patch                        |  182 -
 .../gcc-4_6-branch-backports/0222-PR-c-40975.patch |   55 -
 ...0223-Add-missing-break-for-OPT_mfpu_-case.patch |   21 -
 ...-06-Jonathan-Wakely-jwakely.gcc-gmail.com.patch | 5993 -
 .../0226-Fix-PR-c-48838.patch                      |  112 -
 .../0227-PR-fortran-48894.patch                    |  136 -
 ...Ramana-Radhakrishnan-ramana.radhakrishnan.patch |   28 -
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   58 -
 .../0230-PR-target-48900.patch                     |   44 -
 ...86-i386.md-movdf_internal_nointeger-Apply.patch |   23 -
 .../gcc-4_6-branch-backports/0232-PR-c-48089.patch |   77 -
 .../gcc-4_6-branch-backports/0233-PR-c-48446.patch |  183 -
 .../gcc-4_6-branch-backports/0234-PR-c-48911.patch |   96 -
 .../gcc-4_6-branch-backports/0235-PR-c-48909.patch |   73 -
 ...acking.c-find_mem_expr_in_1pdv-Fix-thinko.patch |   49 -
 .../0240-Fix-PR-c-48574.patch                      |   63 -
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   26 -
 ...09-Paolo-Carlini-paolo.carlini-oracle.com.patch |   44 -
 .../0244-PR-tree-optimization-48611.patch          |   77 -
 .../0245-Backported-from-mainline.patch            |   73 -
 ...x.h-JUMP_ALIGN-LABEL_ALIGN-LOOP_ALIGN-Def.patch |   76 -
 ...x.c-rx_memory_move_cost-Reduce-the-cost-f.patch |   23 -
 .../0249-Fix-PRs-48857-48495.patch                 |  216 -
 .../0251-gcc-cp-ChangeLog.patch                    |   55 -
 .../0252-PR-debug-48159.patch                      |  198 -
 ...-2011-05-11-Tobias-Burnus-burnus-net-b.de.patch |  159 -
 ...non_dependent_expr-Don-t-check-null_ptr_c.patch |   24 -
 ...onfig-rx-rx.h-HAVE_PRE_DECREMENT-Fix-typo.patch |   59 -
 .../0257-zh_CN.po-Update.patch                     |   37 -
 .../0258-PR-debug-48967.patch                      |  134 -
 ...-05-12-Richard-Guenther-rguenther-suse.de.patch |  100 -
 .../0260-PR-tree-optimization-48975.patch          |   61 -
 .../0263-zh_CN.po-Update.patch                     | 5328 -
 ...-i386.md-movxf_internal-Disable-CONST_DOU.patch |  127 -
 .../0267-PR-preprocessor-48677.patch               |   31 -
 .../0269-PR-target-48986.patch                     |   40 -
 ...x.md-Add-peephole-to-remove-redundant-ext.patch |  126 -
 ...x.c-rx_memory_move_cost-Include-cost-of-r.patch |   28 -
 .../0273-PR-tree-optimization-49000.patch          |   39 -
 .../0274-PR-tree-optimization-49000.patch          |   52 -
 ...-05-18-Richard-Guenther-rguenther-suse.de.patch |  138 -
 ...-05-18-Richard-Guenther-rguenther-suse.de.patch |  111 -
 ...-05-18-Richard-Guenther-rguenther-suse.de.patch |   81 -
 .../0278-PR-tree-optimization-49039.patch          |  217 -
 .../0279-Properly-handle-256bit-load-cast.patch    |   95 -
 .../gcc-4_6-branch-backports/0281-PR-c-48869.patch |  460 -
 ...2-gcc.c-torture-execute-960321-1.x-Remove.patch |   30 -
 .../0283-zh_CN.po-Update.patch                     | 1529 -
 .../gcc-4_6-branch-backports/0284-PR-c-49043.patch |   50 -
 ...-2011-05-19-Uros-Bizjak-ubizjak-gmail.com.patch |   67 -
 .../0287-PR-tree-optimization-49073.patch          |  121 -
 ...-05-20-Richard-Guenther-rguenther-suse.de.patch |  117 -
 .../0289-PR-bootstrap-49086.patch                  |   35 -
 .../gcc-4_6-branch-backports/0290-PR-c-48873.patch |   45 -
 .../gcc-4_6-branch-backports/0291-PR-c-48736.patch |   40 -
 .../gcc-4_6-branch-backports/0292-PR-c-48745.patch |   59 -
 ...-register_constexpr_fundef-Add-to-hash-ta.patch |   81 -
 ...-validate_constexpr_fundecl-Check-DECL_TE.patch |   42 -
 .../gcc-4_6-branch-backports/0295-PR-c-48948.patch |  188 -
 .../gcc-4_6-branch-backports/0296-DR-1073.patch    |  156 -
 .../0298-In-gcc-objc.patch                         |   31 -
 .../gcc-4_6-branch-backports/0299-PR-c-49066.patch |   34 -
 ...c-sparc.c-eligible_for_return_delay-Do-no.patch |   65 -
 ...c-sparc.md-setjmp-Handle-PIC-mode-and-use.patch |   56 -
 .../gcc-4_6-branch-backports/0303-PR-c-48780.patch |   49 -
 .../gcc-4_6-branch-backports/0304-PR-c-48945.patch |   45 -
 .../0305-PR-middle-end-49029.patch                 |   52 -
 .../0306-PR-target-49104.patch                     |   63 -
 ...07-config.gcc-sparc-elf-Add-sparc-t-crtin.patch |  150 -
 .../gcc-4_6-branch-backports/0308-PR-c-48647.patch |   97 -
 ...-22-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |  185 -
 .../0311-PR-middle-end-48973.patch                 |  101 -
 .../gcc-4_6-branch-backports/0312-PR-c-49120.patch |   50 -
 .../0313-PR-debug-49032.patch                      |   90 -
 .../0314-PR-lto-49123.patch                        |   49 -
 .../0316-Always-add-mno-XXX-for-march-native.patch |   98 -
 .../0317-PR-target-49133.patch                     |   93 -
 ...c-sparc.c-sparc_option_override-If-not-se.patch |   27 -
 .../gcc-4_6-branch-backports/0320-PR-c-48617.patch |   37 -
 .../gcc-4_6-branch-backports/0321-PR-c-47544.patch |   57 -
 .../gcc-4_6-branch-backports/0322-PR-c-47336.patch |   53 -
 .../gcc-4_6-branch-backports/0323-PR-c-47263.patch |   45 -
 .../gcc-4_6-branch-backports/0324-PR-c-49105.patch |   75 -
 .../gcc-4_6-branch-backports/0325-PR-c-48884.patch |   86 -
 .../gcc-4_6-branch-backports/0326-PR-c-49042.patch |   63 -
 .../gcc-4_6-branch-backports/0327-PR-c-49136.patch |  142 -
 .../gcc-4_6-branch-backports/0328-In-libobjc.patch |   81 -
 ...24-Paolo-Carlini-paolo.carlini-oracle.com.patch |   62 -
 .../0330-PR-tree-optimization-44897.patch          |   24 -
 .../0331-PR-target-49128.patch                     |   23 -
 .../gcc-4_6-branch-backports/0332-PR-c-48292.patch |   71 -
 .../gcc-4_6-branch-backports/0333-PR-c-45080.patch |   59 -
 .../gcc-4_6-branch-backports/0334-PR-c-45418.patch |   50 -
 .../gcc-4_6-branch-backports/0335-PR-c-48935.patch |   76 -
 ...arm-fp16-compile-none-1.c-Update-expected.patch |   74 -
 .../gcc-4_6-branch-backports/0337-PR-c-47184.patch |   64 -
 .../gcc-4_6-branch-backports/0338-PR-c-46696.patch |   48 -
 .../gcc-4_6-branch-backports/0339-PR-c-46245.patch |   88 -
 .../gcc-4_6-branch-backports/0340-PR-c-46145.patch |   37 -
 .../gcc-4_6-branch-backports/0341-PR-c-45698.patch |   44 -
 .../gcc-4_6-branch-backports/0342-PR-c-44311.patch |  125 -
 .../0343-gcc-cp-ChangeLog.patch                    |  207 -
 ...25-Paolo-Carlini-paolo.carlini-oracle.com.patch |   76 -
 ...25-Paolo-Carlini-paolo.carlini-oracle.com.patch |   78 -
 .../gcc-4_6-branch-backports/0347-PR-c-45401.patch |   51 -
 .../gcc-4_6-branch-backports/0348-PR-c-49156.patch |   62 -
 .../0349-PR-tree-optimization-49161.patch          |  200 -
 .../gcc-4_6-branch-backports/0350-PR-c-49165.patch |   89 -
 .../0351-PR-target-44643.patch                     |   44 -
 .../gcc-4_6-branch-backports/0352-PR-c-48424.patch |  105 -
 ...00-rs6000.c-rs6000_register_move_cost-Mak.patch |   28 -
 ...-2011-05-26-Paul-Thomas-pault-gcc.gnu.org.patch |  168 -
 .../gcc-4_6-branch-backports/0357-PR-c-48657.patch |  149 -
 .../gcc-4_6-branch-backports/0358-PR-c-49165.patch |   89 -
 .../gcc-4_6-branch-backports/0359-PR-c-48284.patch |   40 -
 .../gcc-4_6-branch-backports/0360-PR-c-47277.patch |   38 -
 .../gcc-4_6-branch-backports/0362-PR-c-47049.patch |   62 -
 ...-05-29-Richard-Guenther-rguenther-suse.de.patch |   68 -
 .../gcc-4_6-branch-backports/0365-gcc.patch        |  125 -
 .../gcc-4_6-branch-backports/0366-gcc.patch        |   52 -
 ...d-PR-target-43700-to-last-changelog-entry.patch |    7 -
 .../0369-PR-target-45263.patch                     |   71 -
 ...-05-30-Richard-Guenther-rguenther-suse.de.patch |   69 -
 .../gcc-4_6-branch-backports/0371-PR-c-49223.patch |   99 -
 ...-05-31-Richard-Guenther-rguenther-suse.de.patch |   72 -
 ...-05-31-Richard-Guenther-rguenther-suse.de.patch |   64 -
 ..._fmsubadd-and-fma4_fmaddsub-mode-suffixes.patch |   36 -
 ...1-05-31-Thomas-Koenig-tkoenig-gcc.gnu.org.patch |  237 -
 .../0379-PR-tree-optimization-49093.patch          |   61 -
 ...1-06-02-Steven-G.-Kargl-kargl-gcc.gnu.org.patch |  139 -
 .../gcc-4_6-branch-backports/0382-PR-c-49276.patch |   62 -
 .../0384-PR-tree-optimization-49038.patch          |  367 -
 .../0385-PR-debug-47590.patch                      |  490 -
 ...-04-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |   29 -
 .../0388-PR-target-49186.patch                     |   48 -
 ...c-sparc.c-output_return-Fix-thinko-in-the.patch |   45 -
 .../gcc-4_6-branch-backports/0391-PR-c-49134.patch |   24 -
 ...-06-06-Richard-Guenther-rguenther-suse.de.patch |  267 -
 ...11-06-06-Mikael-Pettersson-mikpe-it.uu.se.patch |   59 -
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   27 -
 .../gcc-4_6-branch-backports/0395-PR-c-49264.patch |  134 -
 .../0396-PR-fortran-49268.patch                    |   88 -
 ...00-rs6000.h-REG_CLASS_CONTENTS-Remove-vr0.patch |   23 -
 .../gcc-4_6-branch-backports/0398-PR-c-49298.patch |   37 -
 .../0400-PR-gcov-profile-49299.patch               |  158 -
 .../gcc-4_6-branch-backports/0401-PR-c-48780.patch |   63 -
 .../0403-PR-target-49238.patch                     |   53 -
 ...404-Support-unknown-Intel-family-0x6-CPUs.patch |   48 -
 ...c-sparc.md-return_internal-Adjust-length-.patch |   24 -
 ...-potential_constant_expression_1-Handle-d.patch |   35 -
 ...-finish_compound_literal-Set-TREE_HAS_CON.patch |   22 -
 .../0410-lib-target-supports.exp.patch             |   34 -
 ...te-gcc.target-arm-20090811-1.c-Skip-for-i.patch |   79 -
 ...-sse.md-vec_dupv4sf-Correct-mode-of-force.patch |   50 -
 .../gcc/{gcc-4.6.0.inc => gcc-4.6.inc}             |   26 +-
 .../{gcc-4.6.0 => gcc-4.6}/100-uclibc-conf.patch   |    0
 .../103-uclibc-conf-noupstream.patch               |    0
 .../{gcc-4.6.0 => gcc-4.6}/200-uclibc-locale.patch |    0
 .../203-uclibc-locale-no__x.patch                  |    0
 .../204-uclibc-locale-wchar_fix.patch              |    0
 .../205-uclibc-locale-update.patch                 |    0
 .../301-missing-execinfo_h.patch                   |    0
 .../{gcc-4.6.0 => gcc-4.6}/302-c99-snprintf.patch  |    0
 .../303-c99-complex-ugly-hack.patch                |    0
 .../{gcc-4.6.0 => gcc-4.6}/304-index_macro.patch   |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../306-libstdc++-namespace.patch                  |    0
 .../gcc/{gcc-4.6.0 => gcc-4.6}/64bithack.patch     |    0
 .../{gcc-4.6.0 => gcc-4.6}/740-sh-pr24836.patch    |    0
 .../{gcc-4.6.0 => gcc-4.6}/800-arm-bigendian.patch |    0
 .../904-flatten-switch-stmt-00.patch               |    0
 .../COLLECT_GCC_OPTIONS.patch                      |    0
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |    0
 .../{gcc-4.6.0 => gcc-4.6}/arm-nolibfloat.patch    |    0
 .../gcc/{gcc-4.6.0 => gcc-4.6}/arm-softfloat.patch |    0
 .../gcc/{gcc-4.6.0 => gcc-4.6}/cache-amnesia.patch |    0
 .../disable_relax_pic_calls_flag.patch             |    0
 .../fortran-cross-compile-hack.patch               |    0
 .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch          |    0
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |    0
 .../gcc-flags-for-build.patch                      |    0
 .../gcc-poison-dir-extend.patch                    |    0
 .../gcc-poison-parameters.patch                    |    0
 .../gcc-poison-system-directories.patch            |    0
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |    0
 .../{gcc-4.6.0 => gcc-4.6}/optional_libstdc.patch  |    0
 .../volatile_access_backport.patch                 |    0
 .../{gcc-4.6.0 => gcc-4.6}/zecke-xgcc-cpp.patch    |    0
 .../gcc/gcc-4_6-branch-backports.inc               |  328 -
 ...canadian_4.6.0.bb => gcc-cross-canadian_4.6.bb} |    0
 ...s-initial_4.6.0.bb => gcc-cross-initial_4.6.bb} |    0
 ...iate_4.6.0.bb => gcc-cross-intermediate_4.6.bb} |    0
 .../gcc/{gcc-cross_4.6.0.bb => gcc-cross_4.6.bb}   |    0
 ...nitial_4.6.0.bb => gcc-crosssdk-initial_4.6.bb} |    0
 ...e_4.6.0.bb => gcc-crosssdk-intermediate_4.6.bb} |    0
 .../{gcc-crosssdk_4.6.0.bb => gcc-crosssdk_4.6.bb} |    0
 .../{gcc-runtime_4.6.0.bb => gcc-runtime_4.6.bb}   |    0
 .../gcc/{gcc_4.6.0.bb => gcc_4.6.bb}               |    0
 .../gcc/{libgcc_4.6.0.bb => libgcc_4.6.bb}         |    0
 375 files changed, 16 insertions(+), 741306 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0002-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0003-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0004-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0005-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0006-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0007-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0008-2011-03-26-Paolo-Carlini-paolo.carlini-oracle.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0009-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0012-2011-03-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0014-2011-03-28-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0015-gcc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0016-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0017-libgfortran.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0019-2011-03-29-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0020-config-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0021-c.opt-Add-std-c-03.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0022-PR-c-47570.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0023-PR-c-47504.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0024-except.c-build_noexcept_spec-Call-cxx_constant_value.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0025-c-family.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0026-decl2.c-cp_check_const_attributes-New.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0027-Core-1148.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0028-PR-c-48313.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0029-PR-c-47999.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0030-pt.c-build_non_dependent_expr-Keep-dereferences-outs.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0031-call.c-reference_binding-Allow-direct-binding-to-an-.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0032-Core-1232.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0033-semantics.c-is_valid_constexpr_fn-Specify-input-loca.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0034-PR-c-48296.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0035-PR-c-48166.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0037-config-alpha-alpha.c-alpha_sr_alias_set-Don-t-define.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0038-PR-c-48319.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0039-PR-preprocessor-48248.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0040-PR-debug-48253.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0042-PR-c-48265.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0044-PR-c-48281.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0045-PR-c-48369.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0046-PR-c-48212.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0048-2011-03-31-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0049-PR-target-48142.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0050-PR-target-16292.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0051-PR-c-48280.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0053-Merge-r171807-from-trunk-to-the-4.6-release-branch-t.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0054-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0056-config-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0058-2011-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0060-be.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0061-be.po-ca.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0063-gfortran.dg-bessel_6.f90-Use-dg-add-options-ieee.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0064-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0065-es.po-Update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0067-The-parameters-for-functions-from-the-frexp-family-w.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0068-2011-04-05-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0069-stor-layout.c-self_referential_size-Fix-2010-07-13-c.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0070-de.po-Update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0072-gcov-io.c-Use-GCC-Runtime-Library-Exception.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0073-Backported-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0074-PR-debug-48466.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0076-Merge-r172073-from-trunk-to-the-4.6-release-branch-t.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0077-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0078-de.po-Update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0079-PR-debug-48343.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0080-PR-fortran-48117.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0081-config-i386-sse.md-Update-copyright-year.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0082-gcc.dg-torture-stackalign-non-local-goto-5.c-Fix-for.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0084-PR-tree-optimization-48377.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0085-de.po-Update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0086-PR-c-48450.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0087-semantics.c-finish_decltype_type-Add-complain-parm.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0088-PR-c-48452.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0089-PR-c-48468.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0090-PR-c-48500.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0091-2011-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0092-PR-testsuite-48506.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0094-Bail-out-rather-than-crashing-in-array_type_nelts-if.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0095-PR-c-48528.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0097-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0098-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0099-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0101-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0102-common.opt-Tbss-Tdata-Ttext-New-options.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0104-PR-c-48523.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0105-PR-c-48534.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0106-PR-c-48517.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0107-2011-04-12-Allan-McRae-allan-archlinux.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0108-config-v850-v850.c-expand_prologue-Do-not-use-the-CA.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0109-PR-rtl-optimization-48549.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0110-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0112-Fix-PR-target-48090.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0113-Fix-PR-c-48574.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0114-PR-c-48570.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0115-PR-middle-end-48591.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0116-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0117-PR-c-48594.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0118-sv.po-Update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0119-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0122-PR-target-48605.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0123-PR-target-48614.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0124-2011-04-15-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0125-2011-04-15-Takaya-Saito-gintensubaru-gmail.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0126-2011-04-15-Paolo-Carlini-paolo.carlini-oracle.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0127-testsuite-libjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0129-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0130-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0132-PR-lto-48538.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0133-config-sparc-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0134-2011-04-17-Daniel-Krugler-daniel.kruegler-googlemail.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0135-doc-passes.texi-Fill-crossref-nodes.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0136-gcc-interface-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0138-PR-tree-optimization-48616.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0139-2011-04-18-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0140-PR-47571-Fix-weakref-trickery-breakage-on-alpha-dec-.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0141-dwarf2out.c-is_redundant_typedef-Add-inline-to-proto.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0142-PR-c-48632.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0143-PR-middle-end-48661.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0144-PR-c-48537.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0146-PR-testsuite-48675.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0147-2011-04-18-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0149-PR-target-48678.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0151-PR-c-46304.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0152-bootstrap-lto.mk-Remove-obsolete-requirement.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0153-2011-04-20-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0154-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0155-PR-tree-optimization-48611.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0156-PR-c-48657.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0157-PR-target-48288.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0159-PR-c-48594.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0160-semantics.c-finish_compound_literal-Don-t-put-an-arr.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0161-gimple.c-walk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0162-2011-04-21-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0163-de.po-Update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0164-PR-target-48708.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0166-PR-c-48716.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0167-PR-target-48723.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0168-PR-tree-optimization-48717.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0170-Revert.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0171-PR-c-48685.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0172-gcc.dg-pr48616.c-dg-options-Add-fno-common-to-option.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0173-2011-04-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0174-PR-preprocessor-48740.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0176-2011-04-24-Paolo-Carlini-paolo.carlini-oracle.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0178-PR-c-48707.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0180-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0181-2011-04-26-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0182-PR-tree-optimization-48734.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0183-PR-debug-48768.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0184-de.po-Update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0185-PR-c-48726.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0187-PR-c-42687.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0188-PR-c-48742.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0189-gcc.dg-20020312-2.c-Add-definition-for-RX.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0190-PR-c-48046.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0192-PR-middle-end-48597.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0193-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0194-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0195-Fix-PR-c-48656.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0196-Backport-4.7-patchtes-to-4.6.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0198-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0199-2011-04-29-Paolo-Carlini-paolo.carlini-oracle.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0201-PR-tree-optimization-48809.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0202-2011-04-30-Paul-Thomas-pault-gcc.gnu.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0203-2011-04-30-Jerry-DeLisle-jvdelisle-gcc.gnu.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0205-2011-04-30-Doug-Kwan-dougkwan-google.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0207-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0209-PR-target-48723.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0210-2011-05-03-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0211-PR-target-48774.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0212-2011-05-03-Paolo-Carlini-paolo.carlini-oracle.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0214-include-ext-sso_string_base.h-__sso_string_base-_M_c.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0215-config-i386-i386.md-movdi_internal_rex64-TYPE_SSEMOV.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0216-2011-05-04-Steven-G.-Kargl-kargl-gcc.gnu.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0218-PR-c-48749.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0219-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0220-gcc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0221-PR-ada-48844.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0222-PR-c-40975.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0223-Add-missing-break-for-OPT_mfpu_-case.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0224-2011-05-06-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0226-Fix-PR-c-48838.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0227-PR-fortran-48894.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0228-2011-05-06-Ramana-Radhakrishnan-ramana.radhakrishnan.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0229-2011-05-06-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0230-PR-target-48900.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0231-config-i386-i386.md-movdf_internal_nointeger-Apply.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0232-PR-c-48089.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0233-PR-c-48446.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0234-PR-c-48911.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0235-PR-c-48909.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0239-var-tracking.c-find_mem_expr_in_1pdv-Fix-thinko.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0240-Fix-PR-c-48574.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0241-2011-05-09-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0242-2011-05-09-Paolo-Carlini-paolo.carlini-oracle.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0244-PR-tree-optimization-48611.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0245-Backported-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0246-config-rx-rx.h-JUMP_ALIGN-LABEL_ALIGN-LOOP_ALIGN-Def.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0248-config-rx-rx.c-rx_memory_move_cost-Reduce-the-cost-f.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0249-Fix-PRs-48857-48495.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0251-gcc-cp-ChangeLog.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0252-PR-debug-48159.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0253-2011-05-11-Tobias-Burnus-burnus-net-b.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0255-pt.c-build_non_dependent_expr-Don-t-check-null_ptr_c.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0256-config-rx-rx.h-HAVE_PRE_DECREMENT-Fix-typo.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0257-zh_CN.po-Update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0258-PR-debug-48967.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0259-2011-05-12-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0260-PR-tree-optimization-48975.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0263-zh_CN.po-Update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0266-config-i386-i386.md-movxf_internal-Disable-CONST_DOU.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0267-PR-preprocessor-48677.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0269-PR-target-48986.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0270-config-rx-rx.md-Add-peephole-to-remove-redundant-ext.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0271-config-rx-rx.c-rx_memory_move_cost-Include-cost-of-r.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0273-PR-tree-optimization-49000.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0274-PR-tree-optimization-49000.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0275-2011-05-18-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0276-2011-05-18-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0277-2011-05-18-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0278-PR-tree-optimization-49039.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0279-Properly-handle-256bit-load-cast.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0281-PR-c-48869.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0282-gcc.c-torture-execute-960321-1.x-Remove.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0283-zh_CN.po-Update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0284-PR-c-49043.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0285-2011-05-19-Uros-Bizjak-ubizjak-gmail.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0287-PR-tree-optimization-49073.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0288-2011-05-20-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0289-PR-bootstrap-49086.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0290-PR-c-48873.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0291-PR-c-48736.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0292-PR-c-48745.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0293-semantics.c-register_constexpr_fundef-Add-to-hash-ta.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0294-semantics.c-validate_constexpr_fundecl-Check-DECL_TE.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0295-PR-c-48948.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0296-DR-1073.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0298-In-gcc-objc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0299-PR-c-49066.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0300-config-sparc-sparc.c-eligible_for_return_delay-Do-no.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0301-config-sparc-sparc.md-setjmp-Handle-PIC-mode-and-use.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0303-PR-c-48780.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0304-PR-c-48945.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0305-PR-middle-end-49029.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0306-PR-target-49104.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0307-config.gcc-sparc-elf-Add-sparc-t-crtin.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0308-PR-c-48647.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0309-2011-05-22-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0311-PR-middle-end-48973.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0312-PR-c-49120.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0313-PR-debug-49032.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0314-PR-lto-49123.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0316-Always-add-mno-XXX-for-march-native.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0317-PR-target-49133.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0318-config-sparc-sparc.c-sparc_option_override-If-not-se.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0320-PR-c-48617.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0321-PR-c-47544.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0322-PR-c-47336.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0323-PR-c-47263.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0324-PR-c-49105.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0325-PR-c-48884.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0326-PR-c-49042.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0327-PR-c-49136.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0328-In-libobjc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0329-2011-05-24-Paolo-Carlini-paolo.carlini-oracle.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0330-PR-tree-optimization-44897.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0331-PR-target-49128.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0332-PR-c-48292.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0333-PR-c-45080.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0334-PR-c-45418.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0335-PR-c-48935.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0336-gcc.target-arm-fp16-compile-none-1.c-Update-expected.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0337-PR-c-47184.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0338-PR-c-46696.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0339-PR-c-46245.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0340-PR-c-46145.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0341-PR-c-45698.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0342-PR-c-44311.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0343-gcc-cp-ChangeLog.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0344-2011-05-25-Paolo-Carlini-paolo.carlini-oracle.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0345-2011-05-25-Paolo-Carlini-paolo.carlini-oracle.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0347-PR-c-45401.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0348-PR-c-49156.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0349-PR-tree-optimization-49161.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0350-PR-c-49165.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0351-PR-target-44643.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0352-PR-c-48424.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0354-config-rs6000-rs6000.c-rs6000_register_move_cost-Mak.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0355-2011-05-26-Paul-Thomas-pault-gcc.gnu.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0357-PR-c-48657.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0358-PR-c-49165.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0359-PR-c-48284.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0360-PR-c-47277.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0362-PR-c-47049.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0364-2011-05-29-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0365-gcc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0366-gcc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0367-Add-PR-target-43700-to-last-changelog-entry.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0369-PR-target-45263.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0370-2011-05-30-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0371-PR-c-49223.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0373-2011-05-31-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0374-2011-05-31-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0375-Fix-fma4_fmsubadd-and-fma4_fmaddsub-mode-suffixes.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0376-2011-05-31-Thomas-Koenig-tkoenig-gcc.gnu.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0379-PR-tree-optimization-49093.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0380-2011-06-02-Steven-G.-Kargl-kargl-gcc.gnu.org.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0382-PR-c-49276.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0384-PR-tree-optimization-49038.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0385-PR-debug-47590.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0386-2011-06-04-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0388-PR-target-49186.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0389-config-sparc-sparc.c-output_return-Fix-thinko-in-the.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0391-PR-c-49134.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0392-2011-06-06-Richard-Guenther-rguenther-suse.de.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0393-2011-06-06-Mikael-Pettersson-mikpe-it.uu.se.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0394-2011-06-06-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0395-PR-c-49264.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0396-PR-fortran-49268.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0397-config-rs6000-rs6000.h-REG_CLASS_CONTENTS-Remove-vr0.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0398-PR-c-49298.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0400-PR-gcov-profile-49299.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0401-PR-c-48780.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0403-PR-target-49238.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0404-Support-unknown-Intel-family-0x6-CPUs.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0406-config-sparc-sparc.md-return_internal-Adjust-length-.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0408-semantics.c-potential_constant_expression_1-Handle-d.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0409-semantics.c-finish_compound_literal-Set-TREE_HAS_CON.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0410-lib-target-supports.exp.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0411-gcc-testsuite-gcc.target-arm-20090811-1.c-Skip-for-i.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0413-config-i386-sse.md-vec_dupv4sf-Correct-mode-of-force.patch
 rename meta/recipes-devtools/gcc/{gcc-4.6.0.inc => gcc-4.6.inc} (85%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/100-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/103-uclibc-conf-noupstream.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/200-uclibc-locale.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/203-uclibc-locale-no__x.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/204-uclibc-locale-wchar_fix.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/205-uclibc-locale-update.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/301-missing-execinfo_h.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/302-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/303-c99-complex-ugly-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/304-index_macro.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/305-libmudflap-susv3-legacy.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/306-libstdc++-namespace.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/64bithack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/740-sh-pr24836.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/800-arm-bigendian.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/904-flatten-switch-stmt-00.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/arm-nolibfloat.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/arm-softfloat.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/cache-amnesia.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/disable_relax_pic_calls_flag.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/gcc-flags-for-build.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/gcc-poison-parameters.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/gcc-uclibc-locale-ctype_touplow_t.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/optional_libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/volatile_access_backport.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-4.6.0 => gcc-4.6}/zecke-xgcc-cpp.patch (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4_6-branch-backports.inc
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_4.6.0.bb => gcc-cross-canadian_4.6.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_4.6.0.bb => gcc-cross-initial_4.6.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-intermediate_4.6.0.bb => gcc-cross-intermediate_4.6.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_4.6.0.bb => gcc-cross_4.6.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_4.6.0.bb => gcc-crosssdk-initial_4.6.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-intermediate_4.6.0.bb => gcc-crosssdk-intermediate_4.6.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_4.6.0.bb => gcc-crosssdk_4.6.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_4.6.0.bb => gcc-runtime_4.6.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_4.6.0.bb => gcc_4.6.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_4.6.0.bb => libgcc_4.6.bb} (100%)

-- 
1.7.5.1



