Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 437 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Jan 2015 15:27:08 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4C892718E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 15:27:08 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 7E66727C4D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 16:19:47 +0100 (CET)
Message-ID: <54C7AC94.5040400@pseudoterminal.org>
Date: Tue, 27 Jan 2015 16:19:48 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Should the GStreamer 1.0 _git.bb recipes be removed?
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
X-List-Received-Date: Tue, 27 Jan 2015 15:27:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

right now, for each GStreamer 1.0 package, there is a .inc file, a _git 
recipe, and a versioned recipe. The _git recipes made sense when 
GStreamer 1.0 was first introduced, because this happened during the 1.0 
-> 1.2 version change, and 1.2 brought many essential enhancements, so 
many people wanted to build the git version. However, these days, I 
don't think the git versions are in such high demand. As a result, their 
SRCREVs haven't been updated for a very long time.

Since this is pretty much dead, how about removing these recipes?

cheers

