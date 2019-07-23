Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D2E977ED41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 16:51:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45tPdM6FGvz23;
	Tue, 23 Jul 2019 18:51:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563900696;
	bh=L/VpZmXcdKuoF+emvrNNdVLjvvltxFkE1nK5HCknYVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+BhYyFSsE0vfG/ahqWh+GuCsuPET05LQb2vPg9RWlarRerZW1vu+2JKDrIyeavhX
	B+gpEpm5JnDYszQ19tN8T3Y48rXix/ibslen0t8VQm2KvD6OCmN/4KP+gHHmPWvavA
	TOeoaUPVWo4ei9jGJ0pTe7DbAv8k+kL2X3FSQfF0QQEArJHzLdAGnuowmiL7upESNp
	4LHefz+I3wzaRNKYl8Xc0yAX6Y5ctwDfLCoIr0eI1K8Jh0X5qxQholsxb/0fKPmOnf
	HKeH17QHIt8OIOAoj1u7irsSAWpWzzmQOeXN/Ok+JFmtJDj/0xorwBQ8Pd6DyMV0gF
	iJ04cnCnS+z9Rl9x7u9cGNsgcb4dnViGvVbVCM5Hn9uuHinxGFFFjaVYIWOLFqJlj/
	IfYQw6oKAi7mADrlz1GIydC7YxUQ1jv54XwFTnkq/AFrNSFxye9zmNZ9cIYMOvpu52
	aLIm3ZVZYOCi/XURmbyPUEJOn/dG+zRTn5lHMOvTV6+RsEAzYsPaBNu7pVQ4RzoQFH
	oaoikXQ3s4YBWr00yrb/EL4Y9p25XjhowOp9kixIvWilflz9Jhm9r4rI8IgfzEVxNC
	+G4xDgzhVZIhrywhrql1bIaLOAMuTIV4zIKqtUebYkft3JWHGsgIsxchcMKOFzI7PE
	LWWsvk8pMfbu+vMMBswsXU1U=
Date: Tue, 23 Jul 2019 19:51:33 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190723165133.GA28645@localhost>
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LaVCn47fzpMYcsO9sjwgRpaexGYDRxrrvoWTVny1uVQ_g@mail.gmail.com>
	<20190723054328.GA27144@localhost>
	<CAJTo0LZDXcLhYqvgYmY4-hX4Uc+ZJniDhqWkrjtaYu_k58Fr8w@mail.gmail.com>
	<20190723083512.GC27144@localhost>
	<CAJTo0LZP1GoYtuNGhYiuRGn+qjxT_roJWQsagF=cu4bxGe1PHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZP1GoYtuNGhYiuRGn+qjxT_roJWQsagF=cu4bxGe1PHA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH 1/6] python-scons: update to 3.1.0
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
X-List-Received-Date: Tue, 23 Jul 2019 16:51:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 23, 2019 at 10:03:52AM +0100, Burton, Ross wrote:
> On Tue, 23 Jul 2019 at 09:35, Adrian Bunk <bunk@stusta.de> wrote:
> > In meta-openembedded the only other recipe using scons is
> > PNBLACKLIST[mongodb] = "Since bbclass scons convert to python3, build mongodb failed"
> >
> > So 2/2 of the scons-using recipes in meta-openembedded so not work with
> > the Python 3 version right now, and there might be more in other layers.
> 
> Sounds like the class needs to have a variable to control whether Py2
> or Py3 is used?

OK, now I found a solution for gpsd.

> Ross

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


