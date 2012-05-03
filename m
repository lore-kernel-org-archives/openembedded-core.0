Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPwlb-0005Cv-Qp
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 16:12:23 +0200
Received: by wibhm17 with SMTP id hm17so348275wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 07:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=0cIsVz/6qOLV6wjMJOcO0+X3jXDifgLx4XHqcWrnS+A=;
	b=daPTH+UR/2xUbY3qy/8EG0KVlxL6HITgoLtnJNCDmPd3hlawCY4ZLAaFSeyAqPfehD
	9nbt1d0jZKKfO1F4MBVNAbtIQE2Hsu+dgbX4j/P4Yvkaup/YCCpMPDTA1zGoufPy1nhg
	6NUNZX0703BWut50ZiH7iJxvDdr6m84cOLT1b3qsGludMwjVhWDMHSnlcPVmoM0JpIO9
	kV6FVDIBnoheDq7IkqFdvzEYdedDYZEHyu8vnr995FQ4I93ksjelKpoP50vQPtrlIhlP
	Y29ce9SlXWWgnmmNHkRNOuwsqnD0E4MN426zDpLgcIsSRBJj+xAFtXS8aKKBPY719TEI
	UjqQ==
Received: by 10.216.194.102 with SMTP id l80mr1595783wen.1.1336053756759;
	Thu, 03 May 2012 07:02:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ea6sm54202wib.5.2012.05.03.07.02.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 07:02:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336052928-30764-1-git-send-email-wd@denx.de>
Date: Thu, 3 May 2012 16:02:32 +0200
Message-Id: <D777AF9B-4859-43C3-946D-EF5172E0806B@dominion.thruhere.net>
References: <1335693807-17609-1-git-send-email-wd@denx.de>
	<1336052928-30764-1-git-send-email-wd@denx.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlM2SKo26oFfCVGnA0WA1mzDEG7c38l9bVJQG4HMbxteuTW8bPrZDyDRD73G53+F94z9uIp
Subject: Re: [PATCH] Add KERNEL_EXTRA_ARGS parameter
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
X-List-Received-Date: Thu, 03 May 2012 14:12:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 15:48 heeft Wolfgang Denk het volgende geschreven:

> With recent kernel versions, some ARM configurations need may fail to
> build with errors like this:
>=20
> 	multiple load addresses: 0x80008000 0x80008000
> 	This is incompatible with uImages
> 	Specify LOADADDR on the commandline to build an uImage
>=20
> We cannot pass this information in EXTRA_OEMAKE, as
> "meta/classes/kernel.bbclass" explicitly ignores all EXTRA_OEMAKE
> settings.  So add KERNEL_EXTRA_ARGS parameter so affected boards
> can add for example
>=20
> 	KERNEL_EXTRA_ARGS =3D "LOADADDR=3D0x80008000"

Isn't KERNEL_EXTRA_OEMAKE clearer in this case? I see kernel args being =
what ends up in /proc/cmdline.=


