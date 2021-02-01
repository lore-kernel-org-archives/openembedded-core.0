Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.32555.1612179306040424764
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 03:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fH0TjAJq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id s7so13198603wru.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=PF7WcPoysD8gFItabh9wI1TtOmJxPlF6Fay1R5Ju78k=;
        b=fH0TjAJqgP6ssju08yvqEx5meY3LqmYFSosCeZ4GzpXiTIW8qGVsTW0q2bFAySz6uf
         aZkW+DzCPTFVGzTT3/FEw1C5OSZIuaKAK1uUgK8dzHGNAo+W+N5013k3+C1wZiqWPsxu
         5DnZ6KA+3EksLyAZ8RFRMT5gh9D4I8qA8XXCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PF7WcPoysD8gFItabh9wI1TtOmJxPlF6Fay1R5Ju78k=;
        b=NKA/p9mZDWS6fHNiD/KeHU69mhTFBxzDn3lOoNtaEUxD2yKU0v+BevFPWnSnfftp6p
         rfYjQ08w51bsfD6w2TZ9zNyFMK3r+DukL/ZwGJ1MxVC8Jjlno4eUCOurot4jCAM1PBuA
         yzwPFwfK6Ot3KWFK3N10qjHLLOZ4W7y12vTlqCK6wxR5c33TNHa+gH+/XzW1/FRPS+yE
         cwaRT1Xu7XY2l5rVUDzR7GWKVIMwIXuVadZoM3NnqRhsnWDKIcViKJsJjv4gGuj8n7yJ
         tOSuZgD0CbgIt/7+sZXvOOnWYuESI6xupEwxzwi9oCswNCkMBrnH9i1lG87du0o4ZKpO
         C7gQ==
X-Gm-Message-State: AOAM531XOZ71vZQr47/Etq1JjdnFSGqrW0AI0d5ygU4iwVShK6wHpwNv
	WQ6Ow7L6o0Xkoqbee2oxT0MdPA==
X-Google-Smtp-Source: ABdhPJy8VuKSAsssWPCr5uLrHhlI594LuyAx/JjOeHr/Krtlx8yXeTZLxvtDzjZzqw1t1FzT8Lu3Cg==
X-Received: by 2002:adf:9031:: with SMTP id h46mr17770953wrh.19.1612179304200;
        Mon, 01 Feb 2021 03:35:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ffbf:3082:adb4:3ffa? ([2001:8b0:aba:5f3c:ffbf:3082:adb4:3ffa])
        by smtp.gmail.com with ESMTPSA id t18sm22812463wrr.56.2021.02.01.03.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 03:35:03 -0800 (PST)
Message-ID: <260643e582bbeee2748e08e1fd7ebee4adbef888.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add procps-lib to RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, Joshua Watt
 <JPEW.hacker@gmail.com>
Date: Mon, 01 Feb 2021 11:34:59 +0000
In-Reply-To: <165F4F23A9F2744A.13584@lists.openembedded.org>
References: <20210120050318.10376-1-Qi.Chen@windriver.com>
	 <165F4E547FA339C3.13584@lists.openembedded.org>
	 <165F4F23A9F2744A.13584@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-01-31 at 11:56 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Sun, 2021-01-31 at 11:41 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2021-01-20 at 13:03 +0800, Chen Qi wrote:
> > > Build error occurs as below:
> > > 
> > >   ERROR: igt-gpu-tools-1.25+gitAUTOINC+d16ad07e7f-r0 do_package_qa:
> > >          QA Issue: /usr/lib/libigt.so.0 contained in package igt-gpu-tools
> > > 	 requires libprocps.so.8(LIBPROCPS_0)(64bit), but no providers
> > > 	 found in RDEPENDS_igt-gpu-tools? [file-rdeps]
> > > 
> > > Add procps-lib to RDEPENDS to solve this issue.
> > > 
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >  meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > > index 89480d79d2..b012dbf58e 100644
> > > --- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > > +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > > @@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
> > >  S = "${WORKDIR}/git"
> > >  
> > >  DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
> > > -RDEPENDS_${PN} += "bash"
> > > +RDEPENDS_${PN} += "bash procps-lib"
> > >  RDEPENDS_${PN}-tests += "bash"
> > > 
> > 
> > 
> > You are correct about this and I see the same issue if I build it
> > locally. What worries me is why we don't see this on the autobuilder in
> > world builds?
> > 
> > Cc'ing Anuj as the maintainer.
> 
> Looking at the autobuilder logs, I think I can guess the problem, I
> think its a hash equivalence issue.
> 
> Errors raised by do_package_qa aren't reflected in the output so it
> would error once and then never again as the output wouldn't seen
> changed next time :(
> 
> We'll have to fix this, its nasty.
> 
> Cc: Joshua

Its not a hashequiv issue directly although the QA warnings not being
cached is am unrelated problem.

It seems if you build igt-gpu-tools with /usr/lib64/ it works (as on
the autobuilder where multilib is enabled), if you build with /usr/lib/
it gives the QA warning despite actually having the right RDEPENDS
anyway.

We need to debug why its showing this error incorrectly as there is
something bad looking going on underneath here...

Cheers,

Richard

