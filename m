Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TivKd-0005HQ-BD
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 00:03:15 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so1379749iad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 14:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=J+g7a4EhK+phfu6qYxgVW6L15jlP8rs03jIam8v3TKk=;
	b=kTleAjWrOMCMqxlOp5ELbAB7JFWA8OynLxPiMKPZEMYUuuNUxGBv9m2Ur5vphKg1Ii
	hOFuwsHxLB7WHdn97ywcl0P8OTSe/cF3VTFzxkXDgPZWvKYCwgJtUVo4OpQWTw5cbTb0
	95NFrtS0Gg9ay9PzbDEqgtR8wGWWmUg76L+2Q2+fGQmyJMPHf3GqI+IyZy1vEHYjWO84
	qgVoIxB0P7EVIgD2JQrMLRtBHt9bdQStFGcJSuQkcdR/d31G8HvyaNPZD+o0bHtUROqN
	9ZRGGITruQNSLv457BKTH9gidh4PFOK3VzFVARXzTqqCJ7iClXufGOmvWEEpPATj91iE
	2pcw==
MIME-Version: 1.0
Received: by 10.43.133.197 with SMTP id hz5mr31454icc.6.1355352520834; Wed, 12
	Dec 2012 14:48:40 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Wed, 12 Dec 2012 14:48:40 -0800 (PST)
In-Reply-To: <50C8062C.9050408@linux.intel.com>
References: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
	<50C8062C.9050408@linux.intel.com>
Date: Thu, 13 Dec 2012 00:48:40 +0200
Message-ID: <CAF6bG8daZ1x-XxCoTqrLh=1=8BjT4iwQxYuTem1M1hUR9qnyAw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: update to upstream version 8.20
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 23:03:15 -0000
Content-Type: text/plain; charset=UTF-8

On 12 December 2012 06:21, Saul Wold <sgw@linux.intel.com> wrote:
> On 11/30/2012 03:08 AM, Marko Lindqvist wrote:
>>
>> * remove-gets.patch removed as issue is fixed upstream
>> * cross-prime-list.patch added to fix cross-compilation
>> * noman.patch added to disable manpage creation that does not
>>    work while cross-compiling
>>
>> * License texts are identical to old, but old md5sum was
>>    erronously calculated from the beginning of the ls.c file, and
>>    not from the beginning of license text segment.
>>
>> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>> ---
>>   .../coreutils/coreutils-8.14/remove-gets.patch     |   23
>> ----------------
>>   .../coreutils-build-with-acl.patch                 |    0
>>   .../coreutils-8.20/cross-prime-list.patch          |   29
>> ++++++++++++++++++++
>>   .../coreutils/coreutils-8.20/noman.patch           |   19 +++++++++++++
>>   .../remove-usr-local-lib-from-m4.patch             |    0
>>   .../{coreutils_8.14.bb => coreutils_8.20.bb}       |   11 ++++----
>>   6 files changed, 54 insertions(+), 28 deletions(-)
>>   delete mode 100644
>> meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
>>   rename meta/recipes-core/coreutils/{coreutils-8.14 =>
>> coreutils-8.20}/coreutils-build-with-acl.patch (100%)
>>   create mode 100644
>> meta/recipes-core/coreutils/coreutils-8.20/cross-prime-list.patch
>>   create mode 100644
>> meta/recipes-core/coreutils/coreutils-8.20/noman.patch
>>   rename meta/recipes-core/coreutils/{coreutils-8.14 =>
>> coreutils-8.20}/remove-usr-local-lib-from-m4.patch (100%)
>>   rename meta/recipes-core/coreutils/{coreutils_8.14.bb =>
>> coreutils_8.20.bb} (91%)
>>
> This patch has been in and out of Master_Under_Test for a week or so, I keep
> seeing a failure and had not kept the right build, this time I have it and
> here's the failure:
>>
>> | mips-poky-linux-gcc  -meb -mabi=32   -mhard-float -march=mips32
>> --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips
>> -std=gnu99  -I. -I./lib  -Ilib -I./lib -Isrc -I./src    -O2 -pipe -g
>> -feliminate-unused-debug-types -c -o src/false.o src/false.c
>> | src/factor.c: In function 'factor_using_division':
>> | src/factor.c:766:11: error: unable to emulate 'TI'

 As I wrote 2-Dec, the prime list generation patch is likely to have
issues. I've been considering to just leave coreutils update for now
and to wait for next upstream version with no need for such a patch.
 As for your mips build failure, I'm investigating it so that I can at
least report bug for upstream to fix.


 - ML


