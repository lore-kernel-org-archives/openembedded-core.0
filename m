Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4029F7CF3D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 22:28:08 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	x27MS7sJ008560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 7 Mar 2019 22:28:08 GMT
Message-ID: <2ecd9d2c43dea267e117c4a16d6c42c9512b7fbe.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4PV7zvHAu5uJp22X7ski+UXuHeNj+LJw-DVZhu1tJY7Hg@mail.gmail.com>
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<088fa1a03d1ff2ec9eb08d419e2a7c7bc1ee3406.camel@linuxfoundation.org>
	<CADkTA4NdgcGNtD2RdFSURG7=t1dUna8CC7uGU+Dv4BcHYD=yTQ@mail.gmail.com>
	<CADkTA4MowcWPK_k5egUx=GY4SEVcSrOwWsey2h66KgvOHKfLOQ@mail.gmail.com>
	<533d4de952321163dbcc9115992b21229955191d.camel@linuxfoundation.org>
	<CADkTA4PV7zvHAu5uJp22X7ski+UXuHeNj+LJw-DVZhu1tJY7Hg@mail.gmail.com>
MIME-Version: 1.0
Date: Thu, 07 Mar 2019 22:28:00 +0000
User-Agent: Evolution 3.31.90-1 
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] linux-yocto: consolidated pull request (5.0 kernel intro)
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
X-List-Received-Date: Thu, 07 Mar 2019 22:28:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-03-07 at 10:48 -0500, Bruce Ashfield wrote:
> On Thu, Mar 7, 2019 at 8:04 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2019-03-06 at 23:23 -0500, Bruce Ashfield wrote:
> > Thanks for the other fixes, they improve things a lot. This brings
> > us
> > down to the above perf issue with 4.19 and:
> > 
> > a) KMACHINE_qemuarm = "qemuarma15" not working?
> 
> I mentioned on IRC that the kernel parts are working for me, and
> by that, the mapping to the qemuarma15 bsp definition and hence
> configs is correct.
> 
> I seem to be missing some machine definition parts to get a valid
> userspace to work against that new kernel .. is there a series of
> patches that I'm missing ?

There has been some confusion/mixup. What I want to do is add a
qemuarmv5 which is the current qemuarm and then switch qemuarm to be
the a15 based one.

Something like:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=981788cde4ddae41b5dac7d2aab771939cf2a28f

I put KMACHINE mappings in the machine definitions, this patch isn't
well tested as yet and builds on the qemuarma14 patch in -next.

Jon won't get to that until Monday and I'm travelling so will be a bit
disrupted. I'm testing what I can before I leave.

> > b) qemuarm64 graphics not working with 5.0
> 
> I don't think I've ever had this working, but I'll have a look at it
> as well.
> But more eyes on something like this, will definitely help.

qemumarm64 graphics works with the 4.19 kernel but not 5.0.

The only other issue I'm aware of is stap failing on qemuarm (old v5
version).

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/374/steps/7/logs/step1c

Cheers,

Richard


