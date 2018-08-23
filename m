Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 65E6E792C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 06:48:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7N6mkgh002724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 23 Aug 2018 07:48:47 +0100
Message-ID: <1ed3d54c1a3af5e745fd84d1195d860ec7680d1d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 07:48:46 +0100
In-Reply-To: <20180822083712.46032-1-hongzhi.song@windriver.com>
References: <20180822083712.46032-1-hongzhi.song@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] cryptodev-linux: Fixes a kernel crash observed with cipher-gcm test
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
X-List-Received-Date: Thu, 23 Aug 2018 06:48:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-22 at 01:37 -0700, Hongzhi.Song wrote:
> +Upstream-Status: Backported

The correct field value is "Backport", please use that in future.

No need to resend as I've just tweaked the patches in -next as I don't
want to have to go through another round of testing for it.

Cheers,

Richard

