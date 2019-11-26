Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 074567F8B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 09:17:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Mdb84nJcz4J;
	Tue, 26 Nov 2019 10:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574759844;
	bh=c5VJuywfnJIFZIBdqECumlPCCvw8qbTCjojK7jOYnWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeG4mRtQiRPVE+ohU63fBW32+f7kXwuB47vYOipJLso0193DCHTsWxiqzNoFQ6ZfA
	ibC74RztJz+TgAqzf3hS+z0qkA6Yg15oVx5cxRmQEFpEUF1gRkbaCmQWzLwtmIMOQ2
	Gz8bjcvJd7oZlXuUCMnd2vC2wuIyozABCn/otdsV8b9XMRISDAHW7IWt7y4gMzq1au
	vuvMLRVHR3RiUm3T4I3CFmfHU9altqKjmt58k+mqWdWqI89+k1W1X+Hgb2q7SxTpNJ
	YVnat+UceC29XSRNw9UYyNObvATENV0RY2aywORpU7YyJDUHG98RVRjBEFszmxwU1R
	eSVsYvyPEcGifsep6kX2IUfnZCLf3IisDfPpJoQlyZb5HHKeNKxfX1KkIQqAP0Ysda
	RgJvQT1IMK+PgMyCijOq7HT7+xTfjKRZzmaJRdma73r6+04juwxCdv5vCGeoQZSzxz
	Gv7Voqgn6FUBufcr9emj6HnurCY92sVl800LBAyOaPQMABr1gq8d8ZsGoyKvhQX1u6
	NrYxP5mhB4a4Af4ifNdwQuQNxiApf3aJpznbZ2hYkci5Xo0nYZiFTqCLOcchH5Tpup
	HkNsC8Y91umlpbiDHzbrnRLwdJOTUU1AmVNMJ7/KXJfGyk2SRVgpLkj7Bweqe3m/fw
	hXEBrjIZywz29XJsIiWHlG0Y=
Date: Tue, 26 Nov 2019 11:17:22 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20191126091722.GA2033@localhost>
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<20191125211027.GA32080@localhost>
	<CADySD0HO0QCAScA4iH5LLm4B4Zoq1rXLqi0hP3D5-jMyACwThw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0HO0QCAScA4iH5LLm4B4Zoq1rXLqi0hP3D5-jMyACwThw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Tue, 26 Nov 2019 09:17:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 25, 2019 at 10:17:42PM -0800, Ankur Tyagi wrote:
> Hi Adrian,

Hi Ankur,

> Thanks for explaining things and helping me out.
> 
> Once I have stable builds then will try your suggestion as well.

if everything you need fits into your partition and is stable
just be happy.

FULL_OPTIMIZATION_append = " -Os" would be an option to reduce the size 
of the filesystem further, but it makes the code not only smaller but
also slower.

> Ankur

cu
Adrian

