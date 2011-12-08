Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RYhNA-0001ez-4B
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 18:03:04 +0100
Received: by qcqw6 with SMTP id w6so1434465qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 08:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=i3og1UaYzJVzkFupLBc6GkadOYJD9nXCua+vh9xmses=;
	b=pB8DG5t0oJurtycpZIG3rJCJ2fgJ2EtVPU9PJkrhs0Ghtk1h3Akwgj+u2Ghx5I5huO
	ZNl3GDdgRqJ/bJqhWnvCxX41lnbaQIwzARIj+2qmp0YO9838bcnkJFyU8tM4klQ37vCL
	Cl/HHE1JD9ibjBcMpCNybOd9GaGtLEruhjR5E=
Received: by 10.229.231.12 with SMTP id jo12mr842078qcb.258.1323363373472;
	Thu, 08 Dec 2011 08:56:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.73.200 with HTTP; Thu, 8 Dec 2011 08:55:52 -0800 (PST)
In-Reply-To: <4EE0EA8B.6010103@linux.intel.com>
References: <1323123226-24719-1-git-send-email-kergoth@gmail.com>
	<4EE0EA8B.6010103@linux.intel.com>
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 8 Dec 2011 09:55:52 -0700
Message-ID: <CABcZANnO4_t7HxV5BuTNSjjaK=QOGCh2iKxYSkES33Qw7-eHzA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lzop-1.03: add recipe
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
X-List-Received-Date: Thu, 08 Dec 2011 17:03:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2011 at 9:49 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 12/05/2011 02:13 PM, Christopher Larson wrote:
>>
>> From: Christopher Larson<chris_larson@mentor.com>
>>
>> This is needed by some kernels when CONFIG_KERNEL_LZO=3Dy (specifically,
>> given
>> the current defconfig, this affects linux-omap4 2.6 in the meta-ti layer=
).
>>
>> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
>> ---
>> =C2=A0meta/recipes-support/lzop/lzop/acinclude.m4 | =C2=A0390
>> +++++++++++++++++++++++++++
>> =C2=A0meta/recipes-support/lzop/lzop_1.03.bb =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 25 ++
>> =C2=A02 files changed, 415 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-support/lzop/lzop/acinclude.m4
>> =C2=A0create mode 100644 meta/recipes-support/lzop/lzop_1.03.bb
>>
>
> <SNIP>
>
>
>> diff --git a/meta/recipes-support/lzop/lzop_1.03.bb
>> b/meta/recipes-support/lzop/lzop_1.03.bb
>> new file mode 100644
>> index 0000000..d0cb842
>> --- /dev/null
>> +++ b/meta/recipes-support/lzop/lzop_1.03.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY =3D "Real-time file compressor"
>> +DESCRIPTION =3D "lzop is a compression utility which is designed to be =
a
>> companion to gzip. \n\
>> +It is based on the LZO data compression library and its main advantages
>> over \n\
>> +gzip are much higher compression and decompression speed at the cost of
>> some \n\
>> +compression ratio. The lzop compression utility was designed with the
>> goals \n\
>> +of reliability, speed, portability and with reasonable drop-in
>> compatibility \n\
>> +to gzip."
>> +DEPENDS +=3D "lzo"
>> +PR =3D "r0"
>> +
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddfeaf3dc4beef4f5a7bdbc35b197=
f39e \
>> +
>> =C2=A0file://src/lzop.c;beginline=3D5;endline=3D21;md5=3D6797bd3ed0a1a49=
327b7ebf9366ebd86"
>> +
>> +SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz \
>
> I think this ------------------------------- ^^
> should really be ${BPN}-${PV} which make is much easier to do updates wit=
h
> by just changing the file name.

I think you're confused. BP *is* ${BPN}-${PV}. What exactly is the
problem with using it?


>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://acinclude.m4"
>> +
>
> NO SRC_URI Checksums!

Gah, damnit.
--=20
Christopher Larson
clarson at kergoth dot com
Senior Software Engineer, Mentor Graphics


