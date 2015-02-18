Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E66446E614;
	Wed, 18 Feb 2015 21:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1ILfNWd027606; Wed, 18 Feb 2015 21:41:23 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id haKAJtwAHKiz; Wed, 18 Feb 2015 21:41:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1ILf8ii027591
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Feb 2015 21:41:19 GMT
Message-ID: <1424295668.11836.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Feb 2015 21:41:08 +0000
In-Reply-To: <3F6EFBD4-AC35-4CE0-B52C-0ABDA0D17838@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
	<CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
	<CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
	<CACS+7ZRNm2Y0SJn76imF6DNoEsL2+ppC1zG45iGspOmL0EN0BQ@mail.gmail.com>
	<CAMKF1sqjQm+n5xKfS0utm9B9h_S+RYWrgnGUCboRNCk5XSUmzg@mail.gmail.com>
	<1423908404.20217.100.camel@linuxfoundation.org>
	<CAMKF1sofS7MteZnPsTYRNAcMwrrh=T3FP+ASmAOGDMhcwyXB4g@mail.gmail.com>
	<1424245575.25541.19.camel@linuxfoundation.org>
	<BCB8524E-91CB-41F6-83C0-7B90E60BC82D@gmail.com>
	<1424260309.25541.23.camel@linuxfoundation.org>
	<1424264807.11836.1.camel@linuxfoundation.org>
	<3F6EFBD4-AC35-4CE0-B52C-0ABDA0D17838@gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Wed, 18 Feb 2015 21:41:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-02-18 at 10:38 -0800, Khem Raj wrote:
> > On Feb 18, 2015, at 5:06 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2015-02-18 at 11:51 +0000, Richard Purdie wrote:
> >> On Wed, 2015-02-18 at 01:01 -0800, Khem Raj wrote:
> > The series needs:
> > 
> > TUNE_CCARGS_x86 := "${@oe_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
> > +TUNE_CCARGS_x86-64 := "${@oe_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}”
> > 
> 
> hmmm I assumed x86 was common across 32bit and 64bit x86 but seems not so I replaced the old patch instead of appending it 

Thanks, I'll update the patch for the next round.

> 
> > since the x86 override doesn't cover x86_64. I'll queue that and run yet
> > another build. We do have another poky-tiny issue too:
> > 
> > https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/204
> > 
> 
> OK. I am creating a local config to use tiny config for libc and weed out remaining build issues for tiny config 

Cool, thanks.

The next build is in progress and looking greener than the last. Next up
it appears we still have multilib issues:

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/201

There is a possibility this "from sstate" build may have run into a
problem with sstate but something looks to be wrong with glibc in some
regard.

Cheers,

Richard


