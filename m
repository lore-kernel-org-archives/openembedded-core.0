Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 76EFE60166
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 12:28:04 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id l4so9796545lbv.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2014 04:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:user-agent:mime-version
	:content-type; bh=pxSeppkhgNf4IqhVoTyhyMSMFhnWHEtVORNU4uOPkLc=;
	b=Wf6C0qy0v6WutrYMqyTxhO6qJUbSh6gIseG5VJ0Z7XVO7yQ664naNhPU7/JlJ9P22Z
	kPeKL3+wcTMI6HrYunSBCoEcQ44CyPXKBBpAmTZ4SRK8HK//LHCXyV1X7jzyd/QcyWRg
	nj2VLZtWCRR5xQtMM2x+Wcu0c7Giy6VcwycldVmletS8dfgDTY5ps+k6RTq0/rtcRI6S
	t/VUSqqN+u2KfwF/rSvFWI0ahZYkhdgV21w5oxgnZZkWsSqHyKqHHPdEZEtoqQRKNnIO
	I5Eb4+MEH9Nz0ZdYcXP8mg7qoEd38MTLgqB5ERt4MoqYpm90xyic679C5vtL0tcgL+D6
	HrLw==
X-Received: by 10.112.141.166 with SMTP id rp6mr878836lbb.39.1389011284879;
	Mon, 06 Jan 2014 04:28:04 -0800 (PST)
Received: from [192.168.0.156] (89-253-118-72.customers.ownit.se.
	[89.253.118.72]) by mx.google.com with ESMTPSA id
	ld10sm54861596lab.8.2014.01.06.04.28.04 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 06 Jan 2014 04:28:04 -0800 (PST)
Date: Mon, 6 Jan 2014 13:25:38 +0100 (CET)
From: Jacob Kroon <jacob.kroon@gmail.com>
X-X-Sender: jkroon@localhost.localdomain
To: openembedded-core@lists.openembedded.org
Message-ID: <alpine.LFD.2.11.1401061314390.9209@localhost.localdomain>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
Subject: Strange looking commit in oe-core, 4cee162c292915e
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
X-List-Received-Date: Mon, 06 Jan 2014 12:28:05 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hi,

Just an observation from my side, I was looking at the recent commits
in OE-Core and saw 4cee162c292915e68e8efcab68a31ba0e48105e9,
"enchant: fix unrecognised option"

The actual commit message doesn't seem to have anything to do with the
actual patch. Perhaps it has been rebased and gone through some other
massaging, the patch seems to make sense, at least to me, still it
would be nice to always have sane commit messages.

Regards
Jacob

