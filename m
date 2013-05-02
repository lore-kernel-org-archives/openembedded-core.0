Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UXmx4-0002Va-9d
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 08:25:27 +0200
Received: by mail-ea0-f182.google.com with SMTP id z16so89840ead.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 23:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=P/eByO2+psRcxQzryWT4L0GlwAyyD1pSS2s1KXJU+Ow=;
	b=UJgh5Qk2vbkIujL2PJwdAmn89OvJgN48GIU9i3HJwXOCNgygmSOEjdACx53lTGvV9R
	Yl8TuF+zvYODDfpDw5zyuyJLsmVjalkkgOecxakRfj4ZnHe7FU1piCT5IOigWcFvJ1qi
	6StwoGZT9g6BWjZ5lkqH7F6Bb/C/YRNeo8tfCTDDuYZBD1TIOmaMKSNm8kgPe6JA3PqB
	ZWbtP3xJ7dVJEJKv4iWpbVqplhhH+QEsEXcDjVfHqbPayJ5q9nD/Q2sLa1dK7oE4zpq+
	E+qhjgtf8pdGVj9Kv+9Nr2MO/R135dMbXIDSvYHufDTeie6S2OjdY3eGuoULzFlOPJub
	dkxQ==
X-Received: by 10.15.36.2 with SMTP id h2mr16008515eev.2.1367474837287;
	Wed, 01 May 2013 23:07:17 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6401:2390:53c2:ab85?
	([2001:610:612:0:6401:2390:53c2:ab85])
	by mx.google.com with ESMTPSA id f9sm7426552eeu.11.2013.05.01.23.07.14
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 23:07:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <51817D7A.20708@linux.intel.com>
Date: Thu, 2 May 2013 08:07:14 +0200
Message-Id: <0FC57016-C3CE-4E5F-BF3B-BA3DDBAC334A@dominion.thruhere.net>
References: <1366297820-5000-1-git-send-email-koen@dominion.thruhere.net>
	<51817D7A.20708@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQn7tpa1p+GvH+gOtXiRtMKcZSqgLLxpuMrLQ7g8h+BRlJbKIFIOg8zMFrm2PnCkQfuoyq0A
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] grub-efi-native: fix build on modern distributions without gets()
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
X-List-Received-Date: Thu, 02 May 2013 06:25:28 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 1 mei 2013, om 22:39 heeft Darren Hart <dvhart@linux.intel.com> het =
volgende geschreven:

>> # Native packages do not normally rebuild when the target changes.
>> # Ensure this is built once per HOST-TARGET pair.
>> @@ -28,6 +28,7 @@ SRC_URI =3D =
"ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>>            file://grub-2.00-disable-help2man.patch \
>>            file://check-if-liblzma-is-disabled.patch \
>> 	   file://grub-no-unused-result.patch \
>> +	   file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
>            "
>=20
> Please be consistent with whitespace above. I prefer TABs be used
> exclusively for indentation with spaces used for alignment. The above =
is
> purely alignment. However, others prefer TABs for as much of either as
> possible. Either is fine, but it must be consistent throughout the =
file.
> In this case, please use spaces.

I only use tabs in shell methods for oe-core, I just copied the =
indentation of the line above, which mixes tabs and spaces.

regards,

Koen=


