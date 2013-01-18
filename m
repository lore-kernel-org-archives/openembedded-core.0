Received: from mail-we0-f182.google.com ([74.125.82.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TwBXA-0003wr-8I
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:59:00 +0100
Received: by mail-we0-f182.google.com with SMTP id u54so828655wey.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 04:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=obq1NAzCZ/m/ZmM4fEHMa9hkxILKuhb4pmK0q8BNHWQ=;
	b=aguDEZ72WLwzRgjFuGzXZL68dU9fDZHMS6J2zvk0nt99Ot7pZw++180RKJfcdOxC4L
	C/5Fgi3FpiQrL2mDg4DpxAYNUSmdxsNWpgaPZH5sPBkMXegFeNr5kD7YQCXD5437QCv3
	5JfkMNSAY/160ljSjDuVfXUphcLTVeWO8YS9NnuEFnWJRdDuZIiRVSyrN9km5iAIjHTM
	0C4jx2y8s+cEChBhAzg/a0H340TKtALF8w6bt64AUSASab4KrI7cCoEnghbOnwAnfmrL
	I7UA7uGAdJoveKqQWZZMHt8N03OoSx7imnkzZkkVQg1v8KwBXumYPajQGYOawg5EUmVI
	I35Q==
X-Received: by 10.180.8.130 with SMTP id r2mr3439926wia.28.1358513015762;
	Fri, 18 Jan 2013 04:43:35 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id p2sm3660659wic.7.2013.01.18.04.43.34
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 04:43:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 13:41:47 +0100
Message-Id: <1358512909-14714-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [RFC 0/2] locale packages
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
X-List-Received-Date: Fri, 18 Jan 2013 12:59:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series detects & avoid unwanted packages in images. I know the
second patch might cause fallout due to missing packages but currently we have
a RRECOMMEND which is difficult to discover even with buildhistory.

Andreas Müller (2):
  buildhistory.bbclass: track also complementary package information
  package.bbclass: remove RRECOMMENDS on base packages for locale
    packages

 meta/classes/buildhistory.bbclass |    5 +++++
 meta/classes/package.bbclass      |    3 +--
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.6.5



