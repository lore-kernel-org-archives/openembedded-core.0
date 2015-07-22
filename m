Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47CE060962
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 02:29:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6M2TJae016948
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jul 2015 19:29:20 -0700 (PDT)
Received: from [128.224.162.235] (128.224.162.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Tue, 21 Jul 2015 19:29:12 -0700
Message-ID: <55AEFFFA.8080308@windriver.com>
Date: Wed, 22 Jul 2015 10:29:14 +0800
From: He Zhe <zhe.he@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <cover.1437461993.git.zhe.he@windriver.com>
	<c3b8e75db6f2ebc1bd9e53a4f01da0d642e4edcb.1437461993.git.zhe.he@windriver.com>
	<CABcZAN=D=2FUBHmSRiwYE7PbqHsjYJUQB5PkfvnQYO-=YFJecw@mail.gmail.com>
In-Reply-To: <CABcZAN=D=2FUBHmSRiwYE7PbqHsjYJUQB5PkfvnQYO-=YFJecw@mail.gmail.com>
X-Originating-IP: [128.224.162.235]
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
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
X-List-Received-Date: Wed, 22 Jul 2015 02:29:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 07/21/2015 10:53 PM, Christopher Larson wrote:
>
> On Tue, Jul 21, 2015 at 12:23 AM, <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>wrote:
>
>     From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>
>     To support building packaging and installing multi types of kernel
>     images, such as zImage uImage, at one time define KERNEL_IMAGETYPE
>     as a list.
>     Modify wherever reference KERNEL_IMAGETYPE accordingly.
>
>     Fixes [YOCTO #6945].
>
>     Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>
>
> Question, why not add KERNEL_IMAGETYPES, and make KERNEL_IMAGETYPE equal to your new KERNEL_IMAGETYPE_0?

Adding a new KERNEL_IMAGETYPES will also work. But it should be better not to change the name of KERNEL_IMAGETYPE, so that those who have used it don't have to change their code.

Thank you for reviewing.

Zhe

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


