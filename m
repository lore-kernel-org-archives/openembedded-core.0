Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UINNr-0001zO-LX
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 19:05:23 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so1532593pbc.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=ezIc0cUtiKMW8lMmxqG6xwa65PJbp0qszOdm6+jA2fc=;
	b=aKrKVZJLYaSPG8OPj4KA3uq7EcHZ9evGVXCMG5N8VsnHaz72QqBb7aMPwZ+NszAhPs
	K24qzAy949hHDnqRPkO1m6GqUZhiNsmGayzVBH/5L3tCB4cVZtv7EJzuGzaM7zDrIvUm
	LYFdY8ZwjPDz5WqXNGvnJBbEhal50O5IkXLW01dSzc6BSUbw4wrRlybQtV5yFTOedNxf
	vjwn5CF9uFcOlARL/vAI3T4pQ/DNNUEskEzQonrZjy7pvXdkgjStsrGQGrc0nv6FPa/0
	Y+jy2ytrlwULVmRqPfl0p+jxdu+WTTVMgyJZRqcYmOiLqM5K+xO8iXzO38zDTIFxQNhx
	FHVQ==
X-Received: by 10.68.227.129 with SMTP id sa1mr10336230pbc.107.1363801695774; 
	Wed, 20 Mar 2013 10:48:15 -0700 (PDT)
Received: from sa-nc-ipg-172-23-0-70.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id gf1sm2849779pbc.24.2013.03.20.10.48.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 10:48:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LaU2iEeg-2z=nwaw3O-kTX_VLpKcZ9TUjGGU4gmAzPKqA@mail.gmail.com>
Date: Wed, 20 Mar 2013 10:48:14 -0700
Message-Id: <6D1DEA39-FE6F-4D2D-AE73-0CA6A2881EE3@gmail.com>
References: <cover.1363287636.git.sgw@linux.intel.com>
	<1363313340.14476.13.camel@ted>
	<CAJTo0LaU2iEeg-2z=nwaw3O-kTX_VLpKcZ9TUjGGU4gmAzPKqA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/29] SystemD and other fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 18:05:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Mar 20, 2013, at 10:41 AM, "Burton, Ross" <ross.burton@intel.com> wrote:

> Using ac_prog_cc_for_build.m4 to incorporate CC_FOR_BUILD would be the
> logical solution 

btw, I did considered that :) but thought of not pursuing it


