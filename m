Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.12383.1620402744021496012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 08:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EDsx0mJW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id t18so9770703wry.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 May 2021 08:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=taAcS2yjYszNnpRheTnXsdskmzFR+6ApPpRY1I/YFRc=;
        b=EDsx0mJWf1ZUkLd5uwjKBv1meHiCEmqEPJOLuZiDdJbeONzX6pIjiFymQpMwIP24MT
         SvnyEM4iKB+co3r7A2ef+GJX0aCho1E26fn7yVv6/D5plu8Sv1f+jnU4hHzdRKJrYPJU
         Hi4xqo/NvaEq3j+1W4mjZ4jsh5CXTc3cpM34E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=taAcS2yjYszNnpRheTnXsdskmzFR+6ApPpRY1I/YFRc=;
        b=qgCPL+XZSr6cRa4/33Krw1rI/LlLNGl9WwvT+PndmnGdDyxnH9fgcl1dD4JjDhPhEV
         2uQ189pKox3FNMWg7baRHcFhHSHW5PgciOQa70gcyXJ/5coh07o1WuAQanzcFNoWXEK9
         JzjvOmxHydYW8uYICzcbwsatioJ/Obbm5hxqnocti7y4QJYX0w5YzS6K7GtUcz/blnK5
         ol9VG4z+XvNftWjoD2r/0r11uVY2d1JDKTZCRILx42YAFr5wA1kJGMW7Sh/EdJfJ/peJ
         prs+6kQd4FYxvwkDee/XMp6JZx9EQqkwF0ArwKGlVl2+x0/ciTew7oCzoMspZp63kFg0
         xxrQ==
X-Gm-Message-State: AOAM531bHHtM3uY2WFTXHDIvKEJG78QJdt5+cTfmp5nj0pWvN+TdlsUE
	SDTN21E57erYQFBdN7RocodNcA==
X-Google-Smtp-Source: ABdhPJz+ob+QOMmQ3ScvyXVcJomOBjZos5LTFRlb8h+kzDYrD0+LkPkL47ZmQZUaii536flP+j89xA==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr13480874wri.30.1620402742369;
        Fri, 07 May 2021 08:52:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b293:70f:415f:a3e? ([2001:8b0:aba:5f3c:b293:70f:415f:a3e])
        by smtp.gmail.com with ESMTPSA id i14sm9264433wmb.33.2021.05.07.08.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 08:52:22 -0700 (PDT)
Message-ID: <52a724c1ec9c0184f7153c4b9359b4681f915ea1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] linux-yocto/5.10: qemuppc32: reduce serial shutdown issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Bruce Ashfield
 <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 07 May 2021 16:52:21 +0100
In-Reply-To: <CAOSpxda+ArVQ78hweJm6ckd7ga=aXhzssMGVPv9317b_e++hEQ@mail.gmail.com>
References: <20210506125721.27515-1-bruce.ashfield@gmail.com>
	 <CAOSpxda+ArVQ78hweJm6ckd7ga=aXhzssMGVPv9317b_e++hEQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-05-07 at 05:18 -1000, Steve Sakoman wrote:
> Would it make sense to do a version of this patch for 5.4?
> 
> Though much less frequent on dunfell, we do see it on occasion.

The change is a simple removal of a defconfig option so should be relatively 
simple/safe...

Cheers,

Richard

