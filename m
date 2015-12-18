Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 111926FF72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 16:53:49 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ur14so62959510pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=VJQ31EHa7CQxPZiGCCZZNj8dfH9UehBvPqfuSiONIYk=;
	b=nN7OjWf5ttAfWYNtkDtphFtDKt/ESO7CGSGMk2qD3GSAPWlVIKcVmNnBonZvL3ggnl
	eNRerBeMUOH29BHE0Q/3b7PxTCGc4fLx7BuEwAuM5IUmJi4VaON2lENkD3lCt/C7N7G4
	SYHUoId6M0k1hSciNEtqqYUahOWpzNukQKqnpRlj7EY87PSNkmSq+Qh1+fU9nqktISx+
	ahLRaO5mlnZ6O6DIWVbVTIgpp1M0We9XgicYPJjC4yAyyEkGV5wLph7lhgbGruTeMw+S
	CgQoAv5BAPpTiJ87w9zSQUMCpIUmrFUgBIKQSNc1Cws2WJZ1U23us9/kNJHmclIWRwwC
	pSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=VJQ31EHa7CQxPZiGCCZZNj8dfH9UehBvPqfuSiONIYk=;
	b=DXQtgy8KRNNj79XSYPCPmv+OnTMDGk96n0u4+KrBprBQYcp2hjl5VyxupPEw6nFWP6
	3w/k10aWTsH/sK4t2ja6UP/BhNacGs7OdvAthAqueSqihC9HnqUaH97KacbIrZnKVmMl
	DjSxUIgRkd39kbjDpQ53ZvkPIUQfy4CNhg9j+le5t9NKw2Td6+1RPMYyhqZpL0xZ08sr
	PIJEnEx9AqiGa1cmlnANsLzFj2nJotWrVFvFgMvrV9ZHI0VcTqic6xJHp+K4SaMWT9+L
	sxk/fz21sfVYmyS6JxJtYnifkuvoF1JShm+bzHIKO+wEksThCYnCx5SDUz9fMlrrQG/z
	f+ww==
X-Gm-Message-State: ALoCoQlaIXv6pnlhl2CD1MavaLcLsmglVFC/lI9ZW7Y15PLvHaqLPgoWO6iQtH3mB+aYh3C1P/gYFX4OhK+DPF2yAtidbkKsZA==
X-Received: by 10.66.142.168 with SMTP id rx8mr6797028pab.16.1450457630043;
	Fri, 18 Dec 2015 08:53:50 -0800 (PST)
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com.
	[209.85.192.171]) by smtp.gmail.com with ESMTPSA id
	fc8sm23417892pab.21.2015.12.18.08.53.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 08:53:48 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f171.google.com with SMTP id v86so51581231pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:53:48 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.7.210 with SMTP id 79mr6725162pfh.98.1450457628448; Fri,
	18 Dec 2015 08:53:48 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Fri, 18 Dec 2015 08:53:48 -0800 (PST)
In-Reply-To: <1450389888-24760-3-git-send-email-tom.hochstein@freescale.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<1450389888-24760-3-git-send-email-tom.hochstein@freescale.com>
Date: Fri, 18 Dec 2015 14:53:48 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpug+pfzP++x_LQ4XwMjtkiLrW0kJYzrUbGwPPfRum7bg@mail.gmail.com>
Message-ID: <CAP9ODKpug+pfzP++x_LQ4XwMjtkiLrW0kJYzrUbGwPPfRum7bg@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@freescale.com>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [<OE-core][PATCH v2 3/4] packagegroup-core-x11-base: Remove matchbox for XWayland case.
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
X-List-Received-Date: Fri, 18 Dec 2015 16:53:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 17, 2015 at 8:04 PM, Tom Hochstein
<tom.hochstein@freescale.com> wrote:
> Matchbox is redundant when Weston is run.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>

I think there will be people that will wish to use X11 only, even if
XWayland is available.

Redundancy is not a justification to remove it, if it can be used in
some use-cases. Does it cause problem? Ross?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

