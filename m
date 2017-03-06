Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id C283F77654
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:21:32 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id y193so68185369lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Mar 2017 23:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=ZJX8hqap7VyFD8k5bmdJsAiNfxD7a6dDMsWtB8IeSws=;
	b=xdS4ggHT655Y/5F43xL4G4QzhS2iu1cRRLexSH0pJTk9koVQTMXyVnmK71rVpg+KaR
	43oBk3CwGND/ZlYYajnjY3O5DV4THU9KOijrRNfIKBEyAuJhnL3xllt3bx8mJ8cjlO4o
	bALx2/jx+rDvt4E7+XRkXxc2RX1LtvEH8oUynh7HORpiS0xKiJhezjtlutlsFXZQ6DWh
	qwZy6j507/87qJpsJTMKoKJeJL5ftgY/KrhOGhc0KqMMFnpue8LArAJ1Eo85Qun8Js7u
	UWLrHxiTuLypW7qdhQ/9sd0uDVdHpYU68FRReJOXo58U9XddkiqxIL6EodGkPQlFYTty
	PI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=ZJX8hqap7VyFD8k5bmdJsAiNfxD7a6dDMsWtB8IeSws=;
	b=oQcs7FQ+q7ugUXP7anlTzwuMF6GNGDhTda2SqdGOPz5j+IjSj7boirJlzCQWWMFc/H
	C1o3myY4MpBusC+5e11w+JCllTrS43hYakyAHnSSCa93Jp9eyaErFV4UgxFjHvVU/OTf
	9epOeLaXevrmn73hgVG69mWrrKaQMNlE2NiJLi+tQNi0Mcq0Ita3JoTGRfNKXkzz1Y9T
	8BAWbgQzAk798muM0T9CcFVOTJFLREm+3lTCLIOafj+Jpse6LuwuXBGy+WWwygS49LAH
	q2PlLidQiXxhEP/RBHCDWwrxQt18701eNZdZsL82y8P1NJKWCuWyC3MiC8YA5u2j/GjI
	IwLg==
X-Gm-Message-State: AMke39mpuDs3/Mbj0MfauxMqbX98XbWH+8AjhlA3mgr7sC3nu8Pz2VKMCUCzeJ1rNGQlVg==
X-Received: by 10.25.235.214 with SMTP id f83mr4415218lfk.27.1488784892176;
	Sun, 05 Mar 2017 23:21:32 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	y26sm4006384lja.48.2017.03.05.23.21.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 Mar 2017 23:21:31 -0800 (PST)
Date: Mon, 6 Mar 2017 08:21:29 +0100
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20170306072129.usryssqrwguoftdg@ad.chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1488388550.git.anders@chargestorm.se>
	<12830a63c0c221f1a3a227173a69d55111359b8a.1488388550.git.anders@chargestorm.se>
	<CAMKF1spaobz07gVftrY+ZKxUrXKfcXBvf0QUKLp=agh8fDWeug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spaobz07gVftrY+ZKxUrXKfcXBvf0QUKLp=agh8fDWeug@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [PATCH 2/7] create_npm.py: convert MIT/X11 to MIT
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
X-List-Received-Date: Mon, 06 Mar 2017 07:21:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Khem Raj <raj.khem@gmail.com> [170303 02:18]:

> On Wed, Mar 1, 2017 at 9:19 AM, Anders Darander <anders@chargestorm.se> wrote:
> > Quite a few npm packages declare MIT/X11 as their license. This is equal to
> > a pure MIT license.

> it would be good if you could attach a link where this can be referred to.

Sure, I'll try to find a good, authorative one...

Unfortunately, the initial quick searches mostly returns wikipedia
pages, as well as number of company sites stating this. I need to search
a little bit more in order to find a better reference.

In worst case, I link to a page with the X11 license text, to ease
manual inspection.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

