Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id 9664E6E64A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 12:49:49 +0000 (UTC)
Received: from nbhjo (42-72-253-93.EMOME-IP.hinet.net [42.72.253.93])
	by msfrf2617.sfr.fr (SMTP Server) with ESMTP id 3F5E41C002042
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 13:49:48 +0100 (CET)
Received: from nbhjo (42-72-253-93.EMOME-IP.hinet.net [42.72.253.93])	(using
	TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2617.sfr.fr (SMTP Server) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 13:49:46 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
References: <1479552674-23762-1-git-send-email-herve.jourdain@neuf.fr>
In-Reply-To: <1479552674-23762-1-git-send-email-herve.jourdain@neuf.fr>
Date: Sat, 19 Nov 2016 13:49:38 +0100
Message-ID: <002401d24263$670286a0$350793e0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
thread-index: AQF4ii4SPmdynm04eHOqpmJQkqdMcaGTslSw
X-sfr-mailing: LEGIT
Subject: Re: [PATCH 0/1] Add a tune file for cortexa53, valid for 32 bits and 64 bits
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
X-List-Received-Date: Sat, 19 Nov 2016 12:49:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Please disregard this patch, v2 coming...

-----Original Message-----
From: Herve Jourdain [mailto:herve.jourdain@neuf.fr] 
Sent: samedi 19 novembre 2016 11:51
To: openembedded-core@lists.openembedded.org
Cc: Herve Jourdain <herve.jourdain@neuf.fr>
Subject: [oe-core][PATCH 0/1] Add a tune file for cortexa53, valid for 32
bits and 64 bits

Tune file for ARM Cortex-A53, supporting 32 bits and 64 bits configuration

Herve Jourdain (1):
  Add a tune file for cortexa53, valid for 32 bits and 64 bits

 meta/conf/machine/include/tune-cortexa53.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa53.inc

-- 
2.7.4


