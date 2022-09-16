Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9C3ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 16:38:50 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.8420.1663346321076230757
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 09:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RSXKOKur;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id e18so10265328wmq.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=E/otjnO4CVEeJqk7Rzn845+/GgweM6rwGnlu0q+kBfA=;
        b=RSXKOKurwcTStpF57q+r8J0FYVVL8DlbLRqRt7kcGTMHw6zjh0wl3K6dxtzi8KOCVz
         JHoz+vQOT63EoHJOOIgBHydqK0ar123FGvZX7FdsKj/RVKnbjTGeYNl1QEsKjYgkqfFA
         z1uGj2GygdBJZWC4rCJBRD5763vNz1PNWtNoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=E/otjnO4CVEeJqk7Rzn845+/GgweM6rwGnlu0q+kBfA=;
        b=w03yqMM9BcBxLByFGimuT7qQvt2+XKDBTxLorEdYo9+cq5eCf2xYRyzPpFdH3D6dl1
         ZITcjJ7TfwEtLj+ln/06IflxT+RBhe7CCkBO6s9vS5f21zAi/b+0Y5cY7AbtAOi/094x
         Kg5C+50ngMiImd/6rktFNzWnbkHZOz3wJM8o1QtkiqfeSrzqtvRexnBa4MsMj2ET1iNv
         LM+GuMSVZTuqP/0d5j1Y5d6aheOxV4vK1ZTxA8JZkD6xo4JAfMnQJ4dRQ+Z4PNK9tvLG
         IAcz954PSVLMiBJ/x8jJ8CKMMIDItHuS46aP6h5FTzFovA1Mh/j23icQ+cPX0DpnoAoZ
         dR1w==
X-Gm-Message-State: ACrzQf3wm4a5ulnP6W+1hu7LLGfZDQDWvVmL+BZ7y1FEdRGCr0/45h2b
	CbOKEIPDpxqdaZWxzjLaybLh9g==
X-Google-Smtp-Source: 
 AMsMyM5K087SRZmbuQYYpe5QSd4KMzj9w6Ff18LmXvZQmfn9NTgzGn6FcuYS0y7DDAQr4fiGLEV0RA==
X-Received: by 2002:a05:600c:20b:b0:3b4:86ff:ce with SMTP id
 11-20020a05600c020b00b003b486ff00cemr3887901wmi.179.1663346319505;
        Fri, 16 Sep 2022 09:38:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:816c:1950:863b:51c?
 ([2001:8b0:aba:5f3c:816c:1950:863b:51c])
        by smtp.gmail.com with ESMTPSA id
 d13-20020adff2cd000000b00228dcf471e8sm5692593wrp.56.2022.09.16.09.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 09:38:38 -0700 (PDT)
Message-ID: 
 <48ac3560b886f5cc6c6a42e94ff44b4ed5d7746b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: remove git submodule--helper list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jcreedon@google.com, openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2022 17:38:38 +0100
In-Reply-To: 
 <CAEZLVp59mMOwk86+k51QfiYj+HMyRFuu-M457poi_xugTEtXHA@mail.gmail.com>
References: 
	<CAEZLVp59mMOwk86+k51QfiYj+HMyRFuu-M457poi_xugTEtXHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 16:38:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170794

On Thu, 2022-09-15 at 16:06 -0700, Jacob Creedon via lists.openembedded.org=
 wrote:
> This removes a call to an undocumented and now deprecated subcommand of
> git submodule--helper and replaces it with a suppoorted one that gives an
> equivalent list.
>=20
> Signed-off-by: Jacob Creedon <jcreedon@google.com>
> ---
>  meta/classes/externalsrc.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
> index 3d6b80bee2..0401c75fa9 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -217,7 +217,7 @@ def srctree_hash_files(d, srcdir=3DNone):
>              env['GIT_INDEX_FILE'] =3D tmp_index.name
>              subprocess.check_output(['git', 'add', '-A', '.'],
> cwd=3Ds_dir, env=3Denv)
>              git_sha1 =3D subprocess.check_output(['git', 'write-tree'],
> cwd=3Ds_dir, env=3Denv).decode("utf-8")
> -            submodule_helper =3D subprocess.check_output(['git',
> 'submodule--helper', 'list'], cwd=3Ds_dir, env=3Denv).decode("utf-8")
> +            submodule_helper =3D subprocess.check_output(['git',
> 'submodule', '--quiet', 'foreach', 'echo $sm_path'], cwd=3Ds_dir,
> env=3Denv).decode("utf-8")
>              for line in submodule_helper.splitlines():
>                  module_dir =3D os.path.join(s_dir, line.rsplit(maxsplit=
=3D1)[1])
>                  if os.path.isdir(module_dir):

I put this into our CI and it failed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4136
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4079
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4094
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4150
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/132

which I could reproduce locally with:

"oe-selftest -r devtool.DevtoolAddTests.test_devtool_add_fetch_git"

I'd also note that your patch is line wrapped and your From address is
being mangled by the mailing list, probably due to DMARC issues. If you
could fix those for the new version that'd be great!

Cheers,

Richard



