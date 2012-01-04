Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Riaoe-0004b5-KT
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 01:04:20 +0100
Received: by dake40 with SMTP id e40so10027741dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2012 15:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=AkEnHDHAquTc2CMxRV3z/9cSsjNGZh+LrcT2nlhMgbQ=;
	b=Ombw74663wUvBKdZOL5G+qukUN7pwW3SKzGuuD87csieOJDzdz/4s5msWEEGcI015p
	qtm+6e6iC3tMwZCwOv80Q9PiomL2LVtn4sE7g7DVYKgxLmxZg+VhTrapn840UVvd7x1Q
	AG0n2tNU6fKyHI3Ggtc57IA91UXLNFtS73Oyw=
MIME-Version: 1.0
Received: by 10.68.197.165 with SMTP id iv5mr24414814pbc.69.1325721417689;
	Wed, 04 Jan 2012 15:56:57 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Wed, 4 Jan 2012 15:56:57 -0800 (PST)
Date: Thu, 5 Jan 2012 00:56:57 +0100
Message-ID: <CAAQYJAtDd7SefbyUGJTwbvPErrZ3t8n=Jvf=vN1FW4_CO5eSkw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: rootfs_ipk.bbclass: : [: -eq: unary operator expected
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 05 Jan 2012 00:04:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Checking the logs I noticed this note:

/oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/initramfs-kexecboot-klibc-image-1.0-r0/temp/run.do_rootfs.22017:
line 271: [: -eq: unary operator expected

The line in question is in rootfs_ipk.bbclass

rootfs_ipk_do_rootfs()
...

 if [ $runtime_script_required -eq 0 ]; then


IMHO the test should be refined.

Regards

Andrea


