Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C06BF78432
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 08:21:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w658Lnxr025510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 5 Jul 2018 09:21:50 +0100
Message-ID: <a333b452e931aba10c78abf179e81f55d9de4c49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 05 Jul 2018 09:21:49 +0100
In-Reply-To: <20180704075924.24065-1-Martin.Jansa@gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180704075924.24065-1-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCHv3 1/4] kernel-devicetree.bbclass: Use lowercase names for shell variables
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
X-List-Received-Date: Thu, 05 Jul 2018 08:21:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-07-04 at 07:59 +0000, Martin Jansa wrote:
> * just to make it more clear what is local shell variable and what is
>   replaced by bitbake from the metadata and also to prevent the
> variable
>   to be incorrectly expanded by bitbake if someone happens to define
>   e.g. DTB_BASE_NAME
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/kernel-devicetree.bbclass | 80 +++++++++++++-----------
> --
>  1 file changed, 40 insertions(+), 40 deletions(-)

I think something in this series is breaking qemuppc automated testing:

https://autobuilder.yocto.io/builders/nightly-ppc/builds/1129
https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/1114

Cheers,

Richard

