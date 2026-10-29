Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6617.1793259774696824748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 00:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=LMrq1jHe;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so15757865e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793259773; x=1793864573; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAIzyW1b0WWdQcIGxFnirV8yKcm+GyTcy2L+RwViv48=;
        b=LMrq1jHeqnAxF7tOd6kr/sFCaxxa7veeRvFuRTJIv2cazyMwnS9NioRAdNVuPttsKb
         /hXh24mIJF5QpFsGi1FnpkRzBz34xh56Sb1CHT7TV383qfDubRsif1xo4GXfQfWrrMOX
         IsEXnWyIIm/o0cBW5Al6QuWn46xBO9h6OFGGo4kiZwsc6wZI4+Fr2X2zU/qFTN4T8cLa
         OTC/qUfxOd7epUqL6of9RI5fijCoHeLUt5Gntf2Sz8GLoyg93nGyR2juuG3yla/G5I9P
         UHfn08hhHuEGBiMKTapQnUNtcaBawhWQ0Huv0xFQW/YcwJqZZUbR9fXlZ2nmiqgM/cgv
         VRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259773; x=1793864573;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAIzyW1b0WWdQcIGxFnirV8yKcm+GyTcy2L+RwViv48=;
        b=GCMYLlVZZDhG+aIQeONjxSoyVckwDSVxLQUWdJp2ci0GccU64s2mFSpwrdZR/XcAUf
         gRHhld9Pt4oLrgP/nbDA65EjhGof1e+ZENer6zOXMS0AfcaTxRmOyeFtodX6DpT4Weuq
         RY4WiNCPaV8jzTj1RClvMAak0ofNpweZlfvQH8iL5ANkCOBPdcY22kNbFyJ7myV1ODiX
         taxsHCVtThDkvU6+8+QOXfCdgUb398V+HiV+eCL/GKnS6qfavxDHqxpftt3S8EIdeCf0
         nApcgcn1HjqZO+blTnKKiGmkVyZVoMUkesWqcoVfnwJe6zMVXAvMpC1zrpftjr83QaBy
         LMLA==
X-Forwarded-Encrypted: i=1; AKwUvByfJ02EJvJRGDdc2j8+9H6IluQ9rOlhGZ21+K2muj4OFjzH21+ir1AOY8KDyhPcqyFKTFTtHxBH508Q+9uft23lFQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJ0WO8eN958/tVNDDpaMZlAbN6ZkihtbfRYhWQS5K/uEQo1/iO/
	Ep60zlzfwlTfj6v2MVfIrht3q0f8Wt/kceVvDrh02BUMZLAYM1eIhSpze549cf9McEU=
X-Gm-Gg: AYBFou3elZ3Udgmg33Sy0jgeMg4Jf6i9zIed0CP3i5omW0Du38qnZGQwn0u1Q6YA7ht
	sJpN0bSWmsVDPf8RR1Ar91SR0jftUsjfElxCw3CkBaUD8EhQfjgQYwsagwE1sqmi8MDNq2jladN
	V8upFgkMfrRJxIMZr+mdKYSuKnvbRQSst6I69DkFYe0C/H1EOv9GElyLrCRgYJu/JyVxHM8NvW9
	RoSDK5wcU4LbbFir0WvaHXXTkvp7QMMWjoZUOLz/bm8+TVAcJL0TbWJHSH6k+RAtPUSPrNg6m2q
	IIm+7AWtbl0zgfMXmd2p7+Ezet+L1Yj03A0/29ZmYRi4Z8P7hJiAlMEaDox6ptsgZqbT4JUdrkY
	0Tuq1jM7xWDExfLtPyTm5M90ZQKT61XUbPXcep3HgmLiEeVBPn55vJWF/pK+gocAaolM0sKiyyc
	2mqSoaEaXkwNPOHVjqPZAHRNAHOGEUy3Z+3TesnVVIx7HiUS0+E1I/XB5U2kmeU3mrNapRU4/1i
	SRZGxeYKhBindukzNSIOZCx4CKk7OBT8d9H+qSDIL180+D1RMnkNsPGeQTppYlxC0N3fFa+R2NI
	UOMfWnqKhbAIL1BMc1cgQkRl+prhBvhheX27VClvjItYYz6QoLaW5HVGV/92E+hS793J8pOfgmS
	1vqRAXE60VEBvlUH8CWxwq5nabUsFxBVeyUQxdgU=
X-Received: by 2002:a05:600c:4e86:b0:4aa:9ef:5c81 with SMTP id 5b1f17b1804b1-4aa09ef5c8amr76477625e9.13.1793259772726;
        Thu, 29 Oct 2026 00:42:52 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm47145425e9.1.2026.10.29.00.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 00:42:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 08:42:52 +0100
Message-Id: <DMH5JAEFROYF.2STV6FYP3ETGI@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCHv4] vim: Fix for CVE-2026-73076
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261020061611.9031-1-hprajapati@mvista.com>
In-Reply-To: <20261020061611.9031-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 07:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248907

