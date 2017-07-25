Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C21C78272
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 16:59:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r77so3832631wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 09:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8Cb1aHl+r3hHWvTzFrpJHUgxZ9hYwg32vDmtd+2uTjU=;
	b=bUeaYMHguIfIcRLOS2i7QgAumCOq+KBfwBEExxLpC56oPt09hEGwsXHyiP4jZEMRRZ
	0OfktCfGrCNLpqWHltwPW3xcLwPV1KhfeFwFm53In0fNSgVKSp4KmFLhI5bUbfYN3P7e
	RozWzC/T7NQ0gSxtuS7mQFlgDIy+4xHVUT67+VQ+eWmEErQ3HqhRvCfTRQqixt9boLPa
	U5+nRCkLehtoTtRmLgqxxLVvNERS8amieUJpogXxdiRN3lxcJbgPDvotUzAejr2fdk34
	SkHns3WPyhimHIG95iAoX3+BoclmEZftUJ2Ydrgt0UJDlxUm8ksRObXdF93BRzCNOmWe
	2/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8Cb1aHl+r3hHWvTzFrpJHUgxZ9hYwg32vDmtd+2uTjU=;
	b=FtGRlekCXdgO67M+Wa0q+FebFeCV2xitDfRnlSx/lW3fJxhSqCeZF33o7v8udac3Ex
	vXFzu6myB1BX2KhjaNEOnM4YsQik7Adh02TH2j5foBjarUUWkpvrIN130+OmIlx57GA1
	0laJ5K5+QBXsGEhdl8MusMYqLhZIjEzZLCU8nOvwt5kHpxOXuqhwRQlVrfKKdxQHFnSf
	BS0nkF+RSGmKp9jht2Z3g3HMwy0dq9rzI8SiBzkIpkkMIaOzP7Tzl+CbNOdYGS3vOVl1
	sdKQoDWU6jRxXfmbE0glO9oDy28fnmO1/oSWbZ+Jk+ff22zjY0wzieY+hyRN6Xr3pvHl
	VXbA==
X-Gm-Message-State: AIVw113t0G2pRU2wRIg7QCvVXgMQwZiEQ3gWhYrskdEZGKHmWzrXu6Ri
	vS4BM95j+nBcH3GGNXJKaNxbNYmPhQ==
X-Received: by 10.80.164.18 with SMTP id u18mr4036149edb.250.1500990838953;
	Tue, 25 Jul 2017 06:53:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 25 Jul 2017 06:53:28 -0700 (PDT)
In-Reply-To: <CAJTo0LbJvsviFJGW8k=Hgsr=kCgFhv7MX=wyjxYz2t23zkSQ1Q@mail.gmail.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
	<20170724142818.44403-5-alexander.kanavin@linux.intel.com>
	<CAJTo0LbJvsviFJGW8k=Hgsr=kCgFhv7MX=wyjxYz2t23zkSQ1Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jul 2017 06:53:28 -0700
Message-ID: <CAMKF1so7BKN37KMUBDcDw9zHqZmO6YJuFpM8igAHo40QG_CkkQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] gperf: upgrade to 3.1
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
X-List-Received-Date: Tue, 25 Jul 2017 16:59:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 25, 2017 at 6:12 AM, Burton, Ross <ross.burton@intel.com> wrote:
> This breaks the libcap build:
>
> | In file included from <command-line>:0:0:
> | ./_caps_output.gperf:71:80: error: unknown type name 'size_t'

include <stddef.h> might help

> |  gperf_case_strncmp (register const char *s1, register const char *s2,
> register size_t n)
> |
> ^~~~~~
> | ./_caps_output.gperf:96:53: error: unknown type name 'size_t'
> |  __cap_hash_name (register const char *str, register size_t len)
> |                                                      ^~~~~~

gcc is putting a caret pointer in wrong place hmm may be a cut and paste error

> | ./_caps_output.gperf:200:55: error: unknown type name 'size_t'
> |  __cap_lookup_name (register const char *str, register size_t len)
> |                                                        ^~~~~~
> | ./_caps_output.gperf:200:1: error: conflicting types for
> '__cap_lookup_name'
> |  __cap_lookup_name (register const char *str, register size_t len)
> |  ^~~~~~~~~~~~~~~~~
> | ./_caps_output.gperf:33:29: note: previous declaration of
> '__cap_lookup_name' was here
> |  const struct __cap_token_s *__cap_lookup_name(const char *, unsigned
> int);
> |                              ^~~~~~~~~~~~~~~~~
> | cap_text.c: In function 'cap_to_name':
> | cap_text.c:291:2: warning: ignoring return value of 'asprintf', declared
> with attribute warn_unused_result [-Wunused-result]
> |   asprintf(&tmp, "%u", cap);
> |   ^~~~~~~~~~~~~~~~~~~~~~~~~
> | Makefile:63: recipe for target 'cap_text.o' failed
>
> Ross
>
> On 24 July 2017 at 15:28, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>  meta/recipes-extended/gperf/gperf_3.0.4.bb | 5 -----
>>  meta/recipes-extended/gperf/gperf_3.1.bb   | 5 +++++
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>  delete mode 100644 meta/recipes-extended/gperf/gperf_3.0.4.bb
>>  create mode 100644 meta/recipes-extended/gperf/gperf_3.1.bb
>>
>> diff --git a/meta/recipes-extended/gperf/gperf_3.0.4.bb
>> b/meta/recipes-extended/gperf/gperf_3.0.4.bb
>> deleted file mode 100644
>> index 64003fc0bb7..00000000000
>> --- a/meta/recipes-extended/gperf/gperf_3.0.4.bb
>> +++ /dev/null
>> @@ -1,5 +0,0 @@
>> -require gperf.inc
>> -
>> -
>> -SRC_URI[md5sum] = "c1f1db32fb6598d6a93e6e88796a8632"
>> -SRC_URI[sha256sum] =
>> "767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e"
>> diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb
>> b/meta/recipes-extended/gperf/gperf_3.1.bb
>> new file mode 100644
>> index 00000000000..942820b91d5
>> --- /dev/null
>> +++ b/meta/recipes-extended/gperf/gperf_3.1.bb
>> @@ -0,0 +1,5 @@
>> +require gperf.inc
>> +
>> +
>> +SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
>> +SRC_URI[sha256sum] =
>> "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
>> --
>> 2.13.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

