Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339B21091934
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 23:54:47 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2094.1773964481543676338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 16:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aS+oLD7k;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b40003d13so952692f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773964480; x=1774569280; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVEk+hWY75gNZ++pOL9Efm3xJHQ/6c60aOW1lbIyhqU=;
        b=aS+oLD7kbueGj9Gq5fzY/ma8z4As0qCcBKfPsw0dWl7aGTy5YRWE02JqVF3JWgk2ak
         cik/xJD6gWBLmf2TLJsBfZsdXYQ1uFk9XHsLnQFMPrRCl/KMQwqF+0IyzCWHC9ISioOB
         QJ+ZSc5BkYG0l7uSH7g9frvooFhoaLsTc2eZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773964480; x=1774569280;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jVEk+hWY75gNZ++pOL9Efm3xJHQ/6c60aOW1lbIyhqU=;
        b=OH5PQ319uoNEdi0Bh3EIjBQGOgm/2Ndt+a1UKC+UIjh7sBQqaWpf0cxVGkUQ4Wwf7P
         EDs1KE8ndzCw/aVCyPVuQ2bKaCwm91Ql3/+kX9jDHq9hu26vsSWBnAiMvdYMLk6E+2xC
         ej4TUMru5zi9YmXe9ecaemwfOTCHwna0EGZaxcUKxfQzhGnU2UOPdxQLwoMbOSUQ4w7F
         nvNThlFeliTylCxugtWEa2R36mBlJuqPef3+uQm3xn62j2nttEYkbMxPPYcJ0yz2zu1P
         IfN2x1PL2v1Ib/ZRW6KBT8ElXL1JDLdvtOpOm9jxPFspg3HsBSm+55YVUb6tRCnKwBTO
         j8bw==
X-Forwarded-Encrypted: i=1; AJvYcCWyU9aU21RyEHc4UwHBT3J4kErkEqobYMre91jQ7nIJUMNbF4/AVXAAJ4OdmMYww8rO/Bh0LyvUyhHnvXUx7PVG0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwfaHemoDj/egYaAhOY/dxCgVnaThdoWImAx5Q9wIzK2r/DoSFv
	arSnFJ8CsONv0qGUfahEwBWOwnZgok8+mwR5jDtZP/pGdPF0Ja0qVTEh6n2GMusGaz4=
X-Gm-Gg: ATEYQzw5MN0sIRuz7ByWRzHTGg7sQM7DPScsO5QhiEm1pknS9qgT6BwPMUxNm3TyJ80
	tfv3rg3JlXgGm1NC548vfg2hS9t5kKks3VBoPAsSysCxogtV/CBF8Ja5SIZW/gq177fNfAwRnys
	18lPgn1a2KnLoR5t+VflVr+fWUbXY653EcQk0HhR3aE5bBN10siZSB8SJrmvnD9nSc/lIhotvjR
	0bJUMo8ONefrywqnw1FzLRjNpQI7xhjXP4BFZiiac4hgOgOT740zWcW5kSZUDTdbPQ+CtSnpTGg
	eS7/NsICmGbW9ddXcbyMgOb6NGMfc0v0FdNTfOUpvmZhq7mTY+v193Qf4jTBKKYEhCkMBAVkl55
	sJS9RXK52xqM0RLD1WDpRe6mI9GSrjWEtcYBQla7YxMXQWNTQupXfqIUSF4IUWHy2RogBEGBe3y
	hdXWIyx/gcKDG/+z1WD2jzt4fjSCBKxxzOG3vZBF8nEZ1iz/K2CPYwQDyOkk7npqd23LMd9zQNA
	z3nXHxl+bBxObvHFjPPJMxJnA==
X-Received: by 2002:a05:600c:3b07:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-486febb59acmr13007075e9.5.1773964479597;
        Thu, 19 Mar 2026 16:54:39 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm44848155e9.0.2026.03.19.16.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 16:54:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 00:54:38 +0100
Message-Id: <DH75XB5A5FUG.3BGTXG13U5RQ5@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [Whinlatter] [PATCH V3] vim: Fix CVE-2026-26269
X-Mailer: aerc 0.20.0
References: <411950.1773664515124824221@lists.openembedded.org>
 <20260316140013.66070-1-adongare@cisco.com>
