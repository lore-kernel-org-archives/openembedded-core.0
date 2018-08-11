Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7ECB9607AD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2018 09:59:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w7B9x1go011864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 11 Aug 2018 10:59:03 +0100
Message-ID: <3cfe4ef7344707088d266dd83b1eb698f103ad29.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Jonas <mark.jonas@de.bosch.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Aug 2018 10:59:01 +0100
In-Reply-To: <1533407162-21497-1-git-send-email-mark.jonas@de.bosch.com>
References: <1533407162-21497-1-git-send-email-mark.jonas@de.bosch.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [meta-oe][PATCH] directfb: fix tslib version check in configure.in
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
X-List-Received-Date: Sat, 11 Aug 2018 09:59:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-08-04 at 20:26 +0200, Mark Jonas wrote:
> From: Guan Ben <ben.guan@cn.bosch.com>
> 
> The patch makes sure that the old as well as the new tslib pkg-config
> metadata file naming style is handled correctly.
> 
> tslib 0.0 to 1.0 created only a tslib-<VERSION>.pc pkg-config
> metadata
> file.
> 
> With tslib 1.1 the tslib-<VERSION>.pc phase out was started.
> Additionally, the pkg-config metadata file tslib.pc was added.
> 
> Since tslib 1.6 the tslib-<VERSION>.pc metadata file is deprecated.
> Now, there is only a tslib.pc.

I'm a little confused about why OE needs this patch? Surely OE is using
the more recent tslib releases and therefore we don't need this patch?

Cheers,

Richard

