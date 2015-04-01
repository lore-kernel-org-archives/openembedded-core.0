Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id B3FBB60034
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 11:21:47 +0000 (UTC)
Received: by lbdc10 with SMTP id c10so33465825lbd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 04:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=dS6xsi8GXuQtTFzTW4xEBCmPtsJZHpEiLZbkpGP3y9E=;
	b=iP6lGBGP9wNggHjQ3gF5ti0chULdbWPaSOK0qam1J5ddDubtgl7RQvsT+2oIkyJnDQ
	3Rj1W96IznBuudk4ph/OMvdVSjT6O+s8PPi9lCsDXy217whF2bVYbh/IqRPwWgyl3bOO
	G9Gkb0DHbaQtU7ZaOWqLDW8IQyicIHpbqBGUkzylSEBaeIR+snBTM49G3if1bPBRmzIq
	GCBhc8BScqWf6pOD5GBqv46WE9Q7Z9IZwTxmxHSYiqfxpQa62sF+bm1ej+n/YlukObIb
	PqpgZp8Y5tJGA3Pe/2IDh2Unv37WqZDrSIRmqowIqQBqtrivM6vcRvbMscgF5mA62pr+
	TS8g==
X-Gm-Message-State: ALoCoQk0YGZUzmHr/3dEhBZUYU+psRTXjF4rXd3MnL+2/yhLy8fERu9ZaJ9BmqFGBILn20F09YBb
X-Received: by 10.112.167.36 with SMTP id zl4mr8505862lbb.22.1427887307659;
	Wed, 01 Apr 2015 04:21:47 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id mm7sm347486lbb.30.2015.04.01.04.21.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 04:21:47 -0700 (PDT)
Date: Wed, 1 Apr 2015 13:21:45 +0200
From: Anders Darander <anders@chargestorm.se>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20150401112145.GF18315@ad.chargestorm.se>
Mail-Followup-To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Bruno Bottazzini <bruno.bottazzini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-5-git-send-email-bruno.bottazzini@intel.com>
	<CAHiDW_F8MKf1yWW3y=QOxX02Jjgs1HdZn1PDgL9bFLuMJh+jfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHiDW_F8MKf1yWW3y=QOxX02Jjgs1HdZn1PDgL9bFLuMJh+jfA@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] systemd: v219 with stable fixes
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
X-List-Received-Date: Wed, 01 Apr 2015 11:21:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Jussi Kukkonen <jussi.kukkonen@intel.com> [150401 12:17]:

> On 25 March 2015 at 23:49, Bruno Bottazzini <bruno.bottazzini@intel.com> wrote:
> > Adding patches that fix bugs for 219 version.
> > This will get the same consistency of the stable systemd 219 version.

> > More details:
> > http://cgit.freedesktop.org/systemd/systemd-stable/log/?h=v219-stable

> Is the idea of these patches to reproduce 219-stable in oe-core? If
> yes, wouldn't it be easier to use systemd-stable repo and just update
> the SRCREV instead of error prone patching? Or maybe I'm missing
> something here...

I was just wondering the same thing myself...

Sure, it might be slightly more obvious which fixes are applied; on the
other hand, unless we plan to only add a subset of the stable fixes in
219-stable, there's no real reason to avoid 219-stable in my opinion.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

