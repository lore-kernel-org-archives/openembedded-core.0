Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 69EAC783AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 13:27:35 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5FDRTig010124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Jun 2017 14:27:30 +0100
Message-ID: <1497533249.3942.94.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Ed Bartosh
	<ed.bartosh@linux.intel.com>
Date: Thu, 15 Jun 2017 14:27:29 +0100
In-Reply-To: <CAJTo0LbEz_8uDR0xqSiyD4ZvcxRX4bFCS2Fyx1qn8g_xKTbsaw@mail.gmail.com>
References: <1497527986-20808-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAJTo0LbEz_8uDR0xqSiyD4ZvcxRX4bFCS2Fyx1qn8g_xKTbsaw@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 15 Jun 2017 14:27:30 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: get rid of IMAGE_DEPENDS
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
X-List-Received-Date: Thu, 15 Jun 2017 13:27:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-15 at 14:25 +0100, Burton, Ross wrote:
> 
> On 15 June 2017 at 12:59, Ed Bartosh <ed.bartosh@linux.intel.com>
> wrote:
> > The IMAGE_DEPENDS variable can be overriden to add dependencies for
> > individual image types.  Those dependencies are added to the
> > do_rootfs
> > task, while they really should be added to the specific image type
> > tasks.
> > 
> Other layers such as meta-raspberrypi use IMAGE_DEPENDS, should we
> move oe-core to use [depends] but handle IMAGE_DEPENDS (with a
> deprecation warning) for some of the 2.4 cycle?

Yes, a fatal error if IMAGE_DEPENDS is set and telling the user what to
change it to would be best IMO.

Cheers,

Richard

