Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.12409.1613499824654623655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 10:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0TFjc02K;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.47, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f47.google.com with SMTP id a207so2179577wmd.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=KLO7LusQasI6qMNoOWT0ODa1OGjVDLXCKKzEAG6IGz8=;
        b=0TFjc02KIN5bQnTfpQfAapF695Vh6k/pHoteH+sJcgGClSoswpbxVbmUzXfpdplhA8
         zBGeeSf744oiJR0Am07yWYlMkaKIjnVuTCT8ZCypCtzHgINfDb7JC22m02NIB35Y+Spb
         7uBeRMf7bZ15xPQUnkbq1FLZsYEYlGT65Y1SZAB0SckySPlZhpbQDErx5XVEHGkQ4HRF
         CtA3gG0fBgGeTdXedxdS3N6LFrtJzdkQWe4RTpLDvVhHo2iEIw4E/PlNEkxZU9S0f/+2
         iIFEsQZtWbYgWS/tql6p+UJmUHBsehAJugwnbXGNpA1ijrIMbueDDBXFijhlmUsiofvz
         LolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=KLO7LusQasI6qMNoOWT0ODa1OGjVDLXCKKzEAG6IGz8=;
        b=T+bbRpTqzDMKlAQvvDJD5vuTPI0xYRhOD9/juPwSAhrn5jLw9+RfRI9Hsr2Kkkhky8
         4GPQQAovsqN7jt2dy9pshNmUM5gdoSrHLhoR3vllFLb8diSJSdqIPYMERhR8FYGp1m+Z
         f+5W01I4Z+hBzJwUGqYwZIqPLaEVjZh9+GWHLvzzIUU3IrXKhIAGud5LWWOovYeKQOSX
         TDVqzW0Hc4mQn88bJ9SzbLz0A7rJpFo3w8mWtikmIvHpz/kuLiEsUw1w/2JE+7B4YIKW
         aXJuqGXiQDtIfsjN4CzLj3FFwN6JLpPU5OU4OJBaHQXTxQf6gQ8Vquy8bW5B3L16HSPK
         ejBQ==
X-Gm-Message-State: AOAM533CIn8UeZ/FVGrq2aUBVfZZk8FQa8AjzAg/QQOKt7FVIP8uhhA2
	LbwCiF18JbUSqb416q2pdDTaVHgpmuclfy+08MGXYIUMtkVn3j5T46I=
X-Google-Smtp-Source: ABdhPJz6v/lb5LEBdlx7FYeUWzLVIP+5FhHv/aGB2Lxq6APPZMAxuqjw3JI7vynHfZos2OKnNwh8EROSxCn4yHlri7Y=
X-Received: by 2002:a05:600c:2056:: with SMTP id p22mr4300551wmg.12.1613499822540;
 Tue, 16 Feb 2021 10:23:42 -0800 (PST)
MIME-Version: 1.0
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 16 Feb 2021 08:23:31 -1000
Message-ID: <CAOSpxda=kB8f8ddFh0ZV2PeHSWNGVP=zjL0in4EgBSVP3oL6UA@mail.gmail.com>
Subject: CVE's for linux-yocto
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

The weekly cve reports for master, gatesgarth, and dunfell currently
omit linux-yocto since the CPE database for the kernel is notoriously
incomplete in versioning information.

This morning at the YP technical team meeting we discussed this and
decided to see if we might, as a team, expend some effort to update
the CPE database to improve this situation (much as we have been doing
for the other packages in oe-core)

The first step in this process is to shine some light on the current
situation, so below is a list of the current CVE hits for linux-yocto
in all three branches.

Steve

CVE list for linux-yocto master branch

