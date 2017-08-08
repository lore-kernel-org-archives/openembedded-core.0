Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D82FA719C8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:07:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v78L75uY030485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 8 Aug 2017 22:07:06 +0100
Message-ID: <1502226425.18633.256.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 08 Aug 2017 22:07:05 +0100
In-Reply-To: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
References: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 08 Aug 2017 22:07:06 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] libinput: Upgrade 1.7.3 -> 1.8.1
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
X-List-Received-Date: Tue, 08 Aug 2017 21:07:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-07 at 15:09 +0300, Jussi Kukkonen wrote:
> New feature release, see
> https://lists.freedesktop.org/archives/wayland-devel/2017-June/034286
> .html
> for the major features. This is the last major release to support
> autotools.
> 
> Configure flag "--enable-event-gui" changed name.
> 
> Configure flags no longer default to "auto": explicitly disable the
> things that were previously automatically disabled.
> 
> Package the binaries into libinput-bin while being careful with
> packaging as the main package gets renamed to libinput10.
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

Looks like there is a race somewhere in the new version:

https://autobuilder.yocto.io/builders/nightly-wic/builds/411/steps/BuildImages_1/logs/stdio

Cheers,

Richard

