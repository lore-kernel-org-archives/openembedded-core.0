Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.13029.1613502133855898384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 11:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ofhw8AXn;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id n10so6823361pgl.10
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 11:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aM+cprsiUwVTKj9uPaZUpwqvavtGHGy8Bb1rDngfmPg=;
        b=Ofhw8AXnfDw0hRM1f/6DwhVcEd+9W33Cj+q7942Dz2XbOqAXhLT7YLk89a+joXtxgj
         wy3wHOrA3Y3iLcyG6gpuiWfaJxRsDfOCZ20IfiKKQOcU0KfAytyrJwAf7GzxdsYmIoCh
         F9x/SbQpJ/QHu1XPXSIwIb74i26SYI6HgG7Tn0vSUNTIbOntaL+bova49pvDIBCZktlh
         2tPWCJR/MBF7pl83jv7vDSJTOfwpSlO7bD8l2pxd1HsgyvJ9SHUMdwIXx+jVsjJwgDXn
         di2xcv2vpNDM5AaueIwNVg/pJrhS3T5TPcB9Yl09o0Jz5vRIhBjpyGO8S15MhBosnsaR
         qfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aM+cprsiUwVTKj9uPaZUpwqvavtGHGy8Bb1rDngfmPg=;
        b=XApUUSGjkPyR1YDnuqtNe2Iv9qj/uejV3VxRQP257NYup9HHzYe3GZdedBO09/4xpQ
         EHBnDb9E71r8ay+PdqjWHjD/zVgCm9ni/tjti/jHabam/g1bxLxCap1wzQJBmBYZf8RH
         EAQyPj9SwRMcqhrncQaiJ4Av6iOYaW7QLuYT7QsnGA0qmApSZjQ7CVBIMWaarsQGZ61Y
         Dx71HrhV/7Pw6DTK//HuXT4GtJU8m3Fz8q5yQ1Bdj6/nZpA0s4MM7Axc1qNMRety51zF
         o1G18qZ1ANvozJXUG8ULhO3LBBGn40fsAAzTMlnirKHwzc75IOohIVwXlsPOUWYRoAKF
         qr/Q==
X-Gm-Message-State: AOAM533QF4QooSF+sWf934w/4MwAiTuI+Y8f4QL4MzDk8Myts5Qhxwzg
	n8qRWs4KuzIzUYjKiS//pXa9ukQ/YYpThg==
X-Google-Smtp-Source: ABdhPJx+HZOaTCEpWfXaluBj3GzmBH5mRcm4JHVucTHi2ArE4D0vzFMN5Eui724jPK6E7UEGLru3RQ==
X-Received: by 2002:a65:648e:: with SMTP id e14mr20542727pgv.453.1613502132936;
        Tue, 16 Feb 2021 11:02:12 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:3567:4d62:c82e:b7f7? ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id t77sm23141939pfc.119.2021.02.16.11.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Feb 2021 11:02:12 -0800 (PST)
Subject: Re: [OE-core] CVE's for linux-yocto
To: Steve Sakoman <steve@sakoman.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CAOSpxda=kB8f8ddFh0ZV2PeHSWNGVP=zjL0in4EgBSVP3oL6UA@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a0bcf116-70ac-57bb-ab6a-d9ef67bd9fa1@gmail.com>
Date: Tue, 16 Feb 2021 11:02:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxda=kB8f8ddFh0ZV2PeHSWNGVP=zjL0in4EgBSVP3oL6UA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/16/21 10:23 AM, Steve Sakoman wrote:
> The weekly cve reports for master, gatesgarth, and dunfell currently
> omit linux-yocto since the CPE database for the kernel is notoriously
> incomplete in versioning information.
>
> This morning at the YP technical team meeting we discussed this and
> decided to see if we might, as a team, expend some effort to update
> the CPE database to improve this situation (much as we have been doing
> for the other packages in oe-core)
>
> The first step in this process is to shine some light on the current
> situation, so below is a list of the current CVE hits for linux-yocto
> in all three branches.

