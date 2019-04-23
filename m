Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f172.google.com (mail-it1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id DA1F77D2CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 17:46:48 +0000 (UTC)
Received: by mail-it1-f172.google.com with SMTP id u65so1618708itc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 10:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O2RWTxw0Tw6JyJ1NwJ16RkdvpCzfjDWHvAOM2zWFbuQ=;
	b=gzr4V4Rv1rjUvAXvgz9dOyUsSlIYY25cL3QCbVhU6fNGMuNbmNWGDVuiVkHd6Wey0Q
	COp12In9pJHEMY4GA39XDdB+NItJ5nd+5qhjfTOhrnWm9uY5wLGBJxdNaIS6z4gce0eT
	BEmA0/NOTWOhFVwLPh7lT8g0HmdcZdcQ0P6selcDFsZfxXzK3UN+ERKYT0FaDgFfGoRp
	1F3cdmtKqisfGgbpB82dSZoIgIsi1GfkLDirEOXIANe1MNFetqsfGXuHDLnwJ4vLkFR3
	PipuNfCeS+FyXTPSnp9/XIvrnAZQ8N+YPAOSdZi9sxtgBw+2b6Cr1IUmut1CMnOGRwLj
	iovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O2RWTxw0Tw6JyJ1NwJ16RkdvpCzfjDWHvAOM2zWFbuQ=;
	b=drA3t0+gX+RF/Lk8K9Cr1vQrmZ7nv/uBtcqYaIwfXQ6F9eGtD+sAQiisSrn1uwSom2
	qZp02WDMSxZETl8H8LB0XxuCNcIoOe6TNKpt8lvbDhZR2sFbRqmY8HBB+J/RBc4VwQQx
	3W/WdDLaCUcbLKjPrEzDyvM+bW/k+0UJJror1YSCRP+imL7lnHVXAn7Zh8AHlsPKiXRE
	zzTcjJiGlM7LFNF+LKEiaE4cHUtrGuo4e5RYUKIAFnHmC53LKvFBlJtoVmOK7ZiLpYiP
	n0xsXwR4pHotKU4OpjtUUei1wmA7mqV89DimV80Pr3rdnDc9613DP5H/iUCePCybcM5y
	x1BQ==
X-Gm-Message-State: APjAAAVpISkhiwvO0VHYJD4CjWgo0r3O++zDT1+f1Yig85V0Y3MkkDMH
	e62NUMx5cccMmlaLRRBIIj7C799m7vfVHLlNSqOevgAO
X-Google-Smtp-Source: APXvYqwN4RJ0GrYI8MPYA3+G2QqIOQkcLpLjl6XlN8KTO91z19u9GLL3PApIYZFAO/0Agm2f51aDXzGianiQxK+NaB0=
X-Received: by 2002:a24:52c5:: with SMTP id d188mr3266846itb.130.1556041609943;
	Tue, 23 Apr 2019 10:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190421194422.10862-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190421194422.10862-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2019 18:46:38 +0100
Message-ID: <CAJTo0LboX9h0K4E0AbY1x315qv6ng4hd2rw6fn2RXH6C09p-0Q@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] ell: add recipe
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
X-List-Received-Date: Tue, 23 Apr 2019 17:46:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Apr 2019 at 20:52, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
> +SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${PN}/${PN}-${PV}.tar.xz"

In native or nativesdk builds PN will be ell-native or nativesdk-ell,
so PN here should be BPN  Also BPN-PV can be shortened to just ${BP}.

Ross

