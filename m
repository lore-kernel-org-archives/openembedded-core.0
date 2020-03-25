Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.15455.1585153071060837891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 09:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d6oDyBk9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id d1so3409033wmb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 09:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=tUNdO/saNSpV+787BbntpdWm0w+CqUILvI6JIb7b9cc=;
        b=d6oDyBk9D/u3gU64znHhNXaV273blr/6huSEfomMBB2isde8qyHuc3iEURhgySAFEJ
         j4ahH6kwWye3huNZPDZLIAfh2aO24bxoGMuTMHnAwuVgC6s2FkucShAyNf5mMJTB1t2h
         O9jOWuLNsHudK16mMUqLaCKq7NYiLB9GHQYpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tUNdO/saNSpV+787BbntpdWm0w+CqUILvI6JIb7b9cc=;
        b=Nwzg8PyjcgYaQye1+J7pJJlupqwh0uEXOAjoLDec0F0aBplnaFyWuMSFjs2Ik8P012
         yon2c6D8ZAVD+e9J4S7xPKEayHA5V5Vo/sJNgABfw4nm7ZESRRV1eMlyu+1DhVo1Acm7
         /xQWzX3nfL4MCKGoyVWY3jMrzqbVvfjgZGDOEIBe32cLZmn0TEjuABJzOLDlxM1Vd7sB
         G+cFU8Z+onGv1nUjW3qqjlqi6xc7JArUfK4jpEvaheYux48E7xFbOUikAw7v8ODfYTL3
         RsNu9ySPFlchb5dnwXz1FPVaFvvDI4Hd03o7jVNyJwAnraJEpU3d0ykwD6FkVCG1UwUc
         +P6A==
X-Gm-Message-State: ANhLgQ1Oormb29obHh+jyW0q+d34xrQqjw43cpsOF6Cy6uLPbVvdARPo
	Fsy9cQGVYLEgote45xS9GAABSHroMBE=
X-Google-Smtp-Source: ADFU+vuoXKyVzvA7Y2zeEv1kNT50YZ1x9zRv+CUt3rYRMMhlsBQSvcEF3ctSZPquan5GehD2aCj4uw==
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr312831wmj.134.1585153069649;
        Wed, 25 Mar 2020 09:17:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id p13sm22199403wru.3.2020.03.25.09.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 09:17:48 -0700 (PDT)
Message-ID: <2d3e845f4994968184f47c70fd4cee60c0dbc422.camel@linuxfoundation.org>
Subject: Re: [OE-core] safe to get rid of refs to CVSDIR, SVNDIR, GITDIR?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2020 16:17:47 +0000
In-Reply-To: <alpine.LFD.2.21.2003230814250.10783@localhost.localdomain>
References: <alpine.LFD.2.21.2003230814250.10783@localhost.localdomain>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-23 at 08:19 -0400, rpjday@crashcourse.ca wrote:
>   cleaning up docs, and just noticed this from several months back:
> 
> commit 4ff058226cfc3e7d5bf9a873d1de4475f65ef2f2
> Author: Andre McCurdy <armccurdy@gmail.com>
> Date:   Fri Aug 23 13:51:32 2019 -0700
> 
>     bitbake.conf: drop FETCHCMD, GITDIR, etc fetcher over-rides
> 
>     This completes cleanup originally proposed in 2012:
> 
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2012-July/064224.html
> 
>     Current versions of bitbake have "sane" default fetcher commands
>     so it's no longer necessary for bitbake.conf to over-ride them.
> 
>     Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> >
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1311e6b5fd..a0a7f4911e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -360,12 +360,6 @@ CACHE = "${TMPDIR}/cache${@['', '/' +
> str(d.getVar('MACHINE'))][bool(d.getVar('M
>  # The persistent cache should be shared by all builds
>  PERSISTENT_DIR = "${TOPDIR}/cache"
>  LOG_DIR = "${TMPDIR}/log"
> -CO_DIR = "${DL_DIR}"
> -CVSDIR = "${CO_DIR}/cvs"
> -SVNDIR = "${CO_DIR}/svn"
> -GITDIR = "${CO_DIR}/git2"
> -BZRDIR = "${CO_DIR}/bzr"
> -HGDIR = "${CO_DIR}/hg"
> 
> 
>   so is it safe to remove the remnants of references to those
> variables? all that's left is [doc] references to CVSDIR, SVNDIR and
> GITDIR, and this from meta/lib/oe/recipeutils.py:
> 
>   def get_recipe_upgrade_status(recipes=None):
>       pkgs_list = []
>       data_copy_list = []
>       copy_vars = ('SRC_URI',
>                  'PV',
>                  'GITDIR',       <---
>                  'DL_DIR',
>                  'PN',
>                  'CACHE',
> 
> all of that safe to delete? any others that can go with it? (i didn't
> notice any.)

Yes, well spotted, I've queued two patches for this.

Cheers,

Richard

