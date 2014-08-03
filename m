Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 501 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 03 Aug 2014 13:33:43 UTC
Received: from smtp08.online.nl (smtp08.online.nl [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id 29DC965CD8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 13:33:43 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id 1ABD6664B2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 15:25:22 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp08.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 15:25:22 +0200 (CEST)
Message-ID: <53DE3841.2000305@topic.nl>
Date: Sun, 03 Aug 2014 15:25:21 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
Subject: What does "QA Issue: ... rdepends on .. but its not a build dependency?" mean
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
X-List-Received-Date: Sun, 03 Aug 2014 13:33:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm getting lots of warnings like this:

"""
WARNING: QA Issue: enigma2-plugin-systemplugins-wirelesslan rdepends on 
wireless-tools but its not a build dependency? [build-deps]
"""

What does it actually mean? What does it want me to provide here?

The message in itself is correct. The package only has a runtime 
dependency. It does not require the wireless-tools package to be built 
or otherwise present on the build system. But what is the QA issue here 
and how do I get rid of the message?

Apart from that, there's a spelling error in there (its -> it's) because 
it's "it's" when it's "it is" and it's "its" when it's its property.

-- 
Mike Looijmans

