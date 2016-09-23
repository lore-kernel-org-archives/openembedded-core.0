Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 45AA260807
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 15:20:19 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id e66so31794244iod.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 08:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=t3RlgOUCVhop2M8gJ0EowdKbjreOFlKt+HPYMpEdMYY=;
	b=ebA/q1auGOnMUMk/1c3Tlbkq0cU5z0IJri8XeaaKzBjb+bA4SlOwzAK5XYU7bngpKE
	PiElu7LWbzomeoeQZ2eRi3wTMaP3WoKDUK00DDOZf83klR4FZcju3Irwj9bqj5i213dj
	5OMJYjFOHhreyJkvL6UCAv1ThUJA4F0JySx/02AKfBTHsyQdVRbBJO9x7vQqduMlg80C
	yoLJg7+SdFqIj9YZ2OwJvnoEVfIKOL7oDejnu5YZXYsW+EMQddYpMgvTYBjn2gnNIg7q
	FgaTcO14LOWVMsgld/sFNUWbg2v8Za2B881LUIe9xtpzNqaYcDuPXtz2jDnKcCr2B3bZ
	N/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=t3RlgOUCVhop2M8gJ0EowdKbjreOFlKt+HPYMpEdMYY=;
	b=XaVnGtDL++L3ItiwImhEU63anxtW4gePm1votY9+VUGFfv0GyeBXZW63mmtPjgvEDN
	jhm40YFg1Rx/IgISJa0mfEHWo4hlS2Rvrz2yk9deHGBKfEtgc1YHhzAWscFEwZmQb4mR
	rQnuhQP98ODuFs+M4NFytEcVuoAVXkYWPQNvUVf8Ma1k4D6t/3FDzb+UY15291Tn66WM
	dy0aUONPR75wuIwn3GIJUTBpmPl1UCEDp0IIP6rPFE4sKQiyKzppX3yT/BgC/t0SQRXR
	BDaW0ff4ONndJablmVgiNZEElHGhFZee8EEhukE/Q0SySy5YoJ4pVLONpUmls8xDph8x
	J7HQ==
X-Gm-Message-State: AA6/9Rnv/wjTgpr2MzolO8U4QoTvuVt7gwIRM3mOl8g408x8Pz2itrZzUCIprJt428YPj9HC
X-Received: by 10.107.131.7 with SMTP id f7mr6396058iod.91.1474644020524;
	Fri, 23 Sep 2016 08:20:20 -0700 (PDT)
Received: from pohly-mobl1 (p57A56298.dip0.t-ipconnect.de. [87.165.98.152])
	by smtp.gmail.com with ESMTPSA id
	l187sm2980514iol.37.2016.09.23.08.20.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 08:20:10 -0700 (PDT)
Message-ID: <1474644006.8561.15.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 23 Sep 2016 17:20:06 +0200
In-Reply-To: <5465751.PuAniykgrn@peggleto-mobl.ger.corp.intel.com>
References: <1474620517-4809-1-git-send-email-anujx.mittal@intel.com>
	<20160923085640.GA17846@mbabyjoh-desk.ger.corp.intel.com>
	<5465751.PuAniykgrn@peggleto-mobl.ger.corp.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, Armin Kuster <akuster@mvista.com>
Subject: Re: [master][PATCH] openssl: security fix CVE-2016-6304
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
X-List-Received-Date: Fri, 23 Sep 2016 15:20:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[resending from my Intel account, the one on GMX isn't subscribed]

On Fri, 2016-09-23 at 21:06 +1200, Paul Eggleton wrote:
> On Fri, 23 Sep 2016 11:56:41 Maxin B. John wrote:
> > On Fri, Sep 23, 2016 at 04:48:37PM +0800, Anuj Mittal wrote:
> > > Reference:
> > > https://www.openssl.org/news/secadv/20160922.txt
> > > 
> > > Upstream fix:
> > > https://github.com/openssl/openssl/commit/e408c09bbf7c3057bda4b8d20bec1b3a
> > > 7771c15b
> > > 
> > > Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
> > > ---
> > > 
> > >  .../openssl/openssl/CVE-2016-6304.patch            | 75
> > >  ++++++++++++++++++++++
> > Mid air collision with Patrick's patch.
> 
> I guess for krogoth and jethro we have the choice of applying just this fix or 
> the upgrade. Looking over the commits for 1.0.2i it does look like quite a lot 
> more than the list of CVEs in the recent security advisory were fixed, and 
> it's somewhat concerning that the 1.0.2i release went out with an apparently 
> compile-breaking typo in it (subsequently fixed, patch applied in Patrick's 
> upgrade).

The compile error is inside an #ifdef, so it could be that just that
particular configuration hadn't been tested. But yes, one has to wonder.

So what's preferred for OE-core master and the 2.2 release? Updating to
1.0.2i or backporting the critical patch?

I don't have any strong opinion either way myself.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




