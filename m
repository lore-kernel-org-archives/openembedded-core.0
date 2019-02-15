Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4666771984
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 12:46:30 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id z19so16330989otm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 04:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=Gg4bIZwegxSJd3ICEuFiO+vfZC6jXAF0Dpy6zHzKM8Q=;
	b=agAbnMwt9nb6l/nDaJOieSoyzf45RxHux9lSLPZJJArZ0WgesOPR26/3to9njhP2MY
	ABz57+CV+TSWhb1vTWYdeAFxi3ubAzw764BlCTB1KwYqcpvIXe15kMvbPH3/QinAe5eF
	CTcCXLEPrOD0v7eMRKjN4SkWmW1O7mwyxYehPmVzykbb7dHLpL4FoqUPssThjJEcb/a3
	8JCfbDX8oCEICMwHG8nsK3WmgjAqoxrtSTknseqs9oyFnRKWyQ1+t7DQDWMSAD4Xa3Qt
	Fssnbbp+fMFTvJ2KLtCiD1RH+4et9gOzGA4nal66/hCdh+3zhmRuJIS8cxauyCt4kpfB
	Z7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=Gg4bIZwegxSJd3ICEuFiO+vfZC6jXAF0Dpy6zHzKM8Q=;
	b=QJS9OVhsNSYMvAhnk10s92n+8Kg8UWEyOsmlqCYu8GzWfFVrg7KeZR75yotZS+DY+B
	PTfcMXUj98k0YEIPV/Otex1Ip7wA1B/bBPbq0D1Un3aPSgBEJCHg2If7OFVRlLf3tAb7
	axdXyIvwfk5NyCXVy3oc/iF7oZweZCK6olwMPu269N8jim29r5bnI95TxDH2+Fs1j0hF
	3nttW4SmKBah6Uk2Nz1wdi6Aq9cT1KEtnwziEDfn3aoLBTsuhlte5Lkyr6q2nWf7PM/P
	71Zxxhvt458pT6uXDORDlSrQhGEMym5O2FaZiV8ElyMEgZYAxKMS36VxQ1Gbq7ZeOlB4
	zWlQ==
X-Gm-Message-State: AHQUAubqCMj911u4uoo9k2GS1a4UcvYprhyQXYkwn53CmKvfCyTh0NAC
	N/5NgurYMZ54pBwyw2CZmEQGGwBoHD369A==
X-Google-Smtp-Source: AHgI3IaJwITztVTm+VdKq2QhVxg4y9K9T85f0AyNO0mm3Fm44d+3oqNXOi5J5b4aDT0h6BUoLk5jLQ==
X-Received: by 2002:a05:6830:15ce:: with SMTP id
	j14mr5817089otr.82.1550234790725; 
	Fri, 15 Feb 2019 04:46:30 -0800 (PST)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
	[209.85.210.51])
	by smtp.gmail.com with ESMTPSA id s12sm430705otk.0.2019.02.15.04.46.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 04:46:29 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f51.google.com with SMTP id s5so16265489oth.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 04:46:29 -0800 (PST)
X-Received: by 2002:aca:50d0:: with SMTP id e199mr5462289oib.37.1550234788907; 
	Fri, 15 Feb 2019 04:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20190215073207.30036-1-anuj.mittal@intel.com>
	<20190215073207.30036-2-anuj.mittal@intel.com>
In-Reply-To: <20190215073207.30036-2-anuj.mittal@intel.com>
Date: Fri, 15 Feb 2019 10:46:17 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq0zcHhXON4xWvTTUpnYRoMHOHvwd0RSJHwQeSa2d7P7w@mail.gmail.com>
Message-ID: <CAP9ODKq0zcHhXON4xWvTTUpnYRoMHOHvwd0RSJHwQeSa2d7P7w@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>,
	Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 12:46:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 15, 2019 at 5:32 AM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> * For changes, see:
> https://www.mesa3d.org/relnotes/18.3.3.html
>
> * Convert from using autotools to meson and get rid of unnecessary
> patches.
>
> * Include a patch to fix detection of host os combinations that we build
> for.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

I think this patch should be split off. First we should upgrade to the
newer release and later convert it to use meson.

This allows for better review and testing.

If desired, we can do the upgrade on our side and Anuj can handle the
meson convertion, next. Does it make sense?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

