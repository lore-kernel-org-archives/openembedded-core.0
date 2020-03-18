Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71F2460AE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:03:56 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id a10so12136355qvq.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=i/vOSIBqtjJedlz6wzUZXpuUAvndqA/V5c8XyF/WG6s=;
	b=iHbfw2X7Sa0Cs2aV/gr17LHVJ6mN5SMFpFXoSw7/8VLPE0e2H+/5C3iQIGq8pzTZat
	X8Q1NmqBgZisEI617nrpF74r3GUuLwvMlq1dcHf4KfEJaK9tzAPX5shOkhQAkp49A2ZM
	5Mf3clu1WjKyIp5/EhO2qwEuKejaZql7rMzjt9In+CXttVh3xqaULJO/y3DnHuyEXScl
	aqomn2eNo0DXM8y4Le5hm2Zwg7Uv8/Fbc4vHDr7yLSMQH9XgdNdQkGe/rvKFe2AzT05S
	YVLfzAkkhl3ndBGUUOVKilATamEaN0PuMkjZ3upLnMw68muemA66rGqH6zGpWmY8IvTV
	cJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=i/vOSIBqtjJedlz6wzUZXpuUAvndqA/V5c8XyF/WG6s=;
	b=fPmSF7sbM/XG6camgblBxhxXEH0mmGXN/fSs80XXFqc8dark2q2RWC3zCQEobYrNfW
	XmH0p6XeZVvii2Rsb5nbLdrT3jxE7ZPLb0WlrNdsKImd3in38voLX3qVnWoiub0GIxhI
	3xLHO6D69uGcIdVqKb4UDDovI+Zw9XUmSxYdHqeHU31YeX/rxphh/WD4LG2eufQtF1Vp
	kIXVr3qtyfOop2SIbNEDKnfZNsa1qqw4HK2PWW3KD9+rlIh7JY2qAPEGR7hCHS1nq1vF
	EnzWMMAUm7rgDysp37WmFxU5mfG4qPa1L0u/zPs1lMGRpHyCpWJ5Kn2ABeAII3YAVshx
	pE+g==
X-Gm-Message-State: ANhLgQ1jbgTXhiipkW0OqGu2pZ1Cj/CDZCZZUV3H/YkTcD0m971grD94
	zruLnoR8l61mG9L4yc1Mp7hCKAedttn5JA==
X-Google-Smtp-Source: ADFU+vv7sK/htAoZkefWjWYhdLdPKh+Sj+nqxmWSiAK7B9PqSfCs85BU9KjAM7tZeBiiuRyx4kGb6g==
X-Received: by 2002:a0c:cd8d:: with SMTP id v13mr2158940qvm.189.1584500636986; 
	Tue, 17 Mar 2020 20:03:56 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
	[209.85.160.174])
	by smtp.gmail.com with ESMTPSA id s4sm3964736qte.36.2020.03.17.20.03.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 20:03:56 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f174.google.com with SMTP id z12so263000qtq.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:03:56 -0700 (PDT)
X-Received: by 2002:ac8:6f12:: with SMTP id g18mr2437373qtv.6.1584500635710;
	Tue, 17 Mar 2020 20:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-3-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-3-alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 00:03:44 -0300
X-Gmail-Original-Message-ID: <CAP9ODKovacNsXb924y262Wqx6xu_DVEhsqe6aHa77yceWC1tcw@mail.gmail.com>
Message-ID: <CAP9ODKovacNsXb924y262Wqx6xu_DVEhsqe6aHa77yceWC1tcw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 02/11] systemd: Reinstate systemd-hwdb-update.service
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
X-List-Received-Date: Wed, 18 Mar 2020 03:03:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 12:29 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> systemd supports a distribution hwdb.bin in /usr/lib/udev/hwdb.bin,
> which is used if /etc/udev/hwdb.bin is not present. When generating the
> install time hwdb, for systemd, ensure that we put it in /usr/lib/udev,
> which then ensures that at boot time we do not regenerate it, unless the
> system is marked for update.
>
> This allows fragments dropped into /etc/udev/hwdb.d to be processed
> correctly, but without requiring a first boot time build:
>
> root@qemumips:~# systemctl status systemd-hwdb-update.service
> * systemd-hwdb-update.service - Rebuild Hardware Database
>      Loaded: loaded (/usr/lib/systemd/system/systemd-hwdb-update.service; static; vendor preset: disabled)
>      Active: inactive (dead)
>   Condition: start condition failed at Wed 2020-03-04 15:18:11 UTC; 44s ago
>              |- ConditionPathExists=|!/usr/lib/udev/hwdb.bin was not met
>              |- ConditionPathExists=|/etc/udev/hwdb.bin was not met
>              `- ConditionDirectoryNotEmpty=|/etc/udev/hwdb.d was not met
>        Docs: man:hwdb(7)
>              man:systemd-hwdb(8)
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

