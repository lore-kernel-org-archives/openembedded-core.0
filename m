Received: from ams-iport-4.cisco.com ([144.254.224.147])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mneergaa@cisco.com>) id 1TG3Yz-0004Kq-R1
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 09:58:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=865; q=dns/txt; s=iport;
	t=1348472760; x=1349682360;
	h=date:from:to:subject:message-id:mime-version;
	bh=cQfH0jV4tWbgL59jErzyiuRA8+b0cYXKCoBuYL/IGiM=;
	b=JW1ApHyNp53k+UGhGCE7leWrZTQb8bhZMhz4E9ZafXJRwNIYb7YNv1+r
	3Ve4cZQ+HHdm1CU4X00FLsO/RXQBRO5KnQrDN3S5vNJc+5jXYTKxGZJOh
	2G4aBENYynQODULb/XbiRcryUBS7T7q+mfm3s7lg/l6kNj3cfnRJHwmjk o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AkcFAEIOYFCQ/khR/2dsb2JhbABFhURHuCCBCII5ARCBCwImAhZ+h2OXaIEojRySFgSBIY0Fgg6BEgOVZI47gWmCaQ
X-IronPort-AV: E=Sophos;i="4.80,474,1344211200"; 
   d="scan'208";a="8269290"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-4.cisco.com with ESMTP; 24 Sep 2012 07:44:53 +0000
Received: from kattastrofe (dhcp-10-54-74-65.cisco.com [10.54.74.65])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q8O7ir2U024718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 07:44:53 GMT
Date: Mon, 24 Sep 2012 09:44:53 +0200
From: Morten Minde Neergaard <mneergaa@cisco.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120924074452.GH2254@kattastrofe.rd.tandberg.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Customize devshell terminal command / environment?
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
X-List-Received-Date: Mon, 24 Sep 2012 07:58:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

I'm using screen for all my terminal multiplexing. While using the
devshell feature, I want to add devshells directly to my existing screen
session. This wasn't straightforward, at least not as straightforward as
I'd like.

Made this pach: https://gist.github.com/3774736

It's just a quick hack, the minimum effort for getting the behaviour I
want. The space of possible implementations if probably quite wide, here
are a few options:

 * Make a new CustomTerminal terminal class that takes its command line
   from a configuration directive, e.g. OE_TERMINAL_CUSTOMCMD
 * Allowing option overrides for each of the existing classes
 * Detect the STY variable if present, and use the existing screen if
   one exists

I'm strongly in favour of implementing the first one. Any objections or
interjections? =)

-- 
Morten Minde Neergaard


