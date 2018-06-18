Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8629375231
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:50:34 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5IAoVbp012174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 18 Jun 2018 11:50:32 +0100
Message-ID: <69b1e870bf8e8300273ad04b9ff24bc90a9dc998.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 11:50:31 +0100
In-Reply-To: <20180618100546.7482-1-ross.burton@intel.com>
References: <20180618100546.7482-1-ross.burton@intel.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] xf86-video-omap: remove
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
X-List-Received-Date: Mon, 18 Jun 2018 10:50:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-06-18 at 11:05 +0100, Ross Burton wrote:
> We were shipping the Debian fork of the original code, but that has
> disappeared
> now that Alioth is down.  The driver didn't provide anything better
> than the
> kernel and xserver's modesetting driver, so remove it.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>

This should be xf86-video-omapfb. I've tweaked when I added to -next.

Cheers,

Richard

