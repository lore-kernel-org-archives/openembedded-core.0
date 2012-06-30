Received: from mail-yw0-f41.google.com ([209.85.213.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SkulT-0004vb-Q5
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 12:18:55 +0200
Received: by yhr47 with SMTP id 47so4768254yhr.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2012 03:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Ujp7bUT3D9AiH7Wrr7eIyorboTZFgamJ50+lxUEXcWw=;
	b=YnAkYHYvYaEehx4tygEO6Xmjv7B5MLM2PVICqKqrEayFRJLinQ+hcB0XqyUjgP/M23
	AwvOVCq1TzfNd41QwrPOC0pQxfRTR48fcpEeJ+OpO3OZb3DsHcFhoVKgMV0p7THyIHWq
	SLFsj5xn+bDEuglz2JAg0auu4bOBwEsnqlcSwdtC8O02l4xVtYIIkFQp4GNnzoacTTnN
	aSoFjtivYcOo4LZdmg1i1oFTr/iqgXikMD4msQjlIFUig0IMOD9tfQ92ja2xbDBMi7xw
	IhBBO/h1tD6ebu8BBYY/QZZ5yfCarR/c9uk/SW5T5Xtxu5dCCdQM0uEe2hLQBjV1aY1n
	RS3w==
MIME-Version: 1.0
Received: by 10.100.228.3 with SMTP id a3mr2101350anh.4.1341050878392; Sat, 30
	Jun 2012 03:07:58 -0700 (PDT)
Received: by 10.236.161.37 with HTTP; Sat, 30 Jun 2012 03:07:58 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1206300602360.13626@oneiric>
References: <alpine.DEB.2.02.1206300602360.13626@oneiric>
Date: Sat, 30 Jun 2012 03:07:58 -0700
Message-ID: <CA+chaQfxRZkRJz=BM+57d2R_vbGCNtumVZMpjC6KdoF5o5-e+A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: is the PRIORITY variable actually used anywhere?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jun 2012 10:18:56 -0000
Content-Type: text/plain; charset=UTF-8

http://git.openembedded.org/meta-openembedded/commit/?id=040f75eca217c79fed7b881589d9bb36358cffe1
http://git.openembedded.org/openembedded-core/commit/?id=d122343362669c683acc4af295971a62cbc823fc

so can be dropped from bitbake.conf too AFAIK


On Sat, Jun 30, 2012 at 3:02 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   noticed this in bitbake.conf:
>
> PRIORITY = "optional"
>
> but i've seen no actual usage of that variable anywhere.  is anyone or
> anything actually making use of it?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


