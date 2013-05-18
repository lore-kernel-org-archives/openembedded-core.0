Received: from mail-pd0-f179.google.com ([209.85.192.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Udk3w-0005WS-Q2
	for openembedded-core@lists.openembedded.org;
	Sat, 18 May 2013 18:32:57 +0200
Received: by mail-pd0-f179.google.com with SMTP id q10so4198302pdj.38
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2013 09:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=aDae9VkJFEP/4zdvs8BmfId4RwV5G+w9OSeFck6qIss=;
	b=W8iKxREb45Wq65dcM0lWKgQm5FPXGr9CiLFI8VjgUWTuPaA0vkipKNcAqQcOzkziCF
	F4it5CKKxBXAfzZVmiqPX10ReAWlBiCQeaa1jhVL+KTdTfwSD9PIE+hxG9AGlnbBYAuY
	N9lPUsjionLyxX7J9/8zCNnoWtH9Q5q5j2aSrWNTgbAUxAH+l4lEJCbOcFnljTHR9dJW
	d1VStzujjEr7Rg2ps20S1nrr1Adp2J7KHeGEbFfQoeVZsjS6aM2qiS+cNYIT+zfhFPbO
	sjMSMIr8vAWy3fBKJ7PuSkJOGAnkVJXcEQbtDnuCdvLDKphqub5/NRU6/uQ6UFCLbLFG
	fnUw==
X-Received: by 10.68.176.133 with SMTP id ci5mr53142376pbc.21.1368893674484;
	Sat, 18 May 2013 09:14:34 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id l4sm16188999pbo.6.2013.05.18.09.14.32
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 18 May 2013 09:14:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.DEB.2.02.1305180850090.20316@oneiric>
Date: Sat, 18 May 2013 09:14:31 -0700
Message-Id: <276E57F3-518F-4A46-A7FB-0CE89A519905@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
	<D9D792CF-EAA0-4B7B-8C5D-9429196AEC70@gmail.com>
	<alpine.DEB.2.02.1305140423590.26605@oneiric>
	<CADkTA4O1VFk1juzepWzjV1FjF9F2J_A83ga92USdgxwegd3Qwg@mail.gmail.com>
	<alpine.DEB.2.02.1305140824360.23009@oneiric>
	<CADkTA4M+Ya24qHwFbB-ETyGwTM-8p_OvuzkUF4yDaQ+=iDZQuA@mail.gmail.com>
	<alpine.DEB.2.02.1305180850090.20316@oneiric>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.1503)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Sat, 18 May 2013 16:33:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 18, 2013, at 5:50 AM, "Robert P. J. Day" <rpjday@crashcourse.ca> =
wrote:

>=20
>  just FYI, did a fresh build for qemumips64 from updated oe-core
> layer alone, and it seems to work fine. i think it's a keeper.

thanks. Now expecting people to build world with qemumips64 and report =
issues.=


