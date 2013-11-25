Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 32E276DBF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 12:57:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAPCv37l002235; Mon, 25 Nov 2013 12:57:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W_e8TJUfeZqE; Mon, 25 Nov 2013 12:57:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAPCvKTg002239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Nov 2013 12:57:22 GMT
Message-ID: <1385384237.24083.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 25 Nov 2013 12:57:17 +0000
In-Reply-To: <CAP9ODKpZaWs=9zfvN_WmP7g2rRpc70po-Mdd_g75B8=XwDNAhg@mail.gmail.com>
References: <cover.1385098685.git.Qi.Chen@windriver.com>
	<8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
	<CAP9ODKovi8aHpfM7Tyt+rCxyYC8=YPcxaQGCA6G3=6hhau5W+w@mail.gmail.com>
	<CAAQYJAsmtSLkxnukhv=Guj5cJPhy23UixnZ-aaWB8CjsgbAaQQ@mail.gmail.com>
	<52933DE1.3050202@windriver.com>
	<CAP9ODKpZaWs=9zfvN_WmP7g2rRpc70po-Mdd_g75B8=XwDNAhg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: depends on virtual/kernel
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
X-List-Received-Date: Mon, 25 Nov 2013 12:57:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-25 at 10:28 -0200, Otavio Salvador wrote:
> On Mon, Nov 25, 2013 at 10:09 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> > On 11/23/2013 06:32 AM, Andrea Adami wrote:
> >>
> >> On Fri, Nov 22, 2013 at 8:58 PM, Otavio Salvador
> >> <otavio@ossystems.com.br> wrote:
> >>>
> >>> On Fri, Nov 22, 2013 at 3:39 AM,  <Qi.Chen@windriver.com> wrote:
> >>>>
> >>>> From: Chen Qi <Qi.Chen@windriver.com>
> >>>>
> >>>> Add 'virtual/kernel' to DEPENDS in image.bbclass so that the kernel
> >>>> can get built by default. Otherwise, the kernel will not get built
> >>>> unless it's required by other packages like v86d. As a result, if
> >>>> we build 'core-image-minimal' for qemumips, the kernel is not built,
> >>>> and we have 'bitbake linux-yocto' before we can use runqemu to start
> >>>> the target.
> >>>>
> >>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>>
> >>> If I have a board without modules there's no need to have the depends.
> >>> Why you need this?
> >>>
> >> The first quenstion in my mind when I read the post:
> >>
> >> Odd...wasn't core-image-minimal purposedly lean, mutilated and without
> >> kernel modules ?
> >> (Not that really 'used' it, just booted 'cause was small and could
> >> always fit on nand/nor)
> >
> >
> > What I want to do here is to trigger building of kernel when building out an
> > image. I'm not proposing to make all images have kernel -modules installed.
> 
> Yes but you're proposing *all* images to depends on kernel. This is not a need.
> 
> >> It has always been like this: if one needs the kernel and the modules
> >> can add that in his machine.conf.
> >
> >
> > Previously, the kernel is built out by default because
> > packagegroup-core-boot has a dependency on it. Now the dependency is gone.
> >
> > I'm not talking about installing kernel modules onto images.
> 
> and I am not keen to have all image depending on kernel build. Sorry.
> 
> Nack!

Right now we have a fairly serious regression where the documented use
cases in the manual don't work and people find that behaviours that used
to work no longer do. This is quite damaging.

I'd appreciate working towards a constructive resolution of the
regression, thanks.

Richard




