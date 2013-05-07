Received: from elasmtp-kukur.atl.sa.earthlink.net ([209.86.89.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jshanab@earthlink.net>) id 1UZXo0-0000jf-Pb
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 04:39:06 +0200
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=dk20050327; d=earthlink.net;
	b=F5rnlqwIM1NcXMZy7O5KngAtq22TwvP+etHUqP8ta8dO8qN0XSv5BvZWYvCZPTx0;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding:X-ELNK-Trace:X-Originating-IP;
Received: from [173.15.37.68] (helo=[192.168.1.201])
	by elasmtp-kukur.atl.sa.earthlink.net with esmtpsa
	(TLSv1:AES256-SHA:256) (Exim 4.67)
	(envelope-from <jshanab@earthlink.net>) id 1UZXQF-0000nZ-Uu
	for openembedded-core@lists.openembedded.org;
	Mon, 06 May 2013 22:14:32 -0400
Message-ID: <51886386.3020607@earthlink.net>
Date: Mon, 06 May 2013 21:14:30 -0500
From: Jeff Shanab <jshanab@earthlink.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130210 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-ELNK-Trace: 41b7b48e67ad7886d780f4a490ca6956d5d4673fe7faad860a852d9e0bd84e280507acde6dd322c1350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 173.15.37.68
Subject: Gentoo psyco --> pypy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 02:39:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On the wiki:
http://www.openembedded.org/wiki/OEandYourDistro#Gentoo_instructions

it says for gentoo users to:

 

emerge -n \
  psyco \
  patch \
  make \.....

psyco is a "dead project and no longer maintained". It was suggested to use pypy and I succesfully built the oe-core-X11 for the raspberry pi

emerge -n \
  pypy \
  patch \
  make \.....



