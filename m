Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id C9E046010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 09:52:47 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:to:message-id:subject:mime-version:content-type:user-agent; 
	b=RusCcL7nwYP1K7U5broYe9FlXDAAHgGudVNS92mH3TdzH7WHF6AEZw+00xp9I1N8e4v6bMD8yb3w
	0C4YFs5nt2j0xc6W0sdqt2A8eIgdZPUjXQGG6sFNaWMs1Q5YJq30AilagV4AOd41losMMQA3HETb
	vSPwKah79kCDI67VRzQ=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1463651565525268.89369487467343;
	Thu, 19 May 2016 02:52:45 -0700 (PDT)
Date: Thu, 19 May 2016 05:52:45 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
To: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Subject: Wic and "live" images
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
X-List-Received-Date: Thu, 19 May 2016 09:52:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Greetings, I am trying to learn "wic" and have been confused as how to create a "live" style image.  I am following "http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html#creating-partitioned-images" but am getting confused on the target to use to create the a file system that has a single squashfs file containing my root file system.  

My desired partition layout is as follows:
      40MiB                 40MiB               300MiB
+--------------------+-----------------+-----------------------------+
|      BOOT (esp)    |    DATA (fat)   |          ROOT (live)        |  
+--------------------+-----------------+-----------------------------+

BOOT - efi boot partition with kernel and initramfs
DATA - generic fat filesystem to hold configuration files
ROOT - an ext4 filesystem that contains a single os.img, which is a squashfs file.

I have ROOT and DATA figured out but I am at a loss as how to generate the os.img file and copy it into ROOT.  If I generate the os.img file with bitbake and then use the "-r" option to manually supply a directory structure it works, but I would rather have it done from a wks file for automation reasons.

Any hints?

Thanks!




