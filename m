Return-Path: <net147@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 46DF96FF4E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 08:58:11 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id c63so111598540iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 01:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=J4z8efcnOOt1J5AUR7j4k5Nmvl2IuUo8AiVt7AZZ9T0=;
	b=s7AG1BwVVEzqd3q9JQF+4ASLw/opoupj1okOFRQL/+/nppV+lD3dSa+3j3+6SDoQsC
	0eYAsWvo0pcKC6bpjmJtc9m3X65zxIcR2SN7aMFxEUSZ/K3c6Di4FvDlzYtA5mlNuh0f
	2ZM/Rlg3xJRQVVCp4J0pQQsaTqQh1MNo/4MKF2MCcWTcP1b3BpjU52G2Pth2Kke58PVL
	wFV9d8Vd0lkDgH37aUwArlOjov+nNlDCx9vIQcQsadHjvaCP3uREv5QRsrs9gsBTRMcK
	Qvt7hTUw36ISwC3xXhU3mTLW2nj4pa6AZqP3v05+/NIejag2CRMl3yzBFCeawRackvek
	xJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=J4z8efcnOOt1J5AUR7j4k5Nmvl2IuUo8AiVt7AZZ9T0=;
	b=LhvD/YPW4BZXZfgah+aa307avQ7qXp8Gk7HA0Vz9thL6GqhwKf/Zg3q8CFmypC2b5k
	M9JLe3Es47kGEYnSjS7xS8YfLjvfFs82TUqSkKP/lKyS8uIFqNZfp6mSeWgQEMr6jOLo
	Iqlt1tf/3eOzW50Htd8Y/V2mlBlY6jgulfLQBOuTnkVtGf4ptNaNui64wLpMdRkvAij/
	V76vYRIZbKAEp/IJ8XO75p1SK+yX7bo+S4BgvN1jcJ8uYtrgpISrASaepec5VvI54rlZ
	A6kRrGkvEMXIK/qn7mmR6XK8wEDpY3yj4uAOr7PdQLF5Q1d4dLU+rOyY2c851CF3f/zL
	8dGQ==
X-Gm-Message-State: AD7BkJLHFH+zhDWmGYyRnfr4hac+tj0LdnH7hmC6VWW6oVHsDdaOq12N297gp288HJH9CcZappIvh708lQ9t1A==
MIME-Version: 1.0
X-Received: by 10.107.9.193 with SMTP id 62mr12893368ioj.27.1458896292243;
	Fri, 25 Mar 2016 01:58:12 -0700 (PDT)
Received: by 10.36.69.12 with HTTP; Fri, 25 Mar 2016 01:58:12 -0700 (PDT)
In-Reply-To: <1458896056.3073.45.camel@linuxfoundation.org>
References: <1458887112-27434-1-git-send-email-net147@gmail.com>
	<1458896056.3073.45.camel@linuxfoundation.org>
Date: Fri, 25 Mar 2016 19:58:12 +1100
Message-ID: <CANwerB1wqVPz4CgP24AuUOkKkxnwakaQPYtQmgWG_Lb10z1H_w@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: fix enabling of Python support
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
X-List-Received-Date: Fri, 25 Mar 2016 08:58:13 -0000
Content-Type: text/plain; charset=UTF-8

Hi Richard,

On 25 March 2016 at 19:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2016-03-25 at 17:25 +1100, Jonathan Liu wrote:
>> Python support was not being enabled because of a conflicting
>> --without-python configure argument in OE_EXTRACONF.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> index ae97759..6fd3e3e 100644
>> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> @@ -13,6 +13,7 @@ RDEPENDS_${PN} += "nativesdk-python-core nativesdk
>> -python-lang nativesdk-python-
>>
>>  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>>
>> +EXTRA_OECONF_remove = "--without-python"
>>  EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
>
> Would a PACKAGECONFIG += "python" have the same effect?
>
> Cheers,
>
> Richard
>
>
>

No, it wouldn't. It would depend on python and python-codecs then fail
when building SDK.

Regards,
Jonathan

