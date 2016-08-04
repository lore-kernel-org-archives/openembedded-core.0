Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C2DC37422C;
	Thu,  4 Aug 2016 21:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u74L89QY005749; Thu, 4 Aug 2016 22:08:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ONz9Hl5vZRS6; Thu,  4 Aug 2016 22:08:09 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u74L85GD005745
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 4 Aug 2016 22:08:06 +0100
Message-ID: <1470344885.8166.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, openembedded-core@openembedded.org
Date: Thu, 04 Aug 2016 22:08:05 +0100
In-Reply-To: <CA+chaQc2YTwHbDTG6ABTfVq1Qrv3T9m8SMHPDv2qjL_gEknu=Q@mail.gmail.com>
References: <20160804195640.1105.71618@opal.openembedded.org>
	<CA+chaQc2YTwHbDTG6ABTfVq1Qrv3T9m8SMHPDv2qjL_gEknu=Q@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] branch master updated: Revert "packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput"
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
X-List-Received-Date: Thu, 04 Aug 2016 21:08:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-08-04 at 22:06 +0200, Martin Jansa wrote:
> I think it shouldn't be merged at all.
> 
> xinput-calibrator already RRECOMMENDS pointercal-xinput
> 
> And empty pointercal-xinput (with Ross's ALLOW_EMPTY patch) is as
> useless as pointercal-xinput without xinput-calibrator.

Agreed, I should probably have said "until the pointercal series gets
tweaked" as those tweaks should probably change this patch.

Cheers,

Richard

