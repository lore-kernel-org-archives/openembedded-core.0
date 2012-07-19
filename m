Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1SrpFZ-0002xG-EF
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 13:50:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=3811; q=dns/txt;
	s=iport; t=1342697953; x=1343907553;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=cdb2NF0LedmVienE4RvaPkya4Mnw42iKIiWseZKbtMM=;
	b=E6SbHGNcE1MYxNPeEqX4vY2mj4KGlcatP0Ju4WyXKq5gTnKEITKp7VxY
	PezBgqvkvUVc4zzKindDdaeKR+zxTqZjJ4q0pRfUbejYvahKZcVc4rQPl
	UwCMj6reJtZYH2Fjo+2spFFquPdlg+s9aYkCkTnurrqOHWLt9VtiZOS/a U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EAFLwB1CQ/khR/2dsb2JhbABFuUeBB4IgAQEBAwEBAQEPAVsbCxgJJQ8CFgEvBg0GAgEBBRmHZQYLni2gB4tAhxADkxuCKYEThEaDUIR6gWaCYQ
X-IronPort-AV: E=Sophos;i="4.77,615,1336348800"; d="scan'208";a="75411542"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-2.cisco.com with ESMTP; 19 Jul 2012 11:39:11 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q6JBdBce008155
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 11:39:11 GMT
Message-ID: <5007F0C7.90605@cisco.com>
Date: Thu, 19 Jul 2012 13:34:31 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120628 Thunderbird/10.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342696517-28149-1-git-send-email-mertsas@cisco.com>
	<20120719113512.GK3331@jama.jama.net>
In-Reply-To: <20120719113512.GK3331@jama.jama.net>
Subject: Re: [PATCH] Changed SRC_URI for eglibc repo.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 11:50:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/19/12 13:35, Martin Jansa wrote:
> On Thu, Jul 19, 2012 at 01:15:17PM +0200, Martin Ertsaas wrote:
>> The branches repo for eglibc is /branches, not /svn/branches.
> Are you sure? wasn't this tested on broken bitbake where protocol param
> was ignored and default svn:// protocol was used instead http://?
>
> Cheers,
when was bitbake fixed for this? I have commit number
a93a58b7cea2ddb9596cb4d718c0801db5d1a295 from two days ago now. Was it a
broken bitbake?

- Martin

>
>> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
>> ---
>>  .../eglibc/cross-localedef-native_2.15.bb          |    2 +-
>>  .../eglibc/cross-localedef-native_2.16.bb          |    2 +-
>>  meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
>>  meta/recipes-core/eglibc/eglibc_2.16.bb            |    2 +-
>>  4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
>> index 422e0bb..4301174 100644
>> --- a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
>> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
>> @@ -16,7 +16,7 @@ inherit autotools
>>  PR = "r0"
>>  SRCREV="15225"
>>  EGLIBC_BRANCH="eglibc-2_14"
>> -SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
>> +SRC_URI = "svn://www.eglibc.org/branches/;module=${EGLIBC_BRANCH};protocol=http "
>>  S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
>>  
>>  do_unpack_append() {
>> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>> index 47f0834..12f1d8b 100644
>> --- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>> @@ -16,7 +16,7 @@ inherit autotools
>>  PR = "r0"
>>  SRCREV="19383"
>>  EGLIBC_BRANCH="eglibc-2_16"
>> -SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
>> +SRC_URI = "svn://www.eglibc.org/branches/;module=${EGLIBC_BRANCH};protocol=http "
>>  S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
>>  
>>  do_unpack_append() {
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
>> index 4d4d2cf..a72b076 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
>> @@ -7,7 +7,7 @@ PR = "r12"
>>  PR_append = "+svnr${SRCPV}"
>>  
>>  EGLIBC_BRANCH="eglibc-2_15"
>> -SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
>> +SRC_URI = "svn://www.eglibc.org/branches/;module=${EGLIBC_BRANCH};protocol=http \
>>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
>>             file://IO-acquire-lock-fix.patch \
>>             file://mips-rld-map-check.patch \
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
>> index 7e7d68b..d0cdd68 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
>> @@ -7,7 +7,7 @@ PR = "r1"
>>  PR_append = "+svnr${SRCPV}"
>>  
>>  EGLIBC_BRANCH="eglibc-2_16"
>> -SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
>> +SRC_URI = "svn://www.eglibc.org/branches/;module=${EGLIBC_BRANCH};protocol=http \
>>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
>>             file://IO-acquire-lock-fix.patch \
>>             file://mips-rld-map-check.patch \
>> -- 
>> 1.7.8.6
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



