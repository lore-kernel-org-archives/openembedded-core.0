Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 499C465DCC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 17:21:15 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id as1so1263011iec.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 10:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UiAp0EVgB/HEcQwgHL2WodzKVzeerXZZQHg0bX22awA=;
	b=Px6GzNMrhIy3akDQQYqJ7NYXN0Cq1z8Mu6v0AKuhl9xBl2oU9tjN+cbIptCXul5Ijy
	lc9sU/RzNMDN0rTCe6mWAJCCVyWyVq9gg/NssmcmZwD8wY+VZboleyklT/0A/izjGiFb
	+MXc/dq3UMKVSo4IRaxdk7fOFe1wCfcpraTyF8p1tIXZHI0s8MkXYCEVWA8Idgdutib7
	tGmPrcFPNYDuBWmLZFZqnS/gOv7oJjx6m/t6TcGlquOq04eRcB0zaR3oRhhT3UE9IZ7O
	yc132QRX85iAYho/aCBODEKMpGTwe5YSJ9KBEGe/W8/20e4AnJUFZ52mSQDiWBjIYevd
	9l0g==
X-Received: by 10.42.20.193 with SMTP id h1mr1892004icb.70.1396977676672; Tue,
	08 Apr 2014 10:21:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 8 Apr 2014 10:20:46 -0700 (PDT)
In-Reply-To: <5343EC99.800@dresearch-fe.de>
References: <5330220F.8050504@dresearch-fe.de> <1395664516.24232.56.camel@ted>
	<533029C5.1000406@dresearch-fe.de> <1395665593.24232.58.camel@ted>
	<53303FAB.5020907@dresearch-fe.de> <20140324151537.GD29998@jama>
	<53315AE7.1020304@dresearch-fe.de> <53319AAD.5070506@windriver.com>
	<53429BF2.2050804@dresearch-fe.de> <5342A69C.9020901@dresearch-fe.de>
	<1396882151.24597.72.camel@ted> <5343EC99.800@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Apr 2014 10:20:46 -0700
Message-ID: <CAMKF1soqOcYKVkgCy_wOU=yyeKJ+JO54e6pAy+dZxhmm1DEXBA@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
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
X-List-Received-Date: Tue, 08 Apr 2014 17:21:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 8, 2014 at 5:33 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> If a package contains a shared library *and* a binary (e.g. a related command line tool) then the soname major version *is not appended* to the package name (see debian_package_name_hook in debian.bbclass). All other problems are aftereffects.

shared objects which are to be used by other independent packages (
public .so) should be packaged separately into runtime shared object
package which is separate from packages with binaries so that multiple
versions of same librararies
can be packaged on single system, your usecase seems to indicate that
the .so is just used by this given binary you bundle together is that
the case ?

