Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.34553.1610374982536556840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 06:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eH+7wHxD;
 spf=pass (domain: konsulko.com, ip: 209.85.167.172, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f172.google.com with SMTP id q25so20230481oij.10
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 06:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NHqf6syelx9iwGdKlt/kzmAeYirlqWbRmuw7Q9Zzaz8=;
        b=eH+7wHxDDrHp4BQww4d3H8AuMMvlwgDqak9QY76z+FYYLmlUHki7h72pg7EYbPdeY4
         4DJCnQNb/BanoNmqpYtzTQMrJPyfIxtrf2oNcMOPyWi4p566CCAAkm1WIjZ9mN9qtDsl
         5QWdEUcjd3qgL10FbmAREtTpD7CcCxaFGDycA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NHqf6syelx9iwGdKlt/kzmAeYirlqWbRmuw7Q9Zzaz8=;
        b=Ndpq5GqDjc6tRvPn4Vz2KSmXmju7I5vnZi9NVr783mA670xhTYiATtfo0+hBX/WuAr
         lnDxEzXcuJVlBmab44pGXr7WczzUpxB34Ze/Sq2Dyq39uE5Wq5E3Sv8SUs1IvCEhTCfI
         P83EGnCtjWbgX3Wp2Cn7RzJtzMvGvKGmqFEN8ciqDnc/9nP4qtbE/LHw2Kx6lT6d5Anx
         +XUxnU8of50mukIrUZQI/87gYvIpdYPFD8Ndqrqd/HmDsInfCOxZhA4YTJExvWIG9NZe
         /O8IwwlNDza5qA2KOMxOUOqAQ+XcSDdlofEF+MC/zxRttgft+LEggj8n3Afufo3y0RDK
         +Hgg==
X-Gm-Message-State: AOAM5330DWTfRhU/nmSVu3sBVXiTx+1o0bapCKEGwH+dpc1V/PhI7UDC
	nAlaodHZl0MPNdLasSWpwPiJ86noGdCNM1Tp5h1m2w==
X-Google-Smtp-Source: ABdhPJwZH1KWtXQ2qjLCUx9tvEGtIAerztrdiwzLnj39WpfyhNp1Sr2TvjGY5FUq33QYLDJ7M15lCd0fU1ZeGBkWQbY=
X-Received: by 2002:aca:b5d4:: with SMTP id e203mr10320766oif.152.1610374981873;
 Mon, 11 Jan 2021 06:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20210111103247.11685-1-pbarker@konsulko.com> <MWHPR11MB20008B3181D901FA9C20BC8CB9AB0@MWHPR11MB2000.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB20008B3181D901FA9C20BC8CB9AB0@MWHPR11MB2000.namprd11.prod.outlook.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 11 Jan 2021 14:22:51 +0000
Message-ID: <CAM9ZRVuG7ZBZX1C+MB+NfX-ctqAq+tPN3vs-915g2_cFCXS_uQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] wic: Add workdir argument
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Jan 2021 at 14:17, Lee, Chee Yang <chee.yang.lee@intel.com> wrote:
>
> You might want to update scripts/lib/wic/help.py with description for this new features too

/me looks at help.py

That is really frustrating. The help output should be generated from
the argument parsers instead of carrying hand-written duplicate
information.

-- 
Paul Barker
Konsulko Group
