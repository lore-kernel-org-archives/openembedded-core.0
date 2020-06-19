Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.490.1592605023047820005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 15:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P+6qsak4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id l17so9793071wmj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gYiZH2Y6IBFNUc+SBCSy2aU4CPKuYCKoyXD5sP7ra64=;
        b=P+6qsak4B7z5EswwAzDuaZW9EZXl44PozsJMo41rBsPmRS6dLpu/rJPCrgVytQj9XY
         CSXXLtjMXzuGWWX2bjpvEo2eKyZi39h2acLPylWfzIHxCeKbygYb05Y6eldgOVEvDp5c
         dD5epg/A2BaxFLM1UfrDCDRolsKArGlXGkNAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gYiZH2Y6IBFNUc+SBCSy2aU4CPKuYCKoyXD5sP7ra64=;
        b=cAgP+IY7JHSvQRi4+NpHGxYwtDM8g9QmhUElMKp/1qt/ziIbN92A06H3/T0xgT4sSn
         xZsfyCinCyOEzpEOOsBdugZ4sxiiapy0nTky/FofIQ096xjP9lYrFErVUyWJPMN9k70i
         hyhqFEnDte9ueVX5rAv6SizpJ9EQVblCgmCzp3SbhGCyWXyzgl6J/UWGNTLfNYu7ddvz
         tWHGIwWOZbkd0XNSX3t/PPo3mPlzCQjGjRffQlQ/m0OqpO+19X/flxE7Ll0aGIpsyil3
         YK8xsfTYwTcVLxJWFL3s0qUC16eqhUVIbtA0X3CgmG633x+TOOkWQ1Vi84+cXcoua1RQ
         Cxuw==
X-Gm-Message-State: AOAM533xdY65gfYkVh93rvRTjuUOqLDO3H8bthjtLE+7Q1Ps7YdIR1XE
	CNO14fQ/TKMWcs4UTQF9GJm2rw==
X-Google-Smtp-Source: ABdhPJyOxqahYEE5j6mSCQvOejJnwLD+pzLkOGkDcHL967DWNoIHPTvbiFEzbS2RGPpfPJsX5sZZsA==
X-Received: by 2002:a1c:49c1:: with SMTP id w184mr5592768wma.46.1592605021473;
        Fri, 19 Jun 2020 15:17:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s18sm9632557wra.85.2020.06.19.15.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 15:17:00 -0700 (PDT)
Message-ID: <852221ed55f737787c622ce2eda98389b343b7e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] dbus,dbus-test: Move common parts to dbus.inc
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ovidiu Panait
	 <ovidiu.panait@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jun 2020 23:16:59 +0100
In-Reply-To: <CANNYZj_d+HcPS5Stp0-Mg8j7HKUrUiU28KamH8ouxX7wfW782A@mail.gmail.com>
References: <20200619192550.12379-1-ovidiu.panait@windriver.com>
	 <20200619192550.12379-2-ovidiu.panait@windriver.com>
	 <CANNYZj_d+HcPS5Stp0-Mg8j7HKUrUiU28KamH8ouxX7wfW782A@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-19 at 23:32 +0200, Alexander Kanavin wrote:
> Is it possible to merge the two recipes completely, simply putting
> the testing bits into a package called dbus-test?

This feels like a discussion we've gone around in circles with before.

I think (but the archives would know for sure) that its a circular
dependency problem, where dbus-tests needs glib-2.0 and glib-2.0 needs
dbus or something like that. Its a bit of a pain having them separate
but there was a good reason for it.

Cheers,

Richard

