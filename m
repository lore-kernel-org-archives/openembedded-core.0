Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C56676B512
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 23:00:46 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w73so8605278pfk.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 15:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=K/A5xObIFQ5GTgwzEIcUvrAYuuohxZg3PQwxYNpThCU=;
	b=KrceVHXKrDWbB2NnD/Q7TRAzVZyIPU36BiW7naA6cslgKY/yLNie11iREtYldmBsLx
	xJNqShANI/2RnlpGGPQN+crC614YfMbdevqGokf+yZUFqOrmzkJocJitB73RS3M+uiES
	vtrJTaO5/TgDNFvHplhg8tyPaA//3/nZP4lcpAK61dxwVE9JOEbzZLc97yK3oQinY8PR
	QCpmmTwicoopoKqBtMQKQ9oUIcoS5LhW/yS/ztG8j3HD52b+S5g+IEjfyh/jI+1VQN1W
	6+/uaO/NKB39YDK0288Ky5gxvxHvIrAU56JxY9lS9nEp3npY7GkhaJttcFsR07zgho+G
	EYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=K/A5xObIFQ5GTgwzEIcUvrAYuuohxZg3PQwxYNpThCU=;
	b=SGbi3xBa7wf6Fl1hD5fFBa6hu1z6FoDbV0aL5+XmzI8cGmU+F2kMX7RvKbIen0/zF/
	KJUqTOhoWmaOJVHOyl68sslAukAElW9v/JYiFQLD/0t0SoOPedtJFpO+Zgg0ptpQQzgr
	iEvbTskFklmeFJvrKAHiLY7AjPVqKXqJhP39Q8VFPGcuRVcU04G97vADvUjf9g3zncYR
	6gkRGJe/CDxWL1vUhmOrvUHTRkoN7I6HZ64k6iU510QQT2uznX+gDEZLky7wggsM3GOf
	WcSKo1EBhLwAE+KlIgi5I6vKgaY87Wouw2Vdmn+L1P/5Yrho4tmyct42VMMVQuGe9r1I
	aHSw==
X-Gm-Message-State: AJcUukf6AGaqgoZ0iGyA/+8jfUaFAfXoYEqlZo89PXjZOm7b7PB7rq1P
	s4uwj4GDRj/Ab1DHZGR1705P7hbu
X-Google-Smtp-Source: ALg8bN6jgPYLHnv9ezgYAXEjTpNxJi/04KYzxHGRXy7xBJMx/DDEG8biQVO5b1+szZNBsXaoUyhgfg==
X-Received: by 2002:a62:5fc4:: with SMTP id t187mr20134963pfb.66.1547334047397;
	Sat, 12 Jan 2019 15:00:47 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:816e:2b5:d56e:6d0d?
	([2601:202:4180:c33:816e:2b5:d56e:6d0d])
	by smtp.gmail.com with ESMTPSA id
	v89sm123120168pfk.12.2019.01.12.15.00.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 15:00:46 -0800 (PST)
To: Ovidiu Panait <ovidiu.panait@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20190108125712.14799-1-ovidiu.panait@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e909df97-7e06-57c7-a430-d9c4c55ea3fb@gmail.com>
Date: Sat, 12 Jan 2019 15:00:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190108125712.14799-1-ovidiu.panait@windriver.com>
Subject: Re: [thud][PATCH] ghostscript: Fix CVE-2018-19134 and CVE-2018-19478
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Jan 2019 23:00:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/8/19 4:57 AM, Ovidiu Panait wrote:
> In Artifex Ghostscript through 9.25, the setpattern operator did not properly
> validate certain types. A specially crafted PostScript document could exploit
> this to crash Ghostscript or, possibly, execute arbitrary code in the context
> of the Ghostscript process. This is a type confusion issue because of failure
> to check whether the Implementation of a pattern dictionary was a structure
> type.
>
> In Artifex Ghostscript before 9.26, a carefully crafted PDF file can trigger
> an extremely long running computation when parsing the file.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2018-19134
> https://nvd.nist.gov/vuln/detail/CVE-2018-19478

Thanks for sending the fixes for these CVE.  The package was update to
9.26 a few day's ago in thud proper and I believe these are addressed
via the update.

