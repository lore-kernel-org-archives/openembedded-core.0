Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 82E4377654
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:25:01 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id k202so68300808lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Mar 2017 23:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=UdrRJQAqe+er2oYz1pmniMG10mj2aCAC3LwqapKLcZM=;
	b=kwZn/7DVDpNevLNQP5+nGnR7GsIZCgC3xL+zvSpECV1B+BkBbjHJguuUoduq7DypaH
	s/hw+Cxl3w0mnLt5UD1CeIpThPiApO5JP0iXWgpBunus/eVuKfrMgLjqC+YwWiaOVHSF
	kymykt/I62m5TbbCi8Wh4+R3iJ5UtDk3qqG/KbIojx4/sNQ3udkOnWIzdDsGI723pGvf
	WYbre9FEqKmbRkvgu8KXJLT21jXKp1iXWm8Ppy1ZFmE4dOZVtBB7mB5imrqpW90kntjB
	rXR39Un3/DgkeqqX277D+6HjJnR+54+96ecdW8vi++5AnoHUzperSSq+N5hxOTZVFeyM
	1RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=UdrRJQAqe+er2oYz1pmniMG10mj2aCAC3LwqapKLcZM=;
	b=hvfC5JBOyusgHfkC/G1D9FaTDaBf8PbziRsLnM/R+yShm+q6lmpfeX5oQQwQM1VhKR
	bMUMX6nuodwZczCQOyjACBNxUsmwAHJTDng8pjS6WHC3KR+iNDA/Y6+Lan8Mbwfhuo7J
	PsbgvwFtCVIz2QWIRNJUS08RrJfKao3VJvU67fId6/ipnivcyqvyoDitKqHn6FSlQx9w
	5mVHGrnmijjI+Ai7lLtlOfEg0/50TDFny/RKm4vy+c40oEqINe8MRuMq2GQaNm5t9ph3
	tNKyauOs9v1oKNnWS1unIFIhdxI0KVjw/PHFIt5cPC+NuzVPVQsFOSiBqtZ5zX6Dj3Y3
	afwQ==
X-Gm-Message-State: AMke39l/7WCqK3o0g/nrhrGFVv9eSlJuKCDqYEXF7G5dREgv0NtD25RTcWsJbwFZJV9d8A==
X-Received: by 10.25.235.214 with SMTP id f83mr4419862lfk.27.1488785101899;
	Sun, 05 Mar 2017 23:25:01 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id o5sm3931188lfo.35.2017.03.05.23.25.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 Mar 2017 23:25:01 -0800 (PST)
Date: Mon, 6 Mar 2017 08:24:59 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170306072459.lpcaqyknca54nt7d@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20170228045004.GA5913@linux-uys3>
	<20170228180036.GB16277@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20170228180036.GB16277@linux-uys3>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: npm thoughts
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
X-List-Received-Date: Mon, 06 Mar 2017 07:25:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Trevor Woerner <twoerner@gmail.com> [170228 19:01]:

> Ideally "devtool add ..." wouldn't choke and crash when it encounters a
> LICENSE string it doesn't understand. When parsing license strings from random
> places on The Internet it's inevitable odd things will come up :-)

I recently also stumbled upon this. I've got patch series out, that
improves the situation for all the cases *I* stumbled upon. 

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

