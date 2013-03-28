Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ULFd8-0005EP-Og
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 17:25:07 +0100
Received: by mail-pb0-f42.google.com with SMTP id xb4so5867300pbc.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=B3BTFAeVaRgypmu5DZ/JH1L/Lo3jAMqdB9jsJPc0XCY=;
	b=Qoh7NqGwshi0CbZAYlg1Y0KLdnFgxLKSOgLC8SnYn8ysfu1IGXWw5iDON2r+5oJQ92
	6kRW4pfE8Id+4vi/Pf2oC+i6MDRvoP5FIEXEsneTi9mxv0yFNRB2hXJNaZIIwMEcHc7h
	uMvUWuuRxegIK690R8+5M5d98/GwXTLk2IUXasl98enoxGeZh1CltX87AL0r8FOFWXgj
	Zdkv27MGxesCbZpMCtYfIiZT013wCuOAXDpHdBiB9P74Oyrig4/L1iZmvksCv3WKimP1
	AGFlawQOiicbUULsJ0Ru/hcoxl3tGRwC3/2O4Mf2w8QRl4y2as9W2buqPzoOxjvtM9UP
	3wfQ==
X-Received: by 10.68.252.193 with SMTP id zu1mr36055095pbc.175.1364486863379; 
	Thu, 28 Mar 2013 09:07:43 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id vd4sm26016917pbc.35.2013.03.28.09.07.42
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 09:07:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <515465CE.6080803@linaro.org>
Date: Thu, 28 Mar 2013 09:07:42 -0700
Message-Id: <658D26C6-1631-456F-BD30-320466130D6C@gmail.com>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
	<51540716.40400@linaro.org> <515465CE.6080803@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Thu, 28 Mar 2013 16:25:19 -0000
X-List-Received-Date: Thu, 28 Mar 2013 16:25:19 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Mar 28, 2013, at 8:46 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> W dniu 28.03.2013 10:02, Marcin Juszkiewicz pisze:
>> W dniu 28.03.2013 06:51, Khem Raj pisze:
>>> I have added gcc 4.8 recipes and the branch is here=20
>>>=20
>>> git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8
>>=20
>> =DCbercool! Will do tests with aarch64.
>=20
> After some hacking (see attachment) I got it built and booted
> core-image-minimal.


Nice

>=20
> Problem was with paths - lib contra lib64. Will look at it more next =
week.
>=20
> <aarch64.diff>


Well I guess aarch64 is kind of_special_ here. look into multilib we =
have done
for other architectures. e.g. for x86_64 if you inherit multilib class =
it uses 'lib64'
otherwise it uses 'lib' thats for historic reasons but for arm you could =
always use lib64
why its not so ?

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



