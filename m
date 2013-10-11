Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id F17ED6CE84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 06:53:07 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so3747924pdi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 23:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=+zRr7lDn2fG4OqCqC0+XjQYZflQW0wI6KaY9XUEbLu8=;
	b=tjhMzftt/RtzrSpLqpt+ByXT3zSxkOUfnk+dqodqkmTr1rJ9bsN6F06AX8IUukJ0aT
	iSFczjAARkvzKSlMSFL/toJnSFWl1rpQFL8vxumkA61K5sZ7N7fqii/m0olJvrMYXz0K
	kQye4Se3+I9mpi50igae2EFhmGAMjQzHp+z+nHpUogbXpmuSrn0VwDVewUkc7pbHWMov
	T/temUFQuMW7h2oh9oofIO8RFPwuLIIPzijUvgv+pxtAgYU4hx7vZiXAG2JpY3yCcpLV
	u/xKPH5HFHpDeHFYvvg6PVN+Q0oEwXFe+B6XIDCXstMic7grPV/zmYdFDyFadEoMqec1
	GOig==
X-Received: by 10.66.121.234 with SMTP id ln10mr19629041pab.20.1381474389920; 
	Thu, 10 Oct 2013 23:53:09 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	7sm67751370paf.22.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 23:53:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <86430D8A-9905-4C7F-82C3-2FEEEF4C790A@dominion.thruhere.net>
Date: Thu, 10 Oct 2013 23:53:08 -0700
Message-Id: <F2DA74A1-4BC4-41A0-B1C3-BB6D787EF8AD@gmail.com>
References: <1381400211-28604-1-git-send-email-koen.kooi@linaro.org>
	<CABMQnVJZCxvFgJNgtMZ=gp2BiWLofpFyXCZ9H1-xQhLM=hsd6g@mail.gmail.com>
	<86430D8A-9905-4C7F-82C3-2FEEEF4C790A@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1510)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add aarch64_be target
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
X-List-Received-Date: Fri, 11 Oct 2013 06:53:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 10, 2013, at 11:48 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

>=20
> Op 11 okt. 2013, om 07:37 heeft Nobuhiro Iwamatsu =
<iwamatsu@nigauri.org> het volgende geschreven:
>=20
>> Hi,
>>=20
>> I have a question.
>> Why don't you unite  name rules of  other architecture?
>> Forexample, armeb is endian-big of arm.  mipsel is endian-little of =
mips.
>> If you can unified name, arm64eb is better, I think.
>=20
> In an ideal world I'd do that, but that ghastly 'aarch64_be' is =
already in upstream gcc, binutils and eglibc  :(
>=20

Now that you work with them. can you find out the reasoning behind it ?=

