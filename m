Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7729B787ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 17:44:51 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id b25so5965482pfd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 09:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dzb652Jp9FIul6UmOVC5x9Adube+9zoE9DnyB6OFyUI=;
	b=CV/hO8odMMqdkEZd8RvLtYkbnBYT7T4V+qJwKhhN+PAh+5Q84OOY6w3mHmt+OVFMOg
	RQDr78Q4mZwg3RrI2aOslViFbAmFadaNPoL4Ri+o8rrleviyR9jrPKSXhNlmCAqndfqE
	PBcBVFyvYBVA9lrOKL2ImfxW4RkRcdMVDOOWj/VRVJnM2dWPnF5OhLNKkNi1dEpW8UUp
	5mLIO6nWsO9KWTQ00dMY6KLvgCri4aedM8DOJTmcyz0e3Gv3wvnMlYNMrB5FEZ7IsjFC
	NxfjstBk9vX5qb7RCtwL7rOpQfVIzQgoO4lAq/7JKZRN4iszcg52rsdwC01eX2jRNIIJ
	aw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dzb652Jp9FIul6UmOVC5x9Adube+9zoE9DnyB6OFyUI=;
	b=mnWPFTms0i2YiAJEiPOSwH1yBQJLZ7AS08DnJRDU+IDh1FYm22vqXBQ93KG55Ak3wb
	7nYP47JlCy/VgtxhgzExndHjqzTlxoRJrHNtFqlQBVz5Qe8kL3JD8E3w2O7exZFhhG1T
	6+iCrbXGir7Fu1kz+Y6INcc/Er5FdEXivOWVbxopB92AqZsy91LYL3MQw1Rmw6Tr8Tsu
	H85CFjOD/TcAHjw5J8W1vL/g+faKoATmi4aBFZnj7N2ZAV8WzabhmRt8VoT3KEYGmG8M
	3hzDzJL2K+zD9aZcsnfiH9FSEB5e5LGHVqpIx+ms6khCijpxd49hR1eoxVhoRNrfNJx0
	vZxg==
X-Gm-Message-State: AKwxytdgZPFsbpwCo2AC4QH5wV9Bi6yG6JkNxZ3n5Va284YQ6GWKaEk3
	tdQSVLfRgY6XJt34rLbk88K7GWaWJmHD5vMr3cY=
X-Google-Smtp-Source: AH8x226xl5SDJKk41f424qjBR0gBiBz3jQd1/AeAi6PphCIuM7gI0lmC9i1WqVCs6yKyuj1NWTkzKHqntK2ptM3uzZA=
X-Received: by 2002:a17:902:bd82:: with SMTP id
	q2-v6mr13296911pls.339.1517247892530; 
	Mon, 29 Jan 2018 09:44:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Mon, 29 Jan 2018 09:44:22 -0800 (PST)
In-Reply-To: <CAJTo0LZ=m04zzX5XunL3Ht4t=b9dAiAfwdfkARcH6nyFTL1Y1w@mail.gmail.com>
References: <20180127070626.27581-1-raj.khem@gmail.com>
	<CAJTo0LZ=m04zzX5XunL3Ht4t=b9dAiAfwdfkARcH6nyFTL1Y1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jan 2018 09:44:22 -0800
Message-ID: <CAMKF1sqrT9Fd92FnVyeZ+esWEF-2NUwjow-5hv4GjQnHJ_QqqA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson: Adjust for clang compiler
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
X-List-Received-Date: Mon, 29 Jan 2018 17:44:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 29, 2018 at 9:21 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 27 January 2018 at 07:06, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Remove hardcoding c/c++ compiler to be gcc alone, its
>> possible to use clang as replacement for cross compilers
>> from meta-clang, therefore set clang/clang++ if
>> TOOLCHAIN = "clang"
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/classes/meson.bbclass | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
>> index 91ac652651..cd3497a802 100644
>> --- a/meta/classes/meson.bbclass
>> +++ b/meta/classes/meson.bbclass
>> @@ -40,6 +40,11 @@ EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
>>  MESON_CROSS_FILE = ""
>>  MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
>>
>> +CCOMPILER ?= "gcc"
>> +CXXCOMPILER ?= "g++"
>> +CCOMPILER_toolchain-clang = "clang"
>> +CXXCOMPILER_toolchain-clang = "clang++"
>> +
>
>
> Can we do this in bitbake.conf instead of repeating ourselves?

having it in meson bbclass keeps it to meson based recipes,
bitbake.conf is a bit too generic.

>
> Ross

