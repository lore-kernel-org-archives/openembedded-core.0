Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 88D117F324
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 18:50:50 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id r26so18913987ioh.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 11:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=eCAXluZKcp+lgl6fj5yfMRV7A1U+B1L9C2oQKQ4wpeY=;
	b=ED4PWezjZNMd2XRZByZcXGmTlIU7veCe91tsVOebRmMT6I8vXtmwDwB7uaN+roYjUp
	Cl1Oq0NXpn17KiTFa5O1JyqSP9q4c1ygZVi1JPKALD4R0moJGDFhPSl/TIsA1DACU+Ea
	VPhJUdIaAlfiuHeHLkbJW9VxgENQ0ZRVPVvg4xdbYqhd+Rh4/3e/uoFDWMatQhHIh3Pf
	ZMtN4KCJNMVCOVC4hIiZJK81QsVqn02UKgVkQxtlEBEJygKsj44ZzjFvywFOTTxdOgFJ
	3yjijPwYVvZ86hdYSlOiD1LUH6SThZ9hoYdv2A8wA1dkqSnYoXrxBGjkMxDN5XjARzWN
	Nmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=eCAXluZKcp+lgl6fj5yfMRV7A1U+B1L9C2oQKQ4wpeY=;
	b=gQUVZqwAN9B7FY9dacFmsTZfXn8pYvYGC9ftUrZlNPRC9y3rB2349p/dMDozAJ61kG
	z2QX9FzYej7x7zW5O38kYCTHdjLxO23GwvtOegsCKmUFLe3rAVuFPy2+Kf53OjCSlmGv
	KJqYov+Azbx8V/saiZEccWyYVcYGiOeDegytp+LQzOBJm8nmDQibxouSpiKnCC9v9qg1
	as0sWWyXEhuktrjkn8U3XwX9ZEHhmCSGgN53ckJVPXw+oWVS811jGJYU1H3yfsDQJ4/+
	xSi4umkT0YbK7stnbXhVI/fD5HHfTaYFSL2xxF2n5cTgR/3x872AmFRIdyzz0MdKOg+6
	0c6Q==
X-Gm-Message-State: APjAAAXwnFcnudOmitJ4+FcHPRgccpeNd61njgvvcVQQLO3A0+4HpP3+
	AqAA6MneeQOkEtI7aY1fFZbJgw0d
X-Google-Smtp-Source: APXvYqxFywfF6vE6GVTzcXcK2+pdTTWIqTt9HosIv8EHWqU7yGGyZDgVTzamdSGmSPDsev2of4229w==
X-Received: by 2002:a92:bb47:: with SMTP id w68mr6973873ili.226.1569610250739; 
	Fri, 27 Sep 2019 11:50:50 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	o187sm1461591ila.13.2019.09.27.11.50.49
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 27 Sep 2019 11:50:50 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
References: <20190916182114.17200-1-JPEWhacker@gmail.com>
	<20190926175751.12195-1-JPEWhacker@gmail.com>
	<CAO5Uq5TPxmXq0NWQixMLKmH9goUCXm8Ov=BaB8S_9Pmy8DPCYg@mail.gmail.com>
