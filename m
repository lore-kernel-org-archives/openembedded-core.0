Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 10CB674703
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 14:45:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w85Ej5bw002251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 5 Sep 2018 15:45:06 +0100
Message-ID: <e7847d5e6eb6103ddf02e6da14a1449227e5665a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Wed, 05 Sep 2018 15:45:04 +0100
In-Reply-To: <20180905085322.GA1795@jama>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
	<CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
	<CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
	<CAMKF1sqWuf8sQj7TA_G-prWpOB5mtXo7F8k_K0bj2ufHXRa6Yg@mail.gmail.com>
	<CANNYZj9rQ-vFT09JPs0pJ46HEYK8_UNzA5Di9G6OXosHOKt3mQ@mail.gmail.com>
	<20180905085322.GA1795@jama>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Wed, 05 Sep 2018 14:45:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-05 at 10:53 +0200, Martin Jansa wrote:
> But patching the components to use libssl10 might actually work
> (unlike
> just changing DEPENDS to openssl10).
> 
> It's not only conflicting in build-time in RSS, but it will conflict
> on target as well. You either need to migrate all components included
> in image to 1.1 or all stay on 1.0.

That isn't quite the case. For OE-Core we have images using both 1.0
(openssh) and 1.1 installed together. Its true there are some issues if
you try and parallel install both the -dev packages but normal target
images are working.

We could probably "fix" the -dev images to an extent by making 1.1
replace 1.0 dev pieces.

The build time sysroot problem is harder unfortunately, I've ideas
about things we might be able to do but haven't experimented as yet.

Cheers,

Richard

