Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.36220.1607959222090898189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 07:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=gkcYi+ga;
 spf=pass (domain: burtonini.com, ip: 209.85.167.68, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f68.google.com with SMTP id 23so31003012lfg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 07:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OWchaYthgjcevcwUiExeu8oJV7ylVwJAsAq7XEmME18=;
        b=gkcYi+ga6moajWrNTU7QGDbrlajp3zt9pIcOGAht3KoI02A7NrqukEejI5ZO0xWzlV
         u/TF8Cx+Tz+Ui+xlGk2JlPJZATLMNDXGpPqiyyFME0+lfuVbTU7QgRYgY+Fd2qg39o+m
         ulUpsDoHoSclNnTd/spmmj9rX5JheaHfCM3sTcVTjPQuppW2rir9ZtQMmw+HKx8iaLiE
         x5bSPciCPinXY9P3x3b6byJjQoCYUfCDuLUFuSIPocbfz4OeL86UDFvdV2jJhDjqVt3X
         jDvXeyAPGXfGK5OmZgiaocK8kCuKRuF4al/R+S+qV2ooW84q7pRHqb9Y1iRQ/lQtWqrP
         3ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OWchaYthgjcevcwUiExeu8oJV7ylVwJAsAq7XEmME18=;
        b=dX51N39SNaFCv4u3bUaimqU4FwKDdrzfp6oQi7b3qjb90GpJnbGSXptRJMzpbsuVCt
         Wodd6F/SyZQsehTK2WUISHI/TQpiMmPoLWjMTdTJNEV508dtZJ8PQe7ow+v3E/T43+TM
         Fr5f26ewVubvvrYzv8/remDDybdreoC4d/S7Aqv6YCSpOeEJmN7kgXywgMmAykM5Weau
         CH5PC1nfvAu6JQj03a9Jfh43gVd3ngkCEmhXncV4BGI37UXj4hEeFzv036f8DXqUPqBw
         iLuvUkyda8pR0vZSf5id77zAf6ButQ8b+3cEmhbUBNIeYezFCudlLnG4MCNcbxNKpwQ4
         baMw==
X-Gm-Message-State: AOAM533sBUHLnTUfwB4XOLS2QlM/wCRYEYV0Sxx0O1flxYl/YfPVUfai
	4CGBQ4BaPhzF+1DPO2xtt8mnZactNNwt9LAQHmgMrA==
X-Google-Smtp-Source: ABdhPJygizh+J6iA/sHrZVi+oIU92scQJO0BZyKIDx+tHx3Vl8EOdnikQ2rWhbWNqHXL18EcInYa1UWzZmaaNyx2yCQ=
X-Received: by 2002:a2e:924f:: with SMTP id v15mr11724223ljg.6.1607959220277;
 Mon, 14 Dec 2020 07:20:20 -0800 (PST)
MIME-Version: 1.0
References: <20201210163242.3329917-1-ross.burton@arm.com> <732073f5112c4d4ff8d2e6d72832bb53823e81f4.camel@intel.com>
 <CAAnfSTtMRjAJx4d7KHP4eMa5YO3=uCf0_RpjToDT8bUPLcwGQQ@mail.gmail.com>
In-Reply-To: <CAAnfSTtMRjAJx4d7KHP4eMa5YO3=uCf0_RpjToDT8bUPLcwGQQ@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 14 Dec 2020 15:20:08 +0000
Message-ID: <CAAnfSTtRg5EfEZqHWpFb+Bqzx61Pa7h8Kxd5ND61avW34JxiiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: allow building for Arm targets
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Dec 2020 at 14:11, Ross Burton <ross@burtonini.com> wrote:
> Can we just move the contents of that append into core?

FWIW, got a patch doing just that locally.

Ross
