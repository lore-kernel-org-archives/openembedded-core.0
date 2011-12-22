Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RdjHN-0005Ce-Gj
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 15:05:53 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=HefNfbwqPDMYU/t05jq6bqXUfBmbe284wkYShQXn4htnfl80bqd1w1j/
	l4mqLX4oozhJS3x3rkiJigBJlU0TXGWYoXp3Yyw5dZ2sabRsA/jq1qs5O
	WomfelpwTqxsMvQOGYO7tRH/QYhxKj8vXXQ4CU/4yElO7U/7p2D7L10wL
	fskXY6NUTThh9jKBAHHrSWprNmqyc795ZF1qtpsHGsIAGoOVAnoNJW78z
	635p8qeYvEx9ge4XHCompu4KTgORz;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1324562329; x=1356098329;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=zhCh7GqgM84gvywrT5cUVPhCEXitrx8zeh4m4QVQcac=;
	b=j5vmvX4KboIgIFkpaNMRa66S7vfTD1/KdXR61p2TRUuTHs4ebBI96/A5
	LzjV1xlokZ+lacYIxbtMwlGBv63u1ic+j+gIAUqyPErUbiFNwfJ1QbvJU
	7FK/PlI5TcVExIb1i+xBX573Is5cmUM8/bpu3/TDmkIRfbT6xTwdOTgY6
	mJl/ZOeX9X/aarcQbu9DdGmgRIhUOHojhSh4DEWKJd3k6XbEi6TLpSbrd
	wBn9C0egG5jXunPo/GtwbKgN5lD0v;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,392,1320620400"; d="scan'208";a="81967549"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 22 Dec 2011 14:58:46 +0100
X-IronPort-AV: E=Sophos;i="4.71,392,1320620400"; d="scan'208";a="125857756"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 22 Dec 2011 14:58:45 +0100
Message-ID: <4EF33795.6080605@ts.fujitsu.com>
Date: Thu, 22 Dec 2011 14:58:45 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Enigmail-Version: 1.0.1
Subject: How do I work with CodeSourcery Lite 2009q1?
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
X-List-Received-Date: Thu, 22 Dec 2011 14:05:53 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

what do I need to do if I want to use the latest Codesourcery toolchain,
that is 2009q1-203 in my case? I saw there are recipes for the 2008 and
2005 releases, but what is with the 2009 release of CSL?

Regards
Rainer



