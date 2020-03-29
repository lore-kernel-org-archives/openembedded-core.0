Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.36863.1585515593611026460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 13:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BZDLIkDu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id f74so8210317wmf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2020 13:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=eNRcPfoB/A79PKeSKWlp+RygTxMMrpBMXPBS6UfvDvE=;
        b=BZDLIkDuxcW1enFXPpDNM7O2Od9vbBXIw2o2Yt+fC9ifRCvwc2lj0Xe7CK7hAMco6H
         1gTAKeJ5UFq6lqD9v8r3gazxV9pyqT2kJ6/AGa4HE9pLUS3F/pOlksh9cC8b9SZ0Jo2R
         F5xvPRrpooEF7vkfuNFC8O9z2Sx70De5dz5KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eNRcPfoB/A79PKeSKWlp+RygTxMMrpBMXPBS6UfvDvE=;
        b=GIRZAF7OwvkNKB2aBw2Xxb6sh/FrztAVykEUm9wNY/rqLUixgLQJC4AQtL7aXAshKK
         olubgwMdZV9WHrKPI2n63mkRdPwo76kjbl7A6THsbHDK/PC+ixmMYoJmEdRNS/svj4Tp
         8epwOSpQ/+1OGir/amdlI67G7k/WBzl5ULuyMKYk2qx4hdbqvwa833dgO44dlwlzAuQq
         YYRMO9L2+2P/TOQeZBN8sKuTYl+1nCPBtpQlW1aQDZBUEA9APDqPFsnRAQHKdLNV4NWQ
         dt+vvO/NecE4T4XU22ncmBS9X80PtGIzwORJGVuFStjwF0sK1GbrxV7mcbzd2213i5r0
         VVeQ==
X-Gm-Message-State: ANhLgQ2RRvp60sPlpjo2mB+58iem1HdlPZqHkODw5pwRruZftEV8BAS2
	RiVmPrGzexItUKojfsCTsbDj5ocyZ60=
X-Google-Smtp-Source: ADFU+vtyUmEfKFGRjBJ/H+3WEzLVJs/Mmv/p692dMgfVdaMP4+1ajvA3/ka0w4CRP3Regm2SL7zYxQ==
X-Received: by 2002:a1c:b7d7:: with SMTP id h206mr10005576wmf.143.1585515592251;
        Sun, 29 Mar 2020 13:59:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j11sm7438996wmi.33.2020.03.29.13.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 13:59:51 -0700 (PDT)
Message-ID: <6ec68faae728cfcfeba133146a58765076716aa0.camel@linuxfoundation.org>
Subject: Re: [OE-core] can i assume the following uses of _append could use fixing?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Mar 2020 21:59:50 +0100
In-Reply-To: <alpine.LFD.2.21.2003290853010.17224@localhost.localdomain>
References: <alpine.LFD.2.21.2003290853010.17224@localhost.localdomain>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-03-29 at 08:55 -0400, rpjday@crashcourse.ca wrote:
>   all under recipes-devtools:
> 
> file/file_5.38.bb:EXTRA_OEMAKE_append_class-target = "-e
> FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
> file/file_5.38.bb:EXTRA_OEMAKE_append_class-nativesdk = "-e
> FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
> elfutils/elfutils_0.178.bb:EXTRA_OECONF_append_class-target += "
> --disable-tests-rpath"
> 
>   all three look like they could use a leading space, and the third
> example uses the redundant "+=". or am i misreading?

Worth fixing but the last one works due to the += adding a space...

Cheers,

Richard