CVE-1999-0524: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0524 *
CVE-1999-0656: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0656 *
CVE-2006-2932: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2006-2932 *
CVE-2007-2764: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2764 *
CVE-2007-4998: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4998 *
CVE-2008-4609: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4609 *
CVE-2010-0298: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0298 *
CVE-2010-4563: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4563 *
CVE-2011-0640: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-0640 *
CVE-2014-2648: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2648 *
CVE-2014-8171: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8171 *
CVE-2016-0774: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-0774 *
CVE-2016-3695: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3695 *
CVE-2016-3699: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3699 *
CVE-2017-1000255: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000255 *
CVE-2017-1000377: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000377 *
CVE-2017-5897: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5897 *
CVE-2017-6264: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6264 *
CVE-2018-1000026: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000026 *
CVE-2018-10840: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10840 *
CVE-2018-10876: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10876 *
CVE-2018-10882: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10882 *
CVE-2018-10901: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10901 *
CVE-2018-10902: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10902 *
CVE-2018-14625: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-14625 *
CVE-2018-16880: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16880 *
CVE-2018-16884: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16884 *
CVE-2018-5873: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-5873 *
CVE-2018-6559: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6559 *
CVE-2019-10126: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10126 *
CVE-2019-14899: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2019-3016: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3016 *
CVE-2019-3819: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3819 *
CVE-2019-3846: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3846 *
CVE-2019-3887: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3887 *
CVE-2020-10732: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10732 *
CVE-2020-16119: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16119 *
CVE-2020-1749: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1749 *
CVE-2020-8834: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8834 *
CVE-2021-26708: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26708 *
CVE-2021-3348: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3348 *

CVE list for linux-yocto gatesgarth

CVE-1999-0524: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0524 *
CVE-1999-0656: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0656 *
CVE-2006-2932: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2006-2932 *
CVE-2007-2764: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2764 *
CVE-2007-4998: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4998 *
CVE-2008-4609: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4609 *
CVE-2010-0298: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0298 *
CVE-2010-4563: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4563 *
CVE-2011-0640: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-0640 *
CVE-2014-2648: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2648 *
CVE-2014-8171: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8171 *
CVE-2016-0774: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-0774 *
CVE-2016-3695: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3695 *
CVE-2016-3699: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3699 *
CVE-2017-1000255: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000255 *
CVE-2017-1000377: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000377 *
CVE-2017-5897: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5897 *
CVE-2017-6264: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6264 *
CVE-2018-1000026: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000026 *
CVE-2018-10840: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10840 *
CVE-2018-10876: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10876 *
CVE-2018-10882: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10882 *
CVE-2018-10901: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10901 *
CVE-2018-10902: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10902 *
CVE-2018-14625: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-14625 *
CVE-2018-16880: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16880 *
CVE-2018-16884: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16884 *
CVE-2018-5873: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-5873 *
CVE-2018-6559: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6559 *
CVE-2019-10126: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10126 *
CVE-2019-14899: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2019-3016: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3016 *
CVE-2019-3819: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3819 *
CVE-2019-3846: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3846 *
CVE-2019-3887: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3887 *
CVE-2020-10732: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10732 *
CVE-2020-14385: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14385 *
CVE-2020-14386: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14386 *
CVE-2020-14390: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14390 *
CVE-2020-16119: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16119 *
CVE-2020-1749: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1749 *
CVE-2020-25645: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25645 *
CVE-2020-25656: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25656 *
CVE-2020-25704: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25704 *
CVE-2020-25705: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25705 *
CVE-2020-27152: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27152 *
CVE-2020-27673: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27673 *
CVE-2020-27675: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27675 *
CVE-2020-27777: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27777 *
CVE-2020-28374: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28374 *
CVE-2020-28941: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28941 *
CVE-2020-28974: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28974 *
CVE-2020-29534: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29534 *
CVE-2020-29569: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29569 *
CVE-2020-29660: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29660 *
CVE-2020-29661: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29661 *
CVE-2020-36158: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-36158 *
CVE-2020-8834: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8834 *
CVE-2021-26708: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26708 *
CVE-2021-3178: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3178 *
CVE-2021-3347: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3347 *
CVE-2021-3348: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3348 *

 CVE list for linux-yocto dunfell branch

