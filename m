Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 535AD65CCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:22:02 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so6175771pab.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=QvAyct5Ky+f3iVDMd2illxdoGs979hNFReJU8LYfnWs=;
	b=U5oNm9nEBTYsSNJKzMeB/tFDKUAQTRYwdG8U52Kh4isrjDkgnyK2+oqv0ligMdxTXB
	ynyxveNCv4zaa9qDUnl8Daq/t4uWa+lEodtak6OoGsI15O5NhJ4nCmfw4P8H/MQJ5mD4
	KVi0ru6ZHzcJd8xCW7AHihhm9C+twTRBOwmQX8iqIf7ikC79jd54fDjXvt5fVoJjUaB8
	8SeRed3k/b5bQAy1KPAyMrQfjgs2VRCB7meRvWP0bcg8w6zgMa/tBH2J//8srctySsB/
	FmQo7hvZNrY0GgB1Bvb2/2ZgsoBigr38cpsKBa+7K4NzIK2R+3s9Ouq7qU81msTxv2Ot
	XIqw==
X-Gm-Message-State: ALoCoQms87yDj+DhWhrGeDEjk2rfq8EG/vIzemMRKDAq76RY+IVDAJiip20/K7jK8nFIwx9a5NsL
X-Received: by 10.70.131.134 with SMTP id om6mr23395242pdb.95.1405437723516;
	Tue, 15 Jul 2014 08:22:03 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	cm7sm19013005pdb.74.2014.07.15.08.22.02 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 08:22:02 -0700 (PDT)
Message-ID: <53C54719.60104@mvista.com>
Date: Tue, 15 Jul 2014 08:22:01 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1405430888-12456-1-git-send-email-akuster@mvista.com>
	<53C5436F.1070506@linux.intel.com>
In-Reply-To: <53C5436F.1070506@linux.intel.com>
Subject: Re: [meta-oe][PATCH] [v3] lz4: update to latest version
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
X-List-Received-Date: Tue, 15 Jul 2014 15:22:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 07/15/2014 08:06 AM, Saul Wold wrote:
> On 07/15/2014 06:28 AM, Armin Kuster wrote:
>> update to version r119
>> Use github instead of svn
>> LICENSE md5sum changed since it was updated in r117
>
> What exactly changed in r117?  Same License different working or ??

They updated the copyright date.

- Armin
>
> Sau!
>
>> FIxes CVE-2014-4611
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>   rename meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} (68%)
>>
>> diff --git a/meta/recipes-support/lz4/lz4_svn.bb 
>> b/meta/recipes-support/lz4/lz4_git.bb
>> similarity index 68%
>> rename from meta/recipes-support/lz4/lz4_svn.bb
>> rename to meta/recipes-support/lz4/lz4_git.bb
>> index 38e36d8..3978d76 100644
>> --- a/meta/recipes-support/lz4/lz4_svn.bb
>> +++ b/meta/recipes-support/lz4/lz4_git.bb
>> @@ -2,15 +2,12 @@ SUMMARY = "Extremely Fast Compression algorithm"
>>   DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, 
>> providing compression speed at 400 MB/s per core, scalable with 
>> multi-cores CPU. It also features an extremely fast decoder, with 
>> speed in multiple GB/s per core, typically reaching RAM speed limits 
>> on multi-core systems."
>>
>>   LICENSE = "BSD"
>> -LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850"
>> +LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
>>
>> -# Upstream names releases after SVN revs
>> -SRCREV = "112"
>> -PV = "r${SRCREV}"
>> +SRCREV = "28fd251bc7b42e5cde15f9a2d78fc53b3b575558"
>> +SRC_URI= "git://github.com/Cyan4973/lz4.git;branch=master"
>>
>> -SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
>> -
>> -S = "${WORKDIR}/trunk"
>> +S = "${WORKDIR}/git"
>>
>>   EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} 
>> LIBDIR=${libdir} INCLUDEDIR=${includedir}"
>>
>>


