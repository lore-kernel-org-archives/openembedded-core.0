Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web12.5152.1591905714168705218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 13:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=i1cYScFl;
 spf=pass (domain: konsulko.com, ip: 209.85.167.178, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f178.google.com with SMTP id a137so6588645oii.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2020 13:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XxK/SuwjOLfHUIH7ozHovNgcO+WrSRV51wUn6opdOwI=;
        b=i1cYScFlv2ABjWFlMI3D38GF12Omeivjj69Vn8beIBoaOBG4NRUswuUD8yJ6KOwpJd
         493RoicZsheFotSjd7DaZHSVp4grS6YI9pzgCamCqRaHQGhtl2VTnfrCOJaxU6skP03X
         1DTuYO9o58HZjbHbD++8NzW43sNm7WgOdHsvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XxK/SuwjOLfHUIH7ozHovNgcO+WrSRV51wUn6opdOwI=;
        b=IPYhbIkWxzdu+dyifHRQjef1UBSm8uj0KegSYjEETA/g1kVjNxMYAjKjgO15tnTt8T
         wx89TJRwUMx2WxDuWuRvp9osRHzbnkuc8wx3ttEaei0luKxqMZV53SkpgLZA5DBsgd+p
         6jt4r4+2V92rLF7qOcdlN7GLqXbUTeijm49Hw7QZQRg7XZuLayJmel9zQ8szdRqMXPIw
         NF2bUVO7sC0MyYiLU8vyS+4rZj9yQ3BftvDE9SXbwENQ/Dwb//qPjkHEOAx8C20dhbIQ
         gGpc1Bv2XntK6OpbdrQuZnO5i4BhKFce7QV33PdIQZqIOl82VC+cFTys0cI6TLJ+zeyj
         rV5w==
X-Gm-Message-State: AOAM530ZlKU/ppNpND7bhn9v/4wjloUds/0kqYVryYPTU80Ck4DJyn1E
	uScUUBKXjdOWpwnwcB37MAytRkCLEywMF0iXKQJa+A==
X-Google-Smtp-Source: ABdhPJy4Wo1SqtVH++ekl6VLUMr9eOSxPlQiPxUArBaUz5V4462wRZUeQeK5a+oLcgs9r+USlFe3XSE0V4MSUBd5ycU=
X-Received: by 2002:a05:6808:a97:: with SMTP id q23mr5492408oij.6.1591905713314;
 Thu, 11 Jun 2020 13:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAM9ZRVurC-sSFJrVN_QQmKGoqGp=VRWEg6LdhWCzsn9g3od=Lg@mail.gmail.com>
 <6467.1591902960377778854@lists.openembedded.org>
In-Reply-To: <6467.1591902960377778854@lists.openembedded.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 11 Jun 2020 21:01:42 +0100
Message-ID: <CAM9ZRVtoYwamXjtN5NciNzMg746xAa5N1K6nNOdHzbsCBo46RQ@mail.gmail.com>
Subject: Re: [OE-core] Changing kernel to the Mainline kernel ,linux-stable instead of linux-raspberrypi
To: Pankaj Vinadrao Joshi <pankaj.vj@exaleapsemi.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2020 at 20:16, Pankaj Vinadrao Joshi
<pankaj.vj@exaleapsemi.com> wrote:
>
>
> Thanks for response..You have provided the link ,But i want to build specifically for 5.4.3 only ,where i should change in the existing file so that i will be able to build the image for same since i am very new to yocto can you help me out ??

Why do you want to use an old patch release in the 5.4 series? You
should be using the latest patch release in a stable series so that
you've got all the bug and security fixes.

Thanks,

-- 
Paul Barker
Konsulko Group
