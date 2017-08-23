Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2963978218
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 07:50:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7N7oRwB000326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 23 Aug 2017 08:50:28 +0100
Message-ID: <1503474627.32591.139.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 23 Aug 2017 08:50:27 +0100
In-Reply-To: <CALatG=69H3SNAyieWRDXdUxMwvGCMFtF=gjmuufsK=TZoiLk0A@mail.gmail.com>
References: <1503315814-27663-1-git-send-email-liu.ming50@gmail.com>
	<CAJ86T=UGT-LDa_EgR_uBqA0jD8ide90ceJv+qk3Ck1v2cBjgbw@mail.gmail.com>
	<CALatG=69H3SNAyieWRDXdUxMwvGCMFtF=gjmuufsK=TZoiLk0A@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 23 Aug 2017 08:50:28 +0100 (BST)
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
X-List-Received-Date: Wed, 23 Aug 2017 07:50:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-23 at 04:33 +0200, Ming Liu wrote:
> Hi, Andre:
> 
> Arha, I did not know that when I was submitting the patch, may I know
> why it's rejected at that moment? Since even with the alternative
> fixes, the developers still could introduce duplicated whitespaces in
> their BSP layers if they do not know the rules, since it's quite
> common in recipes to assign variables with duplicated whitespcaces.
> 
> BTW: i just checked, it's been merged to master already.

No, it hasn't.

Cheers,

Richard

