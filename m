Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpZnc-0004Ac-1O
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 08:57:09 +0200
Received: by wibhm11 with SMTP id hm11so241909wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 23:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=N8fwgkWPZf5+uOiml8xqDB5XHoEj1KyPHVFFd9fMW54=;
	b=SYC5R2bV9cOC9ru/wV5Tf3z38PQOQIYqDbFptElkWfRv4HauF1kj3uPqhXnsRt4S8w
	rXquQ2vafbIVzL1+LYoETyuZx3ptszRxqC/fWwJHfvd7gG/5JOBeM2MixdYCW35TIrBp
	MKtN+bliRoffJR1H4grC6SLO8znFDxgWlH2xv7MjcCwogyHONKDwCJcq9F5D1kn3ajjr
	DiP3gJY4k63d4cx/sYIStTKfI0W4gchB7SG5dz4/121iTDyzZCuNc4hFpILQnrfwRWEc
	NUxyGok46izn9gHLmH8NL3IJveadIwaBMo9bVLZgcqXqLs48YsBCbeY5imAF7wlB2pLf
	/Pzw==
Received: by 10.216.101.1 with SMTP id a1mr616321weg.216.1342161908803;
	Thu, 12 Jul 2012 23:45:08 -0700 (PDT)
Received: from [192.168.2.8] ([188.207.89.201])
	by mx.google.com with ESMTPS id b7sm2791756wiz.9.2012.07.12.23.45.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 23:45:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FFF23E2.5040007@linux.intel.com>
Date: Fri, 13 Jul 2012 08:45:12 +0200
Message-Id: <54ABEC81-9673-446D-AD9A-79394DEEA6E8@dominion.thruhere.net>
References: <cover.1342116650.git.andrei@gherzan.ro>
	<8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
	<4FFF23E2.5040007@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkPkgT/o1aPdHMggrI1ugpeXWxyNtSj9bciGb0zhPs7HAg2swbhLB8AJhjUumTDV5VRvx6g
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Fix xz compression command and optimize compression time
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
X-List-Received-Date: Fri, 13 Jul 2012 06:57:41 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 12 jul. 2012, om 21:22 heeft Saul Wold het volgende geschreven:

> On 07/12/2012 11:58 AM, Koen Kooi wrote:
>> Any volunteers to test this on a system with >4 real cores?
>>=20
>=20
> Koen,
>=20
> Does OE-Core or Poky have an image setup for using .xz by default?

No, and as you can see from Andrei's patches, it would have never worked =
:)

regards,

Koen

>=20
> I will run it on a machine I have, just want to make sure I am doing =
the same tests that Andrei is running.
>=20
> I was about to ask what msm asked about the Memory info.
>=20
>=20
> Sau!
>=20
>> Op 12 jul. 2012, om 20:13 heeft Andrei Gherzan het volgende =
geschreven:
>>=20
>>> Koen suggested to add -T to xz commands. We have this option =
implemented in our current version .1alpha.
>>>=20
>>> -T threads, --threads=3Dthreads
>>>              Specify the number of worker threads to use.  Setting =
threads to
>>>              a special value 0 makes xz use as many threads as there =
are  CPU
>>>              cores  on  the system.  The actual number of threads =
can be less
>>>              than threads if the input file is not big enough  for  =
threading
>>>              with  the  given  settings or if using more threads =
would exceed
>>>              the memory usage limit.
>>>=20
>>> -------------------
>>>=20
>>> Memory: 7.8 GiB
>>> Processor:: Intel=AE Core=99 i5-2540M CPU @ 2.60GHz =D7 4
>>>=20
>>> File to compress: 1.9G
>>>=20
>>> xz -f -k -e -9 --check=3Dcrc32 (current configuration)
>>> Memory: 673Mb
>>> real    6m37.170s
>>> user    6m35.389s
>>> sys     0m0.884s
>>> Compressed file size: 3.4Mb
>>>=20
>>> xz -f -k -e -9 -T 4 --check=3Dcrc32
>>> Memory: Cannot allocate memory
>>>=20
>>> xz -f -k -e -8 -T 4 --check=3Dcrc32
>>> Memory: 1.8G
>>> real    3m24.462s
>>> user    12m8.502s
>>> sys     0m2.180s
>>> Compressed file size: 3.4Mb
>>>=20
>>> xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)
>>> Memory: 471Mb
>>> real    1m9.265s
>>> user    4m8.972s
>>> sys     0m0.944s
>>> Compressed file size: 3.4Mb
>>>=20
>>> So my conclusion would be to use the default -e -6 with -T 0.
>>>=20
>>> The following changes since commit =
90ad663909c0c8a405b22a510c9f957007d02669:
>>>=20
>>>  upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
>>>=20
>>> are available in the git repository at:
>>>=20
>>>  git://git.yoctoproject.org/poky-contrib ag/xz
>>>  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dag/xz
>>>=20
>>> Andrei Gherzan (3):
>>>  image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed
>>>    data to file
>>>  image_types.bbclass: Add XZ variable to set number of threads to be
>>>    used while compressing
>>>  image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6
>>>=20
>>> meta/classes/image_types.bbclass |    5 +++--
>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>=20
>>> --
>>> 1.7.9.5
>>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>=20
>>=20
>=20



