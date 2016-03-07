Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9805A60290
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 17:20:20 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id x1so138416020lbj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 09:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=B4JmojqP62pArMHKiPKCNhYuICAWaSOaZs01xm/D/xA=;
	b=uJgr9hKCZSPC7YgnRPEOrACc2W4oW1Di4jOVQoza+xsHpn8maenfspruyw+2uSdA3F
	11EsyG6xYU8B9kIgt2zxWYIu7PrAZbiXCrqKOAfacpIw61fqC4HokD7Ni+Ow17GVRqrS
	xVWAzrZBytxz68mG8TUk1DT0Y2GJByqhdH9HiZeWqa55FtbgZsqGnbpzHM4Mb3uZCTP5
	GA489t8PH1TghS29w2A1GyPBJ5afmj8OEm1cisMartMSYHNQki6HJg/PE2nT23ldVXkk
	MbZk030S+H5YXs+1eWPnvo9IlYZ0bXYHA7fHcIFQixXC7gdFdtB2MjevVtSC94fx/k0w
	ASRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=B4JmojqP62pArMHKiPKCNhYuICAWaSOaZs01xm/D/xA=;
	b=gkAHN+f2gzCApCPHAQnXeGaxvTYStCfOJmN5DmUHM39gLteoQHOfip34+D0xcNkFs3
	OWGRQ0WebYuCjtLqKhSeCwcyNr1AFASHpOgch4vUGdyAWneadcwv+PymQF/eRxieTXVC
	AUdmI7s1W4JqoIqPl7DJu1G2RWQ57kY+87Q5Qy0adQbI5AnGvPa/JtCTWAi6TbXjkwYR
	i5cFd4cpue/p7Pal32wQMwGwMrMv6GQamQhGU45FPczZ5G7n5pGBT9in6lFPkpUKvFtp
	xtcekNDKK+RKpDx4fUcr4FjZJWJpBzbCIyStwujUhQ2g1D26ORMTNqTipe3+d6Or2NXM
	BDsA==
X-Gm-Message-State: AD7BkJIV5WSdBh4KwRFFlne51An7PZIniBJbzDsZYiEwmAEov2tF92jP6JuZHfj0GKI6me6wkSAlQPbPxOtBK7BD
MIME-Version: 1.0
X-Received: by 10.112.156.100 with SMTP id wd4mr7789104lbb.9.1457371220151;
	Mon, 07 Mar 2016 09:20:20 -0800 (PST)
Received: by 10.114.182.240 with HTTP; Mon, 7 Mar 2016 09:20:20 -0800 (PST)
In-Reply-To: <CAJTo0LaH2jPp86=sh7mqiqcQLYmogdx2n4sppm6ma3XaPT8NKg@mail.gmail.com>
References: <1448698194-14390-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAJTo0LZwOpAaUSOVYyuoKQxjU3OkUsi=pTvY5NihHw_kQGJ1Qg@mail.gmail.com>
	<CAD3vsf7djsRsAVnRQ7Q0Ztgsdxj2J6TO5FHis1QuSYWdRf6ubA@mail.gmail.com>
	<CAJTo0LaH2jPp86=sh7mqiqcQLYmogdx2n4sppm6ma3XaPT8NKg@mail.gmail.com>
Date: Mon, 7 Mar 2016 22:50:20 +0530
Message-ID: <CAD3vsf5jcLJqRO22e+Vso9Q6OQ=TWdZHbpCDr-ohWTBmuw5qiQ@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v3] license.bbclass: fix host contamination warnings for license files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Mar 2016 17:20:23 -0000
Content-Type: multipart/alternative; boundary=089e01227e3ce22f2f052d78ad49

--089e01227e3ce22f2f052d78ad49
Content-Type: text/plain; charset=UTF-8

>
> I've merged this into my staging branch for master, no need to send again.
>
> Thanks Martin and Ross.

Regards,
Jagadeesh

--089e01227e3ce22f2f052d78ad49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">I&#3=
9;ve merged this into my staging branch for master, no need to send again.<=
/div><span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_ext=
ra"><br></div></font></span></div></blockquote><div>Thanks Martin and Ross.=
</div><div><br></div><div>Regards,</div><div>Jagadeesh</div></div><br></div=
></div>

--089e01227e3ce22f2f052d78ad49--
