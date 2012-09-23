Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TFuQk-0008Py-8X
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 00:13:38 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 2215C2068D;
	Sun, 23 Sep 2012 18:00:53 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute1.internal (MEProxy); Sun, 23 Sep 2012 18:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=PiSZFX7xmM2jU5Xxyuyjhv
	fT8so=; b=FOXN51J7VIVcxd6Q3Z4HW/KqH/63fEXBucoQbLJNoIF/XdTBZEc+4u
	Giv0EX4LWgXhXF2btG6O1VTYNUhENaBz1WcQ/SyOEk+Xjw147oXffCL8zga4jBKP
	FDsbz0RiAzVKFKybcavmZDxF1Z03usoOu2qGm1m9i4iv8UJJgYocA=
X-Sasl-enc: MGr9HlkQyjrzXVXbSXKuSizbvuy0B6OtF6eGqqXUSiNz 1348437652
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id B2C054824F0;
	Sun, 23 Sep 2012 18:00:52 -0400 (EDT)
Message-ID: <1348437614.4646.20.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Sun, 23 Sep 2012 18:00:14 -0400
In-Reply-To: <8646478.oESqj5TJhl@helios>
References: <1348339337.4444.229.camel@x121e.pbcl.net>
	<1348429520.4646.16.camel@lenny> <8646478.oESqj5TJhl@helios>
X-Mailer: Evolution 3.4.4 (3.4.4-1.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus: Remove hardcoded reference to /usr in System V startup script
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
X-List-Received-Date: Sun, 23 Sep 2012 22:13:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-09-23 at 21:22 +0100, Paul Eggleton wrote:

> What is being expanded here at parse time is a bitbake variable rather than a 
> shell variable, so it should work fine.

Ok, sorry for the noise.