Thanks Steve.
What kernel versions are these for?
- armin
>
> Steve
>
> CVE list for linux-yocto master branch
>
> CVE-1999-0524: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0524 *
> CVE-1999-0656: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0656 *
> CVE-2006-2932: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2006-2932 *
> CVE-2007-2764: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2764 *
> CVE-2007-4998: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4998 *
> CVE-2008-4609: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4609 *
> CVE-2010-0298: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0298 *
> CVE-2010-4563: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4563 *
> CVE-2011-0640: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-0640 *
> CVE-2014-2648: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2648 *
> CVE-2014-8171: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8171 *
> CVE-2016-0774: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-0774 *
> CVE-2016-3695: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3695 *
> CVE-2016-3699: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3699 *
> CVE-2017-1000255: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000255 *
> CVE-2017-1000377: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000377 *
> CVE-2017-5897: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5897 *
> CVE-2017-6264: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6264 *
> CVE-2018-1000026: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000026 *
> CVE-2018-10840: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10840 *
> CVE-2018-10876: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10876 *
> CVE-2018-10882: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10882 *
> CVE-2018-10901: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10901 *
> CVE-2018-10902: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10902 *
> CVE-2018-14625: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-14625 *
> CVE-2018-16880: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16880 *
> CVE-2018-16884: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16884 *
> CVE-2018-5873: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-5873 *
> CVE-2018-6559: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6559 *
> CVE-2019-10126: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10126 *
> CVE-2019-14899: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
> CVE-2019-3016: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3016 *
> CVE-2019-3819: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3819 *
> CVE-2019-3846: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3846 *
> CVE-2019-3887: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3887 *
> CVE-2020-10732: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10732 *
> CVE-2020-16119: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16119 *
> CVE-2020-1749: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1749 *
> CVE-2020-8834: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8834 *
> CVE-2021-26708: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26708 *
> CVE-2021-3348: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3348 *
>
> CVE list for linux-yocto gatesgarth
>
> CVE-1999-0524: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0524 *
> CVE-1999-0656: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0656 *
> CVE-2006-2932: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2006-2932 *
> CVE-2007-2764: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2764 *
> CVE-2007-4998: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4998 *
> CVE-2008-4609: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4609 *
> CVE-2010-0298: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0298 *
> CVE-2010-4563: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4563 *
> CVE-2011-0640: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-0640 *
> CVE-2014-2648: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2648 *
> CVE-2014-8171: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8171 *
> CVE-2016-0774: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-0774 *
> CVE-2016-3695: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3695 *
> CVE-2016-3699: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3699 *
> CVE-2017-1000255: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000255 *
> CVE-2017-1000377: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000377 *
> CVE-2017-5897: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5897 *
> CVE-2017-6264: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6264 *
> CVE-2018-1000026: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000026 *
> CVE-2018-10840: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10840 *
> CVE-2018-10876: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10876 *
> CVE-2018-10882: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10882 *
> CVE-2018-10901: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10901 *
> CVE-2018-10902: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10902 *
> CVE-2018-14625: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-14625 *
> CVE-2018-16880: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16880 *
> CVE-2018-16884: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16884 *
> CVE-2018-5873: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-5873 *
> CVE-2018-6559: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6559 *
> CVE-2019-10126: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10126 *
> CVE-2019-14899: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
> CVE-2019-3016: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3016 *
> CVE-2019-3819: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3819 *
> CVE-2019-3846: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3846 *
> CVE-2019-3887: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3887 *
> CVE-2020-10732: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10732 *
> CVE-2020-14385: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14385 *
> CVE-2020-14386: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14386 *
> CVE-2020-14390: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14390 *
> CVE-2020-16119: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16119 *
> CVE-2020-1749: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1749 *
> CVE-2020-25645: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25645 *
> CVE-2020-25656: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25656 *
> CVE-2020-25704: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25704 *
> CVE-2020-25705: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25705 *
> CVE-2020-27152: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27152 *
> CVE-2020-27673: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27673 *
> CVE-2020-27675: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27675 *
> CVE-2020-27777: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27777 *
> CVE-2020-28374: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28374 *
> CVE-2020-28941: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28941 *
> CVE-2020-28974: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28974 *
> CVE-2020-29534: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29534 *
> CVE-2020-29569: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29569 *
> CVE-2020-29660: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29660 *
> CVE-2020-29661: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29661 *
> CVE-2020-36158: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-36158 *
> CVE-2020-8834: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8834 *
> CVE-2021-26708: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26708 *
> CVE-2021-3178: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3178 *
> CVE-2021-3347: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3347 *
> CVE-2021-3348: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3348 *
>
>  CVE list for linux-yocto dunfell branch
>
> CVE-1999-0524: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0524 *
> CVE-1999-0656: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0656 *
> CVE-2006-2932: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2006-2932 *
> CVE-2007-2764: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2764 *
> CVE-2007-4998: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4998 *
> CVE-2008-4609: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4609 *
> CVE-2010-0298: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0298 *
> CVE-2010-4563: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4563 *
> CVE-2011-0640: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-0640 *
> CVE-2014-2648: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2648 *
> CVE-2014-8171: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8171 *
> CVE-2016-0774: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-0774 *
> CVE-2016-3695: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3695 *
> CVE-2016-3699: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3699 *
> CVE-2017-1000255: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000255 *
> CVE-2017-1000377: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000377 *
> CVE-2017-5897: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5897 *
> CVE-2017-6264: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6264 *
> CVE-2018-1000026: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000026 *
> CVE-2018-10840: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10840 *
> CVE-2018-10876: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10876 *
> CVE-2018-10882: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10882 *
> CVE-2018-10901: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10901 *
> CVE-2018-10902: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10902 *
> CVE-2018-14625: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-14625 *
> CVE-2018-16880: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16880 *
> CVE-2018-16884: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16884 *
> CVE-2018-5873: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-5873 *
> CVE-2018-6559: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6559 *
> CVE-2019-10126: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10126 *
> CVE-2019-14899: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
> CVE-2019-19338: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-19338 *
> CVE-2019-20794: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20794 *
> CVE-2019-20810: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20810 *
> CVE-2019-3016: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3016 *
> CVE-2019-3819: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3819 *
> CVE-2019-3846: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3846 *
> CVE-2019-3887: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3887 *
> CVE-2020-10690: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10690 *
> CVE-2020-10711: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10711 *
> CVE-2020-10732: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10732 *
> CVE-2020-10757: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10757 *
> CVE-2020-10766: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10766 *
> CVE-2020-10767: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10767 *
> CVE-2020-10768: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10768 *
> CVE-2020-10781: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10781 *
> CVE-2020-10942: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10942 *
> CVE-2020-11494: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11494 *
> CVE-2020-11565: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11565 *
> CVE-2020-11608: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11608 *
> CVE-2020-11609: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11609 *
> CVE-2020-11668: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11668 *
> CVE-2020-11725: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11725 *
> CVE-2020-11884: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11884 *
> CVE-2020-12464: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12464 *
> CVE-2020-12465: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12465 *
> CVE-2020-12653: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12653 *
> CVE-2020-12654: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12654 *
> CVE-2020-12655: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12655 *
> CVE-2020-12656: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12656 *
> CVE-2020-12657: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12657 *
> CVE-2020-12659: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12659 *
> CVE-2020-12768: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12768 *
> CVE-2020-12770: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12770 *
> CVE-2020-12771: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12771 *
> CVE-2020-12826: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12826 *
> CVE-2020-12888: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12888 *
> CVE-2020-13143: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13143 *
> CVE-2020-13974: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13974 *
> CVE-2020-14314: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14314 *
> CVE-2020-14331: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14331 *
> CVE-2020-14351: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14351 *
> CVE-2020-14356: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14356 *
> CVE-2020-14381: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14381 *
> CVE-2020-14385: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14385 *
> CVE-2020-14386: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14386 *
> CVE-2020-14390: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14390 *
> CVE-2020-15393: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15393 *
> CVE-2020-15436: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15436 *
> CVE-2020-15437: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15437 *
> CVE-2020-15780: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15780 *
> CVE-2020-16119: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16119 *
> CVE-2020-16166: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16166 *
> CVE-2020-1749: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1749 *
> CVE-2020-24394: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24394 *
> CVE-2020-25211: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25211 *
> CVE-2020-25212: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25212 *
> CVE-2020-25284: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25284 *
> CVE-2020-25285: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25285 *
> CVE-2020-25641: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25641 *
> CVE-2020-25643: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25643 *
> CVE-2020-25645: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25645 *
> CVE-2020-25656: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25656 *
> CVE-2020-25704: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25704 *
> CVE-2020-25705: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25705 *
> CVE-2020-26088: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26088 *
> CVE-2020-26541: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26541 *
> CVE-2020-27152: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27152 *
> CVE-2020-27194: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27194 *
> CVE-2020-27673: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27673 *
> CVE-2020-27675: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27675 *
> CVE-2020-27777: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27777 *
> CVE-2020-28374: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28374 *
> CVE-2020-28915: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28915 *
> CVE-2020-28941: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28941 *
> CVE-2020-28974: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28974 *
> CVE-2020-29368: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29368 *
> CVE-2020-29369: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29369 *
> CVE-2020-29370: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29370 *
> CVE-2020-29371: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29371 *
> CVE-2020-29372: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29372 *
> CVE-2020-29373: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29373 *
> CVE-2020-29374: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29374 *
> CVE-2020-29534: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29534 *
> CVE-2020-29569: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29569 *
> CVE-2020-29660: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29660 *
> CVE-2020-29661: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29661 *
> CVE-2020-36158: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-36158 *
> CVE-2020-8428: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8428 *
> CVE-2020-8647: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8647 *
> CVE-2020-8648: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8648 *
> CVE-2020-8649: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8649 *
> CVE-2020-8834: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8834 *
> CVE-2020-8992: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8992 *
> CVE-2020-9383: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9383 *
> CVE-2021-26708: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26708 *
> CVE-2021-3178: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3178 *
> CVE-2021-3347: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3347 *
> CVE-2021-3348: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3348 *
>
> 
>

