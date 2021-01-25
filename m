Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.3493.1611612622398174567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 14:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YnKKe3Io;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f51.google.com with SMTP id a10so20268061ejg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 14:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0WAOyQ+N7eBNAFcgtFAn84IAkiA5A82uUpKOselvlig=;
        b=YnKKe3IohMPe0a0z6EmEUmJ8HgylA31tcKZ1ytaADtj6vda5RQZcjN2HGFgP0+AWRp
         7a1hl1DNZfmIQObOrZpR7roT+VHBf8/MKw7NYswVcBPVl66zpR4PPfSjKgh5sd5znI4C
         XJfKyDl+NQtKczXNFH09u0tPQmISdfv6wodLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0WAOyQ+N7eBNAFcgtFAn84IAkiA5A82uUpKOselvlig=;
        b=phjL8tBlLuuoP4979UEIh1H3mhCu83K2hZZNo9ufkfY4mqU92/v0+MkBoWX4q99AM6
         urns8hc9tOqB3Bxxe6kpVlIqehrfSacOETDDj6kUDHI7Pva2NFu7t4tO7Oht4bqmqZ5A
         KZRjwrzAhFSC0a1lASYh8/nNgTbOJEsOZTfrY6j5+YxKjQyil3eyemyZ9WGuhai/dUd2
         eoCuh6bg2taIdQP13coj5bQ3VqtLdluQ0v93wz+R2Ln+YZbnZ0IZIK3fHJzfg5EYZfr3
         LI2SvZM2pkk79vk2KwCEZ8EJ4G328cJQx8x+vkbwPTD7MI//a/UMemTO02NrQDF8Iy78
         gU5g==
X-Gm-Message-State: AOAM530I/7aQeBGPKP1INLEHaFCQZ90qt/wYQJX545xkWaiBxlatIpYz
	q4MhlxF2EBDBELeunMNLi9gsuQ==
X-Google-Smtp-Source: ABdhPJzxXCIL8vgIB1LhomG1jrSjU1fsL9ox2oMnUqyawD5RUw6KtO9h++w7gl36tQp0CKjwyIS4Vg==
X-Received: by 2002:a17:906:ace:: with SMTP id z14mr1618715ejf.53.1611612620700;
        Mon, 25 Jan 2021 14:10:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b393:1589:56b4:ccf1? ([2001:8b0:aba:5f3c:b393:1589:56b4:ccf1])
        by smtp.gmail.com with ESMTPSA id e7sm8889775ejb.19.2021.01.25.14.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:10:20 -0800 (PST)
Message-ID: <0d314728a5aceabe78e9d61bfe257d69396b23e3.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Jan 2021 07:15:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>, Steve Sakoman
	 <steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
	"yocto-security@lists.yoctoproject.org"
	 <yocto-security@lists.yoctoproject.org>
Date: Mon, 25 Jan 2021 22:10:17 +0000
In-Reply-To: <MWHPR11MB20005F089BE21737CFA246E7B9BD9@MWHPR11MB2000.namprd11.prod.outlook.com>
References: <20210124171809.D838F960256@nuc.router0800d9.com>
	 <cc80f8541aeef99a4625420fbf7d27dcc6abf341.camel@linuxfoundation.org>
	 <MWHPR11MB20005F089BE21737CFA246E7B9BD9@MWHPR11MB2000.namprd11.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm not sure its working. For example:

https://nvd.nist.gov/vuln/detail/CVE-2019-1543

which says it applies to:

1.1.0 to 1.1.0j
and
1.1.1 to 1.1.1b

Master has 1.1.1i which is greater than 1.1.1b so we shouldn't be shown
as at risk yet the CVE is listed.

Cheers,

Richard

On Mon, 2021-01-25 at 02:39 +0000, Lee, Chee Yang wrote:
> The changes expose these, it ignored trailing character in this version compare ( "i" in this case for openssl_1.1.1i )
> (CVE-2019-1543, CVE-2019-1547, CVE-2019-1549, CVE-2019-1551, CVE-2019-1552, CVE-2019-1563, CVE-2020-1967, CVE-2020-1971)  
> behave this way because its difficult to define the trailing characters (like version 1.1b can be 1.1 beta or patched release 1.1b) 
> 
> 
> NVD just updated these recently 
> CVE-2013-0800, CVE-2020-14409, CVE-2020-14410
> 
> 
> 
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: Monday, 25 January, 2021 7:21 AM
> > To: Steve Sakoman <steve@sakoman.com>; openembedded-
> > core@lists.openembedded.org; yocto-security@lists.yoctoproject.org
> > Cc: Lee, Chee Yang <chee.yang.lee@intel.com>
> > Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Jan 2021
> > 07:15:01 AM HST
> > 
> > On Sun, 2021-01-24 at 07:18 -1000, Steve Sakoman wrote:
> > > Branch: master
> > > 
> > > New this week:
> > > CVE-2013-0800: pixman
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
> > > CVE-2019-1543: openssl
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1543 *
> > > CVE-2019-1547: openssl
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1547 *
> > > CVE-2019-1549: openssl
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1549 *
> > > CVE-2019-1551: openssl
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1551 *
> > > CVE-2019-1552: openssl
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1552 *
> > > CVE-2019-1563: openssl
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1563 *
> > > CVE-2020-14409: libsdl2
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
> > > CVE-2020-14410: libsdl2
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
> > > CVE-2020-1967: openssl
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1967 *
> > > CVE-2020-1971: openssl
> > > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *
> > 
> > Adding Chee Yang, did the recent cve-check change mean some version
> > comparisons regressed and exposed CVEs that shouldn't be in this list, or were we
> > making some we need to fix? Or did some other change expose these?
> > 
> > Cheers,
> > 
> > Richard
> > 
> > 
> 
> 


