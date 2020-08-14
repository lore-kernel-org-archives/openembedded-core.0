Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.14956.1597398255272168132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 02:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KrOK2YgK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id c80so6963078wme.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=s9ydBBjYXb7ZNaGAyUyYEyRdNmYHBoRKwE+qLBt7Q48=;
        b=KrOK2YgKMJme6KEDVhPCPby2bjyXWHAtHLh4UAyFpBx7QymIUJ5Vjb22tDggmMbIWG
         uoFxGCPhBLyfDrIuItphWeMhpeLrK52isZM6WoePIVpsFo3r6XYl3YhW/VRsiRrsv8RS
         kx2j6jgJ/33+8MW+zIddnF9Y6mtmiEywA7V1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=s9ydBBjYXb7ZNaGAyUyYEyRdNmYHBoRKwE+qLBt7Q48=;
        b=g8InyeZYZst9p9seJR3f8YQM2oDpf+aLXImkNZsuuIy2I9zwRp1+/jTiyScgo7mjNu
         iQ1DIVA4RvbNUiw3pogtu3hKBilUt7L5GUKys4U3VQbqmtYEvgl+ThpXFLRCYs1yEUnV
         A+NM350le5X3YHEZqIXR2Ob9fvm93tY/vHIpH6G7lnmqb3JJVVLDNd3vU2ffmeaRA9GG
         reLYG8dzUKosKaTbYMPSyEbVbDquz40A1E/5q4eKHs+d0ZFF3Cv/akWFzMEkfqEi7zKj
         RfUTG5JRYaGhAStteMZUWAxIxJzHK5XjUuSFMIzwL0jl0zF7rmyEo4bH7Ibt706NARgR
         /YpA==
X-Gm-Message-State: AOAM533qJQWskzDp6Mwa8m+Z2LB+Ks4e34VpYiZWo8M7o7ExKUcsoEME
	atU8DV2QDs/pElQGMQq0gLJCZw==
X-Google-Smtp-Source: ABdhPJy/QxsHGeM/Nm4fP4sB8dpUpBsjYKwy2kCCrUldZ3Ml+1TkrTCmo5Qw6Vxe7XpHeoq7S+/nfw==
X-Received: by 2002:a1c:2095:: with SMTP id g143mr1746219wmg.78.1597398253811;
        Fri, 14 Aug 2020 02:44:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:edc4:7dfa:277e:8b29])
        by smtp.gmail.com with ESMTPSA id p14sm15583911wrx.90.2020.08.14.02.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 02:44:13 -0700 (PDT)
Message-ID: <846ae78198cef705d425a18afbcd53559d4484ef.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic/bootimg-efi: Respect fixed partition size
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrei Gherzan <andrei@gherzan.ro>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2020 10:44:12 +0100
In-Reply-To: <20200316152820.23437-1-andrei@gherzan.ro>
References: <20200316152820.23437-1-andrei@gherzan.ro>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-16 at 15:28 +0000, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 21 +++++++++++----
> ----
>  1 file changed, 12 insertions(+), 9 deletions(-)

Causes build failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/2302

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/146

and others in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1260

Cheers,

Richard

