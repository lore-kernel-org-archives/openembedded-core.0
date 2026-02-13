Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4617EE36B2
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:37:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68153.1770975426207407480
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 01:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=N56pN/CX;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837634de51so871145e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 01:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770975424; x=1771580224; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM8/6dcMv4afnd6ttGTjb5Evmrg7l/tKCoW8lkMnGtc=;
        b=N56pN/CXXri/HmUoQL1xFENUNIhKT8sEnzxNeCx/bFbCaYSPYnocsdEoedcuGz3CAi
         o6KL4gm+PUnLQGSVU6zrnt9dj+JYbtAhpvle1m8uIwz6BQPNpIJ8NZUr+uTKJGni9mTf
         xGP97pw2g+Zwt9qaF8kFMHAJ2AEs2fP/lWyWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770975424; x=1771580224;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UM8/6dcMv4afnd6ttGTjb5Evmrg7l/tKCoW8lkMnGtc=;
        b=gv0m6gQsgvP8zlABsokY4yF2eW/veRFY6wLPvflb7lfWj1M+NZKDnppI4H92jcxRwR
         0P0RuUON/cSjj7Qsi40KZwV5amARnPo62lVo+QLRdfa6faZvhcnyGlM1SwUPKwX6mZe9
         OgP4twfuMZUSgnaBL5mCava4zXS4mv4fSSwSFs9qHzxpcxolYgBX+dWxgFDcHd6SD+NZ
         Ap6PHhhrMG7zEbAdVNNpuD2VaDcdHfcQM0064pVjiCZkd3UqrrjkYA1RKOctVlQVufsg
         /oGmKXhMfIQ3JAZFg8icV8VrRMpCf8q4fBaAIJgI5UAr8omxhvFmxB4346BDECbZDxKA
         IVcA==
X-Forwarded-Encrypted: i=1; AJvYcCVOzASrOz+x2qOmr08S8ax8/TiKXFr/9nD7IuBU+LXBbyY78UZkgjJJ7YYFF8JZT7xlvhrzgwnU0kNG8pFfibjyOA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywt37QThRjV8eBfiMO1zJK98wv04O2PCddgcVlzK/TSHAf7S5dh
	lwL7f0PfDYWAn1VkGV007Kl9qNVJqBEkcCNVUfbSusiPmjupIkFxYgPXwHSoCkdT8vQ=
X-Gm-Gg: AZuq6aLk+F+bXl2P/CxhMaFdXGrKkgJvwBXwiNtXs2hxhNUyvLdzM+ostEDJzA3feA9
	VZwZIfeOqIMV3sQT0y1Zd0TlvJXYXVHbs5B2P5bZWlVMmyGujOcTmeAI/jY9giQR80hHjLGRQ/h
	Q0g7qhZbFffbat61SzYW07W1nF3dFLWnH002Nik5WtdDfs92/m3jhP3nBC6ioaIqXCGMS5LTUG7
	6LxUhMgcFzzqYER/ZZzE0WNFgOYb+UmTmeo+Vu0UxKJNU5Bae2J8GlL6+gt+ELyZx+82hYKhm5D
	imGZCH7GJ2kosDrYxQyHs7uAuSoyKxIWg6GCTE/dx5R+lzt5F2gP2nwSzMYl2Oeb7UMbgVr9wVZ
	2tU2C1Cyu82+oc5VFnbwanMAthP7s7rZcnyAzfDEhjxDSH6pmF8ekcTIY7ljqu0b9XCCU6nhyeS
	i3zyQXlDGAKbCmO2EPtY4FQ5FnjBP3z3nWYKnGTfDEmYjOCF4z/FskmLCFsmSSMn5C/hkRVMoHM
	ztf367v5UHSGOE=
X-Received: by 2002:a05:600c:1da1:b0:480:25ae:9993 with SMTP id 5b1f17b1804b1-48371085c9dmr27665465e9.20.1770975424410;
        Fri, 13 Feb 2026 01:37:04 -0800 (PST)
