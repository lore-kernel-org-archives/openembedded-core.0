Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB4171A18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 12:43:23 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id 79so4460916oth.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=akzxpOr6g1CX/Z24TvDhCb9d+nmmIcIEDRcKaRvbS1k=;
	b=KesDb/1vGgsStvrZHbJVQmiqJRJPJPcmqnu7hKbH7IX08Pff/5FfyYgUohsi68F5q5
	fqdp08pjMKHlg/OBwvFKVKeC80/wWcSIzduQwRVxh5BgyP1xIblzNUPvCARE77sOqXSu
	UGaJJB7P2UjSZHM4YUA/0PrZdBPFT1mvfRap0bhdbMBtV7CjyaKC3Oi5DEpw2RYgsLyJ
	y7SbRV/a2MlTi0wPXXqySYV5/JauIjBBbx4DBwEPzauqkygvCY2pC0LYuNUKVzMAz30E
	l+YlNGDz45Wo1Cxap810LBZlGg6q2aifAUjbf0mIbNiuKuBrGaCSnnlyc3ZgiBePK/Lj
	kmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=akzxpOr6g1CX/Z24TvDhCb9d+nmmIcIEDRcKaRvbS1k=;
	b=d1WP5eKEmATicBDQm02fjKIbpv625W3VUOvIdT6vyeym+CIcrQcGOSlPZJv9sEXRTW
	EcWRVtDLEZuERoH6v2rNlTmbpuhQZvjlaYeS826DkO5yA68CiEWS58hlRZChe0H2Id2d
	ap1B6FYFHcOgw8ebqi4uCAAhIr0ECDCOr9wnwQbqRIfare7O0Oz7LuUgCnGwbB/CDqnc
	A4n9nVgUkgjWJnuayfFpW31hK235jLbEOFm03hwEsy8pVslwmNjblZ/IYS1Hglo/2EkS
	KeMIuPy/SzusONbaXdrOUWf5gJL8kx7BnFOKiiVKqnIixlQdqp7kdh9wpAoFKHSLeZD/
	+PTw==
X-Gm-Message-State: APf1xPC3G5dbXPE7NDbhgwi1FgzoMm/aRUdzlfM0SRFPMHguz9JblPOi
	mu+QP5FKgqIfu63OysvAKOhEv3td
X-Google-Smtp-Source: AG47ELshLa0onWHU+UKZNx1RfbKgyuwD9gbgVu1b485MyvTTFWjD1w2avpm3q8H6CbulI+bUMju37Q==
X-Received: by 10.157.26.74 with SMTP id u10mr3576489otu.22.1519303404889;
	Thu, 22 Feb 2018 04:43:24 -0800 (PST)
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com.
	[74.125.82.176])
	by smtp.gmail.com with ESMTPSA id o49sm4215oto.46.2018.02.22.04.43.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 04:43:23 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f176.google.com with SMTP id a7so4467967otk.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:43:23 -0800 (PST)
X-Received: by 10.157.30.228 with SMTP id n91mr4567383otn.181.1519303403217;
	Thu, 22 Feb 2018 04:43:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Thu, 22 Feb 2018 04:43:22 -0800 (PST)
In-Reply-To: <CAJTo0LZkjeVEQohwNZRZU4KLLCJySyPbVqJQgq2nS=jB42DszA@mail.gmail.com>
References: <20180222073647.31860-1-otavio@ossystems.com.br>
	<CAJTo0LZkjeVEQohwNZRZU4KLLCJySyPbVqJQgq2nS=jB42DszA@mail.gmail.com>
Date: Thu, 22 Feb 2018 09:43:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKomT_V2SHUQysFvkMu_9hBd87TWHj--qacmMf5aw2XKFg@mail.gmail.com>
Message-ID: <CAP9ODKomT_V2SHUQysFvkMu_9hBd87TWHj--qacmMf5aw2XKFg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-mkimage: Add dependency on dtc
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
X-List-Received-Date: Thu, 22 Feb 2018 12:43:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 22, 2018 at 9:23 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Shouldn't this be dtc-native?

Good catch; in fact for native it was right but for other variants, it
was not. Fixed in v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