kind regards,
Armin


>
> Upstream patches:
> http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=693baf0
> http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=0a7e5a1
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  .../ghostscript/CVE-2018-19134.patch          | 158 ++++++++++++++++++
>  .../ghostscript/CVE-2018-19478.patch          |  78 +++++++++
>  .../ghostscript/ghostscript_9.25.bb           |   2 +
>  3 files changed, 238 insertions(+)
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2018-19134.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2018-19478.patch
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2018-19134.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2018-19134.patch
> new file mode 100644
> index 0000000000..d32415a32c
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2018-19134.patch
> @@ -0,0 +1,158 @@
> +From 693baf02152119af6e6afd30bb8ec76d14f84bbf Mon Sep 17 00:00:00 2001
> +From: Ken Sharp <ken.sharp@artifex.com>
> +Date: Thu, 8 Nov 2018 14:43:32 +0000
> +Subject: [PATCH] PS interpreter - check the Implementation of a Pattern before
> + use
> +
> +Bug #700141 "Type confusion in setpattern"
> +
> +As the bug thread says, we were not checking that the Implementation
> +of a pattern dictionary was a structure type, leading to a crash when
> +we tried to treat it as one.
> +
> +Here we make the st_pattern1_instance and st_pattern2_instance
> +structures public definitions and in zsetcolor we check the object
> +stored under the Implementation key in the supplied dictionary to see if
> +its a t_struct or t_astruct type, and if it is that its a
> +st_pattern1_instance or st_pattern2_instance structure.
> +
> +If either check fails we throw a typecheck error.
> +
> +We need to make the st_pattern1_instance and st_pattern2_instance
> +definitions public as they are defined in the graphics library and we
> +need to check in the interpreter.
> +
> +CVE: CVE-2018-19134
> +Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + base/gsptype1.c |  2 +-
> + base/gsptype2.c |  6 +++---
> + base/gsptype2.h |  4 ++--
> + base/gxcolor2.h |  4 ++--
> + psi/zcolor.c    | 11 ++++++++---
> + 5 files changed, 16 insertions(+), 11 deletions(-)
> +
> +diff --git a/base/gsptype1.c b/base/gsptype1.c
> +index 27fdd5a1b..e98dde18e 100644
> +--- a/base/gsptype1.c
> ++++ b/base/gsptype1.c
> +@@ -50,7 +50,7 @@
> + 
> + /* GC descriptors */
> + private_st_pattern1_template();
> +-private_st_pattern1_instance();
> ++public_st_pattern1_instance();
> + 
> + /* GC procedures */
> + static ENUM_PTRS_BEGIN(pattern1_instance_enum_ptrs) {
> +diff --git a/base/gsptype2.c b/base/gsptype2.c
> +index 791e538c0..c53eb2e9f 100644
> +--- a/base/gsptype2.c
> ++++ b/base/gsptype2.c
> +@@ -33,7 +33,7 @@
> + 
> + /* GC descriptors */
> + private_st_pattern2_template();
> +-private_st_pattern2_instance();
> ++public_st_pattern2_instance();
> + 
> + /* GC procedures */
> + static ENUM_PTRS_BEGIN(pattern2_instance_enum_ptrs) {
> +@@ -206,10 +206,10 @@ gs_pattern2_set_color(const gs_client_color * pcc, gs_gstate * pgs)
> + 
> +     pinst->saved->overprint_mode = pgs->overprint_mode;
> +     pinst->saved->overprint = pgs->overprint;
> +-    
> ++
> +     num_comps = pgs->device->color_info.num_components;
> +     for (k = 0; k < num_comps; k++) {
> +-        pgs->color_component_map.color_map[k] = 
> ++        pgs->color_component_map.color_map[k] =
> +             pinst->saved->color_component_map.color_map[k];
> +     }
> +     code = pcs->type->set_overprint(pcs, pgs);
> +diff --git a/base/gsptype2.h b/base/gsptype2.h
> +index f0f26d19b..4186201d0 100644
> +--- a/base/gsptype2.h
> ++++ b/base/gsptype2.h
> +@@ -57,8 +57,8 @@ typedef struct gs_pattern2_instance_s {
> +     bool shfill;
> + } gs_pattern2_instance_t;
> + 
> +-#define private_st_pattern2_instance() /* in gsptype2.c */\
> +-  gs_private_st_composite(st_pattern2_instance, gs_pattern2_instance_t,\
> ++#define public_st_pattern2_instance() /* in gsptype2.c */\
> ++  gs_public_st_composite(st_pattern2_instance, gs_pattern2_instance_t,\
> +     "gs_pattern2_instance_t", pattern2_instance_enum_ptrs,\
> +     pattern2_instance_reloc_ptrs)
> + 
> +diff --git a/base/gxcolor2.h b/base/gxcolor2.h
> +index 62ec05e9b..d5b109573 100644
> +--- a/base/gxcolor2.h
> ++++ b/base/gxcolor2.h
> +@@ -92,8 +92,8 @@ struct gs_pattern1_instance_s {
> +     gx_bitmap_id id;		/* key for cached bitmap (= id of mask) */
> + };
> + 
> +-#define private_st_pattern1_instance() /* in gsptype1.c */\
> +-  gs_private_st_composite(st_pattern1_instance, gs_pattern1_instance_t,\
> ++#define public_st_pattern1_instance() /* in gsptype1.c */\
> ++  gs_public_st_composite(st_pattern1_instance, gs_pattern1_instance_t,\
> +     "gs_pattern1_instance_t", pattern1_instance_enum_ptrs,\
> +     pattern1_instance_reloc_ptrs)
> + 
> +diff --git a/psi/zcolor.c b/psi/zcolor.c
> +index 74b428801..3b8849ff3 100644
> +--- a/psi/zcolor.c
> ++++ b/psi/zcolor.c
> +@@ -65,6 +65,8 @@ static const float default_0_1[] = {0, 1, 0, 1, 0, 1, 0, 1};
> + 
> + /* imported from gsht.c */
> + extern  void    gx_set_effective_transfer(gs_gstate *);
> ++extern_st(st_pattern1_instance);
> ++extern_st(st_pattern2_instance);
> + 
> + /* Essential forward declarations */
> + static int validate_spaces(i_ctx_t *i_ctx_p, ref *arr, int *depth);
> +@@ -289,6 +291,9 @@ zsetcolor(i_ctx_t * i_ctx_p)
> +                 code = array_get(imemory, pImpl, 0, &pPatInst);
> +                 if (code < 0)
> +                     return code;
> ++                if (!r_is_struct(&pPatInst) || (!r_has_stype(&pPatInst, imemory, st_pattern1_instance) && !r_has_stype(&pPatInst, imemory, st_pattern2_instance)))
> ++                    return_error(gs_error_typecheck);
> ++
> +                 cc.pattern = r_ptr(&pPatInst, gs_pattern_instance_t);
> +                 n_numeric_comps = ( pattern_instance_uses_base_space(cc.pattern)
> +                       ? n_comps - 1
> +@@ -4423,7 +4428,7 @@ static int setindexedspace(i_ctx_t * i_ctx_p, ref *r, int *stage, int *cont, int
> +         /* If we have a named color profile and the base space is DeviceN or
> +            Separation use a different set of procedures to ensure the named
> +            color remapping code is used */
> +-        if (igs->icc_manager->device_named != NULL && 
> ++        if (igs->icc_manager->device_named != NULL &&
> +             (base_type == gs_color_space_index_Separation ||
> +              base_type == gs_color_space_index_DeviceN))
> +             pcs = gs_cspace_alloc(imemory, &gs_color_space_type_Indexed_Named);
> +@@ -5585,7 +5590,7 @@ static int iccompareproc(i_ctx_t *i_ctx_p, ref *space, ref *testspace)
> +         return 0;
> + 
> +     /* As a quick check see if current is same as new */
> +-    if (ICCdict1.value.bytes == ICCdict2.value.bytes) 
> ++    if (ICCdict1.value.bytes == ICCdict2.value.bytes)
> +          return 1;
> + 
> +     /* Need to check all the various parts */
> +@@ -5605,7 +5610,7 @@ static int iccompareproc(i_ctx_t *i_ctx_p, ref *space, ref *testspace)
> +     code2 = dict_find_string(&ICCdict2, "DataSource", &tempref2);
> +     if (code2 <= 0)
> +         return 0;
> +-    if (r_size(tempref1) != r_size(tempref2)) 
> ++    if (r_size(tempref1) != r_size(tempref2))
> +         return 0;
> + 
> +     buff_size = r_size(tempref1);
> +-- 
> +2.13.3
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2018-19478.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2018-19478.patch
> new file mode 100644
> index 0000000000..b3b7eb1735
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2018-19478.patch
> @@ -0,0 +1,78 @@
> +From 0a7e5a1c309fa0911b892fa40996a7d55d90bace Mon Sep 17 00:00:00 2001
> +From: Ken Sharp <ken.sharp@artifex.com>
> +Date: Wed, 3 Oct 2018 17:00:28 +0100
> +Subject: [PATCH] PDF interpreter - limit page tree recusrsion checking
> +
> +Bug #699856 "Attempting to open a carefully crafted PDF file results in long-running computation"
> +
> +A sufficiently bad page tree can lead to us taking significant amounts
> +of time when checking the tree for recursion.
> +
> +We can limit this by noting the number of pages in the root node
> +(given by /Count) and stopping the recursion check when we have
> +encountered that many leaf nodes.
> +
> +Our other recursion checks work by reading the resources from the page
> +nodes and so are unaffected by this.
> +
> +CVE: CVE-2018-19478
> +Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + Resource/Init/pdf_main.ps | 38 +++++++++++++++++++++++---------------
> + 1 file changed, 23 insertions(+), 15 deletions(-)
> +
> +diff --git a/Resource/Init/pdf_main.ps b/Resource/Init/pdf_main.ps
> +index 09f87353c..4d59d9c53 100644
> +--- a/Resource/Init/pdf_main.ps
> ++++ b/Resource/Init/pdf_main.ps
> +@@ -1952,22 +1952,30 @@ currentdict /xref-char-dict undef
> +   Trailer /Root knownoget {
> +     /Pages knownoget {
> +       10 dict begin
> ++      /Count pdfpagecount def
> +       /verify_page_tree_recursive {
> +-        dup 1 def
> +-        dup /Kids knownoget {
> +-          { oforce
> +-            dup //null ne {
> +-              currentdict 1 index known {
> +-                (   **** Error: there's a loop in the Pages tree. Giving up.\n) pdfformaterror
> +-                /verify_page_tree cvx /syntaxerror signalerror
> +-              } if
> +-              verify_page_tree_recursive
> +-            } {
> +-              pop
> +-            } ifelse
> +-          } forall
> +-        } if
> +-        currentdict exch undef
> ++        Count 0 gt {
> ++          dup 1 def
> ++          dup /Kids knownoget {
> ++            { oforce
> ++              dup //null ne {
> ++                currentdict 1 index known {
> ++                  (   **** Error: there's a loop in the Pages tree. Giving up.\n) pdfformaterror
> ++                  /verify_page_tree cvx /syntaxerror signalerror
> ++                } if
> ++                verify_page_tree_recursive
> ++              } {
> ++                pop
> ++              } ifelse
> ++            } forall
> ++          } {
> ++            /Count Count 1 sub def
> ++          }ifelse
> ++          currentdict exch undef
> ++          } {
> ++            pop
> ++            (   **** Error: Too many pages in Page tree.\n) pdfformaterror
> ++        } ifelse
> +       } def
> +       verify_page_tree_recursive
> +       end
> +-- 
> +2.13.3
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> index fdca8a2ac9..637df7e194 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> @@ -33,6 +33,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
>                  file://0006-Undefine-some-additional-internal-operators.patch \
>                  file://0007-Bug-699927-don-t-include-operator-arrays-in-execstac.patch \
>                  file://0008-Make-.forceput-unavailable-from-.policyprocs-helper-.patch \
> +                file://CVE-2018-19134.patch \
> +                file://CVE-2018-19478.patch \
>  "
>  
>  SRC_URI = "${SRC_URI_BASE} \


