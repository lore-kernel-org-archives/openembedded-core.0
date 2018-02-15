Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3AF72F42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 17:13:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1FHDjZJ014638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Feb 2018 17:13:46 GMT
Message-ID: <1518714825.24236.163.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 15 Feb 2018 17:13:45 +0000
In-Reply-To: <fdad56afc0b04ea511507234935c6029303902b5.1517798422.git.liezhi.yang@windriver.com>
References: <cover.1517798422.git.liezhi.yang@windriver.com>
	<fdad56afc0b04ea511507234935c6029303902b5.1517798422.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/4] nfs-utils: 2.1.1 -> 2.3.1
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
X-List-Received-Date: Thu, 15 Feb 2018 17:13:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-02-05 at 10:41 +0800, Robert Yang wrote:
> * Remove 0001-configure-Allow-to-explicitly-disable-nfsidmap.patch,
> now the
>   nfsidmap can't be disabled when nfsv4 is enabled, and nfsidmap
> requires
>   keyutils, so we have to disable nfsv4 by default since keyutils is
> not
>   available in oe-core, or we can add it oe-core.
> 
> * Drop nfs-utils-1.2.3-sm-notify-res_init.patch and
>   0001-include-stdint.h-for-UINT16_MAX-definition.patch which are
> already in the
>   source.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Fails on musl:

https://autobuilder.yocto.io/builders/nightly-musl/builds/782/steps/BuildImages/logs/stdio

Cheers,

Richard

