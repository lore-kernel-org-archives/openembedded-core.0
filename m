Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Qrl8S-0000KR-W4
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 08:22:25 +0200
Received: by qyk9 with SMTP id 9so2007595qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 23:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=bZ/R2cAYe+tyWK7e8mogZnG1TzvzmcD3P689oxv3bp0=;
	b=nKeeoJ0YP2z/SFCvVzbqAxfHovAo46zEXq3nRsvibpPnwKYleFgkRt8mXzYVQleXvM
	XSVZjwaVizujJLTOm8l3cGoeJ+O/5OFpmOOXeRTXpslbV1hIxXkCxo53HTe+OOzdkT2e
	kKTYwH2CIti91BjPWyX9JeGJWBfKoXqb2n/20=
MIME-Version: 1.0
Received: by 10.229.7.141 with SMTP id d13mr374950qcd.21.1313129872044; Thu,
	11 Aug 2011 23:17:52 -0700 (PDT)
Received: by 10.229.186.7 with HTTP; Thu, 11 Aug 2011 23:17:52 -0700 (PDT)
Date: Fri, 12 Aug 2011 08:17:52 +0200
Message-ID: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Questions about the layer structure in OpenEmbedded-Core
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
X-List-Received-Date: Fri, 12 Aug 2011 06:22:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
lately I looked a bit into the structure of OE-Core and found pages
like: http://www.yoctoproject.org/projects/openembedded-core, and
http://openembedded.org/index.php/LayerIndex

1. question: Are these informations reliable (the layer index page
seems outdated). From the information I found, this graphic was
created as conclusion:
http://imageshack.us/photo/my-images/155/openembeddedlayers.png/

2.: Currently the "UI layer" seems to be contained in
meta-openembedded, so is this _the_ layer for UI and windowmanager
recipes or is this a subject to change?

3.: The commercial layer is nowhere found, what are the plans for this
layer, or was this just an idea?

4.: In which layer would distributions fit in the graphic?

5.: Is something important missing / wrong in my graphic (other than
the distro stuff)?


Regards
Samuel


