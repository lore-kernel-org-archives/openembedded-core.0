Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id EA8FD78482
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 16:04:18 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id z184so12923569pgd.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 08:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fp7isjdqIsMUZWfHH1aJev7gMjrSK42rEoElKSHGY4w=;
	b=Kq8CGyJRmWa9z4T/FqoKnNMiHTrTpILPCEwsXIo3uxfpFtI5KAuQcF1rtKpzoExsQs
	EdRmHdd9hBzWQWdJQh+b3dGOra3nxFQVzkq3XGt0oNiCvNfrPfiD4ZsWB+tpH3s1t31i
	E8y3McQWOCGBegKFAyh78j37GinSNmdEigzL7RHFl3dNdzCQtHs4RssCPNSkZ+YvZdVD
	TN4Wgza8qsZBRIDltBWFZQR7jrteqkMCVcBRyKlw3GlU2tH57/gWRRE7p+ySW5aZM/DZ
	61e1M6VTccvZ4FWHpUWVH8rHYZmwoEe5DzPlucHruxl4yAQQhblvJbDe6jkfTrAhQlEF
	um5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fp7isjdqIsMUZWfHH1aJev7gMjrSK42rEoElKSHGY4w=;
	b=O/xT6g5W62Q63rDw1eA41rhPyMKJzOqFHTQYKvDTmpv08xOAIN7kmHhCpJRkpvWEQ6
	+pSoCovl/uMhdteUd0//YEfhporvozr8iXFISBhHZztSsDHEmwABX7m/HDbSkdLQYELG
	dj63ctpGpvctZI1hRCll9/sdDVwLmgf3AD12ZcjZOUh3/lFtnytQG4Q8RZ4KoZj1Q26l
	ePorNbjAnKJdeuP3mjLCPEgDtFcVg/4RPvREEiZxwVcwQ88OU3WPWVXqkAI9RPiu8cDH
	n7muI3MRRKG5MZNA7WtnI9J2ObyqEQjo3vNTEsUuSvilKNxUR75LVQC4mZV4HKxWP7x0
	l3UQ==
X-Gm-Message-State: AJaThX6jgmyhJrLfWEet1vnFBRYOLKf7RFKmdknGpkVCeOJ94t4alUhm
	a+XvEC1IStq3zFbegohbkp++fq+dQ6kcQctkaMk=
X-Google-Smtp-Source: AGs4zMbtU1mJT/Fnfzx6/q+V7JDrcbNBPKP2UsB2B+0jk68fUJVufR/ytduHGflVcCOD9ZfaokQJ5O1ynISLkYW2yLY=
X-Received: by 10.99.109.2 with SMTP id i2mr16399883pgc.269.1510761860022;
	Wed, 15 Nov 2017 08:04:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.167.106 with HTTP; Wed, 15 Nov 2017 08:03:49 -0800 (PST)
In-Reply-To: <a3256d70-fe9e-8dd3-0f46-825f6be0cb76@gmail.com>
References: <cover.1510715185.git.raj.khem@gmail.com>
	<bbb2b97f66c8c7ab5f32ea229d81e1d81e980d3b.1510715185.git.raj.khem@gmail.com>
	<a3256d70-fe9e-8dd3-0f46-825f6be0cb76@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Nov 2017 08:03:49 -0800
Message-ID: <CAMKF1sp-6Z8iJjryBSt++FrHju6pDqx-sYA0Bn3r23zAp8PDSw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] gdb: Upgrade to 8.0.1
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
X-List-Received-Date: Wed, 15 Nov 2017 16:04:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 7:27 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 11/14/2017 07:09 PM, Khem Raj wrote:
>> Minor bugfix release, details are here
>> https://sourceware.org/ml/gdb-announce/2017/msg00004.html
> Since these are bug fixes only, its it update backport to Rocko?
>

yes it is.

> - armin
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/gdb/{gdb-8.0.inc => gdb-8.0.1.inc}              | 4 ++--
>>  .../gdb/{gdb-cross-canadian_8.0.bb => gdb-cross-canadian_8.0.1.bb}    | 0
>>  meta/recipes-devtools/gdb/{gdb-cross_8.0.bb => gdb-cross_8.0.1.bb}    | 0
>>  meta/recipes-devtools/gdb/{gdb_8.0.bb => gdb_8.0.1.bb}                | 0
>>  4 files changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-devtools/gdb/{gdb-8.0.inc => gdb-8.0.1.inc} (88%)
>>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.0.bb => gdb-cross-canadian_8.0.1.bb} (100%)
>>  rename meta/recipes-devtools/gdb/{gdb-cross_8.0.bb => gdb-cross_8.0.1.bb} (100%)
>>  rename meta/recipes-devtools/gdb/{gdb_8.0.bb => gdb_8.0.1.bb} (100%)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-8.0.inc b/meta/recipes-devtools/gdb/gdb-8.0.1.inc
>> similarity index 88%
>> rename from meta/recipes-devtools/gdb/gdb-8.0.inc
>> rename to meta/recipes-devtools/gdb/gdb-8.0.1.inc
>> index fba32ce12c..04a1c809db 100644
>> --- a/meta/recipes-devtools/gdb/gdb-8.0.inc
>> +++ b/meta/recipes-devtools/gdb/gdb-8.0.1.inc
>> @@ -17,6 +17,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
>>             file://0010-resolve-restrict-keyword-conflict.patch \
>>             file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
>>  "
>> -SRC_URI[md5sum] = "c3d35cd949084be53b92cc1e03485f88"
>> -SRC_URI[sha256sum] = "f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee"
>> +SRC_URI[md5sum] = "48cac527e6f3018b865ece021e9723ac"
>> +SRC_URI[sha256sum] = "3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a53f4c02d7d56295e3"
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.1.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.bb
>> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.1.bb
>> diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.0.bb b/meta/recipes-devtools/gdb/gdb-cross_8.0.1.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gdb/gdb-cross_8.0.bb
>> rename to meta/recipes-devtools/gdb/gdb-cross_8.0.1.bb
>> diff --git a/meta/recipes-devtools/gdb/gdb_8.0.bb b/meta/recipes-devtools/gdb/gdb_8.0.1.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gdb/gdb_8.0.bb
>> rename to meta/recipes-devtools/gdb/gdb_8.0.1.bb
>

