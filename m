Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 28E7473BB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 10:56:30 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C4B7FF811D7; Fri, 17 Jul 2015 04:56:30 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 65B11F81188;
	Fri, 17 Jul 2015 04:56:30 -0600 (MDT)
Message-ID: <55A8DF6B.3040909@mlbassoc.com>
Date: Fri, 17 Jul 2015 04:56:43 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: image.bbclass vs core-image.bbclass
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
X-List-Received-Date: Fri, 17 Jul 2015 10:56:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Why are some ROOTFS_POSTPROCESS_COMMANDs being set in image.bbclass
and others in core-image.bbclass?  If I build an image using only
image.bbclass, I miss the settings from core-image.bbclass (which
is somewhat misnamed IMO since it's heavier than image.bbclass)?

Is there some reason not to have all of the ROOTFS_POSTPROCESS_COMMANDs
just in image.bbclass alone?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

