Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.13764.1613505008570329941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 11:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VZzwZrJ/;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.43, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f43.google.com with SMTP id a207so2356876wmd.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 11:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tmnAx13E7O3cZEAg+WHhevCUoOYTkOM/x0P0Dk8N1lg=;
        b=VZzwZrJ/+/WiS8LYRaCeejUWFLduAQr9fmFijv9bYBGJiiGlfGgKd+t06OSDcOf9i9
         7Td/u5EbcMDes4jRplkBH6v9RMvWHQgGdD6ztZrdhCadiVBcacAL5Kb1uP5vpFwlDCsF
         8YwksiZ7Bde2Cto21y3OwI7gTstp0OW8HCG997OFcAvOieyxNNdQerDDi5dB2GurG02e
         CanlcO0ZrfhGONxv2xEN+w937GjJZ/W8ysOxDhUA/AQ2k2SguwCfNQ5y7R6pa4eTfq4v
         RB23kUcR/g7Sc9Kp84zOy2JWwnvYiNZ2+TMA40HdQvQcfrGFo2LEGWMCDky9HeBr6kBJ
         z5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tmnAx13E7O3cZEAg+WHhevCUoOYTkOM/x0P0Dk8N1lg=;
        b=qs9GJegxSLkyPpgSvaQ1JafrvqfkOo8pDZu0rCEjctOt8BDQJh4IwTXkuSFtPOyZkq
         I4w4iRBpoBBDK8XdU3II3DYFyjUuM+TqR6UCmh1yeeO7dH6waOvr3QJ7Avt2negyPmQk
         Ga8mjyB5OXc2KckPIqcNoDTWuuSiby2U/otC40g8eDLzuaKn8SyEIiXpFvwlHlXTGB7E
         Ki04DOHzn07ct5e9YnPJqbH12iIKbn6Bk75koij4mDzc+d4jbRuInB5wyJFEUFybfCR6
         DblUw3KECRX7v3kTVO5HElwpgn+EqJOOrbjNPd+AZcjZ66bO5z7npqR0rPtZtZ1VLVQS
         TNYQ==
X-Gm-Message-State: AOAM53049xP05hj/ia2agkZ97AwgpZhGV1B/A8TwSZhX21lkx54+N6W8
	MlACIiRudBHPB24iUwi3jVkwe53bBW9QKdIcGp+faA==
X-Google-Smtp-Source: ABdhPJx9S+opomMytUdWlQR++k6kM8JNGXfnZ7o+l/S7tj1r67VJ/MPgLC2gNO8TmzGBhb2/F4DUos6kXVrS3luIURA=
X-Received: by 2002:a05:600c:4f85:: with SMTP id n5mr4417319wmq.3.1613505006884;
 Tue, 16 Feb 2021 11:50:06 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxda=kB8f8ddFh0ZV2PeHSWNGVP=zjL0in4EgBSVP3oL6UA@mail.gmail.com>
 <a0bcf116-70ac-57bb-ab6a-d9ef67bd9fa1@gmail.com>
In-Reply-To: <a0bcf116-70ac-57bb-ab6a-d9ef67bd9fa1@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 16 Feb 2021 09:49:55 -1000
Message-ID: <CAOSpxdZO=zFWbcP_BBGLPcwbXEaCcUthsuq-N1zEBVC54XnooQ@mail.gmail.com>
Subject: Re: [OE-core] CVE's for linux-yocto
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 16, 2021 at 9:02 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 2/16/21 10:23 AM, Steve Sakoman wrote:
> > The weekly cve reports for master, gatesgarth, and dunfell currently
> > omit linux-yocto since the CPE database for the kernel is notoriously
> > incomplete in versioning information.
> >
> > This morning at the YP technical team meeting we discussed this and
> > decided to see if we might, as a team, expend some effort to update
> > the CPE database to improve this situation (much as we have been doing
> > for the other packages in oe-core)
> >
> > The first step in this process is to shine some light on the current
> > situation, so below is a list of the current CVE hits for linux-yocto
> > in all three branches.
>
> Thanks Steve.
> What kernel versions are these for?

Basically whatever is the current linux-yocto version for the default
machine in each branch, since I don't change the default local.conf

I know dunfell is at 5.4, I believe gatesgarth is on 5.8, and I'm not
sure about master.

Steve

