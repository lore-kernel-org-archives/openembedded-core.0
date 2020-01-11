Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 28E6D7FD09
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 20:25:31 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id kx11so2414146pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 12:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=N960Y4mPy1nDdDQ6Y1KiMmN9uFqfemGACkyjAkRLisU=;
	b=nllzqiDYf5GWODfViXvgCPjk1MkU2PEsmQ9rxYVdPH7OwLcN+mebue3XoHi2ZCAggz
	3MKP/hD0MFi279/WdE7CKOSn45tAmoI44CgLG5umeo5DB2jbLeaX1JUbyJDe2G2Rq1bg
	XW7Dq2/YT6PIc3ts6EBTkj69EZ571mRGts3BjvYMCNWB2sCaoX4iLlK4vss3tk1QWFgd
	OEFOR9mlahbfcjNAH8A23HnDCpHmZHqLU2S4g6jfcsWnAseb6MgKkd3R2zp3aNJWJJNG
	GsuE8n9hYrfMwAXPrpFQhy0LrarpgTXlhIidXr1JB8GxC5zSFJm+CecdcHBJogDjVpIb
	anRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=N960Y4mPy1nDdDQ6Y1KiMmN9uFqfemGACkyjAkRLisU=;
	b=eBBLM0wfop1l25532R/LA1fQKaWXBcCwjTwQaG6h9O76K+cTLcWv0fA+cX3xzux3M8
	n1rKC+iipFgZvzKYf5xBqNNWSFZFElRmSzyL404VHayHVBU3Sgjv+iLzvCdn6Assf2nf
	ieQUhXfntP1FfLfXjAIILqfQfv7xY4Lqmtqr5iPecV+4y4x14vF7WMQVYuvEbT4lZBlN
	mPJoxwzgdBsM5rwvZH5kSCVPx14MtOfenUgzA54MeM2vwPBy8J5/zgAzrWhp1XPkxgur
	pFFMWEbpsnwcCoJ+J7pyCGNKFZxBfVNMCVZ+S6SVQ/PNPEXd9LHF6sMiqDq9D+uD6wDY
	HkVg==
X-Gm-Message-State: APjAAAUV8FIREW0GHYXEqd7SELeigwKT3WHaLuiHVfkZYIY5pFRYhIf+
	WVpGKPxjS2N8PBhfFuig3SEQF3M2
X-Google-Smtp-Source: APXvYqyqsnfMVav/8CwehNtK7vYnsSqTtM5ZrfMuSyb3NveGHs3zFfWqFABbN7P8eiBRZm0dJZeoQw==
X-Received: by 2002:a17:902:16b:: with SMTP id
	98mr6501572plb.218.1578774331932; 
	Sat, 11 Jan 2020 12:25:31 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:98c7:1e0a:f74a:68ce?
	([2601:202:4180:a5c0:98c7:1e0a:f74a:68ce])
	by smtp.gmail.com with ESMTPSA id q10sm8198770pfn.5.2020.01.11.12.25.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 11 Jan 2020 12:25:31 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20191211010609.4295-1-pkj@axis.com>
	<aa0b9ef432a44643a82dd82e72cc4f45@XBOX03.axis.com>
	<6452910c3cb64d55a7bda972f467c828@XBOX03.axis.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3bdf3df9-eaee-2de5-0b55-9c329c83c6c2@gmail.com>
Date: Sat, 11 Jan 2020 12:25:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6452910c3cb64d55a7bda972f467c828@XBOX03.axis.com>
Subject: Re: [master][zeus][PATCH] toaster.bbclass: Correct pkgdatadir path in toaster_package_dumpdata()
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
X-List-Received-Date: Sat, 11 Jan 2020 20:25:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/10/20 7:32 PM, Peter Kjellerstedt wrote:
> *ping*
Now that its in master,

I will queue it up for zeus.

- armin

