Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RrvZA-0003pI-1C
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 19:02:56 +0100
Received: by bkaq10 with SMTP id q10so3562353bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 09:55:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.146.14 with SMTP id f14mr33311bkv.132.1327942581804; Mon,
	30 Jan 2012 08:56:21 -0800 (PST)
Received: by 10.204.35.135 with HTTP; Mon, 30 Jan 2012 08:56:21 -0800 (PST)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <4F26C621.6080501@linux.intel.com>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
	<1327936840-13937-2-git-send-email-steve@sakoman.com>
	<4F26C621.6080501@linux.intel.com>
Date: Mon, 30 Jan 2012 08:56:21 -0800
Message-ID: <CAOSpxdYO3kNuYyrqUaO+nTiLAtrV0ZqW=fZc8Ftz85OuN=dU7w@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Saul Wold <sgw@linux.intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libassuan: add recipe for 2.0.3
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
X-List-Received-Date: Mon, 30 Jan 2012 18:02:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 8:32 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/30/2012 07:20 AM, Steve Sakoman wrote:
>>
>> Libassuan is the IPC library used by some GnuPG related software
>>
>> Signed-off-by: Steve Sakoman<steve@sakoman.com>
>> ---
>> =A0meta/recipes-extended/gnupg/libassuan_2.0.3.bb | =A0 11 +++++++++++
>> =A01 files changed, 11 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta/recipes-extended/gnupg/libassuan_2.0.3.bb
>>
>> diff --git a/meta/recipes-extended/gnupg/libassuan_2.0.3.bb
>> b/meta/recipes-extended/gnupg/libassuan_2.0.3.bb
>> new file mode 100644
>> index 0000000..ac34869
>> --- /dev/null
>> +++ b/meta/recipes-extended/gnupg/libassuan_2.0.3.bb
>> @@ -0,0 +1,11 @@
>> +DESCRIPTION =3D "Libassuan is the IPC library used by some GnuPG relate=
d
>> software"
>> +LICENSE =3D "GPLv3+& =A0LGPLv2.1+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be896=
7949 \
>> +
>> =A0file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
>> +
>> +inherit autotools binconfig
>> +
>> +SRC_URI =3D "ftp://ftp.gnupg.org/gcrypt/${PN}/${PN}-${PV}.tar.bz2"
>> +
>> +SRC_URI[md5sum] =3D "179d1918325fdb928c7bd90b8a514fc7"
>> +SRC_URI[sha256sum] =3D
>> "bad5682374c76bcc0abb1a7a34c9557af6874a477500748e64a7d3def79cac1b"
>
>
> Why is this needed, as we already have a copy in
> meta/recipes-support/libassuan? =A0Was that version not found for some re=
ason?

I somehow missed seeing the recipe in recipes-support!  My bad.

I will remove this patch in the next submission.

Steve


