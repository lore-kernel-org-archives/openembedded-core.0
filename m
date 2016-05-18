Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id F2B2C731D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 20:08:21 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q184so5384333qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 13:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DljKU5rMwf6KCNriPEZU2QzDmvow1jOlNytdbwdk84M=;
	b=VPwjEHdcIP6AsfAke/wHDEv4sFJc7hmQz/e+G+FdEPk5EFjs9XBmH9QDGiMNv8fgav
	vio+Fqeo2PclrSGImooWz8vX56zhUnuPEcqTIQwLGPqBuvoRCbc8KTNHOwxLpAJ+pf8l
	FTI/Ska7uAluGFu0neX2F98tgJ5GDOvRsW0Zf/sVcsCfBSIXEF3E0sX5DjzpfB6OIbtB
	Cunhv0duZ1lAtWDof6mxnPAk8ulYloroNE/bBcRYwDQR5OBIDG5uMvCo9pF6ulJiT+vw
	0x0utU+TkfIzimR1XtwnU+bt/4TPDkx6wK1hFfd8XV4QYQWZtY/Zo4E1qLpCC9z9BKRw
	uACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DljKU5rMwf6KCNriPEZU2QzDmvow1jOlNytdbwdk84M=;
	b=IszZQ3pQOHId68RqDxy14xjm0A6Y+OzFouBl3l5cxVJUN8DBNB3YdQNNEzIKoMgclf
	P66ajoQBq7yxNO08AT9H4KElVvgPbAVmRB6rdDk8fD3diUW1wWCjEtI7G5B0qOsWuyfi
	z20KbvxUF4SwHpSpoKkNG1MK0fG2e+l1SoluFCT9EKnIPR17tgVHRBKCy1TJVd9p7JcM
	LeFsWFtL2Tclqe67sszYM2OFCnQx8yiosG2t0wS5AqjvgxBrOOTDVbeAmmk40LoMCihC
	9xv2L8ztdsp8CGIzuxcFhK4ZrWRXXodBfQSrMUb4FtAvHli/KYKBfUKTIdh7DgOmuQA4
	ujyA==
X-Gm-Message-State: AOPr4FU9IU7lN4GTSrAQYqiTj5QOs0DQwFu//zFlltX0mE5eg1pExo77iTyUQlosGQB9GVO2xjyiRqm3b3XBCQ==
X-Received: by 10.233.239.210 with SMTP id d201mr10514663qkg.41.1463602101992; 
	Wed, 18 May 2016 13:08:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Wed, 18 May 2016 13:07:52 -0700 (PDT)
In-Reply-To: <4d1dd04acc6195e8e498741a36b67b208c62b32b.1463562174.git.liezhi.yang@windriver.com>
References: <cover.1463562174.git.liezhi.yang@windriver.com>
	<4d1dd04acc6195e8e498741a36b67b208c62b32b.1463562174.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 May 2016 13:07:52 -0700
Message-ID: <CAMKF1srNvmFgT0s_Tp174WO4SG2RAXUkhcg5_41Vu0V5NRHgwg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkitgtk: turn off JIT on armv4 and armv7a
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
X-List-Received-Date: Wed, 18 May 2016 20:08:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 18, 2016 at 2:03 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> * It doesn't build on armv4:
> {standard input}: Assembler messages:
> {standard input}:52: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
> {standard input}:126: Error: selected processor does not support `bkpt #0' in ARM mode
> {standard input}:128: Error: selected processor does not support `blx r0' in ARM mode
> {standard input}:134: Error: selected processor does not support `bkpt #0' in ARM mode
> {standard input}:185: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
> {standard input}:256: Error: selected processor does not support `blx r4' in ARM mode
> {standard input}:310: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
> {standard input}:311: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
> {standard input}:315: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
> {standard input}:316: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
> [snip]
>
> * It can build on armv7a, but doesn't work on runtime, cause
>   displaying problems or ephiphany hang.
>
> [YOCTO #9474]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.12.1.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
> index bdbcbea..23ead72 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
> @@ -62,9 +62,14 @@ EXTRA_OECMAKE = " \
>  EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
>  EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "
>
> -# ARM JIT code does not build on ARMv5/6 anymore, apparently they test only on v7 onwards
> +# ARM JIT code does not build on ARMv4/5/6 anymore
>  EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
>  EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
> +
> +# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
> +# displaying problems or ephiphany hang.
> +EXTRA_OECMAKE_append_armv7a = " -DENABLE_JIT=OFF "

this should work fine with thumb2 e.g. so this is a little broad brush
here to diable it across
all armv7

>
>  # binutils 2.25.1 has a bug on aarch64:
>  # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

