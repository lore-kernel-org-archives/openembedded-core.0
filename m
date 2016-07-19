Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E546260746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 08:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6J83x7w028635; Tue, 19 Jul 2016 09:04:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7J_9Kx-K0uqD; Tue, 19 Jul 2016 09:04:17 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6J84CE5028789
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 19 Jul 2016 09:04:14 +0100
Message-ID: <1468915452.14148.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bavery <brian.avery@intel.com>, openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2016 09:04:12 +0100
In-Reply-To: <cover.1468363460.git.brian.avery@intel.com>
References: <cover.1468363460.git.brian.avery@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] toaster: Better SDK artifacts and fstypes V2
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
X-List-Received-Date: Tue, 19 Jul 2016 08:04:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-07-12 at 15:54 -0700, bavery wrote:
> This is part of a patch set that is split over the openembedded-core
> and
> bitbake-devel mailing lists.  This is a second version of the patch.
> 
> These patches remove complexity from the toaster.bbclass in order to
> move those
> functions to bitbake/lib/toaster.
> 
> The overall intent of this set is to improve Toaster's ability to
> locate artifacts,
> specify fstypes correctly, and add some tests for these changes.

FWIW you stripped a directory level off these patches so they didn't
apply. Since I'd already merged the bitbake changes, I fixed these
patches by hand.

Cheers,

Richard

