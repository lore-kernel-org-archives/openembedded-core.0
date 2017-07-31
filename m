Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel2.indieserve.net (cpanel2.indieserve.net [199.212.143.6])
	by mail.openembedded.org (Postfix) with ESMTP id 595B67840D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 10:41:13 +0000 (UTC)
Received: from [::1] (port=45754 helo=cpanel2.indieserve.net)
	by cpanel2.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89)
	(envelope-from <rpjday@crashcourse.ca>) id 1dc88R-0001dE-0S
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Jul 2017 06:41:15 -0400
Received: from 158.116.144.29 ([158.116.144.29]) by crashcourse.ca (Horde
	Framework) with HTTPS; Mon, 31 Jul 2017 06:41:14 -0400
Date: Mon, 31 Jul 2017 06:41:14 -0400
Message-ID: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
From: rpjday@crashcourse.ca
To: openembedded-core@lists.openembedded.org
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel2.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel2.indieserve.net: authenticated_id:
	rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel2.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: worth adding a "git"-versioned of i2c-tools to oe-core?
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
X-List-Received-Date: Mon, 31 Jul 2017 10:41:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


   given that some significant changes have been made to i2c-tools since
version 3.1.2, is it worth adding a git-versioned recipe of that to oe-core,
and using DEFAULT_PREFERENCE to force people to select it if they want it?
in particular, the code base has been restructured, and a new utility,
"i2ctransfer", has been added.

rday


