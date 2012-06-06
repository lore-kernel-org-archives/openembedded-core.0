Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScBHj-0003sF-Nq
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 10:08:07 +0200
Received: by eaal1 with SMTP id l1so1775415eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2012 00:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=kGC7yx3nuJiO60sm2rtMBCxj2aXu9QmTXDgcyDBVJak=;
	b=PeERV7lEH7jeXFRNIB0jLi0no4ndZ27AAaE08aHalt4DWcccg4bkMkYNwI8TP92mbu
	7lFPYadKTaDth4bAM6XstBWSSSHsAA6h5jTTQAXt5JjGS+n/MYqibBPpvCNcHVQ14GVy
	DIBGbVKcmsyNcOaVENwBrjCDwQjpYpTU573qvhDwZ+fZQXHZNWqzinoX/GdSm5VwbeIm
	5F70BTwQTozY1vqHSZPeDTjFtoEjbOyyOAdwKmmxGumNQuTdgcac3wyzNAHR3tQT1QKS
	S3+mH5CFhliwHBMXk2jPnDGGEJg/S2QQ0Q6VFYkOjc2Sl225QJuxiGMfOb1kuTduGj2P
	sFmQ==
Received: by 10.14.127.136 with SMTP id d8mr9149512eei.159.1338969460728;
	Wed, 06 Jun 2012 00:57:40 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y3sm3338674eem.16.2012.06.06.00.57.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 00:57:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FCF09D9.4030109@linux.intel.com>
Date: Wed, 6 Jun 2012 09:57:35 +0200
Message-Id: <6C766040-06EA-449C-A006-E3990B8A5A6D@dominion.thruhere.net>
References: <4FCF09D9.4030109@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlN+sogTr4nO8xVkdo0Sm2TTPMFJKYHftR43EdBAdztvh0eqkRmqcmitmoO1i+J2kwhlev7
Subject: Re: curl-native history questions
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
X-List-Received-Date: Wed, 06 Jun 2012 08:08:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 jun. 2012, om 09:42 heeft Saul Wold het volgende geschreven:

>=20
> Folks,
>=20
> I am looking into a bug someone files about not being able to access =
https git repos, and I looked into it and found that curl has the ssl =
bits disabled. We do use openssl-native in other dependencies of git.
>=20
> The question: Is there a reason not to enable ssl for curl?

I'm not sure, but I'd really like https support in the target version of =
git.

regards,

Koen=


