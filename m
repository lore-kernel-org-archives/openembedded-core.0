Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1RYjNi-0005I1-Ri
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 20:11:46 +0100
Received: by lahd3 with SMTP id d3so820451lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 11:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=s+TXpw6xyL5/LTMna7m62RAkHjQfw2m0AwNyGg4uSrs=;
	b=pxSGGnVmsshfBXaFXMjNCXydrR9rPHacwB71RTTIYOddosWoxqd/8NTPCUNAHNz5b/
	CzpSH1eDiob2xoBm0sFpBoD6AIcUe4YFR33jXhe0abyu8bq1xCoSxDwuKf7ITg7zIjog
	KexcthR3kM0mJMzIc+emLugBSyRofBxXyB/fY=
Received: by 10.152.135.195 with SMTP id pu3mr2809293lab.17.1323371096789;
	Thu, 08 Dec 2011 11:04:56 -0800 (PST)
Received: from [192.168.1.3] (145.79-161-31.customer.lyse.net. [79.161.31.145])
	by mx.google.com with ESMTPS id pu10sm1661023lab.10.2011.12.08.11.04.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 11:04:55 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
In-Reply-To: <CA+M6bXk22TQ8jowRyjTyyJzRhUbE7fhvcf1YH_AS9EYn=sX+WA@mail.gmail.com>
Date: Thu, 8 Dec 2011 20:04:54 +0100
Message-Id: <79A60C08-1C6C-48A6-8CAF-F40C6562B755@gmail.com>
References: <4EDF12D3.4060306@gmail.com>
	<CA+M6bXk22TQ8jowRyjTyyJzRhUbE7fhvcf1YH_AS9EYn=sX+WA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: GCC fails when SDK is not extracted to /usr/local
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
X-List-Received-Date: Thu, 08 Dec 2011 19:11:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Dec 8, 2011, at 3:56 PM, Tom Rini wrote:

> On Wed, Dec 7, 2011 at 12:16 AM, Tasslehoff Kjappfot
> <tasskjapp@gmail.com> wrote:
>> gcc fails when I extract my SDK to another place than /usr/local.
>>=20
>> Output when it fails:
>>=20
>> $ ./arm-angstrom-linux-gnueabi-gcc
>> bash: ./arm-angstrom-linux-gnueabi-gcc: No such file or directory
>>=20
>> Readelf output:
>>=20
>> $ readelf -d arm-angstrom-linux-gnueabi-gcc
>>=20
>> Dynamic section at offset 0x34394 contains 21 entries:
>>  Tag        Type                         Name/Value
>>  0x00000001 (NEEDED)                     Shared library: [libc.so.6]
>>  0x0000000f (RPATH)                      Library rpath:
>> =
[/usr/local/angstrom-eglibc-i686-armv7a/sysroots/i686-angstromsdk-linux/us=
r/lib/armv7a-angstrom-linux-gnueabi:/usr/local/angstrom-eglibc-i686-armv7a=
/sysroots/i686-angstromsdk-linux/lib]
>>=20
>> Is it the RPATH here that's making trouble for me?
>=20
> Not exactly.  And RPATH is needed to find some of the shared libraries
> that are needed.  I thought we had been running chrpath over these to
> make them relocatable, however.
>=20
> --=20
> Tom
>=20

Does this RPATH indicate that its not relocatable? Anything else I can =
check?

- Tasslehoff=


