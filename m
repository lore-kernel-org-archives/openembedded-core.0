Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 816277894A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 16:54:36 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id g192so3229898vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KWUgGFggabVbUSmXAhFfl99jkMrMm/MvYZwjdc/B+18=;
	b=Gmi4McdXzVhmdC2JFnYapUpgpFoUnsDBNFIOW3bbkH6ARCxciCUlaFmmDwM+MeG0Gd
	+6QNTVr2ABd2A9lMsuhDhmbBJ022bgc3OC3o7SYQMU7zLbK7r5s2Pl3vKZDj1d0tylXa
	o06kIII2rv5appeHgUX9JfuNWg8PnAtyv5acF3odfryMPeVxRhG19Y1k0npJdKnuG4P8
	Zz+Twr+8w5OCZ7Twgz8e96K4YTn5aie2HgwnJIfNR+1srVuAzBF8P3BKTUJvTPjHbAH+
	jocoB04m7F78DPheVchJwrGc3H2YMvez4kb3JJBER9JmbHMp0iU1yLeXrVvR3ukZCKZS
	hMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KWUgGFggabVbUSmXAhFfl99jkMrMm/MvYZwjdc/B+18=;
	b=I9viQvv63oMvSZ8qT246JvCeRxBuanwM9ReagR3fhrEGTQKQ0ksLBqSMrUKNi9tG/s
	FSD4z8KZvptzfXVDOkzqmCl35B6SwMp92BsfOSqBOsHJl9fi3eTq8nOPk6POAQRRxtvx
	GlsZR9RMfZL6PHRqGQJrwxgamBH2Dbb+EvEFbsI6y9rRfNOi/CVwL23cbbNFVqAIma+W
	ZbSKd4yP4H+JL0IYWIYhJgxWwMKLM9nJM3ioE767Y9ghQkBSJoYhQ++6U7bhxq0pf/qw
	jxQaGDtjqRNQHdKzoEely5uzMxPqH0jHyCC1fbDF+EMm0FLkJrDCUm7ryWJYtq2nf4Zt
	rj8A==
X-Gm-Message-State: AElRT7HFCICQd84ldqfqgzc0ZHHdLLHF+BJ9e/TYOX7hW1CsBWn5V7EY
	Bx8MI8bxW6b9mPcSX/Yq6XZCZhhm3UrOiSCphMY=
X-Google-Smtp-Source: AG47ELv7gTWz0TvRCyv0f8X+KOK3lT8nSS3rY6XuMZoDGFXHtX2cUGpOgQNpI9TXgQ11JUdYSNoc5N7KDCrdaJEXLP0=
X-Received: by 10.31.218.1 with SMTP id r1mr8172915vkg.79.1521478477387; Mon,
	19 Mar 2018 09:54:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.129.195 with HTTP; Mon, 19 Mar 2018 09:54:07 -0700 (PDT)
In-Reply-To: <CAJTo0LZ0Mqnpu+021rDroBnVWKB-zbdC+Q35XXwQpb12_FYHNQ@mail.gmail.com>
References: <cover.1521257828.git.raj.khem@gmail.com>
	<19ff9542e08c7df5898cc811f65200050ecf02d5.1521257828.git.raj.khem@gmail.com>
	<CAJTo0LZ0Mqnpu+021rDroBnVWKB-zbdC+Q35XXwQpb12_FYHNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Mar 2018 09:54:07 -0700
Message-ID: <CAMKF1sq4eFjSXeKy2HYkXhNE5yWRWPF2vjji9sbYhXDJ0S_dyg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] x264: Use updated gnu-config artifacts
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
X-List-Received-Date: Mon, 19 Mar 2018 16:54:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 19, 2018 at 4:36 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 March 2018 at 03:40, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> It is not using autoconf completely, therefore there
>> is no autoreconf happening, so when we depend on latest
>> gnu-config changes e.g. new architectures like riscv
>> the build does not see them and fails.
>>
>> Installing these files from native sysroot helps
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-multimedia/x264/x264_git.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-multimedia/x264/x264_git.bb
>> b/meta/recipes-multimedia/x264/x264_git.bb
>> index a669295044..c445d15e69 100644
>> --- a/meta/recipes-multimedia/x264/x264_git.bb
>> +++ b/meta/recipes-multimedia/x264/x264_git.bb
>> @@ -43,6 +43,8 @@ EXTRA_OECONF = '--prefix=${prefix} \
>>                 '
>>
>>  do_configure() {
>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess
>> ${S}
>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
>>      ./configure ${EXTRA_OECONF}
>
>
> A neater way is to call gnu-configize --force ${S}.
>

this only works if the system uses autotools
in full respect. x264 has a hand woven configure
but rely on other parts of autotools. So we have to
stay with proposed solution.

> Ross

