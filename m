Return-Path: <sledz@dresearch-fe.de>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6B45C65D40
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 18:58:31 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so1047264eei.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 11:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=fF5RR3KG9HOTGaqpOYANSN7HhHNwZi6RrTUiceguNLU=;
	b=KAGU4laaP35mKRVslqxXNdcYyUf3rEEOuv2oa0d/B4b8YCQQ7s6qQRXzQULqivZZ2d
	o+x+VVkYnKAUP38V8leq95gF+WuW4RD0YyLz7PeZtneGD1P2flV2mMHPR8V+59w/Z7w+
	7TQhIzaqLvoclypELfOZoXxe7dgc5kL2XPtauFtXgVVtFfT4qeUIj3e8yI7WFPR2P9Rg
	J+N9vsRxL+IVfHTTFf7BpXeYW9EV6B+wwBMbhmoEGg7yBZXMOyheljebJX8vJvDPCgJy
	SLRFlxGjpEC2rZ9hoHCgDN6tdJVfVvry/Skum05M7AJi5C9OQJle0ky0pYQ6VxnCGDvy
	VD4w==
X-Gm-Message-State: ALoCoQlf9q1Q6gy50f2V9d8DFki6lZBaaryUmYPoUv/ja6OffZgACiMuLKi/gLX6zT80+pQTJ3v0
X-Received: by 10.14.179.193 with SMTP id h41mr6310313eem.27.1396983512089;
	Tue, 08 Apr 2014 11:58:32 -0700 (PDT)
Received: from ?IPv6:2001:bf0:c080:401::1? (recycler.deck1.zone42.org.
	[2001:bf0:c080:401::1])
	by mx.google.com with ESMTPSA id 48sm6363572eee.2.2014.04.08.11.58.29
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 11:58:30 -0700 (PDT)
Message-ID: <534446D4.2090906@dresearch-fe.de>
Date: Tue, 08 Apr 2014 20:58:28 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <5330220F.8050504@dresearch-fe.de> <1395664516.24232.56.camel@ted>
	<533029C5.1000406@dresearch-fe.de> <1395665593.24232.58.camel@ted>
	<53303FAB.5020907@dresearch-fe.de> <20140324151537.GD29998@jama>
	<53315AE7.1020304@dresearch-fe.de> <53319AAD.5070506@windriver.com>
	<53429BF2.2050804@dresearch-fe.de>
	<5342A69C.9020901@dresearch-fe.de>
	<1396882151.24597.72.camel@ted> <5343EC99.800@dresearch-fe.de>
	<CAMKF1soqOcYKVkgCy_wOU=yyeKJ+JO54e6pAy+dZxhmm1DEXBA@mail.gmail.com>
In-Reply-To: <CAMKF1soqOcYKVkgCy_wOU=yyeKJ+JO54e6pAy+dZxhmm1DEXBA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: complex versioning scenario
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
X-List-Received-Date: Tue, 08 Apr 2014 18:58:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 08.04.2014 19:20, schrieb Khem Raj:
> On Tue, Apr 8, 2014 at 5:33 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> If a package contains a shared library *and* a binary (e.g. a related command line tool) then the soname major version *is not appended* to the package name (see debian_package_name_hook in debian.bbclass). All other problems are aftereffects.
> 
> shared objects which are to be used by other independent packages (
> public .so) should be packaged separately into runtime shared object
> package which is separate from packages with binaries so that multiple
> versions of same librararies
> can be packaged on single system, your usecase seems to indicate that
> the .so is just used by this given binary you bundle together is that
> the case ?

No it is used by the binary which is part of the package *and* some other binaries.

So i've to split the package into two packages of which one contains only the shared object. Right?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

