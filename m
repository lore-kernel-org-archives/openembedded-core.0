Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SwraC-0002oF-He
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:20:41 +0200
Received: from localhost ([127.0.0.1]:44311 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SwrOv-0005zN-Ac
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 09:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=2GkDCwHpVaz82AELfbvycd
	fXNRQ=; b=oRYETrYfu1D+cwvWSXpzCCDJRMn/eAmWNMmqseAf+uhdQEcAilgj6E
	avPEkIyccVo7Q1Lh6w5u6K5oNXhfELiTh/J3lvcYDYCJpGD7UegZr7j2PwvKojpd
	OwuHmFyF+AFqQM/nw+OuWEfx+uSIo69+vd3HlEvDaJ24c5paYfJTI=
Received: from [195.171.99.130] (port=47166 helo=[192.168.0.52])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SwrOv-0005zI-8D
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 09:09:01 +0000
Message-ID: <501A43F2.7020209@communistcode.co.uk>
Date: Thu, 02 Aug 2012 10:10:10 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Qemu refusing to build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 09:20:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am having an issue trying to build qemu for the qemuarm machine. It's 
just a standard core-image-minimal with a vanilla copy of poky master. 
The error log is as follows:

    /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/log.do_configure.1062
    ---------------------------------------------------------------------------
    DEBUG: Executing python function sysroot_cleansstate
    DEBUG: Python function sysroot_cleansstate finished
    DEBUG: Executing shell function do_configure
    /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/run.do_configure.1062:
    line 86:
    /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/qemu-0.15.1/configure:
    No such file or directory
    ERROR: Function failed: do_configure (see
    /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r10/temp/log.do_configure.1062
    for further information)


That is all I get, and the build just fails. I'm not sure where to even 
start debugging this...

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



