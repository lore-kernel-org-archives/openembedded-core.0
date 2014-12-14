Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id ED42465E38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Dec 2014 16:57:28 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so10256850pac.36
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Dec 2014 08:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=nuae0gVNo2BeiMndz8ImoosyZrZdABCfSLUhQORPRAw=;
	b=K+5AEDuI9i/IjXZiYhgtx52AqJG2MH0mnSBAZwrn9iJ4af+fqEtZiMbUDiCWUgbapZ
	ldcr6KWm+Yc3aZFiLrRI6wFXaEoTSg4P4eFwfJ1pgHZqzyc1LRaxl3Svlkkg+tAkNhtn
	SSGvfYeU5c1diAc8v3PjtJrJtkfrsQX/Guw5Nlku/e+YIpX912mgNauPheFoe2W9r22N
	KEBK29GiiJoSKEz0RxLJT/oNFwhpLRJea6KYsz0tYfBQcgI/PWOR1fT4bBmetkY4lHMQ
	y8Wcqj16h2tOfSBRU4M7my1LoWP8O0czMJYW+3OnR2cohV9lq/s8gw+bUIrhkB1/oGwz
	N7QA==
X-Received: by 10.68.241.10 with SMTP id we10mr43334466pbc.101.1418576249000; 
	Sun, 14 Dec 2014 08:57:29 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:514e:15d4:f5e2:d462?
	([2601:c:9380:601:514e:15d4:f5e2:d462])
	by mx.google.com with ESMTPSA id bf1sm6914671pbc.31.2014.12.14.08.57.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Dec 2014 08:57:27 -0800 (PST)
Message-ID: <548DC16B.6050507@gmail.com>
Date: Sun, 14 Dec 2014 08:57:15 -0800
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
X-List-Received-Date: Sun, 14 Dec 2014 16:57:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



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

Hmm, that is odd. I thought I used "-M"... will resend.

thanks,
Armin
>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

