Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA9E6BA22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 13:32:11 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id g12so14262317lfb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 05:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ge5nVfnDx21gi31NOL/UFK6UHghTtzcWuf+7T/DJdo4=;
	b=Bao+XcLVLoMQ2Y5tpZestPcPpW7L5EAklIOpSKj6Fagv3dkriDJn+r5S/mwCpIMUHw
	MziKY9XEtXqGIhXdyeePYVCXnX8S8isjVYePsw7v2ZrQKXEAbXSWUmutEWDTAuCgcsFN
	zwEnNb4sRycxFLGzIMYvJuCqnsxcQoQi6FQ9FDuKRATJS5PQByCZWrDEMrXEsUu69xj1
	uOjKy0NCz6TOBMdRQ3pvmSf4RdhiOkOrIl8T1J5lt9PLFm1VOHTxaeSHGx06jLjxCACC
	0sqwK68Td+yD3gbENSKzA43tnOxw/duPtv6P68A6YrVTOxRphV7mlFcQYWSjl/ca5s7Q
	tWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ge5nVfnDx21gi31NOL/UFK6UHghTtzcWuf+7T/DJdo4=;
	b=OSWeklzSP77iaiAAS0pKwgtY4QL38wS8RtykRE7xyf/0T7m1nNBmhbelXEF77H4qGd
	yIPMeNTzkGf8yLzr+1gwiDabCuYE175ZV8dYrqaxZTVBg14QVjj0Oc9YBQIlPRUdLFQx
	raxqI3GAYq4QfAt+nqZaNQmznsJHM2buBbnZAKhVYvzakiWtOhZl5H1xuC4CVJy/Vbhd
	VYyQBzuoDef1C9jMU4rEXCyzesezqSw9ojiijaewaOsCcwtV5E8mJe1EUFIKf7Jd3odM
	doWgsoo0N13wQoAMfF2mx+MHHK8xG7nTGa8DBn6YtF8C3V2AASw+giXMapsM9FpGbuYg
	Owog==
X-Gm-Message-State: APjAAAXTWApkp2Pm3+jIYqZruln250rzJkwcHz9IxHa3rubta+6RpiPJ
	C3NBALy4NJL+Z0H/iMk0SxfMNUx/snMb66lpnUM=
X-Google-Smtp-Source: APXvYqxJWrU3wI5eO8SSIZc82Hi6vzyesZ78xIpVfoHsKSRgR3bsQKvGRQlX2W79Mq3q7UTSNP8aDm+xSPTJrGVWZKE=
X-Received: by 2002:a19:2bc8:: with SMTP id r191mr10848971lfr.41.1552051930502;
	Fri, 08 Mar 2019 05:32:10 -0800 (PST)
MIME-Version: 1.0
References: <20190308063557.3712-1-bruce.ashfield@gmail.com>
	<CA+chaQeSYxNfq8VOhiZr5=C2Z0ArzHsdAOuTLVrHV4SqrkZ38w@mail.gmail.com>
In-Reply-To: <CA+chaQeSYxNfq8VOhiZr5=C2Z0ArzHsdAOuTLVrHV4SqrkZ38w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Mar 2019 08:31:59 -0500
Message-ID: <CADkTA4MFc7Gxv1vB1E_yN-B-EWrd+tjzV1=L958G6E3biAM3GA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: synchronize unistd.h between libc-headers and perf source
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
X-List-Received-Date: Fri, 08 Mar 2019 13:32:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 8, 2019 at 1:38 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Why not use STAGING_INCDIR ?

No reason. Except that it was almost 2am and I was chasing this for 6
hours (and of course, a one line fix!!).

I'll do a v2 with STAGING_INCDIR, I just built up that path from
components that I knew and knew would
fix it, but the incdir variable is better for future proofing.

I'm doing a build test now and will resend when it passes.

Bruce

>
> On Fri, Mar 8, 2019 at 7:36 AM <bruce.ashfield@gmail.com> wrote:
>>
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> During the build for some architectures, perf generates a program
>> which executes on the host to dump the syscall table.
>>
>> The generation of that program uses the cross compiler + sysroot
>> to expand unistd.h. As such, we are getting the contents of that
>> file from linux-libc-headers.
>>
>> The compilation of that generated program uses the host compiler
>> and a restricted include path to the perf source code. In the
>> perf source there is a captured unistd.h, as such it will be used
>> when compiling the host executable. The perf source code is copied
>> from the kernel version that is being built .. so we have a
>> mismatch between the generation and the compilation of the host
>> program.
>>
>> Normally this mismatch is fine, but if the libc-headers are
>> newer than the kernel, we'll have syscalls (and their syscall
>> numbers) that are not defined in the perf source code. This
>> leads to a compiler error and a cascading failure of the perf
>> build due to a missing generated file.
>>
>> To fix this, we can copy unistd.h from the recipe-sysroot
>> into the perf source code and they will always be in sync.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>>
>> Richard,
>>
>> This should fix the perf build failure with 4.19 and the 5.0
>> libc-headers.
>>
>> It also builds fine in the other combinations I was able to
>> test. No sense sitting on this, it can use some AB combinations
>> for more testing.
>>
>> Bruce
>>
>>  meta/recipes-kernel/perf/perf.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index 9120766858..2f85006ee1 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -235,6 +235,9 @@ do_configure_prepend () {
>>      for s in `find ${S}/tools/perf/scripts/python/ -name '*.py'`; do
>>          sed -i 's,/usr/bin/python2,/usr/bin/env python,' "${s}"
>>      done
>> +
>> +    # cp from the sysroot unistd.h to the perf unistd.h
>> +    cp ${RECIPE_SYSROOT}/usr/include/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
>>  }
>>
>>  python do_package_prepend() {
>> --
>> 2.19.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

