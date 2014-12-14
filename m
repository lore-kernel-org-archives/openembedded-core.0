Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 610397113B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Dec 2014 17:57:56 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y13so10249222pdi.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Dec 2014 09:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=a8AnaLB/0LjwPnaLNxpqm7f1tkwZ9yiimWg0+b2/M5Q=;
	b=O0YcDPL5GhSROAOaU+jlyAJzDkZdO+1uk7NTf6zRdEOAHtoK0zuXOHZa4iTwbp6Kts
	+/sYjS+Kw4FMHNzFttXIGejQilxaQ4fDPvIrt3RfeTiq74u0z8Cy7JCrbSZiCA9X6vZm
	C37SGfMZc8fUPLLgEkiImyvffAhyg7grwq5SX+/MCMs2wO98+2fhcKG1EHhIOE2phf1m
	3yxQMZ28xvd3I/sxtwiorbUaZmEFBYTQ/k4OIsswTaJWXlkHIG4IZndWE1RHx3bsFeb4
	LtSh0eI5ujzzkcPUpywPIMr2LrQLwgGcoCtSwIEH60VRc9/r3Sc1Mitp4fY+u5WVPlZ6
	Px4A==
X-Received: by 10.68.164.34 with SMTP id yn2mr44788431pbb.158.1418579877597;
	Sun, 14 Dec 2014 09:57:57 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:514e:15d4:f5e2:d462?
	([2601:c:9380:601:514e:15d4:f5e2:d462])
	by mx.google.com with ESMTPSA id do3sm7046500pac.48.2014.12.14.09.57.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Dec 2014 09:57:56 -0800 (PST)
Message-ID: <548DCF99.3060308@gmail.com>
Date: Sun, 14 Dec 2014 09:57:45 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>
References: <1418487971-12276-1-git-send-email-akuster808@gmail.com>
	<6C37BD56-04DD-4203-BB8E-92075DAD6C8E@gmail.com>
In-Reply-To: <6C37BD56-04DD-4203-BB8E-92075DAD6C8E@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [[PATCH] gnutls: upgrade to 3.3.11
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
X-List-Received-Date: Sun, 14 Dec 2014 17:57:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Khem,

I redid the patch several times and I end up with the same resulting 
changes as below. "-M" used every time. I am not sure what is going on.

- Armin


On 12/13/2014 01:05 PM, Khem Raj wrote:
>
>> On Dec 13, 2014, at 8:26 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>
>> this also includes a fix for CVE-2014-8564.
>>
>> see http://www.gnutls.org/security.html for CVE-2014-3566 "POODLE" statement.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>> meta/recipes-support/gnutls/gnutls_3.3.11.bb | 6 ++++++
>> meta/recipes-support/gnutls/gnutls_3.3.5.bb  | 7 -------
>> 2 files changed, 6 insertions(+), 7 deletions(-)
>> create mode 100644 meta/recipes-support/gnutls/gnutls_3.3.11.bb
>> delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.5.bb
>>
>> diff --git a/meta/recipes-support/gnutls/gnutls_3.3.11.bb b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
>> new file mode 100644
>> index 0000000..320c510
>> --- /dev/null
>> +++ b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
>> @@ -0,0 +1,6 @@
>> +require gnutls.inc
>> +
>> +SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
>> +           "
>> +SRC_URI[md5sum] = "b657e3010c10cae2244e7ce79ee3d446"
>> +SRC_URI[sha256sum] = "aef28d629b6ba824bd435f9b23506525e657e3746d4aa021296b13cbaaa6ae71"
>> diff --git a/meta/recipes-support/gnutls/gnutls_3.3.5.bb b/meta/recipes-support/gnutls/gnutls_3.3.5.bb
>> deleted file mode 100644
>> index b3daa49..0000000
>> --- a/meta/recipes-support/gnutls/gnutls_3.3.5.bb
>> +++ /dev/null
>> @@ -1,7 +0,0 @@
>> -require gnutls.inc
>> -
>> -SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
>> -           "
>> -
>> -SRC_URI[md5sum] = "1f396dcf3c14ea67de7243821006d1a2"
>> -SRC_URI[sha256sum] = "48f34ae032692c498e782e9f1369506572be40ecf7f3f3604b0b00bad1b10477"
>> --
>> 1.9.1
>
>
> This is a simple patch but it will be good if you used -M option for git format-patch so git tries
> a bit harder to detect renames.
>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

