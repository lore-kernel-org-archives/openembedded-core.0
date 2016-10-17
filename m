Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DC6F9719BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 23:22:26 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s8so13588985pfj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=VkgB/N6wD22INou8+1YKJUI4/RojK7xUZcXZoLKN4p8=;
	b=BXQY0m96YJWgcdOHTgbFMvjfCYfqMo0Rf9fuXFRFfEefWNaf9YVwFa002X6YZnIJMX
	LBfSrxp52APuQD3RFz+WZ2+ssAUeKMhIhveYwWmK5SxlCc7fpW+fgFdrBTUrJqPyUP50
	xZuZiU0T2+pKXUrag//ydcxi2rKcWCMWkMjgMuEpdmLeB/vSFCmG8NaPxYqiVEqOB5kp
	ycGsB0pP0cjVWoNcHwmvfEec4xTBUxaynLboxKXj0YVR28SgaHKBULeScYfzxhqXo6DU
	B720h4nlDTImvoyJSau6L0hIxolypWld/kLanZnFeH10/U5UU+obj67R2ubrd7mPITgj
	wfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=VkgB/N6wD22INou8+1YKJUI4/RojK7xUZcXZoLKN4p8=;
	b=jSVs/SzToH5RWKc0zBb1sl8GHlvRErkjRg4M2uohQhgP8YePj2nuKHM6DqAVDj/0VZ
	pR3Okr+UBisMLjZ/wZ6czzHzHE6ARe1hU58W1RCUcf5RVVzqEUANY1NCI2VSmywd+owE
	UuVDBedrOPyePombqrNZfW3lPDoHYxr14DEZH4DLDnqM2HLqaDK1279mLahTzMHyRpMi
	CjhUPu0xWv5U4MnE8R+PlKhav21nd69Jn3b9+viyBGm8GwFj4KifmCZtU7EHvfozP14P
	MeZMxYPQijchAKgBnWccNEZpoE2ERp1tAUNovECqOd5GzP+yhsmA3VJ6nFeiPiGtj2Ni
	p7Eg==
X-Gm-Message-State: AA6/9Rk+yej2vE9yuhy5CXRGFAFFvLrtOhai+lr5KZaYTlFhxCopCnHUjRo9nHY1/Fg1nQ==
X-Received: by 10.99.157.135 with SMTP id i129mr23405pgd.16.1476746547814;
	Mon, 17 Oct 2016 16:22:27 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:5ef:e28f:5dce:e040?
	([2601:202:4001:9ea0:5ef:e28f:5dce:e040])
	by smtp.gmail.com with ESMTPSA id
	zm17sm43387679pab.5.2016.10.17.16.22.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Oct 2016 16:22:17 -0700 (PDT)
To: Saul Wold <saul.wold@intel.com>, openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
References: <1476124325-6771-1-git-send-email-sgw@linux.intel.com>
	<1476714346.31798.249.camel@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <dc336f0e-99da-8962-226c-8d578af5e674@gmail.com>
Date: Mon, 17 Oct 2016 16:22:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476714346.31798.249.camel@intel.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 23:22:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/17/2016 07:25 AM, Saul Wold wrote:
> This has been merged to master ping for Krogoth
Merged to my stagging.  Thanks for the reminder.

- armin
>
> Sau!
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


