Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 577996BC92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:35:02 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e49so357012eek.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=bam5JzOUbAgNRLtfCecVOi/Mnkuc8DFjm/I1mX4b58k=;
	b=Zw+ELTn1L+Mzk7wZNVV34Zllp6nUe70ZXbUryRJfdWiz07BIwec7pAWXfru8Hb1RB+
	a1qWnxe76ItltEVMRC39rLIiujohNK7URhlsvTUc3q5cPynzIf/+AcWX9yy/VPvtf77h
	//+I/V4bsBaQfnJkzbL5hMOTj7PPOZbSW73jVtaURCufM7ONgUFL4aewk197wzCCch0v
	kHvG97TEDmCld44yGGKM2L1Tr6tKvQ+8nNLuRCSaBj+ftgw4nslXaBCY6BqJPyPOToV6
	o/h/+reA8hs2cAtF0w0GcbBXrjuEDz3UmyWddCTqCkFJmd+xt+LdhlB2F17E3jXqWnzM
	55uA==
X-Gm-Message-State: ALoCoQnF5lJ0mlMk8+qHHlp47OdpMDDOGEevJMkm++0Z9uvcJ+GZXgzi/26pdppzyF1uQVlr658M
X-Received: by 10.15.50.129 with SMTP id l1mr107439eew.114.1390476902415;
	Thu, 23 Jan 2014 03:35:02 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id v1sm38587230eef.9.2014.01.23.03.35.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Jan 2014 03:35:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKoU+va9SbCJAfZ4HMkz+==Ec9va0KjJX07c4d4cZ90bjg@mail.gmail.com>
Date: Thu, 23 Jan 2014 12:35:13 +0100
Message-Id: <17C27E68-3F62-414D-A02A-8AD06ACE0B66@dominion.thruhere.net>
References: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoU+va9SbCJAfZ4HMkz+==Ec9va0KjJX07c4d4cZ90bjg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1827)
Cc: Koen Kooi <koen.kooi@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: actually install things
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2014 11:35:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 jan. 2014, om 12:31 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:

> On Thu, Jan 23, 2014 at 7:06 AM, Koen Kooi <koen.kooi@linaro.org> =
wrote:
>> This failure was masked by having lz4 installed on the host system :(
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>=20
> Couldn't it inherit autotools?

It's a handcrafted Makefile, not autotools :(

regards,

Koen=

