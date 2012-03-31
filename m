Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SDob1-000741-NK
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 05:03:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2V2sCnx003219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 19:54:13 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 30 Mar 2012 19:54:13 -0700
Message-ID: <4F7671D2.4030503@windriver.com>
Date: Sat, 31 Mar 2012 10:54:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: xf86-input-synaptics: failed to build on arm and mips
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
X-List-Received-Date: Sat, 31 Mar 2012 03:03:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi folks,

I met this error when "bitbake world" (MACHINE=qemuarm)

| configure.ac:1:   run info '(automake)Extending aclocal'
| configure.ac:1:   or see 
http://www.gnu.org/software/automake/manual/automake.html#Extending-aclocal
| configure.ac:53: error: must install xorg-server development files before 
running autoconf/autogen


The problem is that arm's virtual/xserver="xserver-kdrive", but what it needs
is xserver-xorg, it built success after bitbake xserver-xorg, I don't know
whether this is a problem or not, the only thing is that it breaks the
bitbake world, maybe we should not build it when "bitbake world"
(MACHINE=qemuarm)?

The same error happened to mips when bitbake xf86-input-synaptics (I haven't
tried ppc yet, I think it should have the same error).

-- 
Thanks

Robert


