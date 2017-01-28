Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 18B3C71994
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2017 12:23:31 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id c206so180071661wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2017 04:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=2YqkCokkKpSRtRL4EBzhOYDQ1qPl7KgSSA8n/sgbY1c=;
	b=B6zRFuP5XZ42yKPAd0Xb/Vfx9NaBF35tEFHJuZK5EDjihofVc+hUfGvcIchAeAih8Q
	HDgjxmAy1Y9ssdi2NPm0NwmJHf/wzknF/rQ9jCLWc10BrxNZaryPVnNe/K6s9/qjI3q/
	fsw7zcuzpct2WYLOxXCUNlVeZVZoxcuRgqxHSk/tcn7gBTnTkha48lIhEZy076Sn2qwY
	BUG3MkOwNC4Xm3Z3A0tHZwryJRrjoEr24CGgEaSmMvpjmpStl/I11gDoIkynuCXFm8C6
	XsSULNhLG3iCN02Vsm0vysNXQk7gDghIweQr/6eQV/MDtyYBdqTZ6NEEgbWhRg7DPIH/
	CAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=2YqkCokkKpSRtRL4EBzhOYDQ1qPl7KgSSA8n/sgbY1c=;
	b=iGElnOgzo2dfrsIct5CUUt8GP6B2S6h8CnPcKs5W73scDUuBlvCPkrBq3njIYfJ7Tt
	GkSEwhoJySjfEkGY3YRUIwsECoQysuMnUhxG4mBmcIJhbHy/VUfXXwmCk/duIs/yoNUf
	YmQFRc+2ex/kMqIUB+fy9o445UhHpVhUgxiA350ld9/J08nP76huMwaVHEzooBV29Bju
	RxxDEP6QfSOSyRCbK0vVS/Nh1vC2y1yk969Ih1a3hPm7lTzx2u802oQFD0vW33YQryI8
	d0+eL58N3jQQilxOeiVCTVooSrJ1HVBDjq5+Hy+if2R/78pWuBpfKbvPn+HYNDsJz2Ac
	5RFw==
X-Gm-Message-State: AIkVDXLDKTUEAgWugnJxx+mTjMbXY2cvwJix7riOXWQ5g43/J+og0IfUMSUXY05H02HFLg==
X-Received: by 10.223.169.112 with SMTP id u103mr11142692wrc.166.1485606211894;
	Sat, 28 Jan 2017 04:23:31 -0800 (PST)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com.
	[74.125.82.53]) by smtp.gmail.com with ESMTPSA id
	o2sm12631296wra.42.2017.01.28.04.23.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 Jan 2017 04:23:30 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f53.google.com with SMTP id r126so19742209wmr.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2017 04:23:30 -0800 (PST)
X-Received: by 10.223.163.201 with SMTP id m9mr12868348wrb.66.1485606210247;
	Sat, 28 Jan 2017 04:23:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.69.17 with HTTP; Sat, 28 Jan 2017 04:23:29 -0800 (PST)
In-Reply-To: <20170125112205.8223-1-fabio.berton@ossystems.com.br>
References: <20170125112205.8223-1-fabio.berton@ossystems.com.br>
Date: Sat, 28 Jan 2017 10:23:29 -0200
X-Gmail-Original-Message-ID: <CAP9ODKofgP6cNUxVCZhqbphFVOEiocAKfjsbZ2+gt-5jB0K=WQ@mail.gmail.com>
Message-ID: <CAP9ODKofgP6cNUxVCZhqbphFVOEiocAKfjsbZ2+gt-5jB0K=WQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: Add RCONFLICTS to watchdog-keepalive and split RDEPENDS
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
X-List-Received-Date: Sat, 28 Jan 2017 12:23:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 25, 2017 at 9:22 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> watchdog-keepalive is a simplified version of the watchdog daemon
> and can't be installed along with watchdog daemon, we need to
> choose which daemon install.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

