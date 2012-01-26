Received: from dgate10.ts.fujitsu.com ([80.70.172.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RqP4G-0004my-FE
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 14:08:46 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=RJ3iBqNnk7ytkkHQMz6Xlgw5ts5LdJtU5RQ9X7Sqpc9Iivs6WHQ5jqfk
	RYi0K8hPvooJck0i77QW5BgevW4985d3kAAo5YSc/yxZ1hXjoIBblM9V1
	0cD2c0n5CT8gyI+WWQhPU2zZoXol+0D0cxwC2lhqqUFYwFtUmciJ2eMzS
	iyeGaMTeYu3Er24jDxvq4OjnCufJGW13GHgEsjrYqWcM5iXSDR4a3tPTs
	aZU67bHUi4fwfuP7SI3P9ka/hRCO8;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1327582859; x=1359118859;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=AEpeUbQUzzvhi98xihknTmzCYilZzdLaLXI3VPvANa4=;
	b=UK1F9FFsXjTwsEWxevWrFGloQjwS3JkNha/rjk+N1MtDLwBnwyXJoEuk
	QC/kc/skWvBSTTyyZBjVtlWYgfFsoM4bGWRahKIVVukssN0/5mn87NUUD
	IiCGCINin1mBJuZ4bGj5g4vGdHLHcdgQvjU1ckQls2dX26hVaSXlpFvwB
	Bk5gy+P9wd8js2wQzK7QoQswPgM1yuNhxpjl7ZtDsirfS9PkOhDHbojDt
	SeHGASpsRk7cPFtVlEOoG2K329byN;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,573,1320620400"; d="scan'208";a="99795741"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate10u.abg.fsc.net with ESMTP; 26 Jan 2012 14:00:59 +0100
X-IronPort-AV: E=Sophos;i="4.71,573,1320620400"; d="scan'208";a="127792947"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 26 Jan 2012 14:00:58 +0100
Message-ID: <4F214E8A.4030209@ts.fujitsu.com>
Date: Thu, 26 Jan 2012 14:00:58 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: Openembedded Core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.0.1
Subject: Avoid stripping of firmware files?
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
X-List-Received-Date: Thu, 26 Jan 2012 13:08:46 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Hi,

for my work on the dm8148-evm I got firmware files with the suffix
".xem3" from TI. I made a simple recipe to install those files in my
image, but I ran into a bad problem:

The firmware files I find in my image are different from the files i use
in my recipe. No matter if I use "install" or just "cp" to copy the
files to the destination.

Looks like those files get stripped during packaging. Normally not a bad
idea, but in this special case stripping the symbols makes the files
dysfunctional.

Is there a way to avoid stripping?

Regards
Rainer
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


