Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.6049.1585994316582639727
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 02:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HxALwR92;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id z7so9587816wmk.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FpL21wGeJaID0yfMYf9Yf3yU17LUTfU2dWUIGoy/0No=;
        b=HxALwR92sQVUPRGQkLnM6tAO+MsxESy8vnNLMh63rIExPWlWkfYU153X44hJNXMss+
         PkstoSbQloZEoRhoroIOjislCaltCzqT9iNXID1bkD/ZxU8PLbQH890x2I5I69NoZ5j9
         CsVQnJedwrBOoqdr+9ap9EZHgtGtZYWgqE9Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FpL21wGeJaID0yfMYf9Yf3yU17LUTfU2dWUIGoy/0No=;
        b=mN+SwKbK380zRBH/yQlzoy/XLx1Brj93/aopT/txM2VoN3bBVD2m1L5mXm0oke7VLl
         6bVWkQBXSygCcK2Wgef2yg4phVJBVcaQJZjHtK4DJ4Abin70FYnO2hSQ5bboqcvcMHEH
         2gY10VmntH7kHKBjswkCo09au4fZCpMIg4bCMgKo7h6J7bv6yAJgJUtRqUrzc2uDA4iC
         lHg9dk0hOZypJjEDMLna17Nve2/cNkTD50Elo8w8Z6JqkOBBIpU4CEoSrXXOhgJ4DMid
         TO7NkemhpPYbn5+o++bvW4VDsPaTjuaODW7phdXVOjN8NhzSu7AjZ6HPRgl+OSfvy3C4
         Boqw==
X-Gm-Message-State: AGi0PuY4RWu7FE/fvtW9RkejaIdfsKNAPJs3+9ebL/d1EFjamK4R6Ayq
	MoRqGYH13lnR3P4xzcUJ/mgxug==
X-Google-Smtp-Source: APiQypIB//XfMvBLrnELQsaG5UIhqE9dNoJFz5RGh2BnrwTErHKcP+yG3lUvJBwgvYbxONVU+sqj/w==
X-Received: by 2002:a05:600c:2c50:: with SMTP id r16mr13404967wmg.6.1585994315035;
        Sat, 04 Apr 2020 02:58:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s131sm15471532wmf.35.2020.04.04.02.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 02:58:34 -0700 (PDT)
Message-ID: <5d2d70a05eeb516678cf3b11abd7b948d197e341.camel@linuxfoundation.org>
Subject: Re: [OE-core] trivial(?) question about post-installation scripts
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 04 Apr 2020 10:58:33 +0100
In-Reply-To: <alpine.LFD.2.21.2004040549380.6252@localhost.localdomain>
References: <alpine.LFD.2.21.2004040549380.6252@localhost.localdomain>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-04 at 05:52 -0400, rpjday@crashcourse.ca wrote:
>   still working my way through the YP docs and, in dev manual,
> 3.3.19,
> "Post-Installation Scripts", one reads the final note:
> 
> "Equivalent support for pre-install, pre-uninstall, and post-
> uninstall
> scripts exist by way of pkg_preinst, pkg_prerm, and pkg_postrm,
> respectively. These scrips work in exactly the same way as does
> pkg_postinst with the exception that they run at different times.
> Also, because of when they run, they are not applicable to being run
> at image creation time like pkg_postinst."
> 
>   i'm confused ... why would a pkg_preinst script not be applicable
> to
> being run at image creation time? or am i misreading that?
> 
>   i'll probably have more questions about these scripts as i dig
> further into them.

I think however wrote it misunderstood. prerm and postrm are unlikely
to run at image install time (but can if packages are removed). preinst
will run.

Cheers,

Richard

