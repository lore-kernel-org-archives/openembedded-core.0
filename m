Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 916BE6011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 23:25:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4TNPbwn014768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 30 May 2017 00:25:38 +0100
Message-ID: <1496100337.25229.147.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 00:25:37 +0100
In-Reply-To: <20170526212248.16374-1-twoerner@gmail.com>
References: <20170526212248.16374-1-twoerner@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 30 May 2017 00:25:38 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] mesa: potentially enable texture float for gallium
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
X-List-Received-Date: Mon, 29 May 2017 23:25:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-05-26 at 17:22 -0400, Trevor Woerner wrote:
> Somewhere along the path from OpenGL ES 2.0 to OpenGL ES 3.0 are some
> algorithms that are encumbered by patents. These algorithms are
> enabled with
> mesa's --enable-texture-float configure flag. However, if hardware
> acceleration is being used and the hardware supports --enable-
> texture-float,
> it means the hardware vendor has paid for the patents.
> 
> This patch will add --enable-texture-float for any hardware-backed
> gallium
> mesa driver. In other words, if you are only using the software
> backup
> (swrast) you'll need to enable this flag if you know what you're
> doing (which
> assumes you are complying with the patent). Otherwise we enable this
> flag so
> the software can take full advantage of the hardware.

Does this handle the case where the driver may or may not run on a
platform with the relevant hardware? Some platforms add swrast as well
as hardware acceleration which based on what I read above, may breach
patents depending on which hardware its run on?

Cheers,

Richard