In-Reply-To: <20260316140013.66070-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 23:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233558

On Mon Mar 16, 2026 at 2:59 PM CET, Anil Dongare -X (adongare - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Pick patch from [1] also mentioned in [2]
> [1] https://github.com/vim/vim/commit/c5f312aad8e4179e437f81ad39a860cd0ef=
11970
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-26269
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  .../vim/files/CVE-2026-26269.patch            | 149 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 150 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-26269.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-26269.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-26269.patch
> new file mode 100644
> index 0000000000..d0796ef77e
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-26269.patch
> @@ -0,0 +1,149 @@
> +From b4fb08c06ee37e38c257d800347b062b78fed141 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Fri, 13 Feb 2026 10:27:12 +0100
> +Subject: [PATCH] patch 9.1.2148: [security]: Buffer overflow in netbeans
> + interface
> +
> +Problem:  [security]: Buffer overflow in netbeans special_keys() handlin=
g
> +Solution: Limit writing to max KEYBUFLEN bytes to prevent writing out of
> +          bounds.
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-9w5c-hwr9-hc68
> +
> +CVE: CVE-2026-26269
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/c5f312aad8e=
4179e437f81ad39a860cd0ef11970]
> +
> +Backport Changes:
> +- Excluded changes to src/version.c from this backport. This file only t=
racks
> +  upstream version increments. We are applying a security fix, not a ver=
sion
> +  upgrade. These changes were skipped to maintain current package versio=
ning
> +  and avoid merge conflicts.
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +(cherry picked from commit c5f312aad8e4179e437f81ad39a860cd0ef11970)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + runtime/doc/version9.txt      |  5 +++
> + src/netbeans.c                |  2 +-
> + src/testdir/test_netbeans.py  |  4 ++-
> + src/testdir/test_netbeans.vim | 57 +++++++++++++++++++++++++++++++++++
> + 4 files changed, 66 insertions(+), 2 deletions(-)
> +
> +diff --git a/runtime/doc/version9.txt b/runtime/doc/version9.txt
> +index b82071757..b32400f17 100644
> +--- a/runtime/doc/version9.txt
> ++++ b/runtime/doc/version9.txt
> +@@ -41899,4 +41899,9 @@ features, but does not include runtime file chan=
ges (syntax, indent, ftplugin,
> + documentation, etc.)
> +
> +
> ++Patch 9.1.2148
> ++Problem:  [security]: Buffer overflow in netbeans special_keys() handli=
ng
> ++Solution: Limit writing to max KEYBUFLEN bytes to prevent writing out o=
f
> ++          bounds.
> ++
> +  vim:tw=3D78:ts=3D8:noet:ft=3Dhelp:norl:fdm=3Dmanual:nofoldenable
> +diff --git a/src/netbeans.c b/src/netbeans.c
> +index 4f5378512..8a341a20b 100644
> +--- a/src/netbeans.c
> ++++ b/src/netbeans.c
> +@@ -2302,7 +2302,7 @@ special_keys(char_u *args)
> +	if ((sep =3D strchr(tok, '-')) !=3D NULL)

Hello,

This patch has a weird format. The context lines starts with tabs and
not a single space as usual. While it seems like it passes tests, I'm
afraid it will break something down the line and I'd rather not take
this like this.

Can you please check?

Thanks!

