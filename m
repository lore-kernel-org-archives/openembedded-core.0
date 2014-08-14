Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id B2BED609B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:30:46 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id CB0093345C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 21:30:47 +0200 (CEST)
Message-ID: <53ED0E67.9040505@pseudoterminal.org>
Date: Thu, 14 Aug 2014 21:30:47 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Kernel firmware files with a .dsp ending
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
X-List-Received-Date: Thu, 14 Aug 2014 19:30:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

while writing new recipes for an updated machine specific kernel, I 
noticed some packaging errors:

ERROR: QA Issue: linux-cubox-i: Files/directories were installed but not 
shipped
/lib/firmware/korg
/lib/firmware/korg/k1212.dsp [installed-vs-shipped]

Looking into kernel.bbclass , I see that .bin .cis and .fw files are 
packaged, but not .dsp .

I'm trying to find out if it would be appropriate to extend 
kernel.bbclass to also package .dsp files. Looking into 
http://packages.ubuntu.com/es/lucid-updates/all/linux-firmware/filelist 
, it seems that .dsp is acceptable as a firmware file extension. Opinions?

