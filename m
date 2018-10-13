Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5406025E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 10:23:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9DAN3Yg011946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 13 Oct 2018 11:23:04 +0100
Message-ID: <801e73cf52b3eee76def61f23b7ab309bc2f117a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 13 Oct 2018 11:23:02 +0100
In-Reply-To: <CAMKF1spu=DkMXsn9AxkuRP0iQ6cPCyANMZXX6tkKgmkH5K87Kg@mail.gmail.com>
References: <20181012115502.14205-1-ross.burton@intel.com>
	<20181012115502.14205-2-ross.burton@intel.com>
	<CAMKF1spu=DkMXsn9AxkuRP0iQ6cPCyANMZXX6tkKgmkH5K87Kg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] python: remove the PN package entirely
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
X-List-Received-Date: Sat, 13 Oct 2018 10:23:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-10-13 at 00:10 -0700, Khem Raj wrote:
> I am seeing core-image-sato-sdk-ptest fail to build with errors like
> 
> http://errors.yoctoproject.org/Errors/Build/69750/
> http://errors.yoctoproject.org/Errors/Build/69747/
> 
> So taking a wild guess, this series might be one causing it.

This patch also triggered failures on the autobuilder, basically when
the ipk/deb backends are enabled.

https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/48723/raw
https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/48841/raw
https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/48914/raw

Cheers,

Richard


