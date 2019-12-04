Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1C27F816;
	Wed,  4 Dec 2019 23:23:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Svzg6c3yz4s;
	Thu,  5 Dec 2019 00:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575501808;
	bh=LZ3LZhn1YVjdo9NZvoD2YnD3HjheVCGhWofZIKwJ+ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiTLHVh6udaO6pCK7/aVRUgj6ncu92qKNy3rinqLRaICtpxbKFiRVAfh7l539hKs3
	dyG82nafJOWbJ6r8UmdXGRHz1v5HWV39aH3BweRodNRlAixZa57VD5eySX0NlJWtJF
	EUJ5jbCwADTNITiu9iqrzoNmzRD1wgLUNdrlCQnFAVxjMLcBrXMMoiZ8AmakjWg3EA
	aqrCSrTwVHQu/X3HQiseJHw3oob3hE2OW3p6jpqxT+lHZU6rVX5nC/fr4AnA6JzHzy
	chMUospkHgSvIUKEJoJHOa3EMlJx2CvVXzgOZC9zHfaYbZrtegZipIH8ufDMfBTjzk
	fsffMXy3ycPyKLVb2sUsN9IVdJbFb09evSJKWCoqxUEfp15mo+GMzuugPKRvyCHXuj
	BsixxIgP3BP7ezH2M4u45LTXCztbm07avMF5swfqAiz2YlZ2Dw8RIA7BxZEP5HpNO7
	/M93gdnzRAx+tQDI3+6UMEkki+7QiZWXVs7yNLljE26kT2RcklQpBnHhNDwYt8QBei
	q+0eP7Itsn507TFBt5VrtAb6V+ahQEwa4KFxNN5imxgk5uV+Z4Dx7d/pXLtDcEZDzV
	FZZT/d4lIxAQOFUlI+wa0+qsZeP3V16yKvSracsu/fZtZk64FiO8BnYT07RDD8acSm
	UjybJ3hZejH4fqedKDGjv3Eg=
Date: Thu, 5 Dec 2019 01:23:24 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20191204232324.GA24229@localhost>
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
	<20191204230237.GE9549@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20191204230237.GE9549@bill-the-cat>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: OE-Core python minimum version requirement
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
X-List-Received-Date: Wed, 04 Dec 2019 23:23:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Dec 04, 2019 at 06:02:37PM -0500, Tom Rini wrote:
> On Wed, Dec 04, 2019 at 05:45:03PM +0000, Richard Purdie wrote:
> 
> > I just enabled hashequiv's server in local mode by default in poky.
> > 
> > This causes an unintended side effect of requiring python 3.5 as the
> > minimum version.
> > 
> > We had thought that the servers would be 'rare' and a 3.5 version
> > requirement for that was fine. It turns out a local server is also
> > extremely useful.
> > 
> > The code needed the python 3.5 async support and trying to write it any
> > other way is a nightmare, we need that performance for the server.
> > 
> > At this point I think we just give in and require python 3.5 as a
> > minimum. Any objections?
> 
> In having to pick a minimum Python 3 for U-Boot, it was noted that
> Debian/Stretch is 3.4 and gets end of long term support in 2022.  3.5
> was otherwise fine I believe in the end.

Debian 9 (stretch) has 3.5
Debian 8 (jessie) has 3.4

> Tom

cu
Adrian

