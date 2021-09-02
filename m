Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.3569.1630565576079907568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 23:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DdkDW029;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id z4so1149663wrr.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 23:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=r6tRohQloXg1N7lkyFmOvwDRG7U7Q+NqNabURTzYvNM=;
        b=DdkDW029msH8Cczb/gja32z+72YpU246wUfXcxyosojQJL57z3/2IwGibBsQw5NH6Y
         9MMZZK8404GQjdjmrA6H90GuFJdikRM2MGBIMpgYvYSDk4wFz1KdPzDn0OfjXJeesyBw
         kWGLYuaEVsBr1FeoFv7vMwhd1/WTIOn+93OkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=r6tRohQloXg1N7lkyFmOvwDRG7U7Q+NqNabURTzYvNM=;
        b=gVtEZAX4Hx00CnzREohLln0G0IhrTmkF6D6v5h0PcGDErA3S3WJOdPxb2AG4wfkmCj
         RbQOsSuGuUx7L6iQ5U6EwjUyA+eXf1iZNhrvidIHD9CHdSIc7tNYlfxWcGqD5gtwazwW
         cdggPvJ2Q0i+y3hdlxIx/v5JwF/zE4v3JJ7P74y1wnLGEjxJYAKM3ifhXZuweFKc2xFj
         h7uOTFwBNALpFl+i0sP3Xvclma/2qxmaBP7oYn2DO6HPjY5KwuNwTx/yYxrBnP+EHCR6
         x4fPH96pNmJC7AelBUfBR8mHU6AppIWfw5dFDYsDOuEEjsoui3FxZC/TyJ9sE4NhrTap
         ZNPg==
X-Gm-Message-State: AOAM530KmhnUoDPStsvLvQY50DPU2i54fobAaZwyAIH+N0CRU1yQHH+e
	7M86TL9fhVXoDfSZBAN4zdXrsg==
X-Google-Smtp-Source: ABdhPJycnHcc3dYZvDqJeiRTRkdkscm1vV7bmH/vqdMAV2x6WDg2dFMe1tQOZ3u2z+UgX2SmdcFfNg==
X-Received: by 2002:a05:6000:23a:: with SMTP id l26mr1742063wrz.369.1630565574604;
        Wed, 01 Sep 2021 23:52:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5a99:997:84da:190e? ([2001:8b0:aba:5f3c:5a99:997:84da:190e])
        by smtp.gmail.com with ESMTPSA id x21sm767101wmi.15.2021.09.01.23.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 23:52:54 -0700 (PDT)
Message-ID: <b530eb10dda279d04fdcdcfa21d56cbd919b3c3a.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 19/31] tzdata: Remove BSD License specifier
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	saul.wold@windriver.com
Date: Thu, 02 Sep 2021 07:52:51 +0100
In-Reply-To: <20210901230002.GR1528@denix.org>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
	 <20210901134510.29561-20-JPEWhacker@gmail.com>
	 <20210901230002.GR1528@denix.org>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-01 at 19:00 -0400, Denys Dmytriyenko wrote:
> Can license cleanups in patches 19-31 be submitted as a separate patchset, 
> independent from SBoM changes?

I already queued them the other way around in master-next and will be
considering them as two different patchsets.

Cheers,

Richard

