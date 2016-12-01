Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 087E671AEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:17:24 +0000 (UTC)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <68b7f401-a888-ff73-45d5-b0df76f170c4@embed.me.uk>
Date: Thu, 1 Dec 2016 16:18:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.0
MIME-Version: 1.0
Subject: non-standard library locations and rpath
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
X-List-Received-Date: Thu, 01 Dec 2016 16:17:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm having some troubles with shared library, shared library 
dependencies and rpaths. I have libfoo, which depends on libbar when I 
try to link libfoo with my app, it requires libbar to be found. libbar 
is in a non-standard location, /usr/local/bar when I compiled libfoo, I 
used -Wl,rpath-link ${STAGING_SYSROOT}/usr/local/bar and -Wl,rpath 
/usr/local/bar. Now when I come to try link my app with libfoo, it fails 
to link as it can't find libbar, which I assume means the rpath in 
libfoo isn't being properly prepending with sysroot what is the proper 
way to support this in OE? My library has the following rpath information:

0x0000000f (RPATH) Library rpath: [$ORIGIN/../lib:/usr/local/bar]

So why isn't the rpath being prepended with the sysroot when I compile 
my app and link libfoo? The apps build system is using cmake, but this 
should be a built in linker feature, correct?

Cheers,
Jack.

