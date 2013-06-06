Return-Path: <net147@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6796A6A60F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 05:08:46 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id hz10so1725065vcb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 22:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zxcRwj7G3367QyecnqJFa858AOTMLozwigP4BeyvfhU=;
	b=I2jzfl8Ay5TEFzcC2BkM770stQ+vu2q4jnkPz7JMww4bxG99s04jy2NXxhpDGYA110
	tty4ZbGz4dpEeIDwejbRLygQfSjZUxSc8aJQ7B1kt0Cj2mosC8CZdre9AfJRYOCFK9XC
	q9Y1bs2gRIfGEJ8xPDgz8XvVGorv0AqKewWZLVAGxlgxUT6AM/hl4QO2G4CiLFCxNECD
	QTvwLSRH/DXfR4NNaGSX7evyRLQ+R5V4lfYea2RKAKyTsCx865CdDgDv0e0/7/HTzOGA
	Av9l14mewPKmVBCaNQiDJclo1X+9W6AGgko1MElvV5nU9hFTX2sS69+KVkWYJcRxuuSD
	nLOA==
MIME-Version: 1.0
X-Received: by 10.58.75.41 with SMTP id z9mr11222768vev.4.1370495327305; Wed,
	05 Jun 2013 22:08:47 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Wed, 5 Jun 2013 22:08:47 -0700 (PDT)
In-Reply-To: <51B017F8.8050709@linux.intel.com>
References: <1370491540-21915-1-git-send-email-net147@gmail.com>
	<51B017F8.8050709@linux.intel.com>
Date: Thu, 6 Jun 2013 15:08:47 +1000
Message-ID: <CANwerB1r4hjAiUkyurW0=VAehfkM9o6mmk+da2pDtovddBaKig@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/qmake_base: allow parallel make
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
X-List-Received-Date: Thu, 06 Jun 2013 05:08:47 -0000
Content-Type: text/plain; charset=UTF-8

On 6 June 2013 15:02, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/05/2013 09:05 PM, Jonathan Liu wrote:
>>
>> Remove MAKEFLAGS= from EXTRA_OEMAKE to allow parallel make.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/classes/qmake_base.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/qmake_base.bbclass
>> b/meta/classes/qmake_base.bbclass
>> index 52e7fb0..3762887 100644
>> --- a/meta/classes/qmake_base.bbclass
>> +++ b/meta/classes/qmake_base.bbclass
>> @@ -4,7 +4,7 @@ OE_QMAKE_PLATFORM = "${TARGET_OS}-oe-g++"
>>   QMAKESPEC := "${QMAKE_MKSPEC_PATH}/${OE_QMAKE_PLATFORM}"
>>
>>   # We override this completely to eliminate the -e normally passed in
>> -EXTRA_OEMAKE = ' MAKEFLAGS= '
>> +EXTRA_OEMAKE = ""
>>
> I don't think this is correct, have you checked the run.do_compile script?
>
> It shows
>         make -j 16  MAKEFLAGS=  "$@" || die "oe_runmake failed"
>
> Which means the parallel make info is being passed correctly.
>
> Sau!

MAKEFLAGS= cancels out the -j 16.

Regards,
Jonathan

>
>
>
>>   export OE_QMAKE_CC="${CC}"
>>   export OE_QMAKE_CFLAGS="${CFLAGS}"
>>
>

