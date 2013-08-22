Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5CDDA60842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:24:29 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id fb19so3687403obc.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xuIOoCX6Znx7wyEeHewRSpw7y5uK1Rcww1o3htZExM4=;
	b=RwHl+Iy2HNaOFfpX9vueh5OpW3+6gQs5fKIPjFG0VGBtTwgwtsABGrCCoMXr2D21NQ
	iTiHxWPmcV/FsJ4xOsM+OwRWX/0QsO3Ayr9sLmKSv6CvoJtH5PDaa1zx3JovIib7d9E8
	B9MCzyfN/wgbhGoSyEw+jp3mg/E0qPvIA6C5YPg92qfF4XWzBiyvRqTN1p11ADLspI3g
	WnULDOVpZOv1jlbO5MMRvEwkbEWzeYLEUBdycC3Gy8riuz0rtLNF3yvGge/8gGb7Pir8
	MN2XORvR5dZeaPNGK5xjFLZkhAY4qbFkst4G96FIT34OuOVyh30GUu4VCZG3YeTg4KDq
	gxWA==
X-Received: by 10.60.95.229 with SMTP id dn5mr14443127oeb.26.1377181469508;
	Thu, 22 Aug 2013 07:24:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.44.66 with HTTP; Thu, 22 Aug 2013 07:24:09 -0700 (PDT)
In-Reply-To: <1377180295.6762.19.camel@ted>
References: <1377180295.6762.19.camel@ted>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Thu, 22 Aug 2013 16:24:09 +0200
Message-ID: <CAGiJk9d6-53fdswhsoNC_s7Q75BAgqtFWq8DrC5TPg8KXY_NBA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Web browsing and HTML in OE-Core
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
X-List-Received-Date: Thu, 22 Aug 2013 14:24:29 -0000
Content-Type: text/plain; charset=UTF-8

2013/8/22 Richard Purdie <richard.purdie@linuxfoundation.org>:
> We've slowly been shaking out the definition of OE-Core and as part of
> that we removed web and web-gtk which were the only browsers in there
> and were admittedly a bit limited/broken.
>
> There is no doubt that web technology has an increasingly important role
> in the future and in embedded devices (e.g. kiosk type devices, digital
> signs and so on).
>
> With that in mind, I think some kind of HTML support in OE-Core is
> important going forward. Equally, I dislike having things there which we
> cannot test. I know some people have looked into this and it appears
> midori is the best option for something with a small number of
> additional dependencies. I therefore currently think this is something
> we should make a decision to include since it gives us significantly
> better coverage of things like webkit which are a already in the core
> yet totally untested at present.
>
> I'm open to opinions, equally we do need to make a decision on this soon
> since we're nearly at the feature freeze point. Thoughts?


Hi,

just some thoughts: Qt provides an example application that uses
webkit called "fancybrowser"
This demo it is located at the package qt4-examples
(/usr/bin/qt4/examples/webkit/fancybrowser/ in the target sysroot).


-- 
Regards
Samuel