>
> //Peter
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
>> bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
>> Sent: den 22 december 2019 14:02
>> To: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [master][zeus][PATCH] toaster.bbclass: Correct
>> pkgdatadir path in toaster_package_dumpdata()
>>
>> *ping*
>>
>> //Peter
>>
>>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-
>>> bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
>>> Sent: den 11 december 2019 02:06
>>> To: openembedded-core@lists.openembedded.org
>>> Subject: [OE-core] [master][zeus][PATCH] toaster.bbclass: Correct
>>> pkgdatadir path in toaster_package_dumpdata()
>>>
>>> In commit 692b2046 (package: Fix race between do_package and
>>> do_packagedata), the path used for do_packagedata[sstate-inputdirs]
>>> was changed from "${PKGDESTWORK}" to "${WORKDIR}/pkgdata-pdata-input".
>>> This commit adapts the path used for pkgdatadir in
>>> toaster_package_dumpdata() accordingly to avoid setscene errors like:
>>>
>>>   ERROR: libgcc-9.2.0-r0 do_packagedata_setscene: Error executing a
>>>   python function in exec_python_func() autogenerated:
>>>
>>>   The stack trace of python calls that resulted in this
>>>   exception/failure was:
>>>   File: 'exec_python_func() autogenerated', lineno: 2, function:
>>>   <module>
>>>        0001:
>>>    *** 0002:toaster_package_dumpdata(d)
>>>        0003:
>>>   File: 'meta/classes/toaster.bbclass', lineno: 130, function:
>>>   toaster_package_dumpdata
>>>        0126:    lpkgdata = {}
>>>        0127:    datadir = os.path.join(pkgdatadir, 'runtime')
>>>        0128:
>>>        0129:    # scan and send data for each generated package
>>>    *** 0130:    for datafile in os.listdir(datadir):
>>>        0131:        if not datafile.endswith('.packaged'):
>>>        0132:            lpkgdata = _toaster_load_pkgdatafile(datadir,
>>>        0133:            # Fire an event containing the pkg data
>>>        0134:            bb.event.fire(bb.event.MetadataEvent(
>>>   Exception: FileNotFoundError: [Errno 2] No such file or directory:
>>>   'tmp/work/mips32r2el-nf-poky-linux/libgcc/9.2.0-r0/pkgdata/runtime'
>>>
>>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>> ---
>>>  meta/classes/toaster.bbclass | 15 +++++++++++----
>>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
>>> index 6cef0b8f6e..6a65ecb957 100644
>>> --- a/meta/classes/toaster.bbclass
>>> +++ b/meta/classes/toaster.bbclass
>>> @@ -113,7 +113,7 @@ def _toaster_load_pkgdatafile(dirpath, filepath):
>>>                  pass    # ignore lines without valid key: value pairs
>>>      return pkgdata
>>>
>>> -python toaster_package_dumpdata() {
>>> +def _toaster_dumpdata(pkgdatadir, d):
>>>      """
>>>      Dumps the data about the packages created by a recipe
>>>      """
>>> @@ -122,7 +122,6 @@ python toaster_package_dumpdata() {
>>>      if not d.getVar('PACKAGES'):
>>>          return
>>>
>>> -    pkgdatadir = d.getVar('PKGDESTWORK')
>>>      lpkgdata = {}
>>>      datadir = os.path.join(pkgdatadir, 'runtime')
>>>
>>> @@ -132,6 +131,14 @@ python toaster_package_dumpdata() {
>>>              lpkgdata = _toaster_load_pkgdatafile(datadir, datafile)
>>>              # Fire an event containing the pkg data
>>>              bb.event.fire(bb.event.MetadataEvent("SinglePackageInfo",
>>> lpkgdata), d)
>>> +
>>> +python toaster_package_dumpdata() {
>>> +    _toaster_dumpdata(d.getVar('PKGDESTWORK'), d)
>>> +}
>>> +
>>> +python toaster_packagedata_dumpdata() {
>>> +    # This path needs to match do_packagedata[sstate-inputdirs]
>>> +    _toaster_dumpdata(os.path.join(d.getVar('WORKDIR'), 'pkgdata-pdata-
>>> input'), d)
>>>  }
>>>
>>>  # 2. Dump output image files information
>>> @@ -366,8 +373,8 @@ toaster_buildhistory_dump[eventmask] =
>>> "bb.event.BuildCompleted"
>>>  addhandler toaster_artifacts
>>>  toaster_artifacts[eventmask] = "bb.runqueue.runQueueTaskSkipped
>>> bb.runqueue.runQueueTaskCompleted"
>>>
>>> -do_packagedata_setscene[postfuncs] += "toaster_package_dumpdata "
>>> -do_packagedata_setscene[vardepsexclude] += "toaster_package_dumpdata "
>>> +do_packagedata_setscene[postfuncs] += "toaster_packagedata_dumpdata "
>>> +do_packagedata_setscene[vardepsexclude] +=
>> "toaster_packagedata_dumpdata
>>> "
>>>
>>>  do_package[postfuncs] += "toaster_package_dumpdata "
>>>  do_package[vardepsexclude] += "toaster_package_dumpdata "
>>> --
>>> 2.21.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


