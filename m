Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 051F065D56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 11:24:38 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so8328934wgh.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 04:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=7gbyjuvP/XmGwBkKZT8gmroNinZHJePmCQldtADEcK0=;
	b=J/os9SPo/8qqQyXwBN7XiJfnBJnsLXfSKCMbQvIIltsUaBb/hc4jY52R/iv9ptcDGT
	4zYW3GTP2k8aOo/mdMUW3zijCa+JJEwd/zu+4L4j6ZdpesThi80/BZNd+B1CT0zqxuHj
	taVV4QXXNplzimvb6bmjdAr6khZ9JoMKeVVfA6aHTQslJ8AbdHXyrQ5n7ItGaCjwnBP1
	/X2Ymw523W5nktaRzWIZBIeU8Uxt5bXvSzKtYMKPTiPG4ddQcy+CVzKOD4Ym1+TM1kpo
	UgZ2DhQapgcnQauuXS5bsPswWXaNB6yLIfq0XSj/xyyRJcS0z/YdQT3Onq/21k0YYk9g
	bvCw==
X-Gm-Message-State: ALoCoQnwOsTDbwGWashiuMvcBH0tiS8SKEPaOo01efOW1JtfwaJOU39lKbEbTbYPtHpTHBcDycjo
X-Received: by 10.194.2.132 with SMTP id 4mr45918797wju.49.1407756278691;
	Mon, 11 Aug 2014 04:24:38 -0700 (PDT)
Received: from ?IPv6:2001:610:612::3ccd:641d:5ce1:5263?
	([2001:610:612:0:3ccd:641d:5ce1:5263])
	by mx.google.com with ESMTPSA id w7sm42751408wiy.6.2014.08.11.04.24.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 04:24:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1407751488.22187.1.camel@ted>
Date: Mon, 11 Aug 2014 13:24:36 +0200
Message-Id: <150EBC86-4121-4873-955F-0B97D3D2D8A5@dominion.thruhere.net>
References: <1407575476-15945-1-git-send-email-koen@dominion.thruhere.net>
	<1407751488.22187.1.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][backport][PATCH] kernel: don't copy .so.dbg files into kernel source install
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
X-List-Received-Date: Mon, 11 Aug 2014 11:24:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 aug. 2014, om 12:04 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Sat, 2014-08-09 at 11:11 +0200, Koen Kooi wrote:
>> From: Bruce Ashfield <bruce.ashfield@windriver.com>
>>=20
>> In 3.16+ x86-64 kernel builds produce a vdso64.so.dbg file. If this =
file is
>> copied into the kernel source install multiple QA failures are =
triggered.
>> Specifically, this file triggers a debug package split that results =
in
>> files installed but not shipped, and invalid .debug file errors.
>>=20
>> By ensuring that .so files are not copied, we avoid this incorrect =
split
>> with no impact on future build phases.
>>=20
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>> meta/classes/kernel.bbclass | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Was this mean for daisy, not dora? It doesn't apply to dora but did =
for
> daisy...

Err, right 'daisy', not 'dora'. Sorry for the confusion.

regards,

Koen=

