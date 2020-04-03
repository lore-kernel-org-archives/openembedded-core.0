Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.13544.1585927209145777699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 08:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JB4WDBMW;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id h131so7882103iof.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=5NlR3mWxwiIdAlFquNFrFYMB4oYsz7/NFEw1CogLDpk=;
        b=JB4WDBMWfdI5ETQvN2mV8pj62yamJpOZRwOonQgUbmLajx66gx/BXY9JsUDHbLJ8rm
         wJTnS7yYwVln+fShzMztdsoVxxPqayf4hPxHRsVqHVTn/x6rpnh5pnnlPDMnEyl80Yhk
         IEtcmKbHrtzllqHUa0dzq/RlRKF8dkk5aSzgwIa9dZMJGC1iYg927ZteoOncPJqYcCdy
         V1YLMN+mAuFiggeyh22Q5zg3y786sAB5jjDsX38Ys5Qj4owGywsf1Mcv5I6kk2HQfymy
         ENrD1pqejmE+vIOHph+05G9IMvnTsco+rdAqdMK3D9HhswtY0zrBnztMh312Fhba/9V5
         idbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=5NlR3mWxwiIdAlFquNFrFYMB4oYsz7/NFEw1CogLDpk=;
        b=eEMKwKHPsFEPSGgP70BIoF0RcDIbqWMQEt/1TI7RHN4IBX7+eFQTo0td6Jr+BbBEZl
         mVuGrIPBbTG5aXK9HIcxSZaghcQ/YJMPBjblceQvDVxXYt2nGAPC5xF0wmKA3YjsINxU
         xOgB++fLcubZGiGKec20F6mgVuu469X2EMntvl6Jc0sbo6K6kmWipEIIz8nXUE5Hg3kM
         4OkHbM7QeGiWsBWkmKa3r1qTjcAgHTdSY4dCYUEwMoGL1oG4u+g52Z1Au0ezBHCmftB6
         b4i8mSTyXt+fVk4XBmnECggWydSxqLgHZ8UtxAdavAPZOjVFkLUY+/aKbQTMeOiLkVYi
         8poA==
X-Gm-Message-State: AGi0PuZn1dpKdpeszhFNMi784FzGm+BMBEARLqQqb3Xo7eMcbhlGaoek
	Vi6mnBx0QX7gCDoNEbbNw7OXdziyB8bRCc5dpEM=
X-Google-Smtp-Source: APiQypIMij6B4HY++4acBp8I7B5rUlWxm2uarPqZSQjKFjMVT7qghnkBytAP/pt8f8+hlnC3crZcu6uJVwHX7LL0QAo=
X-Received: by 2002:a05:6638:24c:: with SMTP id w12mr8853646jaq.42.1585927208545;
 Fri, 03 Apr 2020 08:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAM15ne=BtZqVdByS9VxHPSyDk+uAMVEWL6cQAaP8KXC_HX_DPA@mail.gmail.com>
 <CAO5Uq5QYE9Cn1DQxUtnKptqwyzpbUyY8dMaYMdwAm55yHj4mLQ@mail.gmail.com> <CAM15nenPsBbL95RwC21UT9B7U0MY0y9pXYu+=-560C0tks=s6g@mail.gmail.com>
In-Reply-To: <CAM15nenPsBbL95RwC21UT9B7U0MY0y9pXYu+=-560C0tks=s6g@mail.gmail.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Fri, 3 Apr 2020 16:19:57 +0100
Message-ID: <CAO5Uq5SzYq5se-=xdAgGZPHC_JO9=OMd7YPLWziDeH8AZwV0mA@mail.gmail.com>
Subject: Re: [OE-core] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
To: Arnaud Pecoraro <arnaud.pecoraro@externs.easymile.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 3, 2020 at 3:08 PM Arnaud Pecoraro
<arnaud.pecoraro@externs.easymile.com> wrote:
>
> Thanks for your answer.
>
> I am currently working with zeus revision of poky, but the check is in master as well:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/rootfs-postcommands.bbclass?h=master#n306
>

The method is there, but nothing pulls it into the image in poky. I'd
check your other layers.

-- 
Alex Kiernan
