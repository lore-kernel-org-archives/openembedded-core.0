Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 54653612E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 09:05:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48XSdK0l76z2Q;
	Wed,  4 Mar 2020 10:05:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583312709;
	bh=LaQSWFX+4wa0G//OFDO5fcTKalzVoTQsd4AMkKLrPrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=feMOWksu5NTG4Ch51rEksQvSt8u4kNRVzTf+qnV5n0Pe+hk3hegQS5srkNaoT3e5P
	fTqYIkBU09+r+tQLI6Xa0dUKuIDQK6Y87XeUA04qe9D25jJK6Mhm7CzA6HyuuV6nV2
	MPwpHvc0GGSyhkBBK3h0PblCY1xOEr9c3SpVSnHK6MIzveuLLn6fp9F05S4YdGW7PO
	Nr+1cGF9nK3wB0EiVAwFH50jqT/14GfSNkFiue85fQoTa8CztzP/zXbY1pO2+wAou+
	35k4xPsLxUDqIMVtRf2k/JPHDXvDIQw5Jvej3y/zPGARL4vxYlwSWpOeDK58iifqhk
	N32Wf8g6csZ/YT8VncH1tn0HHQ23m+Xg+DKYKmf5d5FHpgD+8k8uCvnEFj56YEngeW
	+XV07q5Ae+RQiANNoY6i0yI7y8lWPco+azIiydaG75f1OeIzlzCYH7PwNJmFAa/nrJ
	CtaqpUWv/SSAI/4SifvG0yI1JpL8jB7pM1LVI5JYtnzctwisfXs2cLgk704iv7E4VE
	1jp5Rvhq7P0bI8d2+7RgCe5yWhaTqGsKActHFDGb0RuiUuqcfXwR2kr0QhCyRVpU47
	j0F8qZt5mYUlnGJ+BfQBuD2ImoeJD0bYuM3pgESwWi19zOHh3yhm3MTTSuQnZsKSHY
	Q1mnNaHaSrvSdpj119bbnF7c=
Date: Wed, 4 Mar 2020 11:05:07 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200304090507.GA7923@localhost>
References: <20200223193408.5602-1-bunk@stusta.de>
	<CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
	<20200224051745.GA6683@localhost>
	<e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
	<20200227132729.GA6240@localhost>
	<CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/2] nss: Move to meta-oe
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
X-List-Received-Date: Wed, 04 Mar 2020 09:05:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Feb 27, 2020 at 03:03:18PM +0100, Alexander Kanavin wrote:
> On Thu, 27 Feb 2020 at 14:28, Adrian Bunk <bunk@stusta.de> wrote:
> 
> > >...
> >
> > It is a crypto library with a history of unfixed CVEs in supported
> > stable Yocto releases.
> >
> 
> If the issue is unfixed CVEs, then I do not think it's particularly
> relevant which layer the recipe is in. Stable release maintainers are not
> expected to 'track and fix CVEs', that one is on users.

Yesterdays LTS announcement makes it clear that the Yocto project does 
provide regular security updates for supported stable branches:

<--  snip  -->

Yocto Project releases are usually maintained for one year.
Beyond this period, releases move to community support, which means
they only receive occasional patches for critical defects and updates,
and no regular defect fixes and security updates.

<--  snip  -->


> Alex

cu
Adrian

