Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8962E7808D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 11:01:03 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id c11so232485638wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 04:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F6N+/W0enn0uTfJd6ww21DOitn0E8TkYA7Styv5I7T4=;
	b=T7RcH9UV8gMOSkwMwlQHoeeYezT9zyIqzSPQyAadAN+DkZhXKBle1ooMWNB+8T7m82
	NSM0go+IUOgp4LQwo5M/ZTGpdHjS6beQUrddGdiZqEzcICMZwTZZbx5pkofvOg3J7MIp
	bxxzrALze0NgLOi2B7NRHKHUrvsbLoNsL9sCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F6N+/W0enn0uTfJd6ww21DOitn0E8TkYA7Styv5I7T4=;
	b=Qa4gJevawd8zZGsL86YOctq+gqsNHQApbRLy4qCqHi/eApzzz3ER4C9WvdLsx5cXMl
	WumtUygOFo4Jhyv4+6CHnWIhkFpEy72d0JVbMirx3OVKiVwANeSn6yixoCm0LSIyurmJ
	o/GEGii9qUIdtVcxdsmn3zAQqYVusCWgwAmHqvkhsXFxtxSgRWOUix2TtbRJjGzpCdKD
	EirkJ1zLUkcQkHKkAWk448ADLW66ZJp7o9dULrTMQRw67cIg6Cq7vGxg+K9f4W16KiEz
	/fbaFZNYWdstEqPlrjroMblN4Uw3YLKPiM0inoraQW6y1ArbdXD98NoQy2jZbmdBX0EG
	Kjgw==
X-Gm-Message-State: AKS2vOxBsPPIgjSO6eJ3gJ505rtXxO9xfmLD7fufbBzB5c63Ej6lPh0+
	IuZF+5A3+g43R98m+hrcIdxaoBGXEUC/
X-Received: by 10.223.128.209 with SMTP id 75mr25415888wrl.99.1499079664092;
	Mon, 03 Jul 2017 04:01:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.207.132 with HTTP; Mon, 3 Jul 2017 04:01:03 -0700 (PDT)
In-Reply-To: <20170703085935.GA17530@mbabyjoh-desk.ger.corp.intel.com>
References: <20170703080331.5973-1-fathi.boudra@linaro.org>
	<20170703085935.GA17530@mbabyjoh-desk.ger.corp.intel.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Mon, 3 Jul 2017 14:01:03 +0300
Message-ID: <CAGNsrLAjB-hT4-1XzU5ZakcCCFMY1quaPvBWH0mSTGrKafjiTA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: add acl, attr, curl and util-linux runtime dependencies
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
X-List-Received-Date: Mon, 03 Jul 2017 11:01:03 -0000
Content-Type: text/plain; charset="UTF-8"

On 3 July 2017 at 11:59, Maxin B. John <maxin.john@intel.com> wrote:
> Hi,
>
> On Mon, Jul 03, 2017 at 11:03:31AM +0300, Fathi Boudra wrote:
>> * Use a list and re-order alphabetically to make it easier to read and
>>   update.
>> * Add missing runtime dependencies:
>>   - acl (getfacl/setfacl commands are required)
>>   - attr (getfattr/setfattr commands are required)
>>   - curl (curl command is required)
>>   - util-linux (ipcs command is required)
>>
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  meta/recipes-extended/ltp/ltp_20170516.bb | 23 +++++++++++++++++++++--
>>  1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
>> index f537d60c15..564fdcf8c2 100644
>> --- a/meta/recipes-extended/ltp/ltp_20170516.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20170516.bb
>> @@ -95,7 +95,27 @@ do_install(){
>>      cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>>  }
>>
>> -RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd unzip gzip cpio cronie logrotate which at"
>> +RDEPENDS_${PN} = "
>> +    acl \
>> +    at \
>> +    attr \
>> +    bash \
>> +    cpio \
>> +    cronie \
>> +    curl \
>> +    e2fsprogs-mke2fs \
>> +    expect \
>> +    gawk \
>> +    gzip \
>> +    ldd \
>> +    libaio \
>> +    logrotate \
>> +    perl \
>> +    python-core \
>> +    unzip \
>> +    util-linux \
>> +    which \
>> +"
>
> These changes look good. However, this patch is causing a parser error:
> ERROR: ParseError at /home/maxin/poky/meta/recipes-extended/ltp/ltp_20170516.bb:98: unparsed line: 'RDEPENDS_${PN} = "
>
> Please fix it.

fixed in v2: https://patchwork.openembedded.org/patch/141483/

>>  FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a /opt/ltp/testcases/data/nm01/lib.a"
>>
>> @@ -106,4 +126,3 @@ INHIBIT_PACKAGE_STRIP = "1"
>>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>  # However, test_arch_stripped is already stripped, so...
>>  INSANE_SKIP_${PN} += "already-stripped"
>
> Best Regards,
> Maxin

