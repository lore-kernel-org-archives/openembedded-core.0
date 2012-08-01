Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Swebu-0004AK-E5
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 21:29:34 +0200
Received: by ghbz2 with SMTP id z2so6930399ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 12:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=w0hUzkIICeDJxeLYX18JwphW+2b6BjZSc2VBMTwcsGQ=;
	b=GDImzlWre09U3RAgS5B7759f9TPMKZptiiUdtgaz59bOUPwZAzPo4GvlYNZHg+I7cN
	MeTzqwlrilzmtvS5DIqaCAry/Rl5i3+sZvGdDcUL2ZawPVTkpDFCT5Nt44JeWhbnD65c
	r7s/xSblpfcVj2LP3oHAGYoow3wiqw+Iwh5rpWP2bwnP4AfcKqCuTIlP67kX96w182C/
	cVfCgLvi1OKaeVjCJQIxDFyF4nz0o1PoK5SBJJL0p7xdPYny3VJDGVsZolCHxcz9nVkp
	tq5jgsa76fTYWk/eY0vKPD2NIErc6rKDS9p7dNuurfmHl12kw8B0SAviDPLPp+c7bMZm
	AJ7Q==
Received: by 10.66.76.170 with SMTP id l10mr41927722paw.57.1343848674934;
	Wed, 01 Aug 2012 12:17:54 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id nk3sm3124467pbc.27.2012.08.01.12.17.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 12:17:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CABcZANk2SzKKcXTdU0MLUeXwOWSxq4HqJceMPO6tOLP3M_GejA@mail.gmail.com>
Date: Wed, 1 Aug 2012 23:17:49 +0400
Message-Id: <86FD2FFF-48E0-4E44-A761-CF9611769EC0@gmail.com>
References: <CALbNGRTYa-2M-pi0d+oBvT+z81kTi8j9VM4gK=iiUDfBSQ7N9A@mail.gmail.com>
	<CABcZANk2SzKKcXTdU0MLUeXwOWSxq4HqJceMPO6tOLP3M_GejA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
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
X-List-Received-Date: Wed, 01 Aug 2012 19:29:34 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On Aug 1, 2012, at 11:08 PM, Chris Larson wrote:

> On Wed, Aug 1, 2012 at 8:29 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> today I updated and found the the number of tasks has increased about
>> 400. Another strange behaviour: in my build dir there are two new
>> folders:
>>=20
>> x86_64-nativesdk-angstromsdk-linux
>> x86_64-angstromsdk-linux
>>=20
>> but up to now I was not interested in sdk stuff. Is that another bug
>> or a feature?

I too found some new extra directories in my sysroots folder and work =
folders

sysroots
	virtex5
	virtex5-tcbootstrap
	x86_64-linux
	x86_64-nativesdk-pokysdk-linux
	x86_64-nativesdk-poky-linux-tcbootstrap

work
	all-poky-linux
	ppc440-poky-linux
	virtex5-poky-linux
	x86_64-linux
	x86_64-nativesdk-pokysdk-linux
	x86_64-pokysdk-linux

Elvis Dowson=


