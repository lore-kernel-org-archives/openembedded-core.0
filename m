Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B5B2F73177
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12FvASF013134; Tue, 2 Feb 2016 15:57:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JScMclxGK0j0; Tue,  2 Feb 2016 15:57:10 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12Fv8WV013118
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 2 Feb 2016 15:57:09 GMT
Message-ID: <1454428628.27087.84.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ed.bartosh@linux.intel.com
Date: Tue, 02 Feb 2016 15:57:08 +0000
In-Reply-To: <20160202125511.GA10780@linux.intel.com>
References: <cover.1454397260.git.ed.bartosh@linux.intel.com>
	<4a80d3209aa669db75e6343646ddb6a127ad8fc2.1454397260.git.ed.bartosh@linux.intel.com>
	<1454424619.27087.80.camel@linuxfoundation.org>
	<20160202125511.GA10780@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH 02/15] runqemu: don't use virtio for wic images
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
X-List-Received-Date: Tue, 02 Feb 2016 15:57:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-02 at 14:55 +0200, Ed Bartosh wrote:
> On Tue, Feb 02, 2016 at 02:50:19PM +0000, Richard Purdie wrote:
> > On Tue, 2016-02-02 at 09:27 +0200, Ed Bartosh wrote:
> > > qemu hands with 'waiting for root device' message during the
> > > boot of wic images if '-drive if=virtio' option is used.
> > > 
> > > Removed if=virtio from qemu command line for wic images. This
> > > should fix above mentioned boot issue.
> > 
> > Does this not change the command for other image types too?
> No, it doesn't. This patch changes qemu command line only for wic
> images.

Sorry, somehow I didn't see the second line in that diff which adds it
back.

I do worry about creating too many codepaths in this code though. Any
idea why virtio doesn't work?

Cheers,

Richard

