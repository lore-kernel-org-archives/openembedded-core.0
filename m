Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QDC0p-0003k8-Hu
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 10:46:51 +0200
Received: by pxi1 with SMTP id 1so348704pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 01:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=MfkHD0iBguhSwUtS1lxq3grX3SifEMGyq9K9atIyNbI=;
	b=ZpM5vu+C6qVjK0s4ZMzJQoE+xreYjBgB5n/CwTqi4O6STJ4F1MMEuqyBtikIrSXUJQ
	DsAvrk/Ka4slWADUUcHPCEMTF3nI15Hl/jLVlWXGMtNKLGTdY3iHZGFTFTrAMoSz+2ce
	ptugXPYhpTgcPOF2H3mXdivnpIZ+To1VH/9M0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JSAzqLmUawhVmOrO66+vmyuGzsZqhG9uVOWoskK3NKeASB4N1TA+Y06Zd3f+fa4fF7
	sKJHnvdfn94918MXx+8k+1sBaqSCrGDE9ZlIMlAvpGOCXTTy52nvV/5L5uCMx+pFNPB5
	/5uhx5PKiW2icStHjzl7bnByuPte2AEnXiQYY=
MIME-Version: 1.0
Received: by 10.142.59.10 with SMTP id h10mr504801wfa.326.1303461864405; Fri,
	22 Apr 2011 01:44:24 -0700 (PDT)
Received: by 10.142.223.2 with HTTP; Fri, 22 Apr 2011 01:44:24 -0700 (PDT)
Date: Fri, 22 Apr 2011 10:44:24 +0200
Message-ID: <BANLkTimJaw7oHSZws2JDY=PtjgpYd6YcuQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org, dongxiao.xu@intel.com
Subject: [FIX] update mtd-utils to 1.4.4
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
X-List-Received-Date: Fri, 22 Apr 2011 08:46:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

mtd-utils_1.4.1 is broken, in fact whole 1.4.X serie was plagued by
mtd alignment bug until 1.4.4.

See: http://lists.infradead.org/pipermail/linux-mtd/2011-April/034599.html

Updated in oe-dev with commit f8e1b7793ff5b02fd27ce886b34a57c6c2358239.

Regards

Andrea


