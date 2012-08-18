Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T2dTq-00007r-OX
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 09:29:58 +0200
Received: by eaad12 with SMTP id d12so1173408eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2012 00:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=cjeY6IcrnNwyUNqUi/OgVC/siPi3NZu2cKG40lwqc9s=;
	b=dF0IDhgEoGL/sgBpSVIqmwJ9WERBr86Bb0wSCEPnWvhPFVQ7J6KsDOG6aomFdk2e1N
	D8JfHXK3+YaP448jCwckYpk81ZKuyPFT3LqnVrWD4vn2xaaeiUhrNKvVSytZYA/f/L/H
	+XLK+vNmEPlP7virN4i4MsksW+xeE+qnQ8YD3FU4tG3EO38gndK4A6musYweT+Pv9XE7
	wIM8Xbx+xMDqs3tF3JEyv64t53vR1W6gl8pi87gBzSrXQhwCt+8XpD16lAM4IqLrp/ZX
	d6WwpVIIOoLzTG544Iia4k2j9w0+GZK99UcbcOHtb1N7OMseU4kVEQOakYPmc03jb31Y
	+NsQ==
Received: by 10.14.5.67 with SMTP id 43mr667338eek.15.1345274279204; Sat, 18
	Aug 2012 00:17:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sat, 18 Aug 2012 00:17:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Aug 2012 00:17:29 -0700
Message-ID: <CAMKF1srvBZzMTbN-iOqEjitgSjFOK_Cpd0B94HjWm1z7s-0-iQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] Replacing chrpath with patchelf
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
X-List-Received-Date: Sat, 18 Aug 2012 07:29:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I have a patchset that replaces use of chrpath with patchelf. Patchelf can
resize the ELF headers to accomodate larger RPATHs

The branch is posted here

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/patchelf

Please test it out and let me know if you see any issues

-Khem


