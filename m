Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0DEB2600B1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 11:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48XWv72BJBz3t;
	Wed,  4 Mar 2020 12:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583321539;
	bh=0e5lewzz6QYf2dVB/U9ScjF3ZJPyFY8oM3+JbrL9AhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dmvT/7Ct4nBcNdkMuAfsW+nvrvDK/FD9/9iPFy3tkdil03KUXlROMw1S61VYeNV5f
	r0ivD+mzwc8RW6jjfI3HCbUZ/GAwC/QF8IkVBJkK5NxRjRguBv9y0prfnsTllFRGBL
	4MChoKKLkktqeyjNh2Sp/LD2nlB1tZ2IwRJ/e08+tqU3ysYkHZZeepknq4FCgWYF5S
	Dj+waCtkY0KudS7WiqnM0mS8uN9un4VUF8keNpGd4buCJSCyiNUteBi43g64HB4DkY
	KgHa67caJUJA/hzULQDXxDUT0IiK/7oaqZ0Thj9PsyNhTMn53PMvU659jlauQ/61Kf
	se8ECKbjuvjHsx0jtPzgRjn6l+a9LHTGoq1c+Kmio1OsfNYhWnmHk0aNKsidf2CPZ1
	iiyNqkLjwAh9hXXPebGyHXHXEdOmuUVGELYOFGgWJ9AdmWXUvcQigz/7e4y7/tBFMA
	zsqRwagg0ldw5Nv3SKbvZ6Tsde84HUCDjol4TbTJyJy+k5pHGm/9UGFCAM1h/322tS
	Ek0xyxsZ+Nb9cbvNb6rcvO4UJ+itsD8MVT1g0WvnX1f4W6i47UhGLejL0LAs2r5Zdt
	y7dlLjAfxm54osX4HPMs0CQXCEj5Tk4zqr7PqSLFqwGxH4f9LX/qkiT8Dx7baf0XcT
	bGXSEkeJkQVR6PYuLDWTCAX4=
Date: Wed, 4 Mar 2020 13:32:17 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200304113217.GB7923@localhost>
References: <20200223193408.5602-1-bunk@stusta.de>
	<CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
	<20200224051745.GA6683@localhost>
	<e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
	<20200227132729.GA6240@localhost>
	<CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
	<20200304090507.GA7923@localhost>
	<CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Mar 2020 11:32:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 04, 2020 at 10:36:52AM +0100, Alexander Kanavin wrote:
> You are misinterpreting the announcement. The security updates are provided
> by users as patches to the mailing list, maintainers merely collect and
> integrate them. There is no promise from the project to do anything else,
> and LTS doesn’t change that, it only extends the maintainer duty from one
> year to two. Moving a recipe in or out of core does not fundamentally
> change how much attention it gets w.r.t. security fixes.

The part in question does not even talk about LTS, it describes the 
status quo for the current stable releases with one year support.

>...
> > <--  snip  -->
> >
> > Yocto Project releases are usually maintained for one year.
> > Beyond this period, releases move to community support, which means
> > they only receive occasional patches for critical defects and updates,
> > and no regular defect fixes and security updates.
> >
> > <--  snip  -->
>...

This announcement states pretty clearly that security updates are
provided for stable branches, but not for community supported branches.

I am sure there will be an update to the announcement if this doesn't
reflect current reality.

cu
Adrian

