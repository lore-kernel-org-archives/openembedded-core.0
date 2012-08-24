Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T51Uo-000726-0U
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 23:32:50 +0200
Received: by pbcwy7 with SMTP id wy7so4266168pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 14:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=QL9vy1nbENj+YOtKH+Y3SbBTX/dSmPJ6Aw8/Ga3qMG8=;
	b=GEil4U0zuIrXskDknj38C6EVq4XAbbzw9Fa15h3qz3fpdKFv0oXnbqbass5rEKDLI9
	eNPWROnYn9omn/qwMybvoHpEOCWXRXsunjAkvd7TsO3f9tNCoSKE7II7Zx8WUsl0Kfxa
	UntqlVA3QP9ch00RBsFzI4dfP6EQCksiwGhXbDWeKcnT8fDjKuw4+HMAxmf8NGajZgGd
	5Pqn+ZkCvcbscP5EFa/X/DaHxqkw+mEgZtz1V5H0R0lfTkoYiqC3BJRKJAuVW/LFyrwx
	clERU8/s/2S+NGL59XS0pCIO/yG4AOODE0zsUAVUdjW9RA0HJ2Yc8WUGyHpklTPP8kXV
	/qdg==
Received: by 10.68.224.70 with SMTP id ra6mr15948489pbc.11.1345843241169;
	Fri, 24 Aug 2012 14:20:41 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id ox5sm9015638pbc.75.2012.08.24.14.20.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 14:20:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1sou8jjkoktbC4J1O+b-KbxZ43MyF3aPq68S74p8wC_qwQ@mail.gmail.com>
Date: Sat, 25 Aug 2012 01:20:33 +0400
Message-Id: <C309CEF1-33E5-4DD0-BA0E-8414EB53802C@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
	<8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
	<48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
	<CAMKF1sou8jjkoktbC4J1O+b-KbxZ43MyF3aPq68S74p8wC_qwQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1278)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
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
X-List-Received-Date: Fri, 24 Aug 2012 21:32:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 25, 2012, at 1:10 AM, Khem Raj wrote:

> On Fri, Aug 24, 2012 at 2:08 PM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:
>>=20
>> I'm adapting my earlier gcc-4.5 recipes, to try and get them to build =
with
>> the latest poky master.
>>=20
>> I'm using eglibc-2.13, so it is possible for this version to drop the
>> gcc-cross-intermediate stage, or is it only with newer eglibc =
versions?
>>=20
>=20
> well it wont work with anything older than eglibc 2.16

What should I do to get the gcc-4.5 recipes to continue to build, with =
eglib-2.13,=20
against the poky master branch? Should I retain the gcc-intermediate =
recipes?

Best regards,

Elvis=


