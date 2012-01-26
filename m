Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RqQhp-0004eR-Oo
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 15:53:41 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:Content-Type:Content-Transfer-Encoding;
	b=GikYFm30we9AHfNHN1N/VfdIRJIYGfLB7eVpJWcq+YoN1mGTZW1N+c4+
	l28Lp34/GsCh9qRBwBFLK7uRcd7xRHoT2A9CX6+rH0uwuStLvdQwR4vUU
	smMFJgMc1XI8VQ9eDlqNYEudmCCJB2C5WgqVxT+JfTm7TIL7jq4MTLi7a
	ktpqPSSDS5ApR2e0GEooZlDhNCPOq1hKNgKxSbE7US9M6SkXqhJxhu9LY
	XmMPZEMULpWZDONiY9I3k5e4VSu+H;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1327589156; x=1359125156;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=/VTLl42lwmaKji2mROy2VYDBSm2vGDDh9jKQDlm8FXc=;
	b=rAVQtyq0hNg7YtnNnrbwix6HkWBFnn1ACGGK53QFTJHD8qJBYhyhFEJC
	KYd003ny/Ss24bWfERV7VRiMsUWJ+t4ouM86tnKrPdQsjk0B2LXHiS7ZV
	JpRMNJq7PRQ1ppm+50tlN/cxvSUAXZd6z4m7+fPm0Vq4K7xhUOeElgwLG
	bjPyyc9AYFRXJ7/k24aXdzJXFx4Wd9+m+5MWwaFFh7suYvqxboW9SjYiO
	GrZil0so+f22X8qi0rR9pYORqTUZP;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,574,1320620400"; d="scan'208";a="84590127"
Received: from abgdgate30u.abg.fsc.net ([172.25.138.66])
	by dgate20u.abg.fsc.net with ESMTP; 26 Jan 2012 15:45:56 +0100
X-IronPort-AV: E=Sophos;i="4.71,574,1320620400"; d="scan'208";a="127502282"
Received: from abgvpn598v.abg.fsc.net (HELO [172.26.150.89]) ([172.26.150.89])
	by abgdgate30u.abg.fsc.net with ESMTP; 26 Jan 2012 15:45:55 +0100
Message-ID: <4F216723.3040302@ts.fujitsu.com>
Date: Thu, 26 Jan 2012 15:45:55 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111120 Icedove/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Confused by the xorg recipes
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
X-List-Received-Date: Thu, 26 Jan 2012 14:53:41 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8bit

Again I'm totally confused. I tried to build my image, but the 
xorg-record-extension is missing. The very strange thing is:
Other extensions like xorg-xserver-extension-dri exist als ipk packages, but
  are not in the image and when I try to build them
manually with "bitbake xorg-xserver-extension-dri" I get an
error that says "nothing PROVIDES 'xserver-xorg-extension-dri'".

That extension is defined as a package in
./meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc,
but why does this one build and the §{PN}-extension-record not that
is defined within the same statement, just a few lines below dri?

Regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Business Clients
Dept. TSP WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany
qq
Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujitsu.com
Company Details  ts.fujitsu.com/imprint.html


