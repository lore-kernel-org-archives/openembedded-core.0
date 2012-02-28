Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S2PbX-0005w9-P7
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 17:08:43 +0100
Received: by wibhq12 with SMTP id hq12so1050749wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 08:00:16 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.131.215 as permitted sender)
	client-ip=10.216.131.215; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.131.215 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.131.215])
	by 10.216.131.215 with SMTP id m65mr9911872wei.54.1330444816548
	(num_hops = 1); Tue, 28 Feb 2012 08:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=hI4aOsdfzOppRPDp2iuGZUmArCd+OI5Lb7XFRqFx0X0=;
	b=Vx189AF8QBHVVv2+8eZz/pacmv13VOADUm9JNworJksQAXhOcGK1tqtdVIh13aD2HG
	WDQGUKSTFLbZFMx20CwMJPUXAQc5YrWXMue3UUEs7W1Rq4fnD99YuBN1bHFxyUTuFMi1
	FvBIrxHGH3H9CqQMC9o1aOrut2zdKf8fYHjcU=
Received: by 10.216.131.215 with SMTP id m65mr7862084wei.54.1330444816454;
	Tue, 28 Feb 2012 08:00:16 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id by4sm23713864wib.3.2012.02.28.08.00.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 08:00:15 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1808929.8Oa6VYabAJ@helios>
Date: Tue, 28 Feb 2012 17:00:10 +0100
Message-Id: <F5E19F99-F1BC-4E5F-9163-C5C8A057871A@dominion.thruhere.net>
References: <1808929.8Oa6VYabAJ@helios>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmqd2g0oJv5jJu6nsfuCE3NWV/KW/H3E+66SR8N23CioDF9+5vdPTVrbbTjN2/kNBKHoEUR
Subject: Re: Including the kernel in the image
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
X-List-Received-Date: Tue, 28 Feb 2012 16:08:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 28 feb. 2012, om 16:48 heeft Paul Eggleton het volgende geschreven:

> Hi all,
>=20
> For some boot configurations (e.g. kexecboot) having the kernel binary =
in the=20
> image is required. In OE Classic, task-boot used to always include the =
kernel=20
> binary in the image (via RRECOMMENDS, so it could be uninstalled). We =
don't=20
> currently have this in OE-Core and I was wondering what the new =
preferred way=20
> to have this done would be.

As long as the solution doesn't end up with the FILES_kernel =3D "" crap =
we had in OE-classic.


> Obviously we could go and add it to various images or even to =
task-core-boot=20
> again but I'm not sure that's ideal. Wanting the kernel in the image =
is really=20
> machine-specific (or to be precise, boot method specific); so I'm =
wondering if=20
> adding it to MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS for all machines =
likely to=20
> need it is the right thing to do?

I think so, maybe that will get people motivated to make =
BAD_RECOMMENDATIONS work with all package formats :)

regards,

Koen=


