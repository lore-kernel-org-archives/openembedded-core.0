Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 068CB7E788
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 08:58:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45W8c21ncBz3Q;
	Sat, 22 Jun 2019 10:58:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561193923;
	bh=HR3zVofLaVzK8bei+22dYoDPwGoJXSkdjRDBD9hIurI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPji+jL7GssUeNMX7HWSnLsvkLIq9eky34FYvaQY5qLD6ENlNwNOQBYhEN6Y432c2
	AaovKfRjeca1y4Yfm1cgWO2VYU5Gi2/xXfPkFngVoo8u/ZsPA2axL3M9lJtR1hA/j0
	ThbggGe4tAO8+n1taDoUGw80ufE4Mzn3OmDPfQoHOuMBq7pVgtngRLVPh6gUuJgQT4
	Me4vn8YdwW5cyyWxum91qdo9zI5x6Ee2D8hJdIF6/1Gh9YTFF7bykfawwG2sEJnJoT
	WOhy4fRfq6i/UKcGvvmsD87OAj20zxlrCQASdh6bxqAwZOj90S6ydAMiyxHeL+zFLl
	WG7Erf8hX68CiqfESpgwVksBD16EFaN8qlm3eLwI8gONvWDOJRWj1g+/YQfB2hEBdY
	5gnKbL/FaaC9ClPYvy3KvIljPJeV1Jp4tPmlJ+bETCvgFwTyM2gWtl3bvQrofzwy4H
	Fidu6bnhuDhSU+J1BPkxD903rdth6412TQ/G19hof8Z0EVUzvwuMYxKxj683E2lVXK
	KbSh8QHn12seTEFPErzLYwczkyJ9Lt+T3sHbWnIEGSpZ5JHZfBH+3ip1Ba0TNRbm0R
	wF9Nz9ZwflIQbzbN/fsBAqELEnVHiIO16fy1n4/9+OPk4GeQjnDV4UaUZBBNT1mZAX
	u02oIo73qNqBpscwT6VE06uQ=
Date: Sat, 22 Jun 2019 11:58:40 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190622085840.GB9472@localhost>
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
	<CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
	<CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
	<CAMKF1sr+Ffk0nCd3aVhGfsdRreFX7cpqEAqH8606LMqg=-ijww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr+Ffk0nCd3aVhGfsdRreFX7cpqEAqH8606LMqg=-ijww@mail.gmail.com>
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
X-List-Received-Date: Sat, 22 Jun 2019 08:58:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jun 20, 2019 at 09:27:15PM -0600, Khem Raj wrote:
> On Thu, Jun 20, 2019 at 6:18 PM Tim Orling <ticotimo@gmail.com> wrote:
>...
> > Latest mongo release appears to be 4.3.0 and appears to support python3:
> >
> >
> > https://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e0f/SConstruct
> >
> > Is this an aceptable upgrade? I am not savvy on which versions are
> > desirable.
>
> Yes for master this upgrade is fine

Are you approving the changed licence for OE,
or were you not aware that this was the question?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


