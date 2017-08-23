Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9C68277E3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 08:00:02 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7N7xvME002139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 23 Aug 2017 08:59:58 +0100
Message-ID: <1503475197.32591.140.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 23 Aug 2017 08:59:57 +0100
In-Reply-To: <CALatG=6NOefmTqj-1OatYNH+43Bpwzo0Xz+BdrMYrYjZMkJTkw@mail.gmail.com>
References: <1503315814-27663-1-git-send-email-liu.ming50@gmail.com>
	<CAJ86T=UGT-LDa_EgR_uBqA0jD8ide90ceJv+qk3Ck1v2cBjgbw@mail.gmail.com>
	<CALatG=69H3SNAyieWRDXdUxMwvGCMFtF=gjmuufsK=TZoiLk0A@mail.gmail.com>
	<1503474627.32591.139.camel@linuxfoundation.org>
	<CALatG=6NOefmTqj-1OatYNH+43Bpwzo0Xz+BdrMYrYjZMkJTkw@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 23 Aug 2017 08:59:58 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: trim duplicated whitespaces from BUILDCFG_VARS
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
X-List-Received-Date: Wed, 23 Aug 2017 08:00:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-08-23 at 09:57 +0200, Ming Liu wrote:
> Yes, it's in master-next not in master branch, but wouldn't that mean
> it's accepted as a proper fix, or?

It means it was queued for testing, I've dropped it from master-next
now as the comments from Chris still apply from last time.

Cheers,

Richard

