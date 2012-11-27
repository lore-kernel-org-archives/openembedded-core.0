Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TdHKw-0008JX-5C
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 10:20:17 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so11871825ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 01:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YYnGAU1jViD0JOtm2MlB3y9IZi2RQrU4HKcT6v9G/aA=;
	b=PNZ9f/jO805d/gudxvXRNfg4l6E9/Oqy3tD6Fk6PubHiJxhAl6oQZNoLV5azUlnU/D
	ZVuQsAbDmMmetoH0qLSYW/plw1iToD1KdqWduLKlO60kOuu03aGlzfslHJyzPbCpObj7
	0YLwewZvJao21nntoBCSOjF4B1xx/chKbdUvpUK1bJy96jMxuIqDUe2dKMYjtjp+NCHt
	7JkwQmT4Crs94RLqv7gHSToEKPAjYTDvXX6JbqLFq2SUp8vvEVyEG4pdaUFo6UhHWPaa
	zI/vZTtuf6+M+72GiXuefa2f3o++vhJRgUxlLSWr+ODYOAazkU2ju4Pkq3z0h3h/oCaN
	tbkw==
MIME-Version: 1.0
Received: by 10.50.152.132 with SMTP id uy4mr14702648igb.3.1354007160876; Tue,
	27 Nov 2012 01:06:00 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Tue, 27 Nov 2012 01:06:00 -0800 (PST)
In-Reply-To: <1354006492.21863.97.camel@ted>
References: <1353986291-9144-1-git-send-email-cazfi74@gmail.com>
	<1354006492.21863.97.camel@ted>
Date: Tue, 27 Nov 2012 11:06:00 +0200
Message-ID: <CAF6bG8dAVr-7S2EVQVyOQ0SJtxLCSZdiF-nA1t3yrTL0=jvLSw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng: update to upstream version 1.2.50
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
X-List-Received-Date: Tue, 27 Nov 2012 09:20:17 -0000
Content-Type: text/plain; charset=UTF-8

On 27 November 2012 10:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-11-27 at 05:18 +0200, Marko Lindqvist wrote:
>> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>
> What changed in the LICENSE?

 Version number and release date.

>
> Cheers,
>
> Richard
>
>
>> ---
>>  .../libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb}          |   12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>  rename meta/recipes-multimedia/libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb} (52%)
>>
>> diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
>> similarity index 52%
>> rename from meta/recipes-multimedia/libpng/libpng_1.2.49.bb
>> rename to meta/recipes-multimedia/libpng/libpng_1.2.50.bb
>> index d33a9f5..211e357 100644
>> --- a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
>> +++ b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
>> @@ -3,15 +3,15 @@ DESCRIPTION = "PNG Library"
>>  HOMEPAGE = "http://www.libpng.org/"
>>  SECTION = "libs"
>>  LICENSE = "Libpng"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=20110633230abd47fe8680afa75f1492 \
>> -                    file://png.h;startline=308;endline=422;md5=edd1c552386a8c3773d90e278ae30891"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
>> +                    file://png.h;startline=310;endline=424;md5=62968b88b0425ceeb919de3fd21b03e5"
>>  DEPENDS = "zlib"
>> -PR = "r1"
>> +PR = "r0"
>>
>> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
>> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
>>
>> -SRC_URI[md5sum] = "d5106b70b4f8b464a7da66bffe4565fb"
>> -SRC_URI[sha256sum] = "fbf8faa70ebca2ed2ee6df6f2249f4722517b581af5b6c3c71bbdaf925d5954e"
>> +SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
>> +SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
>>
>>  inherit autotools binconfig pkgconfig
>>
>
>


