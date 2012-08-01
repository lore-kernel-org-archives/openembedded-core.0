Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SweT1-00041k-T4
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 21:20:23 +0200
Received: by lbol5 with SMTP id l5so483685lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 12:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=UpNFB6uY3dcUgNFdmJpMJ6frN8TbovPuGKsgBxwlNlU=;
	b=K8T9Vjjpzx8sdmv3b3gm1rg3WNJ0NpBwv9TDll7VBa84tPlnYAXk327FI6L56ZCbcO
	cqS3VA1nmDWufWdVNvPv3p2zB+6fsxIv+OtSmpFUDyCv5V3gGF5g2G9NNVGQ10EZXDKZ
	ZrPaAyQ4fRXdoHhT1SwS1ACPAKAqASnXrp4GO55fEVLbXhagKUxtre9a1H2SX6mRJH+4
	SgbyGPROkRfwz9BvY9yyKQ0Hlr5UURsCUTQu4Z9uajKW/E7uVuo0Nv/MyiQshKuus3Eh
	F/NH/liJv7vIatlpizWlbnLB1b6jRswPvb9FAuSGTDr0PSWfESoWm64ynugUxo2yU9ZK
	EpKQ==
Received: by 10.112.30.41 with SMTP id p9mr8765030lbh.26.1343848125256; Wed,
	01 Aug 2012 12:08:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Wed, 1 Aug 2012 12:08:25 -0700 (PDT)
In-Reply-To: <CALbNGRTYa-2M-pi0d+oBvT+z81kTi8j9VM4gK=iiUDfBSQ7N9A@mail.gmail.com>
References: <CALbNGRTYa-2M-pi0d+oBvT+z81kTi8j9VM4gK=iiUDfBSQ7N9A@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Aug 2012 12:08:25 -0700
X-Google-Sender-Auth: gfCvdyWBn8uX6uGBsin_5jwOufA
Message-ID: <CABcZANk2SzKKcXTdU0MLUeXwOWSxq4HqJceMPO6tOLP3M_GejA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: number of tasks increased since last update
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
X-List-Received-Date: Wed, 01 Aug 2012 19:20:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 1, 2012 at 8:29 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> today I updated and found the the number of tasks has increased about
> 400. Another strange behaviour: in my build dir there are two new
> folders:
>
> x86_64-nativesdk-angstromsdk-linux
> x86_64-angstromsdk-linux
>
> but up to now I was not interested in sdk stuff. Is that another bug
> or a feature?

I just went to build core-image-base and saw it building crosssdk
stuff -- not sure if it's related, but thought I'd throw that
datapoint out there.
--=20
Christopher Larson