> - armin
> >
> > Steve
> >
> > CVE list for linux-yocto master branch
> >
> > CVE-1999-0524: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0524 *
> > CVE-1999-0656: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0656 *
> > CVE-2006-2932: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2006-2932 *
> > CVE-2007-2764: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2764 *
> > CVE-2007-4998: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4998 *
> > CVE-2008-4609: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4609 *
> > CVE-2010-0298: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0298 *
> > CVE-2010-4563: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4563 *
> > CVE-2011-0640: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-0640 *
> > CVE-2014-2648: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2648 *
> > CVE-2014-8171: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8171 *
> > CVE-2016-0774: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-0774 *
> > CVE-2016-3695: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3695 *
> > CVE-2016-3699: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3699 *
> > CVE-2017-1000255: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000255 *
> > CVE-2017-1000377: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000377 *
> > CVE-2017-5897: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5897 *
> > CVE-2017-6264: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6264 *
> > CVE-2018-1000026: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000026 *
> > CVE-2018-10840: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10840 *
> > CVE-2018-10876: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10876 *
> > CVE-2018-10882: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10882 *
> > CVE-2018-10901: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10901 *
> > CVE-2018-10902: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10902 *
> > CVE-2018-14625: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-14625 *
> > CVE-2018-16880: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16880 *
> > CVE-2018-16884: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16884 *
> > CVE-2018-5873: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-5873 *
> > CVE-2018-6559: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6559 *
> > CVE-2019-10126: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10126 *
> > CVE-2019-14899: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
> > CVE-2019-3016: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3016 *
> > CVE-2019-3819: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3819 *
> > CVE-2019-3846: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3846 *
> > CVE-2019-3887: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3887 *
> > CVE-2020-10732: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10732 *
> > CVE-2020-16119: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16119 *
> > CVE-2020-1749: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1749 *
> > CVE-2020-8834: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8834 *
> > CVE-2021-26708: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26708 *
> > CVE-2021-3348: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3348 *
> >
> > CVE list for linux-yocto gatesgarth
> >
> > CVE-1999-0524: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0524 *
> > CVE-1999-0656: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0656 *
> > CVE-2006-2932: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2006-2932 *
> > CVE-2007-2764: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2764 *
> > CVE-2007-4998: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4998 *
> > CVE-2008-4609: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4609 *
> > CVE-2010-0298: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0298 *
> > CVE-2010-4563: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4563 *
> > CVE-2011-0640: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-0640 *
> > CVE-2014-2648: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2648 *
> > CVE-2014-8171: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8171 *
> > CVE-2016-0774: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-0774 *
> > CVE-2016-3695: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3695 *
> > CVE-2016-3699: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3699 *
> > CVE-2017-1000255: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000255 *
> > CVE-2017-1000377: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000377 *
> > CVE-2017-5897: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5897 *
> > CVE-2017-6264: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6264 *
> > CVE-2018-1000026: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000026 *
> > CVE-2018-10840: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10840 *
> > CVE-2018-10876: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10876 *
> > CVE-2018-10882: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10882 *
> > CVE-2018-10901: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10901 *
> > CVE-2018-10902: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10902 *
> > CVE-2018-14625: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-14625 *
> > CVE-2018-16880: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16880 *
> > CVE-2018-16884: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16884 *
> > CVE-2018-5873: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-5873 *
> > CVE-2018-6559: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6559 *
> > CVE-2019-10126: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10126 *
> > CVE-2019-14899: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
> > CVE-2019-3016: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3016 *
> > CVE-2019-3819: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3819 *
> > CVE-2019-3846: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3846 *
> > CVE-2019-3887: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3887 *
> > CVE-2020-10732: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10732 *
> > CVE-2020-14385: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14385 *
> > CVE-2020-14386: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14386 *
> > CVE-2020-14390: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14390 *
> > CVE-2020-16119: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16119 *
> > CVE-2020-1749: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1749 *
> > CVE-2020-25645: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25645 *
> > CVE-2020-25656: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25656 *
> > CVE-2020-25704: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25704 *
> > CVE-2020-25705: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25705 *
> > CVE-2020-27152: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27152 *
> > CVE-2020-27673: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27673 *
> > CVE-2020-27675: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27675 *
> > CVE-2020-27777: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27777 *
> > CVE-2020-28374: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28374 *
> > CVE-2020-28941: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28941 *
> > CVE-2020-28974: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28974 *
> > CVE-2020-29534: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29534 *
> > CVE-2020-29569: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29569 *
> > CVE-2020-29660: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29660 *
> > CVE-2020-29661: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29661 *
> > CVE-2020-36158: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-36158 *
> > CVE-2020-8834: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8834 *
> > CVE-2021-26708: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26708 *
> > CVE-2021-3178: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3178 *
> > CVE-2021-3347: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3347 *
> > CVE-2021-3348: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3348 *
> >
> >  CVE list for linux-yocto dunfell branch
> >
> > CVE-1999-0524: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0524 *
> > CVE-1999-0656: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0656 *
> > CVE-2006-2932: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2006-2932 *
> > CVE-2007-2764: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2764 *
> > CVE-2007-4998: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4998 *
> > CVE-2008-4609: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4609 *
> > CVE-2010-0298: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0298 *
> > CVE-2010-4563: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4563 *
> > CVE-2011-0640: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-0640 *
> > CVE-2014-2648: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2648 *
> > CVE-2014-8171: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8171 *
> > CVE-2016-0774: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-0774 *
> > CVE-2016-3695: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3695 *
> > CVE-2016-3699: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3699 *
> > CVE-2017-1000255: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000255 *
> > CVE-2017-1000377: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000377 *
> > CVE-2017-5897: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5897 *
> > CVE-2017-6264: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6264 *
> > CVE-2018-1000026: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000026 *
> > CVE-2018-10840: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10840 *
> > CVE-2018-10876: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10876 *
> > CVE-2018-10882: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10882 *
> > CVE-2018-10901: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10901 *
> > CVE-2018-10902: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10902 *
> > CVE-2018-14625: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-14625 *
> > CVE-2018-16880: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16880 *
> > CVE-2018-16884: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16884 *
> > CVE-2018-5873: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-5873 *
> > CVE-2018-6559: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6559 *
> > CVE-2019-10126: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10126 *
> > CVE-2019-14899: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
> > CVE-2019-19338: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-19338 *
> > CVE-2019-20794: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20794 *
> > CVE-2019-20810: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20810 *
> > CVE-2019-3016: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3016 *
> > CVE-2019-3819: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3819 *
> > CVE-2019-3846: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3846 *
> > CVE-2019-3887: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3887 *
> > CVE-2020-10690: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10690 *
> > CVE-2020-10711: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10711 *
> > CVE-2020-10732: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10732 *
> > CVE-2020-10757: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10757 *
> > CVE-2020-10766: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10766 *
> > CVE-2020-10767: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10767 *
> > CVE-2020-10768: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10768 *
> > CVE-2020-10781: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10781 *
> > CVE-2020-10942: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10942 *
> > CVE-2020-11494: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11494 *
> > CVE-2020-11565: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11565 *
> > CVE-2020-11608: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11608 *
> > CVE-2020-11609: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11609 *
> > CVE-2020-11668: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11668 *
> > CVE-2020-11725: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11725 *
> > CVE-2020-11884: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11884 *
> > CVE-2020-12464: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12464 *
> > CVE-2020-12465: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12465 *
> > CVE-2020-12653: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12653 *
> > CVE-2020-12654: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12654 *
> > CVE-2020-12655: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12655 *
> > CVE-2020-12656: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12656 *
> > CVE-2020-12657: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12657 *
> > CVE-2020-12659: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12659 *
> > CVE-2020-12768: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12768 *
> > CVE-2020-12770: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12770 *
> > CVE-2020-12771: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12771 *
> > CVE-2020-12826: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12826 *
> > CVE-2020-12888: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12888 *
> > CVE-2020-13143: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13143 *
> > CVE-2020-13974: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13974 *
> > CVE-2020-14314: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14314 *
> > CVE-2020-14331: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14331 *
> > CVE-2020-14351: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14351 *
> > CVE-2020-14356: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14356 *
> > CVE-2020-14381: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14381 *
> > CVE-2020-14385: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14385 *
> > CVE-2020-14386: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14386 *
> > CVE-2020-14390: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14390 *
> > CVE-2020-15393: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15393 *
> > CVE-2020-15436: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15436 *
> > CVE-2020-15437: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15437 *
> > CVE-2020-15780: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15780 *
> > CVE-2020-16119: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16119 *
> > CVE-2020-16166: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16166 *
> > CVE-2020-1749: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1749 *
> > CVE-2020-24394: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24394 *
> > CVE-2020-25211: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25211 *
> > CVE-2020-25212: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25212 *
> > CVE-2020-25284: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25284 *
> > CVE-2020-25285: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25285 *
> > CVE-2020-25641: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25641 *
> > CVE-2020-25643: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25643 *
> > CVE-2020-25645: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25645 *
> > CVE-2020-25656: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25656 *
> > CVE-2020-25704: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25704 *
> > CVE-2020-25705: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25705 *
> > CVE-2020-26088: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26088 *
> > CVE-2020-26541: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26541 *
> > CVE-2020-27152: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27152 *
> > CVE-2020-27194: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27194 *
> > CVE-2020-27673: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27673 *
> > CVE-2020-27675: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27675 *
> > CVE-2020-27777: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27777 *
> > CVE-2020-28374: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28374 *
> > CVE-2020-28915: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28915 *
> > CVE-2020-28941: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28941 *
> > CVE-2020-28974: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28974 *
> > CVE-2020-29368: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29368 *
> > CVE-2020-29369: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29369 *
> > CVE-2020-29370: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29370 *
> > CVE-2020-29371: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29371 *
> > CVE-2020-29372: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29372 *
> > CVE-2020-29373: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29373 *
> > CVE-2020-29374: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29374 *
> > CVE-2020-29534: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29534 *
> > CVE-2020-29569: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29569 *
> > CVE-2020-29660: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29660 *
> > CVE-2020-29661: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29661 *
> > CVE-2020-36158: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-36158 *
> > CVE-2020-8428: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8428 *
> > CVE-2020-8647: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8647 *
> > CVE-2020-8648: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8648 *
> > CVE-2020-8649: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8649 *
> > CVE-2020-8834: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8834 *
> > CVE-2020-8992: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8992 *
> > CVE-2020-9383: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9383 *
> > CVE-2021-26708: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26708 *
> > CVE-2021-3178: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3178 *
> > CVE-2021-3347: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3347 *
> > CVE-2021-3348: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3348 *
> >
> > 
> >
>
