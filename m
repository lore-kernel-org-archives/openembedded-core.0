Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id B9D2E60167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 16:24:06 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id i13so4844761qae.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 09:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=S1VFW5Qb58RUREIKWbRMI9apSj2Uo4xdcTkepxx3Y8s=;
	b=T+tCws3WpHTubiBLDHbhJBSzbAKERzLjqkRbI7GgmCz0+tbN0KMwTkIIL4Mjhdun38
	vkyQ8KgA6tD0ZQSqoc/tF1l46gdbKpD1Nd4oaH9AVqYVD1AY6u+WAQXLUkWbulSxIESq
	/noztAmdiMDC0F92GNzSR9RtoKhPv/+ZU2A8KhO3ci0eJtxZH+sqja49XPzIFiyYO/io
	OZ6cPIfbte87L0Cqq/aRQzp5DIeON35fFYazivZ1t2Zn6AXoSqtnkh6mzgIS5Q85qIj5
	8UHIEjjyaXy7tHgkEB+62JAOTbDqmfphNU/Onk1CV+Vo0Wk/UqofuyW4XO1wRjPx8tVG
	U5yw==
X-Gm-Message-State: ALoCoQnFTpnPz5HY97pJHUqQpLbymeff7k6tQODjGnu+rIVv7drhBQXi90RjT9khwjQbmOyw2QNy
X-Received: by 10.229.238.133 with SMTP id ks5mr19343542qcb.23.1411662247890; 
	Thu, 25 Sep 2014 09:24:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 25 Sep 2014 09:23:47 -0700 (PDT)
In-Reply-To: <bfe37164c0903446469c66e1bacfc77207c69e65.1411636114.git.Chong.Lu@windriver.com>
References: <cover.1411636114.git.Chong.Lu@windriver.com>
	<bfe37164c0903446469c66e1bacfc77207c69e65.1411636114.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Sep 2014 17:23:47 +0100
Message-ID: <CAJTo0La5JxzLKA=VHs3wwnqSwVtEOEEn9ODPtkG_1Fo-P37RcQ@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] apt: fix for CVE-2014-0478
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
X-List-Received-Date: Thu, 25 Sep 2014 16:24:10 -0000
Content-Type: text/plain; charset=UTF-8

On 25 September 2014 10:09, Chong Lu <Chong.Lu@windriver.com> wrote:
> +++ b/meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch
> @@ -0,0 +1,188 @@
> +This patch comes from:
> +https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=73;filename=apt_0.9.7.9%2Bdeb7u2.debdiff;att=1;bug=749795
> +
> +diff -uarN apt-0.9.9.4-org/cmdline/apt-get.cc apt-0.9.9.4/cmdline/apt-get.cc

This should have Upstream-Status and Signed-off-by tags.

Ross

