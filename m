Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6B57E8F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:53:19 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r185so4892308iod.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 06:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ijQm+BJXVqzO+wfS7ctetGv18+DtOe9rSzhEptuV3So=;
	b=fmtKxWSxOA+L55DoL2AGpiW+ZhcudpLct6TzqTURIV7JhFSFAhSKUuRm+6qEBAlI99
	jBCD1C9RG254jIflPquTr7u6CAyPAq5eYA0+vNMNVDoXvqtJdZbrUY10ZLCi/z84sQnR
	Gd09xjFhE5RQ6sWQJN1E5sPTi51QRLap/ZYetxF4S030GhAmjSD9O7ytQDDMSsR3a6i2
	p6JsXdp0hH8cqAhYuwCtuwrvGhzuJbtiOxiSSaFMRbAIMJ+s0eh5eabXYrrv5BQlC+O4
	MaqpUrPzDaQApLqurlPHX7QbVyBwiTCn8lSD6WjUv+2TlzRvxfKMA2/DhuYJc4b/0477
	7dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ijQm+BJXVqzO+wfS7ctetGv18+DtOe9rSzhEptuV3So=;
	b=GqUVrI88fek3O0XY0gkt7gGoTaQyedx6uMulD9AwKju5b1F9yi6q8UQXFJFa13L6UR
	T2pU+ueyS8m8IOGTcj4A7bov5kxtS2RzujXfIEVm7ObTuXPM7I4ODqQKDUxikPJu37UU
	CbePCuJsU+LzWP0wDlmTQOR2FlAqa8phJpet/F8CoxOfhhyycXAtpJ65XfOwYNBtOjlu
	r3iaUQ58RMqF5ZCf9Il8RuBvBSOS9eKCg9LidquGmdm0s4vOYbHXpzPAubPykc+RfuZ2
	h0wEyevIsHRBh4mcRunS/08C9xHj4x7QpR2I9kSBRcvuImKK5yRYCuRNgvnUzNGJ1v7o
	DURA==
X-Gm-Message-State: APjAAAVX+uhsNR4i6Nn6wAyZAezHYN7pTKzOMnQPSuW9zAFAl7Bk+sl2
	RQnuMEqft1XNYOczdCokWg6TxeHrmMLd6cD1XSsCdA==
X-Google-Smtp-Source: APXvYqw2P6FpNbNFRKp0dn2XjKI7JxYdcokUv1VikYiNf2CW9x0EwoFLXa82U9O4WG0g5zvZKFGZbL0v6bmi9S4AAoM=
X-Received: by 2002:a02:b395:: with SMTP id p21mr4888182jan.31.1561643601002; 
	Thu, 27 Jun 2019 06:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190627122854.28435-1-ross.burton@intel.com>
	<CA+chaQcv680W=MSioGdQAM-deSYn4ghkFqGEs3OG3x3AhQEdyw@mail.gmail.com>
In-Reply-To: <CA+chaQcv680W=MSioGdQAM-deSYn4ghkFqGEs3OG3x3AhQEdyw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Jun 2019 14:53:07 +0100
Message-ID: <CAJTo0La=UzVwJPexN4kzcna6qdSSRUjJJUiUFtMaQ3X8KP+-rA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] buildhistory: write the contents of the sysroot
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
X-List-Received-Date: Thu, 27 Jun 2019 13:53:20 -0000
Content-Type: text/plain; charset="UTF-8"

Well spotted, thanks.

Changed in my branch.
Ross

On Thu, 27 Jun 2019 at 14:47, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> > Changes to the sysroot as just as
>
> small typo in commit message if you need to update this commit again for whatever other reason.
>
> On Thu, Jun 27, 2019 at 2:29 PM Ross Burton <ross.burton@intel.com> wrote:
>>
>> Changes to the sysroot as just as interesting during development, so write the
>> file listing for the sysroot to buildhistory too.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/classes/buildhistory.bbclass | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
>> index 2e501df24b4..baa7c8e2799 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -60,15 +60,23 @@ SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .= "| buildhistory_emit_outputsigs"
>>  # When extending build history, derive your class from buildhistory.bbclass
>>  # and extend this list here with the additional files created by the derived
>>  # class.
>> -BUILDHISTORY_PRESERVE = "latest latest_srcrev"
>> +BUILDHISTORY_PRESERVE = "latest latest_srcrev sysroot"
>>
>>  PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
>>  PATCH_GIT_USER_NAME ?= "OpenEmbedded"
>>
>> +buildhistory_emit_sysroot() {
>> +       mkdir --parents ${BUILDHISTORY_DIR_PACKAGE}
>> +       buildhistory_list_files ${SYSROOT_DESTDIR} ${BUILDHISTORY_DIR_PACKAGE}/sysroot
>> +}
>> +
>>  #
>>  # Write out metadata about this package for comparison when writing future packages
>>  #
>>  python buildhistory_emit_pkghistory() {
>> +    if d.getVar('BB_CURRENTTASK') in ['populate_sysroot', 'populate_sysroot_setscene']:
>> +        bb.build.exec_func("buildhistory_emit_sysroot", d)
>> +
>>      if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
>>          return 0
>>
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

