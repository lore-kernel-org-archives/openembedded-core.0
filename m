Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnCfo-0007QL-UC
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 18:18:17 +0100
Received: by wibhi8 with SMTP id hi8so574405wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 09:10:36 -0800 (PST)
Received: by 10.180.99.199 with SMTP id es7mr20364825wib.10.1326820236714;
	Tue, 17 Jan 2012 09:10:36 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l2sm33569212wie.11.2012.01.17.09.10.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 09:10:36 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <c7289878f3f3fbcc7da909a962903b7e39ecbbee.1326815198.git.mark.hatle@windriver.com>
Date: Tue, 17 Jan 2012 18:10:30 +0100
Message-Id: <3A4D9257-4791-43B5-AD98-4C99187F9F57@dominion.thruhere.net>
References: <cover.1326815198.git.mark.hatle@windriver.com>
	<c7289878f3f3fbcc7da909a962903b7e39ecbbee.1326815198.git.mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/1] package_rpm.bbclass: Add support for filenames with spaces
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
X-List-Received-Date: Tue, 17 Jan 2012 17:18:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 17 jan. 2012, om 16:47 heeft Mark Hatle het volgende geschreven:

> Files with spaces must be fully quoted in an RPM spec file.  It was
> easier to quote all file paths, then to do it selectively.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Tested-by: Koen Kooi <koen@dominion.thruhere.net>


