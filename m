Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1U5yHm-0005ju-FA
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 13:51:53 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id CF855F81232; Thu, 14 Feb 2013 05:35:33 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id C2F6CF81230;
	Thu, 14 Feb 2013 05:35:32 -0700 (MST)
Message-ID: <511CDA28.5040504@mlbassoc.com>
Date: Thu, 14 Feb 2013 05:35:52 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: What do these warnings mean?
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
X-List-Received-Date: Thu, 14 Feb 2013 12:52:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I imported libav from meta-oe into my build so I can have additional
gstreamer support.  Now I'm seeing these warnings:

WARNING: QA Issue: ELF binary 
'/home/local/p82_soft/tmp/work/cortexa9-vfp-neon-amltd-linux-gnueabi/gst-plugins-bad/0.10.23-r3.ti1.6.4.3/packages-split/gst-plugins-bad-vp8/usr/lib/gstreamer-0.10/libgstvp8.so' 
has relocations in .text
WARNING: QA Issue: ELF binary '/home/local/p82_soft/tmp/work/cortexa9-vfp-neon-amltd-linux-gnueabi/libav/0.8.3-r0/packages-split/libavcodec/usr/lib/libavcodec.so.53.35.0' has 
relocations in .text

Exactly what do these mean?  What do I do to get rid of them?

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


