Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B4AE77E54F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 09:52:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f17so2485868wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=IgWbnKnOxMxpfoCyxCLem6EB3eRwnhAhshOhMTrFZ/Q=;
	b=Nl0dVw0w6A3AcxWik/wDZjeVgvz2Nct/QC260u+IJy/XSXth5W3qmAvICojB0HwQiW
	9jnnDT+ZiM+Dxaoa5mNVwAPPHbccnHQHPxe5fYqdchX5Ub/NNI35tcE9dCuPCfxt0/YD
	AABmuQe2hTi5ILxEhXIJb49NK3UVPMYTuiC0lrO3MCEnHdQafciZeT8zodbdFTNZPTth
	Q6QgtBeAyKdSVPMnfrqL+zUkHdpH9KpXIHhMymhg0TGVuIO0sAUpVo/3PcWi+3UTnl9T
	hqa5ycsGMRBDgerYrripctFXQJP6+ZCj7ES+BgazHGSdpJw7R/lMjXA0kf0o/aNdKMRp
	dwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=IgWbnKnOxMxpfoCyxCLem6EB3eRwnhAhshOhMTrFZ/Q=;
	b=I8snl/2dYCVcBaLIxCEfJC7LKnHX8h//Xfj+pK534gdqRkAwsVussIuCicdtH/Rt9B
	2dRIGEo40MoCRcm6bjcQVFl8ceEfUctDLwXOmbFDh8fCxkR2NUzsqtrS6o8iBmygyVWg
	rSO/tPqCic1mZOHU6HCQ1Zg/BJg+xkPzephIkIEzSlZWRaMVhxnUbqc3hpk9FIYknnbf
	K6RsfaVnVA30UXuDACvYTrABIZokVWRuWnxBdhUOPr5IHHqblILuU4pBIn7fhmTwPZz/
	HwzHHBAluNxDntrRIox337bpOyz5rOfUSJ6nQiy4BfZzILE/KEsHu/lQwQGHWsBStXO0
	miyA==
X-Gm-Message-State: APjAAAW551xtP8COH/rmDlbh4WWg6ArQsZGsnS8qky930cectKPnS6Lb
	Bd14yNpruhnH1yt1OIq76bBetMn/
X-Google-Smtp-Source: APXvYqzYyogsjeKbe9/ddVshgKKbtR2wBOyTdWZESbZKLQLAYj4PpMsPFz301p0yspdet80U0dAKTA==
X-Received: by 2002:a1c:1bc1:: with SMTP id b184mr2266890wmb.42.1561024356444; 
	Thu, 20 Jun 2019 02:52:36 -0700 (PDT)
Received: from ?IPv6:2a01:598:b007:9aab:f0c2:bc83:4804:8780?
	([2a01:598:b007:9aab:f0c2:bc83:4804:8780])
	by smtp.gmail.com with ESMTPSA id
	g131sm2673746wmf.37.2019.06.20.02.52.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jun 2019 02:52:35 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <20190620091913.GD27107@localhost>
Date: Thu, 20 Jun 2019 11:52:34 +0200
Message-Id: <5619ED35-9C21-4824-8DEA-2AE68E6B359A@gmail.com>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
	<b7589dd06670ead7a2ca7e8c7301b289e2543249.1561018476.git.liezhi.yang@windriver.com>
	<20190620082858.GC27107@localhost>
	<07882a06-4c45-07aa-9696-8de4f86b8c0b@windriver.com>
	<20190620091913.GD27107@localhost>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gtk-icon-cache.bbclass: Depends on gtk+3
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
X-List-Received-Date: Thu, 20 Jun 2019 09:52:36 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I=E2=80=99d say virtual/gtk wouldn=E2=80=99t be helpful much as 2/3/4 versio=
ns have major api differences.

Alex

> On 20 Jun 2019, at 11.19, Adrian Bunk <bunk@stusta.de> wrote:
>=20
>> On Thu, Jun 20, 2019 at 04:46:16PM +0800, Robert Yang wrote:
>> ...
>> Maybe gtk+2 is out of date? Since gtk+4 is on the way, so I think that we=

>> need something like virtual/gtk to fix these problems totally?
>=20
> GTK+2 is mostly obsolete.
>=20
> I just checked the GTK4 sources, and there it is renamed to=20
> gtk4-update-icon-cache. Based on that I would say that your
> patch is actually fine at least for now.
>=20
>> // Robert
>=20
> cu
> Adrian
>=20
> --=20
>=20
>       "Is there not promise of rain?" Ling Tan asked suddenly out
>        of the darkness. There had been need of rain for many days.
>       "Only a promise," Lao Er said.
>                                       Pearl S. Buck - Dragon Seed
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

