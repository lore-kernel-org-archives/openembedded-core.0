Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id CF890739BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 10:29:00 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
From: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <55CB2008.4020101@communistcode.co.uk>
Date: Wed, 12 Aug 2015 11:29:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
Subject: making /var/log persistent
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
X-List-Received-Date: Wed, 12 Aug 2015 10:29:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to make /var/log persistent and I'm having trouble. I've made a 
bbappend to base_files which contains:

dirs755_append = " \
         /var/log \
"

volatiles = "tmp"

Looking in the resulting image, /var/log is indeed now a directory and not a 
symlink to volatile storage, however when the image is flashed to target and 
booted it is reverted back to being a symlink; I assume by some init script?

Can anyone shed any light on what more is required to get a persistent log 
directory.

Cheers,
Jack.