> +	{
> +	    *sep =3D NUL;
> +-	    while (*tok)
> ++	    while (*tok && i + 2 < KEYBUFLEN)
> +	    {
> +		switch (*tok)
> +		{
> +diff --git a/src/testdir/test_netbeans.py b/src/testdir/test_netbeans.py
> +index 0d6b09680..585886fb4 100644
> +--- a/src/testdir/test_netbeans.py
> ++++ b/src/testdir/test_netbeans.py
> +@@ -112,7 +112,9 @@ class ThreadedTCPRequestHandler(socketserver.BaseReq=
uestHandler):
> +                   'startAtomic_Test' : '0:startAtomic!94\n',
> +                   'endAtomic_Test' : '0:endAtomic!95\n',
> +                   'AnnoScale_Test' : "".join(['2:defineAnnoType!60 ' + =
str(i) + ' "s' + str(i) + '" "x" "=3D>" blue none\n' for i in range(2, 26)]=
),
> +-                  'detach_Test' : '2:close!96\n1:close!97\nDETACH\n'
> ++                  'detach_Test' : '2:close!96\n1:close!97\nDETACH\n',
> ++                  'specialKeys_overflow_Test' : '0:specialKeys!200 "' +=
 'A'*80 + '-X"\n'
> ++
> +                 }
> +                 # execute the specified test
> +                 if cmd not in testmap:
> +diff --git a/src/testdir/test_netbeans.vim b/src/testdir/test_netbeans.v=
im
> +index d3d5e8baf..d1be5066e 100644
> +--- a/src/testdir/test_netbeans.vim
> ++++ b/src/testdir/test_netbeans.vim
> +@@ -958,6 +958,58 @@ func Nb_bwipe_buffer(port)
> +   sleep 10m
> + endfunc
> +
> ++func Nb_specialKeys_overflow(port)
> ++  call delete("Xnetbeans")
> ++  call writefile([], "Xnetbeans")
> ++
> ++  " Last line number in the Xnetbeans file. Used to verify the result o=
f the
> ++  " communication with the netbeans server
> ++  let g:last =3D 0
> ++
> ++  " Establish the connection with the netbeans server
> ++  exe 'nbstart :localhost:' .. a:port .. ':bunny'
> ++  call WaitFor('len(ReadXnetbeans()) > (g:last + 2)')
> ++  let l =3D ReadXnetbeans()
> ++  call assert_equal(['AUTH bunny',
> ++        \ '0:version=3D0 "2.5"',
> ++        \ '0:startupDone=3D0'], l[-3:])
> ++  let g:last +=3D 3
> ++
> ++  " Open the command buffer to communicate with the server
> ++  split Xcmdbuf
> ++  let cmdbufnr =3D bufnr()
> ++  call WaitFor('len(ReadXnetbeans()) > (g:last + 2)')
> ++  let l =3D ReadXnetbeans()
> ++  call assert_equal('0:fileOpened=3D0 "Xcmdbuf" T F',
> ++        \ substitute(l[-3], '".*/', '"', ''))
> ++  call assert_equal('send: 1:putBufferNumber!15 "Xcmdbuf"',
> ++        \ substitute(l[-2], '".*/', '"', ''))
> ++  call assert_equal('1:startDocumentListen!16', l[-1])
> ++  let g:last +=3D 3
> ++
> ++  " Keep the command buffer loaded for communication
> ++  hide
> ++
> ++  sleep 1m
> ++
> ++  " Open the command buffer to communicate with the server
> ++  split Xcmdbuf
> ++  let cmdbufnr =3D bufnr()
> ++  call appendbufline(cmdbufnr, '$', 'specialKeys_overflow_Test')
> ++  call WaitFor('len(ReadXnetbeans()) >=3D (g:last + 6)')
> ++  call WaitForAssert({-> assert_match('send: 0:specialKeys!200 "A\{80}-=
X"',
> ++        \ ReadXnetbeans()[-1])})
> ++
> ++  " Verify that specialKeys test, still works after the previous junk
> ++  call appendbufline(cmdbufnr, '$', 'specialKeys_Test')
> ++  call WaitFor('len(ReadXnetbeans()) >=3D (g:last + 1)')
> ++  call WaitForAssert({-> assert_match('^send: 0:specialKeys!91 "F12 F13=
 C-F13"$',
> ++        \ ReadXnetbeans()[-1])})
> ++  let g:last +=3D 1
> ++
> ++  sleep 10m
> ++endfunc
> ++
> + " This test used to reference a buffer after it was freed leading to an=
 ASAN
> + " error.
> + func Test_nb_bwipe_buffer()
> +@@ -967,4 +1019,9 @@ func Test_nb_bwipe_buffer()
> +   nbclose
> + endfunc
> +
> ++" Verify that the specialKeys argument does not overflow
> ++func Test_nb_specialKeys_overflow()
> ++  call s:run_server('Nb_specialKeys_overflow')
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--
> +2.43.7
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 044117a57f..792a46faf7 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3Dv${PV}
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
>             file://CVE-2026-25749.patch \
> +           file://CVE-2026-26269.patch \
>             "
> =20
>  PV .=3D ".1683"


--=20
Yoann Congal
Smile ECS


