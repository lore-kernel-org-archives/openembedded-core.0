Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UckZp-00017p-E3
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 00:53:51 +0200
Received: by mail-pa0-f49.google.com with SMTP id bi5so1902816pad.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 15:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=eIWwTTrVccl86ZFvoi+1EAA0v89tWHdJjYzz32W+A3k=;
	b=xRCeMVKL8TKyikaq3p5YJCA1e0JzMEyv1hUcKKjBnehP1+P6O09ShOqRCDCUsh2sMB
	QV3otg2XgSdF9xi+dW8oLSZVef6OKbtspk7BhDwpEOH0oxWvoGdrj0vDH67hdpKl6TK5
	mBLRgWuU33mqesNIPoGWq55Iv1bfO5arNXSZxQlTqkoxCq+wMA0+XjubMQTqb6MPGO/0
	vLAT/NPBOwkzgVbZLSES8vs631fwvbikwuF/LCVrQ4zTRM+0+5LKlrnWBQ84cNg2nXu4
	grEbNeXVQRKHOBS3YBlLFPwuhX2tQ1YH99v6SlqeVIrChclnY+VdyR1DOr9bUtEB0O4E
	fTLg==
X-Received: by 10.68.178.130 with SMTP id cy2mr16413402pbc.106.1368657327517; 
	Wed, 15 May 2013 15:35:27 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id gi2sm4237207pbb.2.2013.05.15.15.35.26
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 May 2013 15:35:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHUNapTU2he7VM+CrEYv5cwoWdB82nVgLowy8d+_zMCzChNZLw@mail.gmail.com>
Date: Wed, 15 May 2013 15:35:25 -0700
Message-Id: <913F9482-BBBF-4400-8745-3983254A997A@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
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
	<CAHUNapTw8-B5AEk2YN3t+vRkjwVOS65Ehs6HV5RkbipYUWpS3A@mail.gmail.com>
	<CADkTA4P+CaEJFfkWSzGrcYMgs7Kxa9iNkgNbQou0xhf53oP6Uw@mail.gmail.com>
	<CAHUNapSuTwy0sSDCXAmk6PEqVkqJzGsrLyPJL9VQCaN5gMbOOA@mail.gmail.com>
	<CADkTA4MpRM5Vw8iDL6gw9jMZ93Bu3Y6mGwy5JVx69pkkP2F06w@mail.gmail.com>
	<alpine.DEB.2.02.1305151757110.12800@oneiric>
	<CAHUNapTU2he7VM+CrEYv5cwoWdB82nVgLowy8d+_zMCzChNZLw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 15 May 2013 22:53:55 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On May 15, 2013, at 3:33 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> Does this mean we now have something that can work on the EdgeRouter =
Lite?

well you have to have a kernel for that platform. If you have working =
kernel everything else will ditto work



