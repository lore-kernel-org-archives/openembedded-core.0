Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CF8917D41F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 08:20:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45XMgW2wblzGB;
	Mon, 24 Jun 2019 10:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561364455;
	bh=ojAg/uKsY7irSBDABkUlvZPJuo/vmbiaC+tzjILSIaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=If+8mWaFAzNWMk1o/rIw2G4oM4gS77T8Yt1PP1veRNbHUK/Ctd11zmx0jGqYkTQQn
	xcBfKZVB9yBiAAjyo5MI9JBa2c/CdroJc1TXws9tm/xhxnwBRzOtivhCK8MNQIpRmt
	lV1WWuexGe9M8hViB4jMDi1GNAzWM4rc542sB/iHrHY2esuRQcOLGUgp6qrUhKVO7Z
	oAUnSUMiFArhLV2iqQ4mI4W6Jfw4Dff37IB06FxGutqxW8v+UkTSdgKcWDHPEdoZzd
	tr/uWp2yxgwZI+RPxPzJ+VCit5YTi70kRgKYySAGzg7PS9SQGok7yCswHrmbG/9xpt
	ZhLD9RNjIdkklttKv9IJPfA57qpF4mZ4LRg4fXFRTUDAv1MlQP+gyJDWRcVV2riMXT
	XK/+2D32mfieZEgdEwgWzSM1f8mTQJE6RxuYaBuTV6WbzW8Sm8Q5URoIBTG50+Lcha
	5ChEcyJwp6EkObjbdDYTrvM6U65mCnfn6/3hKObE8jj1h4LVaC89xkJNs4vad2+rd3
	4B/5MREpgnBgtFKmlzfKo9I8EfX+VkExJz2pmtzT1/ZPqo1v8y0qDCh63EwuRgQFY+
	ub+/V5bIf20vKoJuWW4Nyp8A0xBtQU9bKKvAI3dAaZbZPqx596nHZfgXuxZgvOpJB2
	WP2RLrmJCYzhO5eN4m0IdPYc=
Date: Mon, 24 Jun 2019 11:20:53 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20190624082053.GB11015@localhost>
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
	<CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
	<CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
	<CAKmqyKO_33RpiC4PS6vVTBUz=0Bnc7F5zbGt7mmr6VHU1rK_vA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKmqyKO_33RpiC4PS6vVTBUz=0Bnc7F5zbGt7mmr6VHU1rK_vA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] scons.bbclass: use python3-scons
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
X-List-Received-Date: Mon, 24 Jun 2019 08:20:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jun 23, 2019 at 07:41:05PM -0700, Alistair Francis wrote:
> On Thu, Jun 20, 2019 at 5:22 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> >
> >
> > On Thu, Jun 20, 2019 at 6:37 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Fri, Jun 7, 2019 at 5:50 PM Tim Orling
> >> <timothy.t.orling@linux.intel.com> wrote:
> >> >
> >> > SCons has supported python3 since 3.0.0 release, use it.
> >> >
> >> > [YOCTO #13381]
> >> >
> >> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> >> > ---
> >> >  meta/classes/scons.bbclass | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
> >> > index 9ee7d1587d..a8ddae35f7 100644
> >> > --- a/meta/classes/scons.bbclass
> >> > +++ b/meta/classes/scons.bbclass
> >> > @@ -1,4 +1,4 @@
> >> > -DEPENDS += "python-scons-native"
> >> > +DEPENDS += "python3-scons-native"
> >> >
> >>
> >> some packages haven't upgraded to py3 but use scons see
> >> https://errors.yoctoproject.org/Errors/Details/249271/
> >
> >
> >
> > Thank you for reporting this. I was of course expecting some breakage and am committed to fixes. Please do report any other issues.
> 
> This also breaks the gpsd install, I tried upgrading to the latest
> release and that didn't help. I am going to send a patch for the
> upgrade which I tested with this patch reverted.

This is already workarounded:
http://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=22bfe06d15e07cac0df3f34566a9d33007663bae

There are post-3.18.1 changes required for Python 3 scons,
but I went for this hack after seeing that a proper fix
would involve all of:
1. upgrading to 3.18.1
2. rebasing oe-only patches to 3.18.1
3. adding post-3.18.1 patches

> Alistair

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


