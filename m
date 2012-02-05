Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1RuAVq-0002n7-Dw; Sun, 05 Feb 2012 23:24:46 +0100
Received: by lahc1 with SMTP id c1so2617855lah.6
	for <multiple recipients>; Sun, 05 Feb 2012 14:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ON24YHGeztiZeNZPuvND2/JnuVI2T3w8qiDOglprPs0=;
	b=Sq9zwjn3emlf19rGtVMPHwllG83BA43Qi4kbvISwEI/tTLIrPBLsYivpwVhqPnKVPH
	KHsqXOBRRfIplArt/Z8+1XFj4MsKLO2cCRBb2/+hkPis4PTxPlPnmwOcJcpwxZdpETFq
	2ZkFrP87Ug4+wgE/WRCTXQvWsOyVQNBqPb8so=
MIME-Version: 1.0
Received: by 10.152.130.98 with SMTP id od2mr7611881lab.3.1328480206009; Sun,
	05 Feb 2012 14:16:46 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Sun, 5 Feb 2012 14:16:45 -0800 (PST)
Date: Sun, 5 Feb 2012 23:16:45 +0100
Message-ID: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core@lists.openembedded.org
Subject: do rootfs does not create log files
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
X-List-Received-Date: Sun, 05 Feb 2012 22:24:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

is it a bug or a feature that do_rootfs does not create the package
information (packed_files / packages ..) in a deploy sub-folder did I
miss a switch for this?

Thanks in advance

Andreas