Received: from localhost (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a5e5sm4262700f8f.9.2026.02.13.01.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 01:37:04 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 10:37:03 +0100
Message-Id: <DGDQE65WGGDC.3KJ5RJHSBUK99@smile.fr>
Subject: Re: [OE-core][whinlatter 18/19] devtool: deploy: Run pseudo with
 correct PATH
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1770968514.git.yoann.congal@smile.fr>
 <2e0afe1da33fbe353182ba63760d7d3e5420dbff.1770968514.git.yoann.congal@smile.fr>
In-Reply-To: <2e0afe1da33fbe353182ba63760d7d3e5420dbff.1770968514.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 09:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231106

On Fri Feb 13, 2026 at 9:08 AM CET, Yoann Congal wrote:
> From: Paul Barker <paul@pbarker.dev>
>
> When running FAKEROOTCMD (i.e. pseudo), we need to use the same PATH as
> we would use if we were running inside bitbake instead of the host
> environment's PATH. This ensures that we don't pick up any host
> executables that may have problems with pseudo (such as the uutils
> implementations of common system utilities used in Ubuntu 25.10).
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 1551136333876ab8a63e96430a498dcfa580265c)
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  scripts/lib/devtool/__init__.py | 3 ++-
>  scripts/lib/devtool/deploy.py   | 6 +++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init=
__.py
> index 969d6dc13ab..7c8de5540c1 100644
> --- a/scripts/lib/devtool/__init__.py
> +++ b/scripts/lib/devtool/__init__.py
> @@ -74,12 +74,13 @@ def exec_watch(cmd, **options):
> =20
>      return buf, None
> =20
> -def exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, **kwargs):
> +def exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, cmd, **kwargs):

As a heads-up, this changes the exec_fakeroot_no_d() API. But, I
discussed this with Paul:
* We think this is an internal API (behind the more public
  deploy_no_d())
* And, if this breaks existing code, the change to adapt is trivial.

Regards,

>      if not os.path.exists(fakerootcmd):
>          logger.error('pseudo executable %s could not be found - have you=
 run a build yet? pseudo-native should install this and if you have run any=
 build then that should have been built')
>          return 2
>      # Set up the appropriate environment
>      newenv =3D dict(os.environ)
> +    newenv['PATH'] =3D path
>      for varvalue in fakerootenv.split():
>          if '=3D' in varvalue:
>              splitval =3D varvalue.split('=3D', 1)
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.p=
y
> index a98b33c5718..2bf693d165a 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -186,8 +186,8 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, lib=
dir, base_libdir, max_proce
>          srcdir =3D recipe_outdir
>          recipe_outdir =3D os.path.join(workdir, 'devtool-deploy-target-s=
tripped')
>          if os.path.isdir(recipe_outdir):
> -            exec_fakeroot_no_d(fakerootcmd, fakerootenv, "rm -rf %s" % r=
ecipe_outdir, shell=3DTrue)
> -        exec_fakeroot_no_d(fakerootcmd, fakerootenv, "cp -af %s %s" % (o=
s.path.join(srcdir, '.'), recipe_outdir), shell=3DTrue)
> +            exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "rm -rf %=
s" % recipe_outdir, shell=3DTrue)
> +        exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "cp -af %s %s=
" % (os.path.join(srcdir, '.'), recipe_outdir), shell=3DTrue)
>          os.environ['PATH'] =3D ':'.join([os.environ['PATH'], path or '']=
)
>          oe.package.strip_execs(args.recipename, recipe_outdir, strip_cmd=
, libdir, base_libdir, max_process)
> =20
> @@ -266,7 +266,7 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, lib=
dir, base_libdir, max_proce
>          shutil.rmtree(tmpdir)
> =20
>      # Now run the script
> -    ret =3D exec_fakeroot_no_d(fakerootcmd, fakerootenv, 'tar cf - . | %=
s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, arg=
s.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=3Drecipe_o=
utdir, shell=3DTrue)
> +    ret =3D exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, 'tar cf -=
 . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoption=
s, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=3Dre=
cipe_outdir, shell=3DTrue)
>      if ret !=3D 0:
>          raise DevtoolError('Deploy failed - rerun with -s to get a compl=
ete '
>                          'error message')


--=20
Yoann Congal
Smile ECS