CVE-1999-0524: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0524 *
CVE-1999-0656: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0656 *
CVE-2006-2932: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2006-2932 *
CVE-2007-2764: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2764 *
CVE-2007-4998: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4998 *
CVE-2008-4609: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4609 *
CVE-2010-0298: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0298 *
CVE-2010-4563: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4563 *
CVE-2011-0640: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-0640 *
CVE-2014-2648: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2648 *
CVE-2014-8171: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8171 *
CVE-2016-0774: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-0774 *
CVE-2016-3695: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3695 *
CVE-2016-3699: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3699 *
CVE-2017-1000255: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000255 *
CVE-2017-1000377: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-1000377 *
CVE-2017-5897: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5897 *
CVE-2017-6264: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6264 *
CVE-2018-1000026: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000026 *
CVE-2018-10840: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10840 *
CVE-2018-10876: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10876 *
CVE-2018-10882: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10882 *
CVE-2018-10901: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10901 *
CVE-2018-10902: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10902 *
CVE-2018-14625: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-14625 *
CVE-2018-16880: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16880 *
CVE-2018-16884: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16884 *
CVE-2018-5873: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-5873 *
CVE-2018-6559: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6559 *
CVE-2019-10126: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10126 *
CVE-2019-14899: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2019-19338: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-19338 *
CVE-2019-20794: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20794 *
CVE-2019-20810: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20810 *
CVE-2019-3016: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3016 *
CVE-2019-3819: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3819 *
CVE-2019-3846: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3846 *
CVE-2019-3887: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-3887 *
CVE-2020-10690: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10690 *
CVE-2020-10711: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10711 *
CVE-2020-10732: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10732 *
CVE-2020-10757: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10757 *
CVE-2020-10766: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10766 *
CVE-2020-10767: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10767 *
CVE-2020-10768: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10768 *
CVE-2020-10781: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10781 *
CVE-2020-10942: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10942 *
CVE-2020-11494: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11494 *
CVE-2020-11565: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11565 *
CVE-2020-11608: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11608 *
CVE-2020-11609: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11609 *
CVE-2020-11668: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11668 *
CVE-2020-11725: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11725 *
CVE-2020-11884: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11884 *
CVE-2020-12464: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12464 *
CVE-2020-12465: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12465 *
CVE-2020-12653: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12653 *
CVE-2020-12654: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12654 *
CVE-2020-12655: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12655 *
CVE-2020-12656: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12656 *
CVE-2020-12657: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12657 *
CVE-2020-12659: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12659 *
CVE-2020-12768: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12768 *
CVE-2020-12770: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12770 *
CVE-2020-12771: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12771 *
CVE-2020-12826: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12826 *
CVE-2020-12888: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12888 *
CVE-2020-13143: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13143 *
CVE-2020-13974: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13974 *
CVE-2020-14314: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14314 *
CVE-2020-14331: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14331 *
CVE-2020-14351: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14351 *
CVE-2020-14356: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14356 *
CVE-2020-14381: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14381 *
CVE-2020-14385: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14385 *
CVE-2020-14386: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14386 *
CVE-2020-14390: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14390 *
CVE-2020-15393: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15393 *
CVE-2020-15436: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15436 *
CVE-2020-15437: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15437 *
CVE-2020-15780: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15780 *
CVE-2020-16119: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16119 *
CVE-2020-16166: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16166 *
CVE-2020-1749: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1749 *
CVE-2020-24394: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24394 *
CVE-2020-25211: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25211 *
CVE-2020-25212: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25212 *
CVE-2020-25284: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25284 *
CVE-2020-25285: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25285 *
CVE-2020-25641: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25641 *
CVE-2020-25643: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25643 *
CVE-2020-25645: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25645 *
CVE-2020-25656: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25656 *
CVE-2020-25704: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25704 *
CVE-2020-25705: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25705 *
CVE-2020-26088: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26088 *
CVE-2020-26541: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26541 *
CVE-2020-27152: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27152 *
CVE-2020-27194: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27194 *
CVE-2020-27673: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27673 *
CVE-2020-27675: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27675 *
CVE-2020-27777: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27777 *
CVE-2020-28374: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28374 *
CVE-2020-28915: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28915 *
CVE-2020-28941: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28941 *
CVE-2020-28974: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28974 *
CVE-2020-29368: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29368 *
CVE-2020-29369: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29369 *
CVE-2020-29370: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29370 *
CVE-2020-29371: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29371 *
CVE-2020-29372: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29372 *
CVE-2020-29373: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29373 *
CVE-2020-29374: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29374 *
CVE-2020-29534: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29534 *
CVE-2020-29569: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29569 *
CVE-2020-29660: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29660 *
CVE-2020-29661: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29661 *
CVE-2020-36158: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-36158 *
CVE-2020-8428: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8428 *
CVE-2020-8647: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8647 *
CVE-2020-8648: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8648 *
CVE-2020-8649: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8649 *
CVE-2020-8834: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8834 *
CVE-2020-8992: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8992 *
CVE-2020-9383: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9383 *
CVE-2021-26708: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26708 *
CVE-2021-3178: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3178 *
CVE-2021-3347: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3347 *
CVE-2021-3348: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3348 *
