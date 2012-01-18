Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RnWi8-0004Vg-Ud
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 15:42:01 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:X-Enigmail-Version:
	Content-Type:Content-Transfer-Encoding;
	b=I3Z83dtNcn0DQ15lBQVI4JaRhTZMg2gYdl6tYvhoz+XoygA4CtQGoXTM
	Sr2yqE8t3Y0hV1SBw9kjuTyPc0D63GFkcRFgHcys9+yezMy7H2gqkZKkQ
	LrXosxUx61BZGLWhCG6KgCVwk7qELKbEK9uaGcmgzB+CdOst4WqLkbjMl
	J5Bksd5UKz9VHgE5tE/kVTmxOl3FgjXpJ+hsUEYNu1Ef9KUnO6kmEmy0k
	SqEyuhQjpesbRXf3OnaZl8waCGBZf;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1326897265; x=1358433265;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=1TmcCzI9K/26WO8d7SvIfuKrZxAyB0bRkwPMDDBwGuQ=;
	b=X/WNtSwnRz9GZj9Z8i9es3fYPuZo5UdM8unjshBLoRLC53rT8Ct8AwMv
	2YKx09m1xpsUp4Xx+AIySZ+VoVGSI9AXVu3vTgYXxSeHCwbdNWB18olXA
	rBNLhzmYL5D+IDOUugWNDVPunGzwuMcwxO+CjOUZBofKypxeVZ8i8hxls
	bGwx2l2OvwG2Rr6pKZd4XvQ55k2mk06WmDdeof9rp/qu9MgBbTzfrxT4a
	vYyK9EE5mL8cD+p24jvr+gCFztvif;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,529,1320620400"; d="scan'208";a="83913500"
Received: from abgdgate30u.abg.fsc.net ([172.25.138.66])
	by dgate20u.abg.fsc.net with ESMTP; 18 Jan 2012 15:34:25 +0100
X-IronPort-AV: E=Sophos;i="4.71,529,1320620400"; d="scan'208";a="126986540"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate30u.abg.fsc.net with ESMTP; 18 Jan 2012 15:34:04 +0100
Message-ID: <4F16D85C.6020606@ts.fujitsu.com>
Date: Wed, 18 Jan 2012 15:34:04 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F16C61C.4020304@ts.fujitsu.com>	<20120118134322.GB5443@deadlock.dhs.org>
	<F2C23BA4-EF14-44A5-A4B3-B50848CD0844@dominion.thruhere.net>
In-Reply-To: <F2C23BA4-EF14-44A5-A4B3-B50848CD0844@dominion.thruhere.net>
X-Enigmail-Version: 1.0.1
Subject: Re: How do I get rid of systemd
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
X-List-Received-Date: Wed, 18 Jan 2012 14:42:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Am 18.01.2012 15:21, schrieb Koen Kooi:

> It's really easy, create your own image, no patching needed.
> The systemd dependencies are all in ${PN}-systemd, so just 
> don't include those in your image. I you do include ${PN}-systemd
> in your image you shouldn't be surprised that systemd ends up in it.

Ok. Got 2 files for my image:

---------------------8<-snip---------------------
$ cat magna-base-image.bb

LICENSE = "MIT"
LIC_FILES_CHKSUM =
"file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"

IMAGE_PREPROCESS_COMMAND = "rootfs_update_timestamp"

IMAGE_INSTALL += " \
        angstrom-task-boot \
        task-basic \
        ${CONMANPKGS} \
"
CONMANPKGS = "connman connman-plugin-loopback connman-plugin-ethernet"
CONMANPKGS_libc-uclibc = ""

IMAGE_DEV_MANAGER   = "udev"
IMAGE_INIT_MANAGER  = " "
IMAGE_INITSCRIPTS   = " "
IMAGE_LOGIN_MANAGER = "tinylogin shadow"

export IMAGE_BASENAME = "magna-base-image"

inherit image

$ cat magna-c-image.bb

#Angstrom bootstrap image
require magna-base-image.bb

DEPENDS += "task-base-extended \
           "

IMAGE_INSTALL += "task-base-extended \
            "

export IMAGE_BASENAME = "magna-c-image"
---------------------8<-snip---------------------

Pretty much the same what Angstrom does, just changed the
IMAGE_INIT_MANAGER.

So where did I include ${PN}-systemd?

-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html