On Tue Oct 20, 2026 at 8:16 AM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick the patch from [1], also referenced in the NVD report [2].
>
> [1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd=
0d452
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-73076.patch            | 155 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 156 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-73076.patch
> new file mode 100644
> index 0000000000..892bec3567
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
> @@ -0,0 +1,155 @@
> +From b270bf38cd33c2b0724f214454e4bca1fccc65c1 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Fri, 24 Jul 2026 17:43:51 +0200
> +Subject: [PATCH] patch 9.2.0847: [security]: vimball: code execution via
> + .VimballRecord file
> +
> +Problem:  [security]: vimball: code execution via .VimballRecord file
> +          (tdjackey)
> +Solution: Forbid arbitrary commands, fix broken directory deletion code,
> +          refactor code
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-r22p-fhw4-84p2
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Backport Changes:
> +
> +The .VimballRecord rejection is placed after the fenc/filecnt extraction
> +because the earlier strange-filename check block present in upstream 9.2=
 does
> +not exist in the 9.1.1683 vim sources.
> +Omitted src/testdir/test_plugin_vimball.vim because the current vim sour=
ce
> +archive does not include it.
> +
> +CVE: CVE-2026-73076
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/581a2f3ac9c=
6f96a26324f6b2c8c11415fd0d452]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + runtime/autoload/vimball.vim | 62 +++++++++++++++++++++---------------
> + 1 file changed, 37 insertions(+), 25 deletions(-)
> +
> +diff --git a/runtime/autoload/vimball.vim b/runtime/autoload/vimball.vim
> +index 6456984411..3776314b88 100644
> +--- a/runtime/autoload/vimball.vim
> ++++ b/runtime/autoload/vimball.vim

Hello,

This is not an easy one to parse&review due to indent changes both
upstream and during backport.

> +@@ -464,11 +471,17 @@ fun! vimball#RmVimball(...)
> +     let s:VBRstring=3D substitute(exestring,'call delete(','','g')
> +     let s:VBRstring=3D substitute(s:VBRstring,"[')]",'','g')
> + "	call Decho("exe ".exestring)
> +-	sil! keepalt keepjumps exe exestring
> ++	let nr_files=3D 0
> ++    for line in split(exestring, '|')
> ++      if line !~ '^call delete(''[^'']\{-}''\(,"d"\)\?)$'
> ++        echomsg "ignoring .VimballRecord entry: " line
> ++      else
> ++        sil! keepalt keepjumps exe line
> ++        let nr_files+=3D 1
> ++      endif
> ++    endfor

The above block matches upstream space-based indentation where the
existing scarthgap code in tab-based. Can you reindent the code to match
the current code?
I agree current indentation is not optimal but let's match it anyway for
clarity.

> + 	sil! keepalt keepjumps d
> +-	let exestring=3D strlen(substitute(exestring,'call delete(.\{-})|\=3D'=
,"D","g"))
> +-"	call Decho("exestring<".exestring.">")
> +-	echomsg "removed ".exestring." files"
> ++	 echomsg "removed ".nr_files." files"
        ^ Single stray space here

> +    else
> +     let s:VBRstring=3D ''
> + 	let curfile    =3D substitute(curfile,'\.vmb','','')
> +@@ -622,23 +635,22 @@ fun! s:ChgDir(newdir)
> + endfun
> +=20
> + " ---------------------------------------------------------------------
> +-" s:RecordInVar: record a un-vimball command in the .VimballRecord file=
 {{{2
> +-fun! s:RecordInVar(home,cmd)
> +-"  call Dfunc("RecordInVar(home<".a:home."> cmd<".a:cmd.">)")
> +-  if a:cmd =3D~ '^rmdir'
> +-"   if !exists("s:recorddir")
> +-"    let s:recorddir=3D substitute(a:cmd,'^rmdir',"call s:Rmdir",'')
> +-"   else
> +-"    let s:recorddir=3D s:recorddir."|".substitute(a:cmd,'^rmdir',"call=
 s:Rmdir",'')
> +-"   endif
> +-  elseif !exists("s:recordfile")
> +-   let s:recordfile=3D a:cmd
> +-  else
> +-   let s:recordfile=3D s:recordfile."|".a:cmd
> ++" s:RecordInVar: record a un-vimball file deletion in the .VimballRecor=
d file {{{2
> ++fun! s:RecordInVar(file)
> ++  if !exists("s:recordfile")
> ++    let s:recordfile=3D[]
> +   endif
> +-"  call Dret("RecordInVar : s:recordfile<".(exists("s:recordfile")? s:r=
ecordfile : "")."> s:recorddir<".(exists("s:recorddir")? s:recorddir : "").=
">")
> ++  call add(s:recordfile, $'call delete({string(a:file)})')
> + endfun
> +=20
> ++" s:RecordDirInVar: record a un-vimball dir deletion in the .VimballRec=
ord file {{{2
> ++fun! s:RecordDirInVar(dir)
> ++  if !exists("s:recorddir")
> ++    let s:recorddir =3D []
> ++   endif
      ^ Extra space here

> ++  call add(s:recorddir, $'call delete({string(a:dir)},"d")')
> ++ endfun
    ^ Extra space here

Regards,
--=20
Yoann Congal
Smile ECS

