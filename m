Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TT93w-0004Ni-8F
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 11:28:48 +0100
Received: from localhost ([127.0.0.1]:46154 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TT8qm-0002CC-9b
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=nJuKLoZAGd+Q2osmQ4vZKs
	wApO4=; b=AvJt7k2abzmIDMrg2iRw7CT4L2UKB4pvcbmb+BXaGBKdnsDPpBVoEG
	3qpQYXdcvVB5E1SLbmoZP96K2MNEgnUcI5wZPOKoTgevZqu3SE4jj63KMLB/m0ib
	rA5YFsxJOjtjlc9B0nz2MD5z4+v2u5aYti0eKYCCZk0KzRWgnFa+Y=
Received: from [195.171.99.130] (port=60510 helo=[192.168.0.60])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TT8qm-0002C9-7O
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:15:12 +0000
Message-ID: <508FA924.4030301@communistcode.co.uk>
Date: Tue, 30 Oct 2012 10:17:08 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Removing netbase from an image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 10:28:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am attempting to remove netbase from a custom image. I would like to 
replace it with connman. I have added connman through 
EXTRA_IMAGE_INSTALL, however netbase is brought in via 
packagegroup-core-boot.bb which funnily enough has some very important 
features and I would like to keep.

What would be the best way to make this replacement. Should I copy 
packagegroup-core-boot.bb and keep a local copy, while keeping it in 
sync manually? Alternatively, I notice quite a few packages in 
packagegroup-core-boot have a VIRTUAL-RUNTIME_* define. Would it be 
worth having a VIRTUAL-RUNTIME_network ?= "netbase" which could be 
overridden?

Thoughts?

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



