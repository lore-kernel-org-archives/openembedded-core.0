Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B2DAB719F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:25:03 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 3so16971986pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=xb4TBqKlGvgA/p4x8GDny4C617eNW5r9rUTRkRShI/M=;
	b=IkZmyt+IGjri3TwuECjz+URPC3FPI/VDSRuVX40c+4+jn/ra/pKYUkWtnNI0qxvdm+
	6z6qtq2SWSgpIDJaiIIjQ2ucxYqx7lqnCFBl8lrnBY75R1V81wOLkE0F+0F2eo5Wi4U7
	tVYxDcyaL5T7BlKEAIoX4vLhfE8KG/7rxNCA80RW/YvpkpkCMV3ozl7Wnv/7mPumlkWe
	s3ODdEIbMaM7V1xEo58Ogbvzh14M9aHOMw4IAo1YMsyHCdz0gKfsic7t15qX+wFvWqrv
	w4rxyu8JanCPRxlYtLZOejrIlIUazrphkwHwB6kAln1sLl2q+1N5DhyYeSa7CQ9PNU6N
	CS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=xb4TBqKlGvgA/p4x8GDny4C617eNW5r9rUTRkRShI/M=;
	b=hn6qWaPwFwDoRVkuKiAg8u4fVzpGNZuhPRAyXS8PucS1HYwTRW53/XukE5kp02hn3b
	YNhd4yRRvulBjwjQIixZdZpi9sTzyi9wNw/5cp1/8VErCdGiK30iB584T2qLlDAN0nfL
	yxux7u5VcBZlzBu5aLBYqQwWnstljY3KsRRvHZteAuaPCKcNPND19Q9jKfYqRUQWd2k6
	hxwnf0PgI3eh6KUSNiPpb8t2X3mKFwb9UlPcI4P2svgaoKyx96a04IkxyHgnTsCHXBIG
	4yCKOOUGw0Xn4rfAZwU+CEOnEDAkONpQF3jlQpk/VKCRcqXItYZWA59+yvao4kHxLzQ9
	S8IQ==
X-Gm-Message-State: AKaTC02m7jpUbbxBVA30Nv8jiybfV7aByFCCMriRHFx1pBeH2ztOJo1fcbaiYuw7u0iSdA==
X-Received: by 10.84.205.69 with SMTP id o5mr62499609plh.70.1480440304935;
	Tue, 29 Nov 2016 09:25:04 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:a19b:b7db:ed72:12bc?
	([2601:646:8882:b8c:a19b:b7db:ed72:12bc])
	by smtp.gmail.com with ESMTPSA id
	t21sm96576594pfa.1.2016.11.29.09.25.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 09:25:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <de64dc20-cff3-5f25-7e66-55887e641e3e@topic.nl>
