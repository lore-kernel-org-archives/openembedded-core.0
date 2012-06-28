Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkHN2-0000oI-G3
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 18:15:04 +0200
Received: by pbbrq2 with SMTP id rq2so3131027pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=j5F5i4aLJvNv2QNHoR6v8yGkmcDUHQVRVkUTitVoXd4=;
	b=lHRXI2/wR7rs2gRRwZkiyQD3MNb0MGecbKm/FBwOwRmcS4U3XUUxfATD8d/eaeUets
	XQAwkL644fd9H1kxsVlNXxSr3UW1BR87cZnjem3uWMnxg1O4bBUbwYcJcxvPGB75TF5C
	eaEDupSDPSWr5xbWKX0+qLWLG4CAdg/pwvyKyeBBVyVHwhbDKyE0uWNWp4ylUL6qJHEu
	55yCQ/8tCSymuNpymRJ+i4qWIFigUDxSRtSxLLhabM8jey5q8bCxj2tUTXD6aQq2fZVF
	LtSMHel2jDqf4wHUkvHyIvGRZJynYnuTU/vGdijGh54xpkRI5mMYi2FvUSkXS7qmk1ET
	UvqQ==
Received: by 10.68.195.97 with SMTP id id1mr9281662pbc.91.1340899448726;
	Thu, 28 Jun 2012 09:04:08 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id oo6sm2493885pbc.22.2012.06.28.09.04.06
	(version=SSLv3 cipher=OTHER); Thu, 28 Jun 2012 09:04:07 -0700 (PDT)
Message-ID: <4FEC807C.1040803@gmail.com>
Date: Thu, 28 Jun 2012 09:04:12 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: Pascal Ouyang <xin.ouyang@windriver.com>
References: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
	<CAMKF1sp-vCv1iP3YAgAbEP4=2ruAme+-JnCqxBLXGW5yJ3oyZw@mail.gmail.com>
	<4FEC0EC7.6050800@windriver.com>
In-Reply-To: <4FEC0EC7.6050800@windriver.com>
X-Enigmail-Version: 1.4.2
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpan.bbclass: Fix CCFLAGS.
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
X-List-Received-Date: Thu, 28 Jun 2012 16:15:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/28/2012 12:59 AM, Pascal Ouyang wrote:
> On 2012年06月21日 23:47, Khem Raj wrote:
>> On Thu, Jun 21, 2012 at 12:13 AM,  <xin.ouyang@windriver.com>
>> wrote:
>>> From: Xin Ouyang <Xin.Ouyang@windriver.com>
>>> 
>>> We should not just replace CCFLAGS with CFLAGS while compiling,
>>> because this may cause run-time errors with perl's
>>> DynaLoader.pm.
>>> 
>>> Tested on qemux86 with new libnet-libidn-perl bb recipe:
>> 
>> can you instead try the patch from
>> 
>> http://bugs.debian.org/cgi-bin/bugreport.cgi?msg=19;bug=628522
>> 
> This debian patch takes no effect.
> 
> Actually it try to fix this:
> 
> Some packages which has those lines in Makefile.PL: WriteMakefile( 
> ... 'CCFLAGS'    => 'some cflags', ... ); While run perl
> Makefile.PL to configure, there are CCFLAGS="some cflags" to
> override the original CCFLAGS=$Config{ccflags} in generated
> Makefiles.
> 
> 
> In Poky, CCFLAGS in our generated Makefiles are all right. But when
> we run oe_runmake CCFLAGS="${CFLAGS}" to do_compile, this will 
> override our right CCFLAGS.

but thats what assign operator is meant to do isnt it ?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/sgHwACgkQuwUzVZGdMxSvoACdHtcMLShjJIglhq/KXuE73QIW
7FsAoI/IFxzDXZWX/xLj3tNkDDzdUM++
=MWVl
-----END PGP SIGNATURE-----


