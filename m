Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8143879715
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 15:16:41 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j8-v6so10637372pff.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=or6rjSfQniobIngKoxBCgzSMzjRMFLW0UAMqd+cXgTA=;
	b=uc2fRLtJ09Q16poq9/JQzm48ov5158zydNUPWE3qqedwDhyj8YC4gdYa8ehA7SvT2G
	Y48Awy9Fn8+njjmOL62bEqUWC05oDevb3araS55x+bE3W3gAdycpW3XJPC5cUzxi+DxY
	p0F5u3XwliJ5qCwGgWLa6L9OH3p4Rh07NDESBeFsGKJzqlb4zNXqfMUt21dsInMAxxWm
	+1vstGI6JCc5ni6DTD8mUdjZcskHMOBZ7pcr0DSROSwTH8wOcm5xABt8eGkGOwmBwAli
	YRbOSSaZ99TTcs90IL+0DKPmKUlm00dSMzcPNdidsAluvquAhgfb3VBS9uVeuSV5dvsw
	FJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=or6rjSfQniobIngKoxBCgzSMzjRMFLW0UAMqd+cXgTA=;
	b=emEQQTaVweJTAdy03UJTMUQj1/5qJPRXyAuQVEPpKRUrUiS2+PG61ZcEIsy7HD6MtN
	xpQW1HC2aCFSWGxfTjjd/g3YtDNGJWzFQ1TL8lzSXf6AFj5OppizubQXRKmBSGayhvFQ
	v127N2Fzil3p2l7m2ZEmoRKZX8TxwOciI78HYOyDH0RYCC/QOEl0FsuAptC05wldTww1
	zG7dkRTLAbf+M4eY6Pp1HNkNGUBu95R0l+sZM6BPx7NSAOEDF+T/bqGjC8G6mtfR7bkT
	BbKmdeZZqWNTIX+NZE+XTfidppIySLJk+6gKoVY2udz2rwlhisLLzvLT2l5BORR6vIIU
	64LA==
X-Gm-Message-State: APzg51BthV5zvNJDirdnZDx6WCsOXwDdagKKOtCTvHr26D7WzY/5VR5z
	/JlicrHOhtQWIa5myohZKArtEUsG
X-Google-Smtp-Source: ANB0Vdb/GKKnDY7KALw8UD4QY484mFSZZ1ZKC0Le/tkcId8dP1/xoZ1LTjyELFSIROzCxGghK5hchQ==
X-Received: by 2002:a63:3e8b:: with SMTP id
	l133-v6mr22783346pga.355.1536592602433; 
	Mon, 10 Sep 2018 08:16:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:518a:47f1:5e9e:9b96?
	([2601:202:4180:c33:518a:47f1:5e9e:9b96])
	by smtp.gmail.com with ESMTPSA id
	s85-v6sm26706927pfa.116.2018.09.10.08.16.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 08:16:41 -0700 (PDT)
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
References: <1536564061-127648-1-git-send-email-hongxu.jia@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <07c22c3e-5575-6b07-4161-f4c0d54212f8@gmail.com>
Date: Mon, 10 Sep 2018 08:16:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536564061-127648-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH] ghostscript: fix CVE-2018-15908 & CVE-2018-15909 & CVE-2018-15910 & CVE-2018-15911
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
X-List-Received-Date: Mon, 10 Sep 2018 15:16:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 09/10/2018 12:21 AM, Hongxu Jia wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...Bug-699665-memory-corruption-in-aesdecode.patch | 56 +++++++++++++
>  ...Handle-LockDistillerParams-not-being-a-bo.patch | 53 +++++++++++++
>  ...660-shading_param-incomplete-type-checkin.patch | 91 ++++++++++++++=
++++++++
>  .../0004-Hide-the-.shfill-operator.patch           | 35 +++++++++
>  ...properly-apply-file-permissions-to-.tempf.patch | 54 +++++++++++++
>  .../ghostscript/ghostscript_9.23.bb                |  5 ++
>  6 files changed, 294 insertions(+)
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-=
Bug-699665-memory-corruption-in-aesdecode.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0002-=
Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0003-=
Fix-Bug-699660-shading_param-incomplete-type-checkin.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0004-=
Hide-the-.shfill-operator.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0005-=
Bug-699657-properly-apply-file-permissions-to-.tempf.patch
Thank you for the fixes.

Is updating to the=C2=A0 9.24 release an option? I believe there even are=

more vulnerabilities being addressed within that release.

