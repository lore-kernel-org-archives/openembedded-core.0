Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 357AC6093E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 21:36:41 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id u84so3625550pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 14:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=j7ikvU+mtjgzCyfBuFFqfAB42dvu2eRrxuOO3cjdtxU=;
	b=rw8IbausUItLJg6D7Mntu4XSiKCwqLfbm/DL7RuU5dMmmn6t2Z7rjSCIyzeArbxka5
	qlB285oYDAlFD0WkILnbMseCRgFnakbhCEZigqIFNwdi6k2XAkQA2VgXQXO4nupnUrtX
	rqYpsgf93eLN4TPcE0uC7vXr01jvyVHDvzl7PdN9JGsIJ/4rA9nxO3fBg5lAel0uI+eW
	SzoyZgcLePKhqJwYTiom2WSjdYGo6VZ5qOyer8oQ2KezosFBi9FmlODzdV0Br2+p41uB
	9IA8qZOkA2i5RWly9ML+hzDzdUgjx8TZgO0eZNacQCWi6MW09E6FPHVgSkQlMWmUDgyI
	uiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=j7ikvU+mtjgzCyfBuFFqfAB42dvu2eRrxuOO3cjdtxU=;
	b=VcG/Z4Vz6ITNwNpAeqE8rXVShuJ0m3AUTLSQfgYEspvlziAg15qSNAkIJ+OLX1BkEj
	gv8PjGWmDta4D0iL4EnCW5aptZ5AG07a0zox7AJQ2Ti56K/7i1E5/5rAgGle6GarylEx
	8wuGljrLJkCoaogoFIna5v7I/sjiejnJcxkVv1QEhyTXY1JdccCb0CYTo13CCi30o5Ss
	FJkviCPD50Ip8OKfIItqZCWXYjPywyy2QOwqH96PnX4Tsv+v3flGQdeVArTfZJ6rTtvH
	ni4B9ymIzII0OKFGUdcVr0vgOCwsUWyK2Upb9Me5xdR9s53BjPxTASe4vj6/8orErY6M
	Ql9g==
X-Gm-Message-State: ABUngvc+KT6aWZapLtOhkH6LjtracXnbnkSHggxSjOGXLfBolYa+rmhZK9n6fHhpOydLDw==
X-Received: by 10.99.176.7 with SMTP id h7mr2874444pgf.170.1477604202714;
	Thu, 27 Oct 2016 14:36:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c57:6cb7:8938:cc04?
	([2601:202:4001:9ea0:c57:6cb7:8938:cc04])
	by smtp.gmail.com with ESMTPSA id
	e90sm13908699pfd.5.2016.10.27.14.36.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Oct 2016 14:36:42 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1476124325-6771-1-git-send-email-sgw@linux.intel.com>
	<1477600328.2097.1.camel@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <13e9b950-6aa1-359d-88d3-fff04b0dbfd1@gmail.com>
Date: Thu, 27 Oct 2016 14:36:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1477600328.2097.1.camel@intel.com>
Subject: Re: [PATCH][master][krogoth] archiver: fix gcc-source handling
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
X-List-Received-Date: Thu, 27 Oct 2016 21:36:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/27/2016 01:32 PM, Wold, Saul wrote:
> This has been merged to master ping for Krogoth
>
> Sau!

is in my staging work.
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/krogoth-next&id=d52071671f6b93a7653b8445bf9bf2b9a5c0e29a

I am working on getting a clean build out of the AB before doing a pull 
request. I suppose I should send a pre-pull request for review.

- armin
>
> On Mon, 2016-10-10 at 11:32 -0700, Saul Wold wrote:
>> The source archiver was not handling the gcc-source target correctly,
>> since it uses the
>> work-shared directory, we don't want to unpack and patch it twice,
>> just as the comments
>> say, but the code was not there to check for the gcc-source target.
>>
>> [YOCTO #10265]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>
>>   meta/classes/archiver.bbclass | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/archiver.bbclass
>> b/meta/classes/archiver.bbclass
>> index 1d8e863..9239983 100644
>> --- a/meta/classes/archiver.bbclass
>> +++ b/meta/classes/archiver.bbclass
>> @@ -303,9 +303,10 @@ python do_unpack_and_patch() {
>>           return
>>       ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
>>       ar_workdir = d.getVar('ARCHIVER_WORKDIR', True)
>> +    pn = d.getVar('PN', True)
>>   
>>       # The kernel class functions require it to be on work-shared, so
>> we dont change WORKDIR
>> -    if not bb.data.inherits_class('kernel-yocto', d):
>> +    if not (bb.data.inherits_class('kernel-yocto', d) or
>> pn.startswith('gcc-source')):
>>           # Change the WORKDIR to make do_unpack do_patch run in
>> another dir.
>>           d.setVar('WORKDIR', ar_workdir)
>>   
>> @@ -323,7 +324,7 @@ python do_unpack_and_patch() {
>>           oe.path.copytree(src, src_orig)
>>   
>>       # Make sure gcc and kernel sources are patched only once
>> -    if not ((d.getVar('SRC_URI', True) == "" or
>> bb.data.inherits_class('kernel-yocto', d))):
>> +    if not (d.getVar('SRC_URI', True) == "" or
>> (bb.data.inherits_class('kernel-yocto', d) or pn.startswith('gcc-
>> source'))):
>>           bb.build.exec_func('do_patch', d)
>>   
>>       # Create the patches
>> -- 
>> 2.7.4
>>


