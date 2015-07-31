Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 036B976579
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 14:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VEdr9s009732; Fri, 31 Jul 2015 15:39:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3kHaK2mj7nbP; Fri, 31 Jul 2015 15:39:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VEdefn009693
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 31 Jul 2015 15:39:51 +0100
Message-ID: <1438353580.22462.82.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: He Zhe <zhe.he@windriver.com>
Date: Fri, 31 Jul 2015 15:39:40 +0100
In-Reply-To: <55BB5FDB.4080707@windriver.com>
References: <cover.1437461993.git.zhe.he@windriver.com>
	<c3b8e75db6f2ebc1bd9e53a4f01da0d642e4edcb.1437461993.git.zhe.he@windriver.com>
	<CABcZAN=D=2FUBHmSRiwYE7PbqHsjYJUQB5PkfvnQYO-=YFJecw@mail.gmail.com>
	<55AEFFFA.8080308@windriver.com>
	<1438341880.22462.25.camel@linuxfoundation.org>
	<55BB5FDB.4080707@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] kernel: Define KERNEL_IMAGETYPE as a list
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
X-List-Received-Date: Fri, 31 Jul 2015 14:39:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-07-31 at 19:45 +0800, He Zhe wrote:
> On 07/31/2015 07:24 PM, Richard Purdie wrote:
> > On Wed, 2015-07-22 at 10:29 +0800, He Zhe wrote:
> >> On 07/21/2015 10:53 PM, Christopher Larson wrote:
> >>> On Tue, Jul 21, 2015 at 12:23 AM, <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>wrote:
> >>>
> >>>     From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
> >>>
> >>>     To support building packaging and installing multi types of kernel
> >>>     images, such as zImage uImage, at one time define KERNEL_IMAGETYPE
> >>>     as a list.
> >>>     Modify wherever reference KERNEL_IMAGETYPE accordingly.
> >>>
> >>>     Fixes [YOCTO #6945].
> >>>
> >>>     Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
> >>>
> >>>
> >>> Question, why not add KERNEL_IMAGETYPES, and make KERNEL_IMAGETYPE equal to your new KERNEL_IMAGETYPE_0?
> >> Adding a new KERNEL_IMAGETYPES will also work. But it should be better
> >> not to change the name of KERNEL_IMAGETYPE, so that those who have
> >> used it don't have to change their code.
> >>
> >> Thank you for reviewing.
> > I have to agree with Chris here, keeping KERNEL_IMAGETYPE as used today
> > and equivalent to KERNEL_IMAGETYPE_0 and adding KERNEL_IMAGETYPES does
> > seem like a cleaner way to implement this.
> 
> But it might mean we are going to check both KERNEL_IMAGETYPE and KERNEL_IMAGETYPES
> to generate final image type list. Is that OK?

Well, in some places you will use one and in some places you'll use the
other, that is unavoidable. 

I much prefer "KERNEL_IMAGETYPE and KERNEL_IMAGETYPES" to
"KERNEL_IMAGETYPE_0 and KERNEL_IMAGETYPE" as variable names though.

Cheers,

Richard


