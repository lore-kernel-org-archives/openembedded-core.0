Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF1B78269
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Oct 2017 02:36:28 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id i8so1024587pgd.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 19:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sTwIBQ0tWEsVCt+KwGWkraP3LI5fsB+ns8KU1l1ukwY=;
	b=aQ/XQgMNxUy0nQcwcPAVjcu4dfNb+Uos5Nv1EqTayOhjrkxg/323EMnJLfk5ZZ3wR5
	rhJiMvqLjX4kMLS1Ds4qWzZdyQGxBVHkCuZ99AgXMDF73GW3GzW/oZ2KDvGp35oh2sIx
	BLeODhywWM1J/2e0KOpsQ0PrZ3TEHRv58YBo/ipzV85ripKIJqz4O2fZNKXjYLw8wXLT
	czVUW0TBjCh5stSgDfB4WVyjrLNS2kHMli/Qh73Wt4KO/TIbFU87QAIcrGJ0twQLaj1U
	eICgo9GbNmChQbvLn7RB2IDZdG+J9KLGNBZZ7+nNd2u1pfTh060ejZXAy6aZxYGub/nZ
	8New==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sTwIBQ0tWEsVCt+KwGWkraP3LI5fsB+ns8KU1l1ukwY=;
	b=DBZ2iDddt3Os0s3buxQS8auDt+ndiIsVbkbpSkyPubXmzqMXROBx0ga68P/l+fPLP7
	21arar70w9SKB/ctjfA6rVKdJnXS/ZjPZe3RC1WwLo61qtq+I8xMTL0RMHHCKKY+SsXZ
	sCltGP28Oq1ivCQplTZDwss7iF5ylvs/PBG903b12u80AExCS4l0B6rh6P269Q5Zvz5x
	GBHlcqxpgGqBGiGk9AS7eRDt85X4nbbyFatqqTvvfsRTu3pMmSYwh87r1cDFkZXpleaV
	PQOa6dGpcIm1PbhgcmSToST8q6pt29x0QChlatWFYPHhTdw9oWD9CrBiw5orI+zgIWSh
	mHWQ==
X-Gm-Message-State: AMCzsaWBtBejB+yNN1F1Lc1MU4mMydUnobAplOKQCDyOWrtlQSNhY8JA
	eSOykBrE8UozEjPqxfQH4tKvTfoFa8Zvfk7inps=
X-Google-Smtp-Source: AOwi7QBIW/Mf7Z1Q898JREDTAvpgcVUaZbajKy8b9cLf2wO7y46Zo0XoKcWVHj8JlEgN85xCZJL7P7+XMdnJDyJ+diM=
X-Received: by 10.99.181.68 with SMTP id u4mr3670774pgo.317.1507343789988;
	Fri, 06 Oct 2017 19:36:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Fri, 6 Oct 2017 19:35:59 -0700 (PDT)
In-Reply-To: <94360711-c98a-a103-20c4-6fa4e5d70ef7@windriver.com>
References: <1485350316-4842-1-git-send-email-ed.bartosh@linux.intel.com>
	<94360711-c98a-a103-20c4-6fa4e5d70ef7@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Oct 2017 19:35:59 -0700
Message-ID: <CAMKF1sodenAYDuMXv1ijTd71C=38TCGeqjN52SjCrq-PznKZow@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-shar-extract: compare SDK and host gcc versions
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
X-List-Received-Date: Sat, 07 Oct 2017 02:36:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 5, 2017 at 10:43 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> I realize this reply is months after the original email.  But I think I found a
> bug with the implementation.  See below inline.
>
> On 1/25/17 7:18 AM, Ed Bartosh wrote:
>> If ext sdk is built by gcc version higher than host gcc version
>> and host gcc version is 4.8 or 4.9 the installation is known to
>> fail due to the way uninative sstate package is built.
>>
>> It's a known issue and we don't have a way to fix it for above
>> mentioned combinations of build and host gcc versions.
>>
>> Detected non-installable combinations of gcc versions and
>> print an installation error.
>>
>> [YOCTO #10881]
>>
>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>> ---
>>  meta/classes/populate_sdk_base.bbclass | 1 +
>>  meta/files/toolchain-shar-extract.sh   | 8 ++++++++
>>  2 files changed, 9 insertions(+)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index 5ad08c6..588a3cb 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -226,6 +226,7 @@ EOF
>>               -e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
>>               -e '/@SDK_PRE_INSTALL_COMMAND@/d' \
>>               -e '/@SDK_POST_INSTALL_COMMAND@/d' \
>> +             -e 's#@SDK_GCC_VER@#${@oe.utils.host_gcc_version(d)}#g' \
>
> The return value from "oe.utils.host_gcc_version(d)" includes a leading '-'...
>
>>               ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
>>
>>       # add execution permission
>> diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
>> index 9295ddc..3f54c96 100644
>> --- a/meta/files/toolchain-shar-extract.sh
>> +++ b/meta/files/toolchain-shar-extract.sh
>> @@ -11,6 +11,9 @@ export PATH=`echo "$PATH" | sed -e 's/:\.//' -e 's/::/:/'`
>>  INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>>  SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>>
>> +INST_GCC_VER=$(gcc --version | sed -ne 's/.* \([0-9]\+\.[0-9]\+\)\.[0-9]\+.*/\1/p')
>
> The item above fails with the message:
>
> line 28: gcc: command not found
>
> If the host does not have gcc on it.  (I realize this is incredibly rare
> situation, but is valid in some cases.)  It might be a good idea to catch this
> and put up a warning or otherwise clean up the error situation.
>

I think if we need gcc then we should sanitize the installer to check-before-use
so end user gets a good error message.


>> +SDK_GCC_VER='@SDK_GCC_VER@'
>> +
>
> So based on the above you will end up with:
>
> INST_GCC_VER="4.8"
> SDK_GCC_VER="-4.9"
>
>>  verlte () {
>>       [  "$1" = "`printf "$1\n$2" | sort -V | head -n1`" ]
>>  }
>> @@ -112,6 +115,11 @@ fi
>>  # SDK_EXTENSIBLE is exposed from the SDK_PRE_INSTALL_COMMAND above
>>  if [ "$SDK_EXTENSIBLE" = "1" ]; then
>>       DEFAULT_INSTALL_DIR="@SDKEXTPATH@"
>> +     if [ "$INST_GCC_VER" = '4.8' -a "$SDK_GCC_VER" = '4.9' ] || [ "$INST_GCC_VER" = '4.8' -a "$SDK_GCC_VER" = '' ] || \
>> +             [ "$INST_GCC_VER" = '4.9' -a "$SDK_GCC_VER" = '' ]; then
>
> The comparisons above do not include the leading '-', so it would appear to me
> that the checked would never end up being true -- and thus the error below would
> never happen.
>
> Am I seeing what is happening right?  If so, we'll need to get this fixed...
>
> --Mark
>
>
>> +             echo "Error: Incompatible SDK installer! Your host gcc version is $INST_GCC_VER and this SDK was built by gcc higher version."
>> +             exit 1
>> +     fi
>>  fi
>>
>>  if [ "$target_sdk_dir" = "" ]; then
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

