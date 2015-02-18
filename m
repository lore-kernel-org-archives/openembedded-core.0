Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 237D065C85;
	Wed, 18 Feb 2015 07:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1I7kR20011413; Wed, 18 Feb 2015 07:46:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id th6ewsZMP2Uo; Wed, 18 Feb 2015 07:46:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1I7kFBS011409
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Feb 2015 07:46:27 GMT
Message-ID: <1424245575.25541.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Feb 2015 07:46:15 +0000
In-Reply-To: <CAMKF1sofS7MteZnPsTYRNAcMwrrh=T3FP+ASmAOGDMhcwyXB4g@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Feb 2015 07:46:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-02-17 at 23:15 -0800, Khem Raj wrote:
> On Sat, Feb 14, 2015 at 2:06 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Hi Khem,
> >
> > On Thu, 2015-02-12 at 15:35 +0800, Khem Raj wrote:
> >> I have refreshed the branch to include the patch which moves the src
> >> uri to use the newly released glibc 2.21 branch
> >> and please run it via autobuilder ( top 5 commits )
> >
> > Its running on the autobuilder at the moment. Errors will be reported to
> > the error reporting system and can be seen at:
> >
> > http://errors.yoctoproject.org/Errors/Search/?items=10&query=be29d13a847d458efaf542ed302e48050f67a655
> >
> > Right now, poky-tiny failed due to warning are errors and unused
> > symbols. Minnow failed due to SSE instruction issues. Full build logs
> > are also available on the autobuilder:
> >
> > https://autobuilder.yoctoproject.org/main/tgrid
> >
> > as ross/mut-next. We do have other changes in the branch but the above
> > are pretty clearly glibc.
> >
> > Other errors will go to the places above as the builds complete/fail.
> 
> Thanks. So I see following errors categories and status
> 
> 1. valgrind - Martin already sent a patch for that
> 2. slang - I could not yet reproduce it on my active build (mips) (
> seems specific to x86/ppc )
> 3. poky-tiny - glibc build - ( pushed a fix for that in latest pull tree)
> 4. minnow/qemux86 - glibc failure - ( pushed a fix for that in latest
> pull tree )
> 5. glibc build failure on qemuarm - need to reproduce here
> 6. Image failures are probably due to above not building
> 
> I might get slang reproduced soon on qemux86 if I do I will try to
> push for a fix

I think slang is a parallel make race from another patch so don't worry
about that one, Robert will likely get that when he comes back.

Cheers,

Richard


