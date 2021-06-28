Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.10468.1624884584447669005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 05:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IhwKwCCd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id m41-20020a05600c3b29b02901dcd3733f24so13674918wms.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 05:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=a+ffIls1u7cY02MNZL/HQudKl22QcT73uuDyG6hZE3I=;
        b=IhwKwCCdVUDEwYW+DqBug8hMylQQLyVzVEpLcXw+Hazd2laOqDU1pkGkKZ1Ql/qwdD
         +4FAls5tTJPBJIHG8pp5rK9PY4Rki9YJJkapSG4n02ocxs3uC4mE6OdGGY79sAfQGsY2
         g9BJR/sKpBvQkN9PlVoJrGLIvCkRcmMm5J1+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=a+ffIls1u7cY02MNZL/HQudKl22QcT73uuDyG6hZE3I=;
        b=tfQCaZVaUDpXOg7PRk8ZW0ucxziDU8liNbzh5i2q55+UsfVnEMN4AYrlHu4T3RvRmv
         6JXyEfh3XnNo2lajNZWFGjcBz8MnIX3mfPslg63rEG3eQEbJCUoVhJRhhfu8kvl2uhXS
         Vkl/TaE6YqZTTfzZTWC/jN2Sr5okhLSrhkR2x3kdtQLu9ndOa4x89m0NnC6rNbwTYMfV
         hYH1kDUO/Hu7pIJ232VJYxybMcilYUP1IxxbhDnLxRVG8OqiXXNjTrcC+toKNpoOGa+b
         Uy19oQO+GEBhI5lwZ0uJWI4A0RisUdB/jXsmoYwuu6GEfPHiXq/ebto+2OpXLBqJK2HT
         G2kg==
X-Gm-Message-State: AOAM53191gmAGMjw5ejO3F/V/xRMGooyKH2gyxF8ZfqfegfGVW3+V1O2
	Z7bgth0bgN0snov6xS1tD00/Sg==
X-Google-Smtp-Source: ABdhPJzxQGct5gBP3p8ae6pqQ9fa+PR7ZVRzc89WayX3X7CEo960ZFJV5WDZ2rGemkFPTJ8WEQq+0A==
X-Received: by 2002:a1c:b3d7:: with SMTP id c206mr26590435wmf.148.1624884583064;
        Mon, 28 Jun 2021 05:49:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6f48:4aa9:490d:a26? ([2001:8b0:aba:5f3c:6f48:4aa9:490d:a26])
        by smtp.gmail.com with ESMTPSA id t64sm13368529wma.44.2021.06.28.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 05:49:42 -0700 (PDT)
Message-ID: <c48956c8a5358d081fb9e8b9b04cf27848bde756.camel@linuxfoundation.org>
Subject: Re: [OE-core] Hardknott (GCC10) Compiler Issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chuck Wolber <chuckwolber@gmail.com>, 
	openembedded-core@lists.openembedded.org, Yocto-mailing-list
	 <yocto@yoctoproject.org>
Date: Mon, 28 Jun 2021 13:49:41 +0100
In-Reply-To: <CAB=6tBQR1S=2niGMojS_55-JebtQX4LybA2aEh_6YNtXf_3yNA@mail.gmail.com>
References: 
	<CAB=6tBQR1S=2niGMojS_55-JebtQX4LybA2aEh_6YNtXf_3yNA@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-06-24 at 21:48 -0700, Chuck Wolber wrote:
> All,
> 
> Please accept my apologies in advance for the detailed submission. I think 
> it is warranted in this case.
> 
> There is something... "odd" about the GCC 10 compiler that is delivered with 
> Hardknott. I am still chasing it down, so I am not yet ready to declare a 
> root cause or submit a bug, but I am posting what I have now in case anyone 
> has some insights to offer.

The issue you describe does sound strange. I was a little unclear about exactly
which combinations were passing/failing. Are you saying that some versions of 
buildtools let the system work but some do not? We now have gcc 11 in master 
so it would be interesting to know how things worked there and if any 
regression was fixed.

I have also heard reports of issues with bison segfaulting from other sources
but I don't have anything I can point to specifically about it.

The target system should be independent of buildtools version and the target
system should also be binary reproducible so if that were changing through
changing buildtools tarball, that would be worrying in itself.

> P.P.S. For the sake of completeness, I had to add the following files to the buildtools-extended
> sysroot to fully complete the build of our images:
> 
> /usr/include/magic.h -> util-linux "more" command requires this.
> /usr/include/zstd.h -> I do not recall which recipe required this.
> /usr/bin/free -> The OpenJDK 8 build scripts need this.
> /usr/include/sys/* -> openjdk-8-native
> /lib/libcap.so.2 -> The binutils "dir" command quietly breaks the build without this. I am not a fan of the
>                             lack of error checking in the binutils build...
> /usr/include/sensors/error.h and sensors.h -> mesa-native
> /usr/include/zstd_errors.h -> qemu-system-native

It is great to have this list, outside the non-jdk issues are probably issues we 
should look at fixing in OE-Core. Do you mean binutils above for the dir command?

Cheers,

