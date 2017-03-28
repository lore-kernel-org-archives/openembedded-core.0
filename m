Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3839477AE1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 13:03:30 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b187so4638389oif.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=2bPLkJta+kwJ/H7/a6960QFURItkLXy0WmDepRimEyk=;
	b=ax0GBCWdjLn0C5MxuXrRViRK4zgz0kj9VYClpNguypHY46xIpyMVyUtQkXfUXc1nJp
	1hWnG7WBf58DPcxUogYqDe5kYndqBXsYTIAcf2DbAzGPMofrtlOmsTjGQcBuySPsdlCw
	cc9u7Yjv/IIeemduNjctetfTgwmW/ITN2PU/0FDQwM6NsxpDBqtyCigQpqlysnbeJzWw
	qvdTHDom2XZ3Mhqf15LAWvdk/DAj+XBSaBZDKeac8HR7UyntHOCec2P6/sKbXitR6zSr
	2LhLo1YZUK0V0Ql1qvfr0I7rpGfu3AX1io5Ur6smD8MsDoZzkSncGw/fcREzNMWuT6fl
	38Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=2bPLkJta+kwJ/H7/a6960QFURItkLXy0WmDepRimEyk=;
	b=KMEeDpEN67hoJGVFbGNHRVTddj6c6rEp9hcTmKEF45Hz2dIAYlJqVkSaZq1TMq5SvY
	iCoDBDTGGVni5cDxhWcEUtlnHETscsMzN4XayceVilDKkCurUOmchQnv2W/ZoRYjQ3CX
	xValcTQZ6cOPOBw1cpnWfEckvBGI/eDIzgj3j5JCVper71+n9KaIJGR/IYGVow2JXBp3
	6leuTLkyvwMFT348zVJBdmcJzqxdk5bvFqnAkHHy/2bM9GLrxXkIjxqiDs91frH2i43L
	FHQehfPnuGmxykTqsR+Iv3D4BXGgx/47O2a4wq3J/Kwo712QStB8hxrzzEjRjcNh6bmp
	2lOQ==
X-Gm-Message-State: AFeK/H3m1GM86v05pfuKk4GoL4R2cOlHMYJ1CqJiFCiA2ys+5LtjaFezWUOLRpOs43ofzg==
X-Received: by 10.202.78.10 with SMTP id c10mr1244764oib.189.1490706211528;
	Tue, 28 Mar 2017 06:03:31 -0700 (PDT)
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com.
	[74.125.82.171])
	by smtp.gmail.com with ESMTPSA id 70sm1614830otc.35.2017.03.28.06.03.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Mar 2017 06:03:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f171.google.com with SMTP id a5so51165932oth.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 06:03:30 -0700 (PDT)
X-Received: by 10.157.26.121 with SMTP id u54mr7109131otu.11.1490706209999;
	Tue, 28 Mar 2017 06:03:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.79.203 with HTTP; Tue, 28 Mar 2017 06:03:29 -0700 (PDT)
In-Reply-To: <CANwerB04wVBrfSPwrQ5wNxumbO8oKtfhnefAVDOxcJzNT1XQyw@mail.gmail.com>
References: <20170327200929.2357-1-otavio@ossystems.com.br>
	<CANwerB04wVBrfSPwrQ5wNxumbO8oKtfhnefAVDOxcJzNT1XQyw@mail.gmail.com>
Date: Tue, 28 Mar 2017 10:03:29 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr0JNnrCaUB+qu7RHo5Tw3KPxhOnO5LKjA5jn9kO2sf8Q@mail.gmail.com>
Message-ID: <CAP9ODKr0JNnrCaUB+qu7RHo5Tw3KPxhOnO5LKjA5jn9kO2sf8Q@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] eudev: restore userspace firmware loading support
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
X-List-Received-Date: Tue, 28 Mar 2017 13:03:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 27, 2017 at 8:16 PM, Jonathan Liu <net147@gmail.com> wrote:
...
> It may be a good idea to submit a pull request at
> https://github.com/gentoo/eudev/ to upstream this into eudev as Gentoo users
> have also experienced this issue in the past -
> https://forums.gentoo.org/viewtopic-t-1011456.html. One of the goals of the
> eudev fork is obtaining better compatibility with older kernels.

This is something so simple; why it has not been reverted yet in
upstream. I am afraid they prefer to have this off.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

