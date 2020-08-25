Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.11126.1598352588185532960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 03:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DqsyMof1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id y3so12219804wrl.4
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 03:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=UdlJ0IlGpeVu+lkQQbr1wFEn+USKDd0Ju8xFUZFGQmQ=;
        b=DqsyMof1voWaxalpl32qVVBCA8q80H3rsFK+tiTGA29UYBQfKkQVWvq1lU6zTHS7/T
         bhuh2VAKxL6wHAlJvvmijOzGRSWGRTQZMLLT7BAsTgZFRVXsZwqqEb93RTlGX7tFg/qE
         grjnaxnwQNdob2LMiSlxM1iINPEoCd0Of4pJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UdlJ0IlGpeVu+lkQQbr1wFEn+USKDd0Ju8xFUZFGQmQ=;
        b=kElrqwsTKPAaz0nKbcI2FtaCoUa8uVk1mvQGSndoAd4sCk/Lq/KDggG7OGxswZDoDd
         h9gPkk5l6I5WE7XsG1Ly550PiTsIl3Gj2LPQZheDur24457/rUmcsx2a++ALjK8WYWT1
         06mw4JCxWJ5u+h59hEx0Ia9m5huGFcnMw5LxoEwmftYI7896b8qEqUzRXxHWJRLNUZ3T
         Fq1E8qLuu/QPmVR1KRtEtwzav7qpf0ylz0Lcwkosl0wMnZeDpi7rQVfvNMQdKFU8UyU9
         A/fyi66NjOwq2X0xqW4daVek1akW7WPw16X2kuzJeLVN0juEyCfrTZ4/Ns273GcR/UGh
         8RvA==
X-Gm-Message-State: AOAM531kvU3u+QBhWK5dziRXt/9qPvFXo2kL2fMFjV6lMen3KFibin97
	yj4YVpTqm+1BHpMkOJC8cDDeAjBcNpuaJLtL
X-Google-Smtp-Source: ABdhPJwNz6Q9VxBVjbjkf3womcCid5qltKBwndcfT2NA/m+11m9Lp+mpgxcMiB1C6A6Y/SUBkI6bNQ==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr9857581wrq.261.1598352586252;
        Tue, 25 Aug 2020 03:49:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id r12sm5020824wmh.46.2020.08.25.03.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 03:49:45 -0700 (PDT)
Message-ID: <65d6973c588c636725c857bfb4fb8e8db68fb254.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH 1/5] package_tar.bbclass: Sync to the other package_* classes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2020 11:49:42 +0100
In-Reply-To: <20200824232930.150388-2-mark.hatle@kernel.crashing.org>
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
	 <20200824232930.150388-2-mark.hatle@kernel.crashing.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-24 at 18:29 -0500, Mark Hatle wrote:
> Sync up the task definitions with the other package classes.  This may not
> have been strictly necessary but will make overall maintenance easier as
> the various package classes are now in sync.
> 
> Additional, there was a missing deltask in the nopackages.bbclass related
> to the package_tar which has been corrected.  This could cause problems on
> native recipes when package_tar was enabled.
> 
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/classes/nopackages.bbclass  |  1 +
>  meta/classes/package_tar.bbclass | 11 ++++++-----
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
> index 559f5078bd..7a4f632d71 100644
> --- a/meta/classes/nopackages.bbclass
> +++ b/meta/classes/nopackages.bbclass
> @@ -2,6 +2,7 @@ deltask do_package
>  deltask do_package_write_rpm
>  deltask do_package_write_ipk
>  deltask do_package_write_deb
> +deltask do_package_write_tar
>  deltask do_package_qa
>  deltask do_packagedata
>  deltask do_package_setscene

This part makes sense.

> diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
> index ce3ab4c8e2..8946bc212a 100644
> --- a/meta/classes/package_tar.bbclass
> +++ b/meta/classes/package_tar.bbclass
> @@ -57,10 +57,8 @@ python do_package_tar () {
>  
>  python () {
>      if d.getVar('PACKAGES') != '':
> -        deps = (d.getVarFlag('do_package_write_tar', 'depends') or "").split()
> -        deps.append('tar-native:do_populate_sysroot')
> -        deps.append('virtual/fakeroot-native:do_populate_sysroot')
> -        d.setVarFlag('do_package_write_tar', 'depends', " ".join(deps))
> +        deps = ' tar-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
> +        d.appendVarFlag('do_package_write_tar', 'depends', deps)

This is effectively no change but standardises so ok...

>          d.setVarFlag('do_package_write_tar', 'fakeroot', "1")
>  }
>  
> @@ -70,4 +68,7 @@ python do_package_write_tar () {
>      bb.build.exec_func("do_package_tar", d)
>  }
>  do_package_write_tar[dirs] = "${D}"
> -addtask package_write_tar before do_build after do_packagedata do_package
> +do_package_write_tar[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"

Does package_tar need those dependencies? it doesn't handle postinsts
so it basically doesn't.

> +addtask package_write_tar after do_packagedata do_package
> +
> +do_build[recrdeptask] += "do_package_write_tar"

This is also incorrect since tar's have no dependencies on other things
and I suspect this difference is deliberate.

Cheers,

Richard




