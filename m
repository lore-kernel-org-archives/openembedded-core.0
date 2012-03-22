Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAjSW-0002Wn-Ir
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 15:57:48 +0100
Received: by wera1 with SMTP id a1so1887364wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 07:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=F3uCXVgigWdsybIbLI7fj0x2/DthmGfw77Q1M8A6zxA=;
	b=Pb3k3ACzyVU4dCfO9Gq3POyxWGy3TiNoPnK6bpi6qu8kFfEKr8u/7R/I0ICTiizGFV
	V91h/LAVljq3VDXt6P52j3SBq2DCC3keR3t0Zw84JrghIbNVANZUq5tnda6uIbYN9VzR
	Te3EgCZrMTXKVMjo5liTe56DtVUbM9mdopms34Ia9FqHJ9h4kF+U4fzww/Qg55aq2xat
	KhD157qa1ds/RzPve8NdaRVTJi9b9njexURb5aGjgZjRJo4VHYJMY5D2paLzLuSmD3Dc
	75z+hztCqHEReNrs8hg7xIO+pv07odhQS2Kwv48iUxMYB/S/BBaCNyQu29StSh591cPG
	beJQ==
Received: by 10.180.102.101 with SMTP id fn5mr239277wib.6.1332427733830;
	Thu, 22 Mar 2012 07:48:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 17sm6135330wis.0.2012.03.22.07.48.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 07:48:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1376344.pbiv3OAoml@helios>
Date: Thu, 22 Mar 2012 15:48:51 +0100
Message-Id: <033E03AA-E5A4-4CC5-A9CC-CC918D58B249@dominion.thruhere.net>
References: <1332414627-6512-1-git-send-email-schnitzeltony@googlemail.com>
	<1332414627-6512-2-git-send-email-schnitzeltony@googlemail.com>
	<1376344.pbiv3OAoml@helios>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmBIW8aSLMoqZKRQ1xpAObwvWGe58cntrPB0wAbZx3qBPYvKHlrb7eXQtYMROMKDixpmmek
Subject: Re: [PATCH] busybox: enable eject
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
X-List-Received-Date: Thu, 22 Mar 2012 14:57:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 22 mrt. 2012, om 15:41 heeft Paul Eggleton het volgende geschreven:

> On Thursday 22 March 2012 12:10:27 Andreas M=FCller wrote:
>> In xfce-environment ejecting USB-memory stick caused:
>> Error starting job: Failed to execute child process "eject" (No such =
file or
>> directory)
>=20
> Not to say we shouldn't merge this, but I'm concerned if this =
continues we=20
> could end up with busybox in the default configuration creeping up in =
size as=20
> more and more features get enabled.
>=20
> Where do we draw the line?

FWIW, the standalone 'eject' is in meta-oe, so xfce could RDEPEND on =
that. I don't have a strong opinion on the busybox patch.=20

regards,

Koen=


