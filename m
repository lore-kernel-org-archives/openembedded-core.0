Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.6659.1588431608871879000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 08:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MYLjOplQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id v8so11920617wma.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Zu5darTAz+rick1fQ/CUlElJl3U2AAY6m6fioLor2Ps=;
        b=MYLjOplQH01SQ3jpo96BABgw3HRt6wmox63FgRZ29qAm9RWC4mjr+7BnQEVWUHQ/6U
         MiJnMsTgBE3JtoGfl1pu8fgOVXe/s3fQgUFNp3pt0I7DUtF3x4T57NQyb+5FIMwym9s6
         0KTAXZbfjGq1fZUtaKaZG5FjhDgpADxk+kUY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Zu5darTAz+rick1fQ/CUlElJl3U2AAY6m6fioLor2Ps=;
        b=eyvGbAdcLBxRlZrkdYS7yNLPnMI4YOA3uGNG+VojSDL9fJkK8O83o4hNOMgpeysmY3
         jeOR+vijG7f2RJXrPq8ldrtssKtCzcy7entXEIeyylV+z1PoY6V33a6BxG4i/SQ0FFOE
         sD+zNXgKHMMpgJuOiizLt7DEszmH2ENPiRI9g7oQ4LREGtWlmqOeGuIW9LdksIyJZaHy
         HaWjKfEkFPt8F8Liqprm1B2IueXVqUASCXDKrU+yOph30NnSExc/TSsQ8TeT50KSJSEW
         T/FTivmWqeCydA1lEvbUBTCGBA8bfa7gGJI3SLDHmZ8VqiNuLSWxhutDgdEnxZxAyubB
         0Ptg==
X-Gm-Message-State: AGi0PuZvEucP7pBJGsr7wwsTyn8GDYsOsEd5TRHubz8E5hadpUOSFhdS
	U4SaH0e25PKCs1um4CWEvqlkG1Q2kcI=
X-Google-Smtp-Source: APiQypLj1ZSXvyTPRcRSfO15OyBN8xF9MgdQM6uupPcDNmDtV/UQ2LG5aFw76CoVXj/mh5sdgoUcgQ==
X-Received: by 2002:a1c:2392:: with SMTP id j140mr4923797wmj.136.1588431606948;
        Sat, 02 May 2020 08:00:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d13sm4439651wmb.39.2020.05.02.08.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 08:00:06 -0700 (PDT)
Message-ID: <2e66b913ad106592755b0a53e2440dd46c21eb4c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 16/17] glib-2.0: update 2.62.4 -> 2.64.2
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 02 May 2020 16:00:05 +0100
In-Reply-To: <20200430095815.2824-16-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
	 <20200430095815.2824-16-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-30 at 11:58 +0200, Alexander Kanavin wrote:
> Add a couple of missing ptest dependencies.

That causes problems for non-gplv3:
https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1848

> Drop backports.

and more strangely:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/466

which looks liek a gtk-doc issue?

Cheers,

Richard