Message-ID: <85ca2995-11fe-99e1-e2fa-866110a9f6b8@gmail.com>
Date: Fri, 27 Sep 2019 13:50:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5TPxmXq0NWQixMLKmH9goUCXm8Ov=BaB8S_9Pmy8DPCYg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] classes/reproducible_build: Move SDE deploy to another directory
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
X-List-Received-Date: Fri, 27 Sep 2019 18:50:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/27/19 1:03 PM, Alex Kiernan wrote:
> On Thu, Sep 26, 2019 at 6:58 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>> The deployment of the source date epoch file had a race condition where
>> any task attempting to read from the file would race with creation of
>> the sstate archive for the do_deploy_source_date_epoch task. The
>> creation of the sstate archive requires moving the directory to a
>> temporary location, then moving it back. This means that the file
>> disappears for a short period of time, which will cause a failure if any
>> other task is running and trying to open the file to get the current
>> source date epoch.
>>
>> The solution is to copy the source date epoch file to a separate
>> directory when deploying so the file never disappears. When the file is
>> restored from sstate, it is moved to the correct location after being
>> extracted.
>>
>> [YOCTO #13501]
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/classes/reproducible_build.bbclass | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
>> index 8788ad7145c..99b749a9ee2 100644
>> --- a/meta/classes/reproducible_build.bbclass
>> +++ b/meta/classes/reproducible_build.bbclass
>> @@ -39,19 +39,27 @@ inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'repr
>>
>>   SDE_DIR ="${WORKDIR}/source-date-epoch"
>>   SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
>> +SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
>>
>>   SSTATETASKS += "do_deploy_source_date_epoch"
>>
>>   do_deploy_source_date_epoch () {
>>       echo "Deploying SDE to ${SDE_DIR}."
>> +    mkdir -p ${SDE_DEPLOYDIR}
>> +    if [ -e ${SDE_FILE} ]; then
>> +        cp -p ${SDE_FILE} ${SDE_DEPLOYDIR}/__source_date_epoch.txt
>> +    fi
>>   }
>>
>>   python do_deploy_source_date_epoch_setscene () {
>>       sstate_setscene(d)
>> +    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_epoch.txt')
>> +    if os.path.exists(sde_file):
>> +        os.rename(sde_file, d.getVar('SDE_FILE'))
>>   }
>>
>> -do_deploy_source_date_epoch[dirs] = "${SDE_DIR}"
>> -do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DIR}"
>> +do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
>> +do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
>>   addtask do_deploy_source_date_epoch_setscene
>>   addtask do_deploy_source_date_epoch before do_configure after do_patch
>>
> This seems to have broken builds with reproducible builds enabled and
> sstate downloaded from a mirror - I just get a blizzard of:
>
> ERROR: Logfile of failure stored in:
> /home/akiernan/nanohub/build/tmp/work/x86_64-linux/automake-native/1.16.1-r0/temp/log.do_deploy_source_date_epoch_setscene.113823
> WARNING: Setscene task
> (virtual:native:/home/akiernan/nanohub/build/../poky/meta/recipes-devtools/automake/automake_1.16.1.bb:do_deploy_source_date_epoch_setscene)
> failed with exit code '1' - real task will be run instead
> ERROR: autoconf-native-2.69-r11 do_deploy_source_date_epoch_setscene:
> Error executing a python function in exec_python_func() autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>       0001:
>   *** 0002:do_deploy_source_date_epoch_setscene(d)
>       0003:
> File: '/home/akiernan/nanohub/build/../poky/meta/classes/reproducible_build.bbclass',
> lineno: 58, function: do_deploy_source_date_epoch_setscene
>       0054:python do_deploy_source_date_epoch_setscene () {
>       0055:    sstate_setscene(d)
>       0056:    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'),
> '__source_date_epoch.txt')
>       0057:    if os.path.exists(sde_file):
>   *** 0058:        os.rename(sde_file, d.getVar('SDE_FILE'))
>       0059:}
>       0060:
>       0061:do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
>       0062:do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
> Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '/home/akiernan/nanohub/build/tmp/work/x86_64-linux/autoconf-native/2.69-r11/deploy-source-date-epoch/__source_date_epoch.txt'
> -> '/home/akiernan/nanohub/build/tmp/work/x86_64-linux/autoconf-native/2.69-r11/source-date-epoch/__source_date_epoch.txt'

Sorry about that. It looks like destination directory isn't getting 
created. You can try giving 
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/hash-equivalence&id=7177bb4c4c174f0852b984b9b2d2d23de92e70cd 
a try to see if it resolves the issue.


>
> ERROR: Logfile of failure stored in:
> /home/akiernan/nanohub/build/tmp/work/x86_64-linux/autoconf-native/2.69-r11/temp/log.do_deploy_source_date_epoch_setscene.113869
> WARNING: Setscene task
> (virtual:native:/home/akiernan/nanohub/build/../poky/meta/recipes-devtools/autoconf/autoconf_2.69.bb:do_deploy_source_date_epoch_setscene)
> failed with exit code '1' - real task will be run instead
> ERROR: m4-native-1.4.18-r0 do_deploy_source_date_epoch_setscene: Error
> executing a python function in exec_python_func() autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>       0001:
>   *** 0002:do_deploy_source_date_epoch_setscene(d)
>       0003:
> File: '/home/akiernan/nanohub/build/../poky/meta/classes/reproducible_build.bbclass',
> lineno: 58, function: do_deploy_source_date_epoch_setscene
>       0054:python do_deploy_source_date_epoch_setscene () {
>       0055:    sstate_setscene(d)
>       0056:    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'),
> '__source_date_epoch.txt')
>       0057:    if os.path.exists(sde_file):
>   *** 0058:        os.rename(sde_file, d.getVar('SDE_FILE'))
>       0059:}
>       0060:
>       0061:do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
>       0062:do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
> Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '/home/akiernan/nanohub/build/tmp/work/x86_64-linux/m4-native/1.4.18-r0/deploy-source-date-epoch/__source_date_epoch.txt'
> -> '/home/akiernan/nanohub/build/tmp/work/x86_64-linux/m4-native/1.4.18-r0/source-date-epoch/__source_date_epoch.txt'
>
> ERROR: Logfile of failure stored in:
> /home/akiernan/nanohub/build/tmp/work/x86_64-linux/m4-native/1.4.18-r0/temp/log.do_deploy_source_date_epoch_setscene.113897
>
>

