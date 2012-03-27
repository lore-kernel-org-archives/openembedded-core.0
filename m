Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SCYWf-0003GX-34
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 17:41:37 +0200
Received: by yenm3 with SMTP id m3so26089yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Rbqa2g5MdBOAVXUBwSFAR0hDQ/l3R4ptmqZ4AXk2WtY=;
	b=SLBt+GBD2nBxyiPvKzxvfilGPiWT7WjGGd3fQWANIxMGb4Dcm3YMwi9n7ULjoMW5Mh
	YMrzEX2KqpHiQ1CIDUyzBcX1qgmwq+fsl7sJm0NUbdav2TIj/5CpPWS+VFvz1crp8HIs
	U8JEWXd9SYTNXayVBZJl3kW+HyKlv+/Gl/yrl42NcwaVLABod5bssU16+ahq5l08XL5X
	XwBVwq9gBa96iQv9GDy7iQtECOzrg79IvnidbkM5Ct/DBH9n7o+8WgnF7zVZBQX/JQuf
	7R8AIkO+B2+qa2ABKTLCev4LhXOaNN8JGMgGQnsCzQBC1ZZLWsWoE9gsE/BBCg9pdVOt
	Kxaw==
MIME-Version: 1.0
Received: by 10.50.212.97 with SMTP id nj1mr8990069igc.65.1332862355109; Tue,
	27 Mar 2012 08:32:35 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Tue, 27 Mar 2012 08:32:35 -0700 (PDT)
Date: Tue, 27 Mar 2012 17:32:35 +0200
Message-ID: <CALbNGRQFQ6=kFVCeVfOgUTPvBVpeSxZZQ2Zak96O5UjjRxxoqQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: What causes a variable being static/global
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
X-List-Received-Date: Tue, 27 Mar 2012 15:41:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

some more stupid questions:

What causes a variable being global (accessible by all recipes)?
Does the declaration in *.conf lead to global variable?
Are there other mechanisms forcing global scope?

Thanks in advance

Andreas


