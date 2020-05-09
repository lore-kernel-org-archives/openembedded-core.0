Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.6085.1589062664176585975
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 15:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dTKSx2GL;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.68, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f68.google.com with SMTP id a2so4549979ejx.5
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 15:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3u0eNi5FMWQo6dbH80wbdXl2xsZ44vWPdFJWGfcC1kY=;
        b=dTKSx2GLtsc15NMcsEZV2xPSMSoSL7uihzaSrIvrQkOHePW7dtR8xLLpbWCmEpQeHQ
         EkPeTATQaF1S1bgmuS1Y9fWVuKekUKNSnkjE6Ckrn0gwEZEgvGgxbyNMZyJyld5B9POl
         cZdhKfIFTOMCSwZRCaUha5yF7jgoA67oXjJpNnHstUWL1WH1q/wscDfjCBMnkaZHFdkn
         +IFcXzshTyq22DqKGRqSP8INXpItY5W+AhCc90fJyQD11HBP28v5eDZGugS2iXbtMtLP
         X3ZAUHUOEVclzYuh/GwRQicDIKxvuKERPHfKgBpXFcJMacE803bHuVgTUo3EYWrSVBAI
         NIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3u0eNi5FMWQo6dbH80wbdXl2xsZ44vWPdFJWGfcC1kY=;
        b=Xj8WRzdxsE+TTKc9BCjvre7zRr0BgUksdjKLTkXquBxSzzmf6kOr2ouovaZ2OfkAvD
         UmsD8S+xrSgqNhnjo1nmwK9V7ha0JM87OJ5rjbH9dYIrmPuIryIQXP3W83IAr6BhH/5u
         Tl2ssbJkGwMF8NoEJ0z5GWT2pJjCIjodYiH47l3iS6IjDHz+6AWUazffgFUa2lEgyRJd
         mZuu4P8ZYCpK4J/hSUwSNgCXQzcBdEFAf2rIykkiJa4TKBLwPS0O4kbRyBUzEViHPwK4
         dNWPZVllrj5JiaRgV3Kt76Nz5CNXeJIEfCSjhhhPEIhcPDNJwEkTVclZZmjS4G8e05Ys
         4S0g==
X-Gm-Message-State: AGi0PuatPKLTNVvtlqA1Y+Y3UAvuc1gXFEvMreqoBVf1yt3H9TeEe3n7
	RIu2wYjS0twmOuMZE3XEswXs0qxSoBa9HTIQXjHxJA==
X-Google-Smtp-Source: APiQypLjOUkdQ0J6LoZqaXj+X9+MHsNlWcECFWYrFhQPHAFFOkAFrA8t0IPaKtFZ4pyJrsY/y89dinhRrHktDTKHOZU=
X-Received: by 2002:a17:906:7750:: with SMTP id o16mr7633957ejn.12.1589062662587;
 Sat, 09 May 2020 15:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200509212312.8023-1-timothy.t.orling@linux.intel.com> <CANx9H-CXmR4iKEDimUD33aWgOzMfOATH_21duXLFwQdOjkXBNw@mail.gmail.com>
In-Reply-To: <CANx9H-CXmR4iKEDimUD33aWgOzMfOATH_21duXLFwQdOjkXBNw@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sat, 9 May 2020 12:17:30 -1000
Message-ID: <CAOSpxdaw613aVsO4NCKwnXyzMGTBT8K+4z3VyMqeKq1-MpqFkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pypi.bbclass: use new pypi UPSTREAM_CHECK_URI
To: Tim Orling <ticotimo@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks TIm, I'll keep an eye out for when both patches hit master.

Steve

On Sat, May 9, 2020 at 11:30 AM Tim Orling <ticotimo@gmail.com> wrote:
>
> This is a candidate for backport to stable once it lands in master.
>
> On Sat, May 9, 2020 at 2:23 PM Tim Orling <timothy.t.orling@linux.intel.com> wrote:
>>
>> Upstream https://pypi.python.org/pypi/${PYPI_PACKAGE}/
>> redirects to https://pypi.org/project/${PYPI_PACKAGE}/
>>
>> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>> ---
>>  meta/classes/pypi.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
>> index ffa8aa3ff44..87b4c85fc09 100644
>> --- a/meta/classes/pypi.bbclass
>> +++ b/meta/classes/pypi.bbclass
>> @@ -22,5 +22,5 @@ SECTION = "devel/python"
>>  SRC_URI += "${PYPI_SRC_URI}"
>>  S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>>
>> -UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
>> +UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
>>  UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
>> --
>> 2.24.0
>>
>> 
