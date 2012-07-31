Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <b08248@gmail.com>) id 1SwH99-00085y-TP
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 20:26:20 +0200
Received: by vbbfr13 with SMTP id fr13so5791664vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=GK3B/G+u5TY6mmp2NfoTx1Okv/TmdKCP/onTPwy3UFM=;
	b=hkY+8n2fjY9a2O205jhdT4T18h+12pWGdTsK5tPlAobw9mYx4uh4VOCjVHdfVBXlaw
	I8gu8QpYcxv90Qmh3bGBtkS/hUR6qivUFkkPAQ7TIdLX08C/HC49WW2v/AWWec5ZA/BL
	GV5eTUrL2slQtwjNEh32zOfOh53PslFnlhTBgq9wTiNb1cZYf6DydnHxFKArZKYQK6DC
	8BCjqIBz47oIGSvBIMvct0dkarsSpxtZwjYq+zji/pH/NlJZ1J+SOwCysRVSG3IYeER2
	y5vTz7NYLeBj2shIzp18ZbozZlkfBhyWNv5VFu1p0mrejRN67h25LjzF21/6coG49IM4
	1RUg==
MIME-Version: 1.0
Received: by 10.220.214.208 with SMTP id hb16mr14723399vcb.56.1343758482078;
	Tue, 31 Jul 2012 11:14:42 -0700 (PDT)
Received: by 10.58.231.106 with HTTP; Tue, 31 Jul 2012 11:14:41 -0700 (PDT)
Date: Tue, 31 Jul 2012 13:14:41 -0500
Message-ID: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
From: Stuart Yoder <b08248@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: static busybox?
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
X-List-Received-Date: Tue, 31 Jul 2012 18:26:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

We are doing some work with LXC (containers) and one of the templates
is for busybox.  For LXC, the busybox package needs to be built statically and
there is a config option for this.

A couple possible approaches:

   -create a new 'busybox_static' recipe that the lxc package
    depends on that turns on the needed build options.   Pretty
    straightforward, but now there are 2 variants of the busybox
    package.

   -somehow propagate some configuration options through to
    the standard busybox recipe so it turns on the config
    option to build things statically.   Not sure how to
    do this, and seems like it could get pretty messy.

Any thoughts?

Thanks,
Stuart Yoder


