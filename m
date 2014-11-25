Return-Path: <diego.ml@zoho.com>
X-Greylist: delayed 1294 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Nov 2014 10:12:37 UTC
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.103])
	by mail.openembedded.org (Postfix) with ESMTP id 7C05D65DAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 10:12:37 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:user-agent:in-reply-to:mime-version:content-type;
	b=FjkZ9dZjVmgH5Ka8Y9dDPFB1kou63QwrNsPbeBcr8fKxElzPO/l2FU5QcdjWb2Rm5dW9V4F0xFe+
	roIkAgKnYjblXH7AmE5qHQRieFjrlQtGCfGbxE82t/p/UkWtziYM  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1416908617796376.8938983627352;
	Tue, 25 Nov 2014 01:43:37 -0800 (PST)
From: Diego <diego.ml@zoho.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Nov 2014 10:43:34 +0100
Message-ID: <15075639.N11tDChWWz@localhost.localdomain>
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1416843472-16839-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Subject: Re: [PATCH v2] resolvconf: add fixes for busybox and make it work
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
X-List-Received-Date: Tue, 25 Nov 2014 10:12:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> resolvconf was missing a script and needed readlink which was in
> /usr/bin.  Also the /etc/resolv.conf was not being correctly linked
> to /etc/resolvconf/run/resolv.conf, which is fixed by the volaties
> change which is now a file as opposed to created in do_install.
> 
> Ensure that the correct scripts for ifup/ifdown get installed and that
> resolvconf is correctly enabled at startup

Hi Saul,

Works for me both with udhcp and static configuration, you can add:
Tested-by: Diego Rondini <diego.ml@zoho.com>

Will you be able to backport it to dizzy?

Bests,
Diego


