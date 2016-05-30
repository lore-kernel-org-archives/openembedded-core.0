Return-Path: <rm.santos.caldas@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C1A626FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 21:50:34 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n129so26529114wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 14:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=jxWxWJbpydSnv09LtcbK/C4lxxEXmrKbjIApumhwY3U=;
	b=CV2MkSNpryhNE0tJ+xlNol7/zzdTZ5Gl9IxA2iHGgNw4rItt5sVsY8iC/jU3aWCYF9
	ZBdbzZkSTe2UK4j81LLAomJb3pyqa+ufR0IEFrnQYq/y2BDLhQB77qnKArTR9VKjO909
	6tY+0nqzZ6Q4ZA8hYS4wRMK9Gqqe1rnXZXit0Z6Jp7VttDB1Qi6hva81C+MUVocifz48
	S1Pt2lJJMQHITOS976hCsZBK+KJQ410UKLDNb1ePUWA21ZtN7s4bSOhgK4bLE/V7e9Rx
	+GEsuEqq/DMwJHoj6K+O09XXpjq7dRUOWRglNbQZUPVVnKci08GCKNLZiUdPsLhqUGeC
	l9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=jxWxWJbpydSnv09LtcbK/C4lxxEXmrKbjIApumhwY3U=;
	b=DIXmPSneEgn05/Aa+iU1t0QXXTYnzPQiQTlHvvF5LBe7qX0KJ0ZIGSzC/skBJTYl4p
	R12RueBRFIx3bqq/vbOVAjNlROGhpRK6l0xttkZXLxqriRRlhHqnoIi+lbUDiGpglVy2
	hpKBY3Cz1+Ap+ZE/elp26RYd2+LxMzPveqXDZzWBKIh9AOk32GTh/qBxUTHXiaIqLFbD
	iwHEJXndv6LqcALFVyjm1aL9OmyKYvlrJ+4j6wEYNd2v2BG4D61CwPqomIdKEBgCunBC
	Q8Y9vqJff5cgDuyAvJYRclF27y7JCK7vSGxspOj/TsInpYAuDU6sHbmAL6OzGOWLhhxf
	nnTQ==
X-Gm-Message-State: ALyK8tJ60AF61CurxaQLu72DIdxRh8mDUN6qm8BTTKZjcEdmGBo7vQHMQa15N38lDbPtxvi1GXKs1b/hzmyMIw==
MIME-Version: 1.0
X-Received: by 10.28.39.196 with SMTP id n187mr12214799wmn.4.1464645034929;
	Mon, 30 May 2016 14:50:34 -0700 (PDT)
Received: by 10.194.81.105 with HTTP; Mon, 30 May 2016 14:50:34 -0700 (PDT)
In-Reply-To: <574CB55A.4080405@linux.intel.com>
References: <20160530214549.3766-1-rm.santos.caldas@gmail.com>
	<574CB55A.4080405@linux.intel.com>
Date: Mon, 30 May 2016 22:50:34 +0100
Message-ID: <CA+21M5Cj0hELbsY3im+oz63yQKOmDEL8tcfrmC-_FQZyE4x6EA@mail.gmail.com>
From: Renato Caldas <rm.santos.caldas@gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Mon, 30 May 2016 21:50:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2016-05-30 22:49 GMT+01:00 An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel=
.com>:
> Thanks for sending the patch, only a little comment the [master] prefix
> isn't required.

I know, I meant to type "krogoth".. noticed the error shortly after
sending it :)

>
>         alimon
>
> On 05/30/2016 04:45 PM, Renato Caldas wrote:
>> On some distributions tar requires the FILE argument to be the last, and
>> the existing order was causing the subsequent --exclude options to be dr=
opped.
>>
>> Fixes [YOCTO #9673].
>>
>> Signed-off-by: Renato Caldas <rm.santos.caldas@gmail.com>
>> ---
>>  meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-de=
vtools/perl/perl-ptest.inc
>> index 948ea7c..66c5355 100644
>> --- a/meta/recipes-devtools/perl/perl-ptest.inc
>> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
>> @@ -7,8 +7,8 @@ do_install_ptest () {
>>       mkdir -p ${D}${PTEST_PATH}
>>       sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
>>       sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
>> -     tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makefile=
 --exclude makefile --exclude hostperl \
>> -             --exclude miniperl --exclude generate_uudmap --exclude pat=
ches | ( cd ${D}${PTEST_PATH} && tar -xf - )
>> +     tar -cf - --exclude \*.o --exclude libperl.so --exclude Makefile -=
-exclude makefile --exclude hostperl \
>> +             --exclude miniperl --exclude generate_uudmap --exclude pat=
ches * | ( cd ${D}${PTEST_PATH} && tar -xf - )
>>
>>       sed -i -e "s,${D},,g" \
>>              -e "s,--sysroot=3D${STAGING_DIR_HOST},,g" \
>>
>

