Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id AB34373EED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 06:37:45 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so32580177pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 23:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=iNJ2ozkioQYI4pMVxZ4GiY/hutRNdhlllLUAH9KgHs8=;
	b=zW+bTCsus2up6IjahTOPZOdvBkF0xiXIVjGZEa/bZlqMcIN3ABHirTOdx+FNWEm08b
	n7cbku3n4/GTrGt8dtLEM6bv5nIyhwKU7Tqz1HfRr4lRRjx0gwQKJllB/HXcRbwPlH2R
	BaHMwfuCQVKG3Y9tSS6ZoaKFkex+ghDamclfeu/rfRlgw0bk3/4Sn9CZhEqVbwSxXA1t
	BhR3smOCyOqFyNqlwcYdmS5mZDD+1JPCeCPQgWtwhhucVXNcxfta9B7TstZyzsPdO6EF
	xO+vJ+VL9x69zw6kOTpLhfPGv65mH8xa0q2beVv27ZiXZnsZYVhN/NiWMwjhBUswI37I
	Okpw==
X-Received: by 10.70.135.106 with SMTP id pr10mr4223800pdb.156.1430980667360; 
	Wed, 06 May 2015 23:37:47 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id ea4sm966458pbb.94.2015.05.06.23.37.46
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 May 2015 23:37:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150506153933.GC2067@jama>
Date: Wed, 6 May 2015 23:37:44 -0700
Message-Id: <6547454A-72E1-4FA6-A58D-51FFBFC96CF9@gmail.com>
References: <1430502462-26698-1-git-send-email-Martin.Jansa@gmail.com>
	<20150506153933.GC2067@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy][PATCH] mesa: update --with-llvm-shared-libs configure option
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
X-List-Received-Date: Thu, 07 May 2015 06:37:47 -0000
X-Groupsio-MsgNum: 65232
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8CC856B5-C4DA-4737-BFD1-77A82791AA52";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8CC856B5-C4DA-4737-BFD1-77A82791AA52
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On May 6, 2015, at 8:39 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> On Fri, May 01, 2015 at 07:47:42PM +0200, Martin Jansa wrote:
>> From: Andre McCurdy <armccurdy@gmail.com>
>> 
>> As per the Mesa 10.2 release notes, "--with-llvm-shared-libs"
>> has been renamed to "--enable-llvm-shared-libs".
>> 
>>  http://www.mesa3d.org/relnotes/10.2.html
> 
> Be aware that this correctly enables gallium-llvm, but then
> gbm_gallium_drm can fail to find LLVM libs:
> 
> ld: cannot find -lLLVMMCJIT
> | collect2: error: ld returned 1 exit status
> | make[3]: *** [gbm_gallium_drm.la] Error 1
> 
> at least in some configurations, I'm looking what's the difference in
> builds I'm seeing failing.

is LLVM_CONFIG set to point to valid llvm-config ?


--Apple-Mail=_8CC856B5-C4DA-4737-BFD1-77A82791AA52
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVLCDkACgkQuwUzVZGdMxRGxACfUxG1CXo0WRiTM+KEkzPGVp6y
Y4AAn0hcmP/nm7kIL9Dj7S0oKPJEcIED
=ImrH
-----END PGP SIGNATURE-----

--Apple-Mail=_8CC856B5-C4DA-4737-BFD1-77A82791AA52--