Date: Tue, 29 Nov 2016 09:25:03 -0800
Message-Id: <BAC3A276-F8A3-42FE-9E43-A8D98FABAA1A@gmail.com>
References: <6df42b3b-66b7-25dc-faac-e26e19fefbfd@topic.nl>
	<9147101c-f99a-92fc-d45c-0b67f477a57e@topic.nl>
	<CADkTA4N-PEZZdDh7nrzaXBQb7jm0-SUkGbpcShXcQAJKe5bfEg@mail.gmail.com>
	<B3A9B210-3501-47BB-8B16-CC31C7A4BCC5@gmail.com>
	<de64dc20-cff3-5f25-7e66-55887e641e3e@topic.nl>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Mailer: Apple Mail (2.3251)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Kernel: Builds use old version of defconfig
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
X-List-Received-Date: Tue, 29 Nov 2016 17:25:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Nov 28, 2016, at 11:58 PM, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
>=20
> On 29-11-16 03:03, Khem Raj wrote:
>>=20
>>> On Nov 24, 2016, at 5:55 AM, Bruce Ashfield =
<bruce.ashfield@gmail.com
>>> <mailto:bruce.ashfield@gmail.com>> wrote:
>>>=20
>>>=20
>>>=20
>>> On Thu, Nov 24, 2016 at 5:32 AM, Mike Looijmans =
<mike.looijmans@topic.nl
>>> <mailto:mike.looijmans@topic.nl>> wrote:
>>>=20
>>>    On 24-11-16 11:10, Mike Looijmans wrote:
>>>=20
>>>        I'm currently experiencing a problem with "defconfig" files =
and the
>>>        kernel.
>>>=20
>>>        In short, when I make a change to the "defconfig" file, the =
kernel
>>>        is rebuilt
>>>        (which is correct), but the resulting kernel has been built =
using
>>>        the old
>>>        defconfig from a previous build, instead of the new one.
>>>=20
>>>        The kernel recipe just contains "file://defconfig" in its =
SRC_URI. The
>>>        defconfig file is in the project's overlay.
>>>=20
>>>        For example, I have a kernel with "CONFIG_DEVMEM" disabled:
>>>=20
>>>        # gunzip < /proc/config.gz | grep DEVMEM
>>>        # CONFIG_DEVMEM is not set
>>>=20
>>>        Now, I change the defconfig to contain CONFIG_DEVMEM=3Dy and =
build the
>>>        image.
>>>        The result:
>>>=20
>>>        # gunzip < /proc/config.gz | grep DEVMEM
>>>        # CONFIG_DEVMEM is not set
>>>=20
>>>        So the change did not make it into the actual kernel, even =
though
>>>        the kernel
>>>        was rebuild as a result of the change.
>>>=20
>>>        I run "bitbake -c cleansstate virtual/kernel" and build the =
image again:
>>>=20
>>>        # gunzip < /proc/config.gz | grep DEVMEM
>>>        CONFIG_DEVMEM=3Dy
>>>=20
>>>        After cleaning, the result is correct and the new defconfig =
is active.
>>>=20
>>>        I'm trying to figure out how this can happen, any help is =
welcome...
>>>=20
>>>=20
>>>    What seems to be the problem is this code in kernel.bbclass:
>>>=20
>>>            # Copy defconfig to .config if .config does not exist. =
This allows
>>>            # recipes to manage the .config themselves in
>>>    do_configure_prepend().
>>>            if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" =
]; then
>>>                    cp "${WORKDIR}/defconfig" "${B}/.config"
>>>            fi
>>>=20
>>>    This keeps any existing ".config" file if it happens to still be =
in the
>>>    $B path, which is the case if you're rebuilding a kernel.
>>>=20
>>>    I see two possible ways to fix this.
>>>=20
>>>    1) During "cleanup" also remove the .config file in the build =
dir.
>>>    However, the build dir is probably kept alive for a reason? I =
also can't
>>>    figure out how that "cleanup" is being done.
>>>=20
>>>=20
>>>    2) Remove the second part of the "if" statement, so it becomes:
>>>=20
>>>            # Copy defconfig to .config if "defconfig" exists. This =
allows
>>>            # recipes to manage the .config themselves in
>>>    do_configure_prepend().
>>>            if [ -f "${WORKDIR}/defconfig" ]; then
>>>                    cp "${WORKDIR}/defconfig" "${B}/.config"
>>>            fi
>>>=20
>>>    I've tested that, and it solves my problem. However, it will =
probably
>>>    break other people's config mangling?
>>>=20
>>>=20
>>> Yep, in particular all the fragment processing which has the =
capability of
>>> starting
>>> with a defconfig and then apply fragments from any number of other =
places. When
>>> that task completes, a full .config is in ${B}.  If that statement =
comes
>>> along and
>>> clobbers the .config =E2=80=A6
>>=20
>> so you either assume that .config is valid once generated or you =
dont. When a
>> configure task
>> is triggered it should recreate .config everytime.
>=20
> The problem seems to be that the class "do_configure" does things that =
should happen before and after things that the recipe would want to =
change.
>=20
> Copying defconfig or whatever means to create a .config should be =
first.
>=20
> Next, the specific kernel recipe would want to mangle that =
configuration to suit its needs, like applying fragments and such.
>=20
> Then the makeoldconfig (or whatever) task should run.



>=20
>=20
> The current system assumes that the kernel recipe creates a =
do_configure_prepend to do the mangling, which is rather =
counterintuitive, one would expect to "append" extra actions.
>=20
> A structured approach would be to split the do_configure into two =
parts that should run in sequence, and then kernel recipes can inject =
their actions by appending to them as they see fit. The first task would =
create the .config file by (forcibly) copying any defconfig or starting =
point. The second task would call the kernel's make script to futher =
process it.
>=20

it might just be enough to expect kernel.bbclass to error out if a given =
task is not implemented by inheriting recipes much like pure virtual =
functions in C++
and get rid of _append/_prepend sequencing expectations.


> But this too would break existing recipes.
>=20
>=20
>=20
>>>=20
>>> I'm actually working in the 2.3 release cycle to make the fragment =
processing
>>> be available to all kernels, which will likely solve this problem .. =
but we
>>> can't
>>> wait for that.
>>>=20
>>> So I'm hoping that there's a way to make the behaviour cover both =
use cases.
>>>=20
>>> Maybe someone with more bitbake knowledge can point out a way that =
can
>>> detect if the task is being run due to a change in the task =
signature.
>>>=20
>>> Since if you've modified the defconfig, the task is being re-run for =
that change
>>> and at that point we could safely remove the .config (versus forcing =
it on the
>>> clean step).
>=20
>=20
>=20
>=20
> Kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>=20
> Please consider the environment before printing this e-mail
>=20
>=20
>=20
>=20
>=20


