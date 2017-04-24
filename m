Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 773C372FBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 21:27:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3OLR8Bs001253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 24 Apr 2017 22:27:09 +0100
Message-ID: <1493069228.19076.121.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Martin Jansa
	<martin.jansa@gmail.com>, Ross Burton <ross.burton@intel.com>, akuster808
	<akuster808@gmail.com>
Date: Mon, 24 Apr 2017 22:27:08 +0100
In-Reply-To: <CADkTA4PGVyJ+b2S_77yJS6f0f3osM-yYonE55Khjk-k0oF-j-Q@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
	<CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
	<CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
	<CADkTA4Nm71DESZodfrGKH1bqLT0o2MSn7nmgcFtkLJu57kk_=A@mail.gmail.com>
	<CADkTA4PGVyJ+b2S_77yJS6f0f3osM-yYonE55Khjk-k0oF-j-Q@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 24 Apr 2017 22:27:09 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Mon, 24 Apr 2017 21:27:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-04-24 at 15:56 -0400, Bruce Ashfield wrote:
> 
> 
> On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <bruce.ashfield@gmail
> .com> wrote:
> > 
> > 
> > On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@gmail.c
> > om> wrote:
> > > I'm still seeing this with your "kernel-yocto/kern-tools: fix
> > > do_validate_branches clean stage" patch applied:
> > > 
> > > 
> > > | DEBUG: Executing shell function do_patch
> > > | ERROR: Could not apply patches for qemux86.
> > > | ERROR: Patch failures can be resolved in the linux source
> > > directory work-shared/qemux86/kernel-source)
> > > | 
> > > | [ERROR] Can't find patch dir at .kernel-meta/
> > > | usage: kgit s2q
> > > | ERROR: Function failed: do_patch (log file is located at linux-
> > > yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-
> > > r0/temp/log.do_patch.44497)
> > > NOTE: recipe linux-yocto-
> > > 1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: task do_patch:
> > > Failed
> > > 
> > Well bugger.
> > 
> > I'll start another set of builds.
> > 
> I had this on a build loop all day without any luck. I also enlisted
> a few others around the office
> to build master and see if they could cause an issue .. again, no
> luck.
> 
> Richard/Ross: are you seeing this same thing on the autobuilder ?
> 
> There's some incantation or config that I'm missing, I assume this is
> a straight qemux86 config
> with a bitbake of something like core-image-minimal ?

We're not seeing this on the autobuilders. I do suspect something in
the handling of extra patches or cfg fragments from SRC_URI if I had to
guess. That certainly was the trigger last time I saw this.

Cheers,

Richard

