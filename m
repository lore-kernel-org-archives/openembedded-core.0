Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172])
	by mail.openembedded.org (Postfix) with ESMTP id 467EF7920A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 12:05:45 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id l197-v6so17780333oib.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 05:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oB6Y5PSJqtsq7vzXPwca91KX0wCn+a4Tc9zkj/BlKOk=;
	b=iG18AOa9kXVzlzILOzqlHrD3OtWizoWmD9hUgZr2nQBoXOASenCQbrrrLbiEgdx0EZ
	GqFhyH8Qkka/ZUPrTyHlFjaOwr5X/vt5KYZfKtzXZJxbCA5CUz1zSMy4/pRm65z73/7h
	JiVEURCnAvYa6GaDVHogFrsfcx0xrBYrAaay3hSOMNAZ7i6Mc72S3Qzk5w3XFDvSCnA9
	nT+Xu9CqdbGAfe2j5iHrBkYgmeP5hjIGVk+lxfu7VH1Q7uH3oIz2mH/kWhwu2Tbpd8MC
	pUX4hi9XZ9xYoxIQbWm9kQE6j43Toh6f5OmfRFW1HucKqhajcyr9pg646ID3yONWp6Bu
	5Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oB6Y5PSJqtsq7vzXPwca91KX0wCn+a4Tc9zkj/BlKOk=;
	b=Hu12ZEz7mzXIzu0Pr9Frodsdjkv3z0ofAgOdyCdlNyoFKnHhrP3KIpoSPBlyoYKr+s
	lq73+3ZCMUt1ONV6FWWyiVh4WMATFBXkg8D1j2QfuF4Yh5Eq4sHu1eIwYkKUnYeuvXPP
	T/+CYklcQrANDoPsREGJyMOwBbdFp+IJ5QCMXLrpYU5d5z5iPsBYDnG98PSIZ26IhZWl
	EjGOb4VGtvGso/vwvVw0aE0h6IlNq0+O7vi8oJtR2zX9YFQlIFZ6gs7TpsDCoybc3uyu
	NgZD02YRp8pBQPIcuR+RCFECPAoeatwHQGqBhSSCv6aNdXtiqhkCuMXRAs9NVG9T/4sp
	tA2w==
X-Gm-Message-State: ABuFfoj91Cc/EMg2pXCSYiGGD6e/5seCi9qgSCwGhmvUlRqyPDc0D4pz
	Ar4EFX7CNo+Hj1nO53TfHUNfzfSBI0Z9jqhU53FmrA==
X-Google-Smtp-Source: ACcGV60oTBMzssYFrjbRlmpUVD7pHqfZhacZ62+Zl+QaERf+X5iIAeoIpLbwf5mrdqBOE1PLTSrhotNT9fyFzVkxdZs=
X-Received: by 2002:aca:b186:: with SMTP id
	a128-v6mr11905717oif.182.1539691546193; 
	Tue, 16 Oct 2018 05:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20181016090054.122374-1-mingli.yu@windriver.com>
	<fb67373823b7952f1acf022bed6bd40611c74754.camel@linuxfoundation.org>
	<CAJTo0LbbgiiPQSanVFuibf2PpYmVr9t1vebxZD6OT7DF+BdhDw@mail.gmail.com>
	<CAJTo0LZT1ytnsBoKkfdwv8GThzsOCjoQtLdbe9dtFPMaPupMxw@mail.gmail.com>
In-Reply-To: <CAJTo0LZT1ytnsBoKkfdwv8GThzsOCjoQtLdbe9dtFPMaPupMxw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Oct 2018 13:05:34 +0100
Message-ID: <CAJTo0LY79q4La-mTQwG552XAkwJ8UTLp9yztVCd4g7m-pogpKw@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost.inc: make libboost_python3.so available
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
X-List-Received-Date: Tue, 16 Oct 2018 12:05:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Oct 2018 at 12:18, Burton, Ross <ross.burton@intel.com> wrote:
> OpenCV has a patch to "fix" (bodge) the Py2 build:
>
> https://github.com/ros-perception/vision_opencv/pull/239
>
> But this doesn't work for Py3.

This was just pushed:
https://github.com/ros-perception/vision_opencv/commit/b57fd5b

Ross