- Armin
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-699=
665-memory-corruption-in-aesdecode.patch b/meta/recipes-extended/ghostscr=
ipt/ghostscript/0001-Bug-699665-memory-corruption-in-aesdecode.patch
> new file mode 100644
> index 0000000..df654f7
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-699665-mem=
ory-corruption-in-aesdecode.patch
> @@ -0,0 +1,56 @@
> +From b9fa1157e1f4982d42241146c9b7c6c789d6f076 Mon Sep 17 00:00:00 2001=

> +From: Ken Sharp <ken.sharp@artifex.com>
> +Date: Thu, 23 Aug 2018 15:42:02 +0100
> +Subject: [PATCH 1/5] Bug 699665 "memory corruption in aesdecode"
> +
> +The specimen file calls aesdecode without specifying the key to be
> +used, though it does manage to do enough work with the PDF interpreter=

> +routines to get access to aesdecode (which isn't normally available).
> +
> +This causes us to read uninitialised memory, which can (and often does=
)
> +lead to a segmentation fault.
> +
> +In this commit we set the key to NULL explicitly during intialisation
> +and then check it before we read it. If its NULL we just return.
> +
> +It seems bizarre that we don't return error codes, we should probably
> +look into that at some point, but this prevents the code trying to
> +read uninitialised memory.
> +
> +CVE: CVE-2018-15911
> +Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + base/aes.c  | 3 +++
> + base/saes.c | 1 +
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/base/aes.c b/base/aes.c
> +index a6bce93..e86f000 100644
> +--- a/base/aes.c
> ++++ b/base/aes.c
> +@@ -662,6 +662,9 @@ void aes_crypt_ecb( aes_context *ctx,
> +     }
> + #endif
> +=20
> ++    if (ctx =3D=3D NULL || ctx->rk =3D=3D NULL)
> ++        return;
> ++
> +     RK =3D ctx->rk;
> +=20
> +     GET_ULONG_LE( X0, input,  0 ); X0 ^=3D *RK++;
> +diff --git a/base/saes.c b/base/saes.c
> +index 6db0e8b..307ed74 100644
> +--- a/base/saes.c
> ++++ b/base/saes.c
> +@@ -120,6 +120,7 @@ s_aes_process(stream_state * ss, stream_cursor_rea=
d * pr,
> +         gs_throw(gs_error_VMerror, "could not allocate aes context");=

> +         return ERRC;
> +       }
> ++      memset(state->ctx, 0x00, sizeof(aes_context));
> +       if (state->keylength < 1 || state->keylength > SAES_MAX_KEYLENG=
TH) {
> +         gs_throw1(gs_error_rangecheck, "invalid aes key length (%d by=
tes)",
> +                 state->keylength);
> +--=20
> +2.8.1
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/0002-Bug-699=
656-Handle-LockDistillerParams-not-being-a-bo.patch b/meta/recipes-extend=
ed/ghostscript/ghostscript/0002-Bug-699656-Handle-LockDistillerParams-not=
-being-a-bo.patch
> new file mode 100644
> index 0000000..a16f215
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/0002-Bug-699656-Han=
dle-LockDistillerParams-not-being-a-bo.patch
> @@ -0,0 +1,53 @@
> +From 1b516be5f6829ab6ce37835529ba08abd6d18663 Mon Sep 17 00:00:00 2001=

> +From: Chris Liddell <chris.liddell@artifex.com>
> +Date: Tue, 21 Aug 2018 16:42:45 +0100
> +Subject: [PATCH 2/5] Bug 699656: Handle LockDistillerParams not being =
a
> + boolean
> +
> +This caused a function call commented as "Can't fail" to fail, and res=
ulted
> +in memory correuption and a segfault.
> +
> +CVE: CVE-2018-15910
> +Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + devices/vector/gdevpdfp.c | 2 +-
> + psi/iparam.c              | 7 ++++---
> + 2 files changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/devices/vector/gdevpdfp.c b/devices/vector/gdevpdfp.c
> +index 522db7a..f2816b9 100644
> +--- a/devices/vector/gdevpdfp.c
> ++++ b/devices/vector/gdevpdfp.c
> +@@ -364,7 +364,7 @@ gdev_pdf_put_params_impl(gx_device * dev, const gx=
_device_pdf * save_dev, gs_par
> +      * LockDistillerParams is read again, and reset if necessary, in
> +      * psdf_put_params.
> +      */
> +-    ecode =3D param_read_bool(plist, "LockDistillerParams", &locked);=

> ++    ecode =3D param_read_bool(plist, (param_name =3D "LockDistillerPa=
rams"), &locked);
> +     if (ecode < 0)
> +         param_signal_error(plist, param_name, ecode);
> +=20
> +diff --git a/psi/iparam.c b/psi/iparam.c
> +index 68c20d4..0279455 100644
> +--- a/psi/iparam.c
> ++++ b/psi/iparam.c
> +@@ -822,10 +822,11 @@ static int
> + ref_param_read_signal_error(gs_param_list * plist, gs_param_name pkey=
, int code)
> + {
> +     iparam_list *const iplist =3D (iparam_list *) plist;
> +-    iparam_loc loc;
> ++    iparam_loc loc =3D {0};
> +=20
> +-    ref_param_read(iplist, pkey, &loc, -1);	/* can't fail */
> +-    *loc.presult =3D code;
> ++    ref_param_read(iplist, pkey, &loc, -1);
> ++    if (loc.presult)
> ++        *loc.presult =3D code;
> +     switch (ref_param_read_get_policy(plist, pkey)) {
> +         case gs_param_policy_ignore:
> +             return 0;
> +--=20
> +2.8.1
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/0003-Fix-Bug=
-699660-shading_param-incomplete-type-checkin.patch b/meta/recipes-extend=
ed/ghostscript/ghostscript/0003-Fix-Bug-699660-shading_param-incomplete-t=
ype-checkin.patch
> new file mode 100644
> index 0000000..174f79e
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/0003-Fix-Bug-699660=
-shading_param-incomplete-type-checkin.patch
> @@ -0,0 +1,91 @@
> +From 759238fd904aab1706dc1007826a13a670cda320 Mon Sep 17 00:00:00 2001=

> +From: Ken Sharp <ken.sharp@artifex.com>
> +Date: Thu, 23 Aug 2018 14:12:48 +0100
> +Subject: [PATCH 3/5] Fix Bug 699660 "shading_param incomplete type che=
cking"
> +
> +Its possible to pass a t_struct parameter to .shfill which is not a
> +shading function built by .buildshading. This could then lead to memor=
y
> +corruption or a segmentation fault by treating the object passed in
> +as if it were a shading.
> +
> +Its non-trivial to check the t_struct, because this function can take
> +7 different kinds of structures as a parameter. Checking these is
> +possible, of course, but would add a performance penalty.
> +
> +However, we can note that we never call .shfill without first calling
> +.buildshading, and we never call .buildshading without immediately
> +calling .shfill. So we can treat these as an atomic operation. The
> +.buildshading function takes all its parameters as PostScript objects
> +and validates them, so that should be safe.
> +
> +This allows us to 'hide' the .shfill operator preventing the possibili=
ty
> +of passing an invalid parameter.
> +
> +CVE: CVE-2018-15909
> +Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + Resource/Init/gs_init.ps  | 4 ++--
> + Resource/Init/gs_ll3.ps   | 7 ++++++-
> + Resource/Init/pdf_draw.ps | 3 +--
> + 3 files changed, 9 insertions(+), 5 deletions(-)
> +
> +diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
> +index 6c8da53..1956ed5 100644
> +--- a/Resource/Init/gs_init.ps
> ++++ b/Resource/Init/gs_init.ps
> +@@ -2181,8 +2181,8 @@ SAFER { .setsafeglobal } if
> + /.getiodevice /.getdevparms /.putdevparams /.bbox_transform /.matchme=
dia /.matchpagesize /.defaultpapersize
> + /.oserrno /.setoserrno /.oserrorstring /.getCPSImode
> + /.getscanconverter /.setscanconverter /.type1encrypt /.type1decrypt/.=
languagelevel /.setlanguagelevel /.eqproc /.fillpage /.buildpattern1 /.sa=
slprep
> +-/.buildshading1 /.buildshadin2 /.buildshading3 /.buildshading4 /.buil=
dshading5 /.buildshading6 /.buildshading7 /.buildshadingpattern
> +-/.argindex /.bytestring /.namestring /.stringbreak /.stringmatch /.gl=
obalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstring
> ++/.buildshading1 /.buildshading2 /.buildshading3 /.buildshading4 /.bui=
ldshading5 /.buildshading6 /.buildshading7 /.buildshadingpattern
> ++%/.shfill /.argindex /.bytestring /.namestring /.stringbreak /.string=
match /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstri=
ng
> + /.localvmarray /.localvmdict /.localvmpackedarray /.localvmstring /.s=
ystemvmarray /.systemvmdict /.systemvmpackedarray /.systemvmstring /.syst=
emvmfile /.systemvmlibfile
> + /.systemvmSFD /.settrapparams /.currentsystemparams /.currentuserpara=
ms /.getsystemparam /.getuserparam /.setsystemparams /.setuserparams
> + /.checkpassword /.locale_to_utf8 /.currentglobal /.gcheck /.imagepath=

> +diff --git a/Resource/Init/gs_ll3.ps b/Resource/Init/gs_ll3.ps
> +index 5aa56a3..1d37e53 100644
> +--- a/Resource/Init/gs_ll3.ps
> ++++ b/Resource/Init/gs_ll3.ps
> +@@ -440,6 +440,11 @@ systemdict /.reuseparamdict mark
> +     /shfill .systemvar /undefined signalerror
> +   } ifelse
> + } bind def
> ++
> ++/.buildshading_and_shfill {
> ++  .buildshading .shfill
> ++} bind def
> ++
> + systemdict /.reuseparamdict undef
> +=20
> + /.buildpattern2 {	% <template> <matrix> .buildpattern2
> +@@ -464,7 +469,7 @@ systemdict /.reuseparamdict undef
> +         % Currently, .shfill requires that the color space
> +         % in the pattern be the current color space.
> +         % Disable overprintmode for shfill
> +-  { dup gsave 0 .setoverprintmode .buildshading .shfill } stopped
> ++  { dup gsave 0 .setoverprintmode .buildshading_and_shfill } stopped
> +   grestore {
> +     /$error .systemvar /errorinfo 2 copy known {
> +       pop pop
> +diff --git a/Resource/Init/pdf_draw.ps b/Resource/Init/pdf_draw.ps
> +index e8ca213..a7144d3 100644
> +--- a/Resource/Init/pdf_draw.ps
> ++++ b/Resource/Init/pdf_draw.ps
> +@@ -1365,9 +1365,8 @@ drawopdict begin
> +     { dup /.shading .knownget {
> +         exch pop
> +       } {
> +-       .buildshading
> ++       .buildshading_and_shfill
> +       } ifelse
> +-      .shfill
> +     } stopped {
> +       pop
> +       (   **** Error: Ignoring invalid smooth shading object, output =
may be incorrect.\n)
> +--=20
> +2.8.1
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/0004-Hide-th=
e-.shfill-operator.patch b/meta/recipes-extended/ghostscript/ghostscript/=
0004-Hide-the-.shfill-operator.patch
> new file mode 100644
> index 0000000..7c6d002
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/0004-Hide-the-.shfi=
ll-operator.patch
> @@ -0,0 +1,35 @@
> +From ee9e8065e7d7b3adbc25fd655727ca72861ee032 Mon Sep 17 00:00:00 2001=

> +From: Ken Sharp <ken.sharp@artifex.com>
> +Date: Fri, 24 Aug 2018 12:44:26 +0100
> +Subject: [PATCH 4/5] Hide the .shfill operator
> +
> +Commit 0b6cd1918e1ec4ffd087400a754a845180a4522b was supposed to make
> +the .shfill operator unobtainable, but I accidentally left a comment
> +in the line doing so.
> +
> +Fix it here, without this the operator can still be exploited.
> +
> +CVE: CVE-2018-15909
> +Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + Resource/Init/gs_init.ps | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
> +index 1956ed5..955b843 100644
> +--- a/Resource/Init/gs_init.ps
> ++++ b/Resource/Init/gs_init.ps
> +@@ -2182,7 +2182,7 @@ SAFER { .setsafeglobal } if
> + /.oserrno /.setoserrno /.oserrorstring /.getCPSImode
> + /.getscanconverter /.setscanconverter /.type1encrypt /.type1decrypt/.=
languagelevel /.setlanguagelevel /.eqproc /.fillpage /.buildpattern1 /.sa=
slprep
> + /.buildshading1 /.buildshading2 /.buildshading3 /.buildshading4 /.bui=
ldshading5 /.buildshading6 /.buildshading7 /.buildshadingpattern
> +-%/.shfill /.argindex /.bytestring /.namestring /.stringbreak /.string=
match /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstri=
ng
> ++/.shfill /.argindex /.bytestring /.namestring /.stringbreak /.stringm=
atch /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstrin=
g
> + /.localvmarray /.localvmdict /.localvmpackedarray /.localvmstring /.s=
ystemvmarray /.systemvmdict /.systemvmpackedarray /.systemvmstring /.syst=
emvmfile /.systemvmlibfile
> + /.systemvmSFD /.settrapparams /.currentsystemparams /.currentuserpara=
ms /.getsystemparam /.getuserparam /.setsystemparams /.setuserparams
> + /.checkpassword /.locale_to_utf8 /.currentglobal /.gcheck /.imagepath=

> +--=20
> +2.8.1
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/0005-Bug-699=
657-properly-apply-file-permissions-to-.tempf.patch b/meta/recipes-extend=
ed/ghostscript/ghostscript/0005-Bug-699657-properly-apply-file-permission=
s-to-.tempf.patch
> new file mode 100644
> index 0000000..ccd4021
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/0005-Bug-699657-pro=
perly-apply-file-permissions-to-.tempf.patch
> @@ -0,0 +1,54 @@
> +From f4f50ceea8e8852b8c3ac73f5807d8b54b735c3e Mon Sep 17 00:00:00 2001=

> +From: Chris Liddell <chris.liddell@artifex.com>
> +Date: Tue, 21 Aug 2018 20:17:05 +0100
> +Subject: [PATCH 5/5] Bug 699657: properly apply file permissions to .t=
empfile
> +
> +CVE: CVE-2018-15908
> +Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + psi/zfile.c | 20 ++++++++++++++++++--
> + 1 file changed, 18 insertions(+), 2 deletions(-)
> +
> +diff --git a/psi/zfile.c b/psi/zfile.c
> +index a0acd5a..19996b0 100644
> +--- a/psi/zfile.c
> ++++ b/psi/zfile.c
> +@@ -134,7 +134,7 @@ check_file_permissions_reduced(i_ctx_t *i_ctx_p, c=
onst char *fname, int len,
> +     /* we're protecting arbitrary file system accesses, not Postscrip=
t device accesses.
> +      * Although, note that %pipe% is explicitly checked for and disal=
lowed elsewhere
> +      */
> +-    if (iodev !=3D iodev_default(imemory)) {
> ++    if (iodev && iodev !=3D iodev_default(imemory)) {
> +         return 0;
> +     }
> +=20
> +@@ -734,7 +734,23 @@ ztempfile(i_ctx_t *i_ctx_p)
> +     }
> +=20
> +     if (gp_file_name_is_absolute(pstr, strlen(pstr))) {
> +-        if (check_file_permissions(i_ctx_p, pstr, strlen(pstr),
> ++        int plen =3D strlen(pstr);
> ++        const char *sep =3D gp_file_name_separator();
> ++#ifdef DEBUG
> ++        int seplen =3D strlen(sep);
> ++        if (seplen !=3D 1)
> ++            return_error(gs_error_Fatal);
> ++#endif
> ++        /* strip off the file name prefix, leave just the directory n=
ame
> ++         * so we can check if we are allowed to write to it
> ++         */
> ++        for ( ; plen >=3D0; plen--) {
> ++            if (pstr[plen] =3D=3D sep[0])
> ++                break;
> ++        }
> ++        memcpy(fname, pstr, plen);
> ++        fname[plen] =3D '\0';
> ++        if (check_file_permissions(i_ctx_p, fname, strlen(fname),
> +                                    NULL, "PermitFileWriting") < 0) {
> +             code =3D gs_note_error(gs_error_invalidfileaccess);
> +             goto done;
> +--=20
> +2.8.1
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.23.bb b/me=
ta/recipes-extended/ghostscript/ghostscript_9.23.bb
> index 019d99b..898b6cd 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.23.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.23.bb
> @@ -26,6 +26,11 @@ SRC_URI_BASE =3D "https://github.com/ArtifexSoftware=
/ghostpdl-downloads/releases/d
>                  file://avoid-host-contamination.patch \
>                  file://mkdir-p.patch \
>                  file://remove-direct-symlink.patch \
> +                file://0001-Bug-699665-memory-corruption-in-aesdecode.=
patch \
> +                file://0002-Bug-699656-Handle-LockDistillerParams-not-=
being-a-bo.patch \
> +                file://0003-Fix-Bug-699660-shading_param-incomplete-ty=
pe-checkin.patch \
> +                file://0004-Hide-the-.shfill-operator.patch \
> +                file://0005-Bug-699657-properly-apply-file-permissions=
-to-.tempf.patch \
>  "
> =20
>  SRC_URI =3D "${SRC_URI_BASE} \



