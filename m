Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.1766.1588407508283797189
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 01:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BSV4qHAi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id s8so4239790wrt.9
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wBISpsXsiYEQ8wMOUNWH+m8/LXxcOkTTD0GhESan4oo=;
        b=BSV4qHAi/hMsygY/YqZdoSYi3QPVaCddmaWiY79Cl8y8xzJZ1scw4RvbpEZvTykHER
         iIdr4qucdU+ATxE8AL+e9eHtfH+UcHud89/dhWnED3fKixVraFIji3fHRDudWk8ZEXla
         9PrxoPY76rji5HmfZT4/sjG1CBnoTL8YCGRFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wBISpsXsiYEQ8wMOUNWH+m8/LXxcOkTTD0GhESan4oo=;
        b=ida5BPL1q/BD0ej3QQtslbP482DlnXq6yvQVhf6bBeHXITMR+JKjXAdLyIPNjKhsXQ
         aCVIs8saAkZOavyXGMBFqwgerIIgDMyAHknQ/26dLFE2xw4ZO5S0FKA9Cd3zuS4utWel
         F/kl3yBYFC7hhKEeYfsYmyZwHD8ed6PlHPb+/VTFcIzkHcZKdONahSIMux29AFFFC6y5
         xQDgStpEKoKwK/w8vOrr0FCTDCyg/7hkNC+/DUU5epSgYe233BGf/jwpQE1dSNIeUg+d
         bUA/kT7I3ZIN7O95LS/PU3Pzykk1nHEw6HpMAfAGlwwvcbQ/Ikty0Ulb/wgDwKDdjRll
         QY+g==
X-Gm-Message-State: AGi0PuZCt6wzH8Xw1a/MRE0X1pfSvnQnVPfTeZTeh3EFQDigBOMLJwaG
	vscdsERtU1m+Rwpe17a9H03cDQ==
X-Google-Smtp-Source: APiQypK6RHq0WkluAzIHvICKtN1gXTWjtirgE0V2MvuYlsXX0CgKvU8JPg/RJMdcm/vA5H8ARIutOQ==
X-Received: by 2002:adf:f684:: with SMTP id v4mr6733414wrp.218.1588407506816;
        Sat, 02 May 2020 01:18:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l6sm8442364wrb.75.2020.05.02.01.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 01:18:26 -0700 (PDT)
Message-ID: <e058d4f20050003b166b1a541233d0797cdc5304.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1][v2] re2c: advance to version 1.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Sat, 02 May 2020 09:18:24 +0100
In-Reply-To: <20200428181802.37502-1-joe.slater@windriver.com>
References: <20200428181802.37502-1-joe.slater@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-04-28 at 11:18 -0700, Joe Slater wrote:
> The locations of release archives have changed.  We change to pulling
> source from the git repo.  Remove PV from the recipe name.
> 
> Fix CVE-2020-11958 which applies to versions 1.2 and 1.3.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>

Somehow this seems to cause the failures in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/909

i.e.

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/890
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/895
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/884

which are all:

oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk_sdl

failing...

Cheers,

Richard

