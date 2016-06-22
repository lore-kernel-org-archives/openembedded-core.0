Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id DE7546FF01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 19:59:30 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id h14so20674028pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 12:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=qAqA+ym/jrpyO1Ac4c3H16X72pE/GbNZxa8gpGfQg9c=;
	b=0ZEq3tEViU7mkc9OUn96LjZt25220PPsYcZZoLXW8ApqHTCPQf1TC5rVFX7UvWlHE7
	lH5KHuQCUjWu9sCrVqQokKUeL5dh21qnhvDYM5VLABWMAthrtp1zEQHNkvih085E/g3W
	piuLc22AhQ63ymr6vQRM4UkpOqVGbxhP+C68JDMKnr3KrCzCR2PQ00xZ4HBD7al6WNMc
	hDBLro/vQj75C64mtcSy9zXMCllToGVrDg4cWP7Ertb3Se7+D6UItaXWXJkvsF9Kvj9Y
	pMTmGeTkRB0683Oh4b+OXYKm9N9sV5jpzNVvqcomX9uiiRCIH8JtCUm/XdHB6+uCyqBt
	pcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qAqA+ym/jrpyO1Ac4c3H16X72pE/GbNZxa8gpGfQg9c=;
	b=dllrFg3w4fB8ChzuGjwv3IdGlFmdYnuN0CyrfDo6g3Z3icdSCzgPcWau9M3C0GfWFb
	KaJu3u4dn7S8PLE9PCQ8TD6/eOelbebtwDVY7dSXOJ3/9grzuRYuvJT4hwu8ch6bNqr/
	cKjih9jfIPxbegMHNLRjuQ26zlOhv62sxQl4E3nFUxLu4VCFWDMLoTFwJUcpZMsLNE3z
	szAEIoB5uEuOigtdU5n76RXq1kLzurs4mHkaDHG3mH9puQEoKITjW/WUqJImggnW32f0
	9MZg7KCRvvxmbjpgEPzQ1moIkspYI1ZH32fONT8NpebC98JE9akfHbJEhE0Yrvc3dD+3
	0sZw==
X-Gm-Message-State: ALyK8tIN3WI81H3XIMEqFKcktgB5AlHnvoj4kYh6tvnCTsVuN5GVWoeMd1lt4tUlATgugA==
X-Received: by 10.98.71.155 with SMTP id p27mr29390767pfi.132.1466625570991;
	Wed, 22 Jun 2016 12:59:30 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:115c:c15d:825f:58bc:113e?
	([2601:647:4c00:115c:c15d:825f:58bc:113e])
	by smtp.gmail.com with ESMTPSA id h66sm1709173pfe.6.2016.06.22.12.59.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 12:59:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1606020932230.27421@localhost.localdomain>
Date: Wed, 22 Jun 2016 12:59:26 -0700
Message-Id: <745E9387-3B72-4992-98BF-CED5DB1537E8@gmail.com>
References: <alpine.LFD.2.20.1606020932230.27421@localhost.localdomain>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: easiest way to patch some headers in gcc-5.2 source?
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
X-List-Received-Date: Wed, 22 Jun 2016 19:59:32 -0000
X-Groupsio-MsgNum: 83756
Content-Type: multipart/signed;
	boundary="Apple-Mail=_56490158-D8E4-4761-B914-76B98EEB0A81";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_56490158-D8E4-4761-B914-76B98EEB0A81
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Jun 2, 2016, at 6:40 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> 
> 
>  for backward compatibility reasons, i need to patch some header
> files in gcc-5.2 to change some quoted includes to angle bracket-style
> includes.
> 
>  i have the patch, and this change is only to make the resultant
> cross-compiler work properly, but i figure the easiest thing to do is
> just apply the patch to *all* gcc-5.2 compilations (native, cross,
> whatever) since it's all fairly innocent and won't break anything that
> already works.
> 
>  from what i see, in all the recipes and inc files under
> oe-core/meta/recipes-devtools/gcc/, i can just add the application of
> that patch to the gcc-source_5.2.bb recipe, which will then apply to
> all gcc-5.2 compilation output, is that correct? so i'd create me a
> little gcc-source_5.2.bbappend file and add my patch to SRC_URI.
> 
>  does all that sound reasonable? am i reading this correctly?

did this work for you ?

> 
> rday
> 
> --
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                        http://crashcourse.ca
> 
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_56490158-D8E4-4761-B914-76B98EEB0A81
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldq7iEACgkQuwUzVZGdMxRoxACfcQk1JUQNyOn7VSB7IiWNmeJT
KWsAnR7axg+AnHAOZ4wsoo9EeW4+Apzn
=btOs
-----END PGP SIGNATURE-----

--Apple-Mail=_56490158-D8E4-4761-B914-76B98EEB0A81--
