Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B67387E4A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 17:27:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 459YGg5vzzz40;
	Fri, 24 May 2019 19:27:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558718861;
	bh=49hVo51jBPVMILlVJiUfcAX8Hr+0L8zbOkRVm9h71kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPEzCs3nyXbyJqEiG3FCno4S/k8KIRupVqUNP5vu415d2c19DU2VJjKrdh7Ugoi1u
	tnAS18uINNeeIj8DGVjRIFckPHYcGjlEAfjtXqhIRQSKomwHbWaaMcuUPIPpwKgnbV
	DTPxS8hmN4mWkWz5fFxcbjIFs+Z6T83zMPxpkOgOVbnVhttxocRohcvplaBgotv19z
	qof9K5XFBnuKczEl/cG2FOk3zRBdKHOWVOQ9x+2ch21Z6lgBjfDdyctNebF/PLDag/
	BFeZPdph/kfPKbqnLFXQ/y/8GtJJkz6Sgj83OkMJ3DGj01cVUoMQSO78Qs+xdOwnMe
	9+E1xyfsOzCtAqeL5wnR5C0CBmIoQO+88WNk+kg4jR92mOlr+hKENVAVlGQVBBmZE6
	+nHs8I85TQQmjGCAmbU5b1mrYS8FnJCg2tTuuODPlSqY/78avUWfClvZ8OWjj3iaXg
	4+hAOlds8XggYzwNcWyEhLDmugRLgg4woLwOUl+8yFM17uJSMVMioLuUpimFQjSneE
	UWNxbQW02aUXxT+K8JndJYVXfHnr92BNg52yAguRZEesqJBA4iiWuXeFI+SXGXL0WZ
	i/NsMBrKx2SgY+m0un+Vn5h7tdUqrig4rUR6yef/7KX+vXT7u5XBEYHeRVLl8S4twA
	9WBcrpDpT1EzLHobpE5JtZno=
Date: Fri, 24 May 2019 20:27:37 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190524172737.GA6813@localhost>
References: <20190523103352.GA25084@localhost>
	<CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
	<45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
	<f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
	<20190524101211.GA25912@localhost>
	<f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Fri, 24 May 2019 17:27:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 24, 2019 at 09:13:08AM -0700, Khem Raj wrote:
> 
> 
> On 5/24/19 3:12 AM, Adrian Bunk wrote:
> > On Thu, May 23, 2019 at 07:16:53PM -0700, Khem Raj wrote:
> > > ...
> > > but I think dropping
> > > systemd support completely from musl is not an option I would like to go
> > > with, there are cases where this makes sense. Especially when you have to
> > > cater to different set of devices from small to big, userspace remaining
> > > same is big advantage atleast in the world I am in.
> > > ...
> > 
> > That's a good point - when arguing against systemd as default init system.
> > 
> > systemd is bigger than glibc, therefore on very small systems where the
> > size of the C library matters using systemd is usually not an option.
> 
> Yes, design-wise I concur, in practice, desktop distros rule the linux world
> and systemd is quite prevalent there,

Desktop distros don't use musl - it wouldn't make sense.

> so sometimes you have to wear the
> shoes of same color, atleast thats what I see.

Is any musl-using distribution supporting it with systemd?

After a cursory look around it doesn't seem that trying to support the 
weird combination of systemd and musl brings compatibility with anyone 
else.

> apps want to run uniformly on both OE and non-OE systems

This implies using glibc, which is the correct choice in most cases.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


