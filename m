Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1S4vZU-0000SX-IM
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 15:41:00 +0100
Received: by wibhq12 with SMTP id hq12so2796755wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 06:32:25 -0800 (PST)
Received-SPF: pass (google.com: domain of slapinid@gmail.com designates
	10.180.99.100 as permitted sender) client-ip=10.180.99.100; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of slapinid@gmail.com
	designates 10.180.99.100 as permitted sender)
	smtp.mail=slapinid@gmail.com;
	dkim=pass header.i=slapinid@gmail.com
Received: from mr.google.com ([10.180.99.100])
	by 10.180.99.100 with SMTP id ep4mr24075058wib.7.1331044345007
	(num_hops = 1); Tue, 06 Mar 2012 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=MNhboLjjqPdV/Brg/bK9Xoqmm9BS3PcshbOhjUQwvZc=;
	b=QXxduKEUL5dmVyQx4ATjGFTJdp/6bZaZYGGcoMk19CtX780B9+nPCbYzoHK680Haks
	bZbumb6z0oUTMNBg4ws0XvpxeTZ9xaKR84PygYWzcqcGWceloDBGvsaMKzhW2DwGO8xs
	g2DbVSMTe/MTqRUfKXC8lpY+PjipaKUvsdnCyPYWIou1nIj/KkMrk0S0DLI2ttzcH02b
	0pJQOsh8lFT3Te+47NS40BbhBBXL+HDvRZgTo7kWfooJ6zcRD3L6fTZVtQAl3BLf3NLj
	U4M3XJjZYKPycQgl9/3+6rT1z3BGXgSqdlr9YhUKWl+/p1N9Tt2kdCTJl8n/wBibfgJr
	OEpw==
MIME-Version: 1.0
Received: by 10.180.99.100 with SMTP id ep4mr19106978wib.7.1331044344964; Tue,
	06 Mar 2012 06:32:24 -0800 (PST)
Received: by 10.216.65.130 with HTTP; Tue, 6 Mar 2012 06:32:24 -0800 (PST)
Date: Tue, 6 Mar 2012 17:32:24 +0300
Message-ID: <CAFZPMoYf0nA-T-rSqbQfWnaZ7Ju865=aVZJ1+N=vvmhYEKcGgQ@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: python build check
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
X-List-Received-Date: Tue, 06 Mar 2012 14:41:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

is there some custom QA mechanism to run on compilation output to
detect Bad Things?
I need to check that mandatory modules in Python are built properly
(like _hashlib).
Because it reports normal status but becomes unusable in non-obvious way.

It prints failed modules on stdout during compilation, so some log
processing is necessary.

All the best,
S.


