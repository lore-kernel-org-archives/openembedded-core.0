Return-Path: <ml@embed.me.uk>
X-Greylist: delayed 1958 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Nov 2016 15:06:34 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 769B06FFC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 15:06:34 +0000 (UTC)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
Date: Fri, 11 Nov 2016 14:34:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
Subject: libtool --with-libtool-sysroot
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
X-List-Received-Date: Fri, 11 Nov 2016 15:06:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I've run into an issue where libtool isn't using the right prefix in an 
SDK built with -c populate_sdk. Looking at the configure log I can see:

configure: WARNING: unrecognized options: --with-libtool-sysroot

However, looking at the libtool recipe in OE it has a patch which 
changes the libtool flag from --with-sysroot to --with-libtool-sysroot. 
The question is, how is this version not making it into my SDK, I have 
sourced the environment script and a which libtoolize points to the 
right path.

/openembedded/sdk/latest/sysroots/x86_64-oecore-linux/usr/bin/libtoolize

Any ideas?

