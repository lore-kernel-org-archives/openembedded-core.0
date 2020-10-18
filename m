Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.26005.1603043801084103770
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 10:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LibWwN/V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id j136so10451518wmj.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 10:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=njwCKCuTCMr7H50juIWvRCYHc+P0hZ/yCJB64bPdS6M=;
        b=LibWwN/VhK9+I2fKF3+y7Bv0F/WRbOtHqw6eTJgfkUcwNjG93Rn7bZx4n/0ZEWph2y
         ljtJmvMtpd51qjwPoxHpZvEdpUv+UaGXjc8Lsk1nr5fJv/LrmfMMHT6sU/IWE6o0gcTO
         ijRXgeZ4/+YAMn+B/Z4LamAGovYJAvEo5G8nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=njwCKCuTCMr7H50juIWvRCYHc+P0hZ/yCJB64bPdS6M=;
        b=c1QfaL7VZ85JqXwOSazV4rqpqDQTeTMke90NHWBwPikl1cAGqpdsZlUCGemjmYVTQq
         dGdpDMwVMOYMmRWdgmhRn8rTdrdReOnnRJ5sZ5exnvSv8iF3Nig8qw/OO2QFGd2tam54
         VJ74Ws49q4wpbPvX2X77K2xEDUo+b7U/NZzVhtLcfgJIoq6WMbtV7kkWpMyRHwCPIjud
         qltQADUiB+H/MXPprYj5uZtDYLs4V4qQEf7dA5fjjaKx0M3InnFYZK8dgvoTFSNoDRQO
         k6xnIjvBJJvESQRMXsDdBgVZQ3l36CraHZoNt42zMWsmoMf34AGMul0cSmMFCz+Dwkcv
         Hxsg==
X-Gm-Message-State: AOAM532gKkhzXAKrRFTisgW1xdTiy9sXbRBaSMjsgNzMjGpuE683x/j3
	M9HqZzIo3wuyEu1uyVBer8tJbw==
X-Google-Smtp-Source: ABdhPJzDzvsdjCbdINKhTpbZ018TqIU6/UZSeEANmpOBD0yVuiykbbQ3QhRt/wEz72kCpgevEezV2g==
X-Received: by 2002:a7b:c250:: with SMTP id b16mr14680126wmj.161.1603043799519;
        Sun, 18 Oct 2020 10:56:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id z11sm14115140wrh.70.2020.10.18.10.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 10:56:38 -0700 (PDT)
Message-ID: <27f0873f9e4c50789588953a20d530c9965e1a35.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 18 Oct 2020 12:00:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 18 Oct 2020 18:56:36 +0100
In-Reply-To: <20201018100004.8512E9601C6@nuc.router0800d9.com>
References: <20201018100004.8512E9601C6@nuc.router0800d9.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-10-18 at 00:00 -1000, Steve Sakoman wrote:
> Branch: master
> 
> New this week:
> CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
> CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
> CVE-2020-26116: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26116 *
> CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
> 
> Removed this week:
> CVE-2019-18276: bash https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-18276 *
> CVE-2019-20907: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20907 *
> CVE-2020-14346: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14346 *
> CVE-2020-14361: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14361 *
> CVE-2020-14362: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14362 *
> CVE-2020-14363: libx11 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14363 *
> CVE-2020-16092: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16092 *

I'm a little puzzled about how dunfell improved significantly but
master didn't?

Cheers,

Richard

