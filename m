Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id AE1AE71A6D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 07:49:22 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id o16so5832550lff.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=fGHzJc5oFXoUGeGK0zSE8ncVVHZbaRlR8VWve8ML8Is=;
	b=pL4mYDiHoVhws6FxZe0JoSKaRwXc5AikSAQp0LPeYRvhi0RzCzTUfu7kdurkOxL8tz
	MKF9LzlgLpIHQBvM1+MMC0qBWbMmlcDb2ebuzOvxxmfIxoGRSCC9hm67WWB2eWEV3r4N
	ixemMwqr3woETfHQM7vAKgSgsI9A6cZoVKypC0IWRRe63GO8LVLSXlhcGxYe1OvugRH9
	lkEcRjm7yPGhZBpUzGukwt7DChgsxJBy7RWX6oosa6Q0x6KB9hWofiZ0bEbhZdWF9Mba
	GWOo/QH2bA7U0bHYa8bwb9D3yWFZ8f8euJ72cStRoF2ErI1RGcRQ1bZ9gNWIzRj1PbNw
	Soew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=fGHzJc5oFXoUGeGK0zSE8ncVVHZbaRlR8VWve8ML8Is=;
	b=lhuu6Rko/iQ9xloExFRjB2A0sUPzDs/gT80B/pL0QDSgI0xxBdSFwWoldNJ4Vl1AR1
	k6jniE5ba6/49eC+8Bb6iOj5bndVl783aJehlDxUaZKmHDDGcxsvWY064YsEHl6YVJ4R
	aQoRPHhZE4E0EzQDz6L0onrH4wVAXskKX4Nu3cnbNiWcluprw0P5mrUXOOM8Ivl2/ddC
	2Slt6x2OxBppMUy/Senw1cFAe3iCQMlarr1f2ziO9dLU2mDQRDsr4lQ+awvHNAysQttq
	ats3Pc29FlufK3dcusLxtozaJRrlXtqUVf3/ZJL2ARky1p4BZ/xpOmduYMJEOSrCLscY
	vU8g==
X-Gm-Message-State: ABUngvdOxbZ9YCpAwoLlq0yuuOZ+MlEz4hXbLRBOYJak/MDEqm0p85XQZx0zsLMj4o/mhQ==
X-Received: by 10.25.26.73 with SMTP id a70mr9630988lfa.108.1477381763524;
	Tue, 25 Oct 2016 00:49:23 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-49-no126.business.telia.com.
	[213.64.218.49])
	by smtp.gmail.com with ESMTPSA id u3sm3638011lja.8.2016.10.25.00.49.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Oct 2016 00:49:22 -0700 (PDT)
Date: Tue, 25 Oct 2016 09:49:21 +0200
From: Anders Darander <anders@chargestorm.se>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Message-ID: <20161025074921.sqpe3dup4jqkcqe5@ad.chargestorm.se>
Mail-Followup-To: "thilo.cestonaro@ts.fujitsu.com"
	<thilo.cestonaro@ts.fujitsu.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, 
	"raj.khem@gmail.com" <raj.khem@gmail.com>
References: <58072ca7.c70f420a.fed0f.74b1SMTPIN_ADDED_BROKEN@mx.google.com>
	<432953B0-59CB-4E94-A670-C4BD4A12C88A@gmail.com>
	<1476944666.6754.1.camel@ts.fujitsu.com>
	<20161024043614.3gqmsqpu2h52tnpr@ad.chargestorm.se>
	<1477380507.4894.4.camel@ts.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1477380507.4894.4.camel@ts.fujitsu.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20161014 (1.7.1)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain and meta-toolchain-qt for specific image
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
X-List-Received-Date: Tue, 25 Oct 2016 07:49:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* thilo.cestonaro@ts.fujitsu.com <thilo.cestonaro@ts.fujitsu.com> [161025 09:28]:

> Hey

> > Well, have your image `inherit populate_sdk_qt5`, and then call

> > `bitbake <your-image> -c populate_sdk`. That'll give you the standard,
> > image-based SDK, with Qt5 in it.

> Can the image and the sdk be build seperatly then? Or will a "bitbake <my-image>" build the qt5 toolchain directly too?
> This is what I intended to get rid off. To be able to build the image and the sdk in two independed build steps.

Yes, `bitbake <my-image>` does only build your image and `bitbake
<my-image> -c populate_sdk` does only build the SDK. 

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

