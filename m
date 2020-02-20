Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id B3D8560C74
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 01:16:30 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id z1so2780990iom.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 17:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u1n0EYdmy9eKwfDtcFQLU6evbJmQlM6zbI8Xf966vC0=;
	b=HYiSZgrE5MgYtUXG9sDEzoqCXvht7t1JrkFu1Fgc3TWRUEmkpFxK3Irs8HECRIodw/
	SeNxi6yd+dVktjRMKoErbQ4QtuW0OrbAbcXE1G288KGS0K+xAayGWJFllNRnoVLJXPNU
	KskTPR7DuhuKGkJkybbGSPQl+nsVbamqi6SDZQ0jgF4OTyflywZ0x9ecqI/w1PA9CUnY
	TtOCEEIGMMWWpbfnwFy4PxV3kaU5p3Gy0aXBl6S2+fjz90pmj19xex3xLMgvSEa19Rno
	PHIery9ZRDS+a7xffkc+U1K9ULGVEURap1UptcqVJfJ1HsEFwIQ3W7cM8xa2nnuFoK9U
	jRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u1n0EYdmy9eKwfDtcFQLU6evbJmQlM6zbI8Xf966vC0=;
	b=BR7tLM5juF6xUdFnZAnP6salEWGgaSkc/p6NzmnvsLB0LvNpFtIN43SiYOYoZtHiLO
	7XIc7wGHWdSNREVngfmdZqSM/3CJJkek8o6QLCafTnPsluzf80Ay5sqEof38fn++j/vP
	KnIvsqvA8QrlOXBK5GSO840DeUvTGbdeN4Ayfx7wWan94Wqai+KJCOzoFDIpMjVbCoEF
	MYXE8Wjf6Ku2UbO3OjK1HyjN/5T3qTYciBSfKsq5rWX9GMVaYuju7aXW4hAlnTEZtRXc
	iWXLaGviKHz7o8VM3sq+RV9y13RtWPQ+ta/jRnAaqWRNZSADqZBNVOC43CWWGJwSMpon
	HDKw==
X-Gm-Message-State: APjAAAX8OIe/x3MAEcP2ubLXTKZBhrpjCNYZYSPyYyU84UDnEGN4R8Ab
	oH1+0IHUIECHL+nJRl8n/pj2nAsxEUaokxM7ZrqN0w==
X-Google-Smtp-Source: APXvYqyxc/YPX0M/jb4lscOxQIZPFQECpsoQKRlNMkLhHQvhe4qIc0F2v7b2oIlBAj/4brlo2RmC668RNIp92scZk1k=
X-Received: by 2002:a5d:87ca:: with SMTP id q10mr22893180ios.192.1582161391240;
	Wed, 19 Feb 2020 17:16:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Wed, 19 Feb 2020 17:16:30
	-0800 (PST)
In-Reply-To: <CAA=hcWS60Jr0aQ+qVqMoxyU90VPvC_cUyWKjsujqkWxPXLL8NQ@mail.gmail.com>
References: <CAA=hcWS60Jr0aQ+qVqMoxyU90VPvC_cUyWKjsujqkWxPXLL8NQ@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Thu, 20 Feb 2020 12:16:30 +1100
Message-ID: <CAA=hcWS=gMW0giYSqks=gMKE_b=xQuufj5=yRd=zFYe1tWA=Ew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>
Subject: Re: You advice to append environment set up to local root shell profile
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
X-List-Received-Date: Thu, 20 Feb 2020 01:16:30 -0000
Content-Type: text/plain; charset="UTF-8"

May be I should append to shells script.

On 2/20/20, JH <jupiter.hce@gmail.com> wrote:
> Hi,
>
> I want to setup export LD_LIBRARY_PATH and export PATH to the
> /home/root shell profile, the oe-core base-files has a profile file,
> is it a right way to copy that file to my application layer, to extend
> it and to add new path to export LD_LIBRARY_PATH and export PATH? I'll
> handle it by a base-files_%.bbappend in my application layer.
>
> Thank you.
>
> Kind regards,
>
> - jh
>

