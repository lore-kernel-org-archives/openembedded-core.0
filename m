Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 13C7B6007B;
	Wed,  4 Mar 2020 14:01:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48XbBw2w5dz7G;
	Wed,  4 Mar 2020 15:01:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583330472;
	bh=DM6mvFZMClbnlHStDFVCuqgJgHASYOEJPgUZ/hFwpHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNCFJwpWJD8xo7vcrgkrK2anQexo5pFL9pZEYssqqj656RDde9RmvHero3FTaunH5
	ARyxJLyuNzz8UPUrg1PlJqs0L3/i3ykA3mZZcMrcIZrV+YsQY4aLkeR+97iW1fqVzv
	AvGSqxjD6cMTND8lhvzXY8d/FXgt/6irfqP+BDAFsDb6uUjuFKU2vbnaHBGd55Lv1U
	pp0SMxfKKkj+HKVXn9gTLEYNZiEN4B5NYDsCmbsfO95x94iijb2DX1ZWGlHsn5gTOK
	OSirUftE/qZgpFZ0BGjhU5JNvtikj+pieGvWrv5mcH9dFvd4mZXYNjbYM5k6T+DecV
	By4a3jy/q6Dm9ZrhRtzSmtGAu0lPBF0EjwXbViRdsIJ2vBTaZtY/ojZQ/388C6FshK
	meHzYWXPpiR+RUEdNQ0F5j+wpTLcnwpw792xfAX9IzlaftJRUOdCi2n5K3CNDDmraP
	F4tbwO5Rs66gVF6pRezJEwDXRq9UgzzJT9W/9bTKRlQOzqAMiBzCXMT8o9gkNyPMy6
	IZf3eGUQlTQXid+R1oZjvroCDQyineHRNPQU9QFsKX2jH0CijBQJi5pN6q9+p8A272
	i3qv65TS8Kk02vI5TOgAZQOZ6fdwcpQ469WQVPnGxKguWsVR2gHIpLzVJ7xjnT0Pd7
	otBzDwJuRU0nKkrsElDcrMDA=
Date: Wed, 4 Mar 2020 16:01:09 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200304140109.GC7923@localhost>
References: <20200223193408.5602-1-bunk@stusta.de>
	<CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
	<20200224051745.GA6683@localhost>
	<e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
	<20200227132729.GA6240@localhost>
	<CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
	<20200304090507.GA7923@localhost>
	<CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
	<20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-architecture@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Wed, 04 Mar 2020 14:01:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 04, 2020 at 01:13:19PM +0100, Alexander Kanavin wrote:
> On Wed, 4 Mar 2020 at 12:32, Adrian Bunk <bunk@stusta.de> wrote:
> 
> > I am sure there will be an update to the announcement if this doesn't
> > reflect current reality.
> 
> Who is expected to do the actual work of tracking CVEs, making action
> points and performing the actions? The current reality is this: the
> security update work is done ad hoc by community, even for stable branches.
> There is no rigorous security process like in Debian, and no roles to
> follow in that process. This means that if no one bothers to make a patch,
> the security issue will remain unfixed, and this does happen often. If you
> are expecting anything else (e.g. that listed recipe maintainers should do
> something), you're setting yourself up to be disappointed.

All I am expecting is honesty.

If YP does not provide security support for supported stable branches, 
then public statements that community support would be worse than stable 
branches due to lack of security support are dishonest and offensive.

It also puts all users of Yocto stable and LTS releases and billions of 
devices at danger if the Yocto project announces security support but 
does not deliver.

The normal user expects that that the announced "usual defect fixes and 
updates for the extended period of two years" in LTS include the regular 
security updates that were claimed for stable branches earlier in the 
same announcement.

For cases where I am the user the only benefit of going through the pain 
of upgrading existing products from older releases to Yocto 3.1 would be 
2 years of security support from upstream. Doing the upgrade and only 
discovering afterwards that it doesn't bring the benefit that was 
promised would make me <unprintable>.

Let me repeat that the only thing I am expecting is honesty,
and all I am asking for is that if YP does not provide security
support for stable and LTS branches this should be communicated
clearly so that all users are aware.

> Alex

cu
Adrian

