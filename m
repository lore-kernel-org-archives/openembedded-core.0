Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web08.11158.1631725439463606210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 10:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M4nLqP9K;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id r4so7105084ybp.4
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gc6R3ewn7rbIgnGmIDjf2nkyI7PuC2e/Alg0NY8TRUY=;
        b=M4nLqP9K9FJRByyn3TUkYuFWH2G6zT2L+7kXMnBH2LSI3UMpj3Kg6sn7Rn1XAVmfO7
         9j4WoS0seWO+lwewovzL3B+MaM0w+fiEUQOwq/Gajb2pjibyRXO+i8hGr+Cm5wimgILa
         0Lbb5ENHpHC8eXU/IDCZep6nFwQk+SFcXY0hZVcJAYj2uI0mCFxYtBGPX1gCTQtLAaMa
         0vGSS6+KCBacpZVYLHS9GYt3BKgjx+uHO1+0K9EGoXfpzoRwAI1bP6PrOFGr21QF6fXU
         YiAnDJJTyGzf0k37xVVgfxyytYB3JhOy0YXPbtG6ZLSRwOtei1I/3dx9B2Rx7oBnzXCd
         jH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gc6R3ewn7rbIgnGmIDjf2nkyI7PuC2e/Alg0NY8TRUY=;
        b=yIypNF1eIqw9BAuPXr7JJXQrx4/oqwXsEgdvhSUPlbx2EZqvpSCmgKsJ1yInOBZDF3
         6aiLAea00ODa+uolq6zhjVB06hjSpGy3cGBZN/agERokZLTxo0sPaeqiQd5lFCN055/G
         ZF5p4OvmtQGVNXJlnAnUHEMMO9qCyaoV7FRFju5csfrWr+bvhhxZtkosokbY6IkeV5D8
         MpD3UuPAfoEmQ0tVV7+Ed70/I2pu1aHTWijdncLXpl31HeTnMMOdReEteFLb3nudjeTS
         IL5hbkaJrgjuhy2e3/Rd83ZfguuGN8Yz+c0zGZf8a4b1f/pXqV2Pzwfkm93jSn2EDn+T
         9uaA==
X-Gm-Message-State: AOAM532VtNp/FUxtWbFtqA2lHXCtTdbnn+Pnq0I4NqnITmScko0aVhYZ
	dVGUBzAD6o07F8ODfMhGsWquZJJPxCywkjDX9kw=
X-Google-Smtp-Source: ABdhPJzyd1DwUTigsgFQDPSdR2D22Ma3CBKzhTHJ9kkb+h2vhANag80wUugI8C0eaOQE7wlFyIGCgLonotpjf+99TzU=
X-Received: by 2002:a25:49c2:: with SMTP id w185mr1201058yba.294.1631725438636;
 Wed, 15 Sep 2021 10:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210912150121.8237296032A@nuc.router0800d9.com> <643057cf221a41e13ae92c496ad6358a2a6db265.camel@intel.com>
In-Reply-To: <643057cf221a41e13ae92c496ad6358a2a6db265.camel@intel.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 15 Sep 2021 07:03:47 -1000
Message-ID: <CAGDS+n=ahKnoqQ2V4f7Qr-CXW1CHswBpyPRNmKxryBiRHOK88Q@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for hardknott on Sun 12 Sep 2021 05:00:01 AM HST
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 15, 2021 at 6:59 AM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> Can we also set commercial flag while generating this list so recipes
> like ffmpeg are also picked up?

Yes, I can do that.

Steve

>
> Thanks,
>
> Anuj
>
> On Sun, 2021-09-12 at 05:01 -1000, Steve Sakoman wrote:
> > Branch: hardknott
> >
> > New this week: 0 CVEs
> >
> > Removed this week: 2 CVEs
> > CVE-2020-27748: xdg-utils
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
> > CVE-2021-38185: cpio
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *
> >
> > Full list:  Found 27 unpatched CVEs
> > CVE-2013-0340: expat:expat-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
> > CVE-2019-12067: qemu:qemu-native:qemu-system-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
> > CVE-2019-6293: flex:flex-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
> > CVE-2019-6470: bind
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
> > CVE-2020-18974: nasm:nasm-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> > CVE-2020-29623: webkitgtk
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
> > CVE-2020-35503: qemu:qemu-native:qemu-system-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
> > CVE-2021-0129: bluez5
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
> > CVE-2021-1765: webkitgtk
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
> > CVE-2021-1789: webkitgtk
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
> > CVE-2021-1799: webkitgtk
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
> > CVE-2021-1801: webkitgtk
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
> > CVE-2021-1870: webkitgtk
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
> > CVE-2021-20196: qemu:qemu-native:qemu-system-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
> > CVE-2021-20255: qemu:qemu-native:qemu-system-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
> > CVE-2021-22922: curl:curl-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
> > CVE-2021-22923: curl:curl-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
> > CVE-2021-29923: go
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *
> > CVE-2021-31810: ruby:ruby-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31810 *
> > CVE-2021-31879: wget
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
> > CVE-2021-32066: ruby:ruby-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32066 *
> > CVE-2021-3445: libdnf
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
> > CVE-2021-3507: qemu:qemu-native:qemu-system-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
> > CVE-2021-35331: tcl:tcl-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
> > CVE-2021-3682: qemu:qemu-native:qemu-system-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
> > CVE-2021-36976: libarchive
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
> > CVE-2021-3713: qemu:qemu-native:qemu-system-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
> >
> >
> >
>
>
> 
>
