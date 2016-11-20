Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id A5E1C71978
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 08:08:01 +0000 (UTC)
Received: from nbhjo (111-82-100-69.EMOME-IP.hinet.net [111.82.100.69])
	by msfrf2614.sfr.fr (SMTP Server) with ESMTP id BDD4D1C000406
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 09:08:02 +0100 (CET)
Received: from nbhjo (111-82-100-69.EMOME-IP.hinet.net [111.82.100.69])	(using
	TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2614.sfr.fr (SMTP Server) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 09:08:01 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
References: <1479559833-128256-1-git-send-email-herve.jourdain@neuf.fr>
In-Reply-To: <1479559833-128256-1-git-send-email-herve.jourdain@neuf.fr>
Date: Sun, 20 Nov 2016 09:07:54 +0100
Message-ID: <003501d24305$351baf70$9f530e50$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
thread-index: AQIZuPqIOKLcPxAJ7Pf8pqxZRGdymqBSmB5Q
X-sfr-mailing: LEGIT
Subject: Re: [PATCH v2 0/1] Add a tune file for cortexa53, valid for 32 bits and 64 bits
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
X-List-Received-Date: Sun, 20 Nov 2016 08:08:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Please disregard this patch, it's not working fine for 32bits (cortex-a53
must have armv8+crc as arch), v3 coming soon.

Sorry for that.

Herve

-----Original Message-----
From: Herve Jourdain [mailto:herve.jourdain@neuf.fr] 
Sent: samedi 19 novembre 2016 13:51
To: openembedded-core@lists.openembedded.org
Cc: Herve Jourdain <herve.jourdain@neuf.fr>
Subject: [oe-core][PATCH v2 0/1] Add a tune file for cortexa53, valid for 32
bits and 64 bits

Tune file for ARM Cortex-A53, supporting 32 bits and 64 bits configuration

Herve Jourdain (1):
  Add a tune file for cortexa53, valid for 32 bits and 64 bits

 meta/conf/machine/include/tune-cortexa53.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa53.inc

-- 
2.7.4


