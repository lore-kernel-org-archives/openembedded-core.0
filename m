Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web09.10259.1604479007055602771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 00:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CD5ZpbyA;
 spf=pass (domain: konsulko.com, ip: 209.85.210.53, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f53.google.com with SMTP id 32so18650099otm.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2020 00:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9QY1hTBl4OcRyy0dl3OOAqZG0l+X2Ipbia6Tn194oS4=;
        b=CD5ZpbyApTA/hp6nysR9EGa9w06UABxqMrdBL9ssH7hIDPg1StvEuINO8LUAguEoZR
         LgNnn/eby6SPRsHUKBNsyFEoTUq93UzN73eMQanOkkOpoBvgWYrK/RsNSkqb5Cvqek0X
         /PF9x+Uqd59a20I9xkMdjSeNE8X2JU1hm904s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9QY1hTBl4OcRyy0dl3OOAqZG0l+X2Ipbia6Tn194oS4=;
        b=arUoTc2RMgl+wtLgXIzvs+jTNEW9P28R+WlPD4Nej+25q1SQhevFFyCNnd/qTFNILU
         mAHaUuK/vCdSgtKh3OhjAFi/HulX1ehDRiOXFsyqEkAvZDqXzL20DJG2EK9tFKVgIDWa
         GM4ogqzcYbNAp3bkGc4eJXUTlukWKqu0aNiB/MVp/CQeZeDRSFefTHY9+UM5iChR/DP1
         cc9J7hTVEoZvcx+fnWDxGudmqrO1jzazKQCFl30jPWU8kYo9S7Xq/17uAp1NEj51dpHx
         GT/e8RKS83BaV6A0XTy9gisv1HemKePNC7F4zWPGq1bFU8yVoeRhSbI00x2tkRgq3nVs
         XQVw==
X-Gm-Message-State: AOAM530MGtVslKGk2So11UPIRGcTl1NbaZ6yV2NCDfEg+4D3bvUXK0QU
	Eb5XDkw4XPT2OTFfZ2JV20efZ0sb1gY8CN9R8wKO8g==
X-Google-Smtp-Source: ABdhPJx7hKjLkDBPJNm+ZYE8+wmb2HhFRgCzMpXIlYcNvCfB7Cm4kV0fhbCXqOdKdvWkvFYo5nZQYjoroCw2cyILE+Y=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr5128421otc.305.1604479006374;
 Wed, 04 Nov 2020 00:36:46 -0800 (PST)
MIME-Version: 1.0
References: <CAGHO4hUyy=XL-iKKty+qLBG7cOoh97Yy1eFspoB_mQvnqySajA@mail.gmail.com>
In-Reply-To: <CAGHO4hUyy=XL-iKKty+qLBG7cOoh97Yy1eFspoB_mQvnqySajA@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 4 Nov 2020 08:36:36 +0000
Message-ID: <CAM9ZRVtpOFCKpTcoyGQ75FtGzgfWEL==KCFc2YRQk3hsAg10Ew@mail.gmail.com>
Subject: Re: [OE-core] Backport 05043a26cc297ed9834055678ac699e20e2f16d5 to warrior
To: Florin <florin@balena.io>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2020 at 08:27, Florin <florin@balena.io> wrote:
>
> Hi, we'd need 05043a26cc297ed9834055678ac699e20e2f16d5 to be backported to warrior.
> When this is backported, will this result in a new release tag? Or does this typically get merged first to warrior or warrior-next and a release tag follows only later on?

The warrior release is now End of Life (EOL):
https://wiki.yoctoproject.org/wiki/Releases

I assume you're referencing this commit in the poky repository:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=05043a26cc297ed9834055678ac699e20e2f16d5.
That looks to add support for v5.8.0 or later Linux kernel releases.
If you need support for such recent kernels I highly recommend
upgrading to the dunfell (3.1) or gatesgarth (3.2) releases.

Thanks,

-- 
Paul Barker
Konsulko Group
