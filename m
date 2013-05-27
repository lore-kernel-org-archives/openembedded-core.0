Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4F55E61AD0;
	Mon, 27 May 2013 11:48:08 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id hr11so4565188vcb.19
	for <multiple recipients>; Mon, 27 May 2013 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=YYutIrySjjrjA5aK8p+lQjSn8RxCflJNEZ906/vwleU=;
	b=B16A6Nz2c8A/4sh97TF1rSUh6HS9p5wfFVxYuDGyDzFjYBVQB4fv5sxJE5TMHGi08R
	PtWv+VrCDQ/8D+4f2xndsDolQ0wmvqX8Keume+E7ZBvdnMejwwJQCylayK+dpdXsPCUd
	ygg9YNeV5KBjhqEHes1M6wjxi3V2LG/7dJGXiRYCA85MW8wtCUqWTEQUPEqnI80YhGxN
	Mm0lAEvltg0sQWTpA4uVfu/mhY2Iw/l8O+I/yfWTzLNIqQ02knPiteTfB84y14hNdIjG
	OEpHU1dSzVpwWqaMyEXHoamzhkPaks+i2iLvhAh30Wlpas37hda+8UJojjHyhPQ7ABGT
	qI3A==
X-Received: by 10.58.75.73 with SMTP id a9mr15013735vew.25.1369655288311; Mon,
	27 May 2013 04:48:08 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.110.6 with HTTP; Mon, 27 May 2013 04:47:28 -0700 (PDT)
In-Reply-To: <CANyK_8fQrdjXq0WBJYZsJwnovD+Do8FC8TSsD40=9VMAZGs1=g@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<CANyK_8fQrdjXq0WBJYZsJwnovD+Do8FC8TSsD40=9VMAZGs1=g@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 27 May 2013 12:47:28 +0100
X-Google-Sender-Auth: HbqtkJfnzmPo20QvyajJ20ZwYKM
Message-ID: <CANyK_8caVdHpX+jXXKh3xz=N7PQZm8X2Z06J4pngQ999cAQfrw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Mon, 27 May 2013 11:48:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 16 May 2013 11:36, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 16 May 2013 08:52, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>>   meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb, do_compile
>>
>
> Cause of failure is:
>
> | ipsec_doi.c: In function 'get_proppair':
> | ipsec_doi.c:1321:24: error: argument to 'sizeof' in 'memset' call is
> the same expression as the destination; did you mean to dereference
> it? [-Werror=sizeof-pointer-memaccess]
> |   memset(pair, 0, sizeof(pair));
> |                         ^
> | cc1: all warnings being treated as errors
>

I've updated locally to ipsec-tools-0.8.1 and still get this error.
The 'obvious fix' isn't so obvious so I'm going to hold back on making
any changes to see what the upstream developers say. Reported to
upstream mailing list.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

