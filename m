Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id D091360746
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 07:12:30 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id x1so119787457lbj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Mar 2016 23:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=4A5buTQE6CgKMaF49IqXo2DaRAqd/vqI8eRQDvyC3Fw=;
	b=I69aLYKpLhLu0ewcP6PL/d3+Lm8vUTrWIWtS5S/4ZzvSsO970oaan0YFJS4Qy0is2u
	RbdtOLvS+14IDq1PGMLhVc91MELNJLdZ7hrWgeSuVw7KFgHugv5Sx9vdldsGjKjaMc/F
	VNVbjcBiO8v5fgzHMYzxHx9oLILoufdTb3iojHgVpTJheUc/9dpHewTfso3mS+pD5nKj
	ITyN8N77uW5fsCd/pFMRmvRKJbids3e+THmeI3hkZGNkPGi9D1CuwAiCcL9fPZztUwac
	LpkniNclSFUyIaA9WZ7fa6SkAq0ARX3bvpPy8ECbR9AZK5SobUX4Kfsce/9WZV68iJJ4
	wY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=4A5buTQE6CgKMaF49IqXo2DaRAqd/vqI8eRQDvyC3Fw=;
	b=doQn7NWRHHmKEmtl4/OQXvHOETm6GB5BAlT5P5ucjFL5qZVfEqntB7i2oADQqWkqH3
	1kaZgTY6DgXbQJYFkN5Dpt7rj1S5pjYIRCYXfdyMud2bsp9kIf99qCZgiNt44bXkoafx
	JL20yXyKiIk6NtWocqQIPbhK1Uvxm0418xOamOk7eUbaI2C8yV/zkC0tWBdbiYkvh48Q
	DQshnncY0RSlco9H2tf8ULoodwrXENydOSbMb2SPEGqH0CH1m2PP5Qnfphpaz0qzO8u0
	LFsIfxNOfKe59yV6WMkSLiOMnYcC09teRplzudRtuiqHIAKusjac2miWW5UvKEjMjOcI
	bO3w==
X-Gm-Message-State: AD7BkJJO4XFjKgxwaeMY9XaxLyc6MXfrDRYTAP8lhMYg+Mh/jV/cOXmSRGRzS3JZyFWxZg==
X-Received: by 10.112.126.72 with SMTP id mw8mr7351994lbb.14.1457334749810;
	Sun, 06 Mar 2016 23:12:29 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	qn2sm2555894lbb.49.2016.03.06.23.12.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Mar 2016 23:12:28 -0800 (PST)
Date: Mon, 7 Mar 2016 08:12:27 +0100
From: Anders Darander <anders@chargestorm.se>
To: winiston@futuraautomation.com
Message-ID: <20160307071227.GB25007@ad.chargestorm.se>
Mail-Followup-To: winiston@futuraautomation.com,
	"Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>
References: <20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
	<2CD39F82881F465AAD78DBB61BCA369E@RD3>
	<CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
	<E744C7D53BB7428AB0FD15C117627D11@RD3>
	<20160226093319.GA4329@ad.chargestorm.se>
	<38408F728A334E9F9A452EFD2448CC8D@RD3>
	<CAJTo0LbAoSeWVikqA4t9vXrbSnoiWwOWwLBLPtGPLwwr7E3w+g@mail.gmail.com>
	<25A507B472054F9B9002D68314A7C388@RD3>
	<CAJTo0LYqPQDVoKdFPP4onF-V+0fJ3fZU5CAk_ao3QdbgN05RRA@mail.gmail.com>
	<7C340AF3BCDD49AB919DB23371FBDEE5@RD3>
MIME-Version: 1.0
In-Reply-To: <7C340AF3BCDD49AB919DB23371FBDEE5@RD3>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [linux-yocto] How to integrate third party application software to yocto image
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
X-List-Received-Date: Mon, 07 Mar 2016 07:12:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* winiston@futuraautomation.com <winiston@futuraautomation.com> [160305 06:45]:
> winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
> Loading cache: 100% |##########################| ETA:  00:00:00
> Loaded 2176 entries from dependency cache.
> ERROR: ParseError at /home/winiston/poky/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb:12: Could not inherit file classes/bash-completion.bbclass

> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> winiston@winiston-VirtualBox:~/poky/build$ 

Well, the networkmanager recipe in mete-oe needs a class,
bash-completion, which isn't available to you.

> meta              
> meta-yocto        
> meta-yocto-bsp    = "jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"

This tells us that you're using the jethro branch from OE-core. This
one doesn't have the class that you required earlier. The class is only
avalaible in the master branch.

> meta-oe           = "jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"

Well, this one lies to us, as you have only copied meta-oe. Had you
cloned the repository instead, we would be able to tell you that you're
not using the jethro branch of meta-oe, but rather the master branch, a
lot easier.

You need to use the correct branches for all your layers. Mixing release
branches for certain layers, and master branches for other is a no-go,
unless you know what you're doing. (And can handle the pain yourself).

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

