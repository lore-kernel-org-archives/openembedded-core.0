Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1S4epH-0003kr-Jt
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 21:48:11 +0100
Received: by lagw12 with SMTP id w12so5313555lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 12:39:36 -0800 (PST)
Received-SPF: pass (google.com: domain of cliff.brake@gmail.com designates
	10.112.9.34 as permitted sender) client-ip=10.112.9.34; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of cliff.brake@gmail.com
	designates 10.112.9.34 as permitted sender)
	smtp.mail=cliff.brake@gmail.com;
	dkim=pass header.i=cliff.brake@gmail.com
Received: from mr.google.com ([10.112.9.34])
	by 10.112.9.34 with SMTP id w2mr10151937lba.50.1330979976544 (num_hops
	= 1); Mon, 05 Mar 2012 12:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gEXW/udWN82e1t351JuOvfxFJVuQMfs0dIoB/HZ6fjg=;
	b=F5umjU04b+trYVk1c+R9v7oiafjXJzywZqjQNWyLFKtNPiNA3TA0GJLqN2pcAmrrku
	QertxPPM67bchOL44C0ystGA5kkSZtFSP6QADtLXca1fwMdIqBVNJ1szo46TWGrwBp8c
	AmGIE6wmPpoQlcwD7ULgvHleGOkppMjLQoRbC4EZmkktYAYrGSQgAX53TdxggwyHzB3Y
	dw1396rDzFAeI2doqmo0hxvz/m/HALm4a8tMmt/CJ0oMbig8PK1u7YPkdDwRFBuepalj
	NKMQBOAEh7g7+/p0o3m+1CUJdIvkquWEdu5LWfPE56o48oTetueT3YxPxVvGwKF5d3La
	ijzg==
MIME-Version: 1.0
Received: by 10.112.9.34 with SMTP id w2mr8309864lba.50.1330979976429; Mon, 05
	Mar 2012 12:39:36 -0800 (PST)
Received: by 10.112.31.197 with HTTP; Mon, 5 Mar 2012 12:39:36 -0800 (PST)
Date: Mon, 5 Mar 2012 15:39:36 -0500
Message-ID: <CAOd_LFz2nUOW4D4Q9YuDHzwvs6qTwgS2TJZA5UnJbYaROCiSGg@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: read only rootfs?
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
X-List-Received-Date: Mon, 05 Mar 2012 20:48:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

What are the best practices for implementing a read-only rootfs built
with OE?  I've looked at a few things like poky-tiny.conf, but figured
I would ask.

To date, I've been cheating and implementing a tmpfs overlay on top a
RO rootfs using unionfs, but this is less than idea as you need to do
the package install process on every boot.  Others boot the first time
RW, and then switch to RO for subsequent boots.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


