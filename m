Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.14643.1604942173864890918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ENHC+6Lv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id a65so123153wme.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 09:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FceBHlHfnyzAqYqRSCePqBhWzwCEpl1x7oxSc4tagxA=;
        b=ENHC+6LvBGxpx+lyhJK7YeGV6lmyNdwL/0xAGa01wJ9MprUyJBDcjeh1CsUleE7pvV
         +Gge/u2JdNjFeCT3A7HSxpvnJ1jAXX3wcVLyzmzcNJopajGbK185yochx79qXN0ZpkUX
         Z2fPpRQhDXV9dyf+upXwDq02MzB1959OByh3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FceBHlHfnyzAqYqRSCePqBhWzwCEpl1x7oxSc4tagxA=;
        b=YlF79fyIfDkxei4HxpONEn5m/lqrKWq9+W3rmbdU7sV+42FczMLZUX+m0psSIKorSJ
         A2S/PHHQ6+s5vWfI1wk7KTZ4+p3f58WRHw3jguJotiBBNgEtiQqot/wjFEMHIbdGv5Pi
         4PbgpFR8/On5fex6S4BLeP6Oxd/c+aUHFQ9fi0rhRh/rWMcGwoTzox4G9sV+PGlUqh5X
         9n4ipXIZDIjfdWfrtt1ahxFwUkzPIdNuFuVKCwGVNGjaD3+wPgOJvksUP00nmWM2dpA5
         wMpdGMLb0GUVX4KENwjdHBH0YjdB4IkavGZDP13wOU8pc11kVPGSzENVKxApg3SXmemm
         j0CA==
X-Gm-Message-State: AOAM531LI46x69kw0tgjAO0pl74Xo0Q9QT5upbWKOOpuDROWLCf63uuA
	I564blbFalhg/EtFk2P51fdp0A==
X-Google-Smtp-Source: ABdhPJxwvUGBTUhbUZ2lBJBnjWMJRMDur8l+KXblcqSsKhj+nDOOaq+v3x/UMd+LcHNND16H2WoFHA==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr201095wmc.36.1604942172525;
        Mon, 09 Nov 2020 09:16:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 2.f.3.d.1.3.3.a.9.f.d.f.a.e.5.a.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (2.f.3.d.1.3.3.a.9.f.d.f.a.e.5.a.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:a5ea:fdf9:a331:d3f2])
        by smtp.gmail.com with ESMTPSA id h128sm57026wme.38.2020.11.09.09.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:16:12 -0800 (PST)
Message-ID: <d94ba0eebc39fa15b9324e74c7c7ef18bf09e1ce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 02/12] oeqa/buildperf: use weston image instead of sato
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 09 Nov 2020 17:16:10 +0000
In-Reply-To: <20201109083133.16503-2-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
	 <20201109083133.16503-2-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-09 at 09:31 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oeqa/buildperf/test_basic.py | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/lib/oeqa/buildperf/test_basic.py
> b/meta/lib/oeqa/buildperf/test_basic.py
> index 2104617ba3..0fe7d3c8dc 100644
> --- a/meta/lib/oeqa/buildperf/test_basic.py
> +++ b/meta/lib/oeqa/buildperf/test_basic.py
> @@ -11,10 +11,10 @@ from oeqa.buildperf import BuildPerfTestCase
>  from oeqa.utils.commands import get_bb_var, get_bb_vars
>  
>  class Test1P1(BuildPerfTestCase):
> -    build_target = 'core-image-sato'
> +    build_target = 'core-image-weston'
>  
>      def test1(self):
> -        """Build core-image-sato"""
> +        """Build core-image-weston"""
>          self.rm_tmp()
>          self.rm_sstate()
>          self.rm_cache()
> @@ -40,10 +40,10 @@ class Test1P2(BuildPerfTestCase):
>  
>  
>  class Test1P3(BuildPerfTestCase):
> -    build_target = 'core-image-sato'
> +    build_target = 'core-image-weston'
>  
>      def test13(self):
> -        """Build core-image-sato with rm_work enabled"""
> +        """Build core-image-weston with rm_work enabled"""
>          postfile = os.path.join(self.tmp_dir, 'postfile.conf')
>          with open(postfile, 'w') as fobj:
>              fobj.write('INHERIT += "rm_work"\n')
> @@ -60,10 +60,10 @@ class Test1P3(BuildPerfTestCase):
>  
>  
>  class Test2(BuildPerfTestCase):
> -    build_target = 'core-image-sato'
> +    build_target = 'core-image-weston'
>  
>      def test2(self):
> -        """Run core-image-sato do_rootfs with sstate"""
> +        """Run core-image-weston do_rootfs with sstate"""
>          # Build once in order to populate sstate cache
>          self.run_cmd(['bitbake', self.build_target])
>  
> @@ -93,7 +93,7 @@ class Test3(BuildPerfTestCase):
>  
>  
>  class Test4(BuildPerfTestCase):
> -    build_target = 'core-image-sato'
> +    build_target = 'core-image-weston'
>  
>      def test4(self):
>          """eSDK metrics"""

This change is a big deal since it means numbers are no longer
comparable and we have quite the history of these build numbers. Not
quite sure how I feel about that...

Cheers,

Richard



