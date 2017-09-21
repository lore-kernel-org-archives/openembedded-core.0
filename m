Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 075BC77F70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 08:17:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8L8H7hC015009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 21 Sep 2017 09:17:08 +0100
Message-ID: <1505981827.18640.156.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 09:17:07 +0100
In-Reply-To: <20170919182734.15741-3-sgw@linux.intel.com>
References: <20170919182734.15741-1-sgw@linux.intel.com>
	<20170919182734.15741-3-sgw@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/3] wic: remove systemd-boot for x32
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
X-List-Received-Date: Thu, 21 Sep 2017 08:17:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-09-19 at 11:27 -0700, Saul Wold wrote:
> Currently systemd-boot actually incorporates libgcc, since the
> systemd-boot needs to be built with 64bit instructions it can not
> use the x32 based libgcc.

I'm a little confused by this since the point of x32 is that it uses
all the 64 bit instructions with a 32 bit address space?

Cheers,

Richard

