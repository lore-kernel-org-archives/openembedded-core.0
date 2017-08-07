Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4F99770016
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 13:00:03 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v77D00Hi023982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 7 Aug 2017 14:00:02 +0100
Message-ID: <1502110800.18633.220.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 07 Aug 2017 14:00:00 +0100
In-Reply-To: <41176f6a-807d-f488-7f55-38ee82cc48bf@linux.intel.com>
References: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
	<41176f6a-807d-f488-7f55-38ee82cc48bf@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 07 Aug 2017 14:00:02 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: Meson support in oe-core
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
X-List-Received-Date: Mon, 07 Aug 2017 13:00:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-07 at 15:19 +0300, Alexander Kanavin wrote:
> On 08/07/2017 03:09 PM, Jussi Kukkonen wrote:
> Looks like 2017 is when autotools is finally being replaced en masse
> by 
> various projects, particularly those related to gnome stack. Even 
> relatively large projects like gstreamer are going forward with it.
> The 
> replacement is meson, whose advantages over autotools are major, and 
> disadvantages are minor:
> http://mesonbuild.com/
> 
> Ross and I have done some work on bringing meson support into oe-
> core. 
> One recipe has been fully migrated to meson (including tricker bits
> like
> gtkdoc, and gobject introspection). Going forward that will be the 
> default when a project has both that and autotools, and of course we 
> should be ready for the situation when autotools support is removed
> from 
> the upstream altogether.
> 
> http://git.openembedded.org/meta-openembedded-contrib/log/?h=akanavin
> /meson
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavi
> n/meson

Thanks for looking at this. Whilst some project still have some support
for both, could we get timings of do_{configure|compile|install} for
autotools vs. meson?

Cheers,

Richard

