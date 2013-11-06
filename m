Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id D39086CEE8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 14:47:03 +0000 (UTC)
Received: from [10.1.14.248] (83-64-248-68.inzersdorf.xdsl-line.inode.at
	[83.64.248.68]) by ptmx.org (Postfix) with ESMTPSA id 9A1042043D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 15:47:02 +0100 (CET)
Message-ID: <527A5666.6040208@pseudoterminal.org>
Date: Wed, 06 Nov 2013 15:47:02 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Request for moving Orc to OE-core
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
X-List-Received-Date: Wed, 06 Nov 2013 14:47:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

As preparation for upgrading the gstreamer1.0 recipes to 1.2 , I would 
propose to move Orc into OE-core.
Without Orc, key elements of GStreamer (audioconvert, audioresample, 
videoconvert, videoscale ..) are much slower.
Currently Orc is in meta-oe . Its recipe uses the most recent version 
(0.4.18), which is the minimum Orc version that works with GStreamer 
1.2. If Orc is in oe-core, it can be added to the 
gstreamer1.0-plugins-base/good/bad/ugly recipes' default PACKAGECONFIG 
lists.

Thanks,
   Carlos

