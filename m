Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1So5ej-0002HM-SP
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 06:33:05 +0200
Received: by eaal1 with SMTP id l1so3917506eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 21:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6ZpBemyVYsBzj126oFKtXuXzHYymH+fnpeIsLRtBKbY=;
	b=x0uI42lh9yvAKTJ4uzJ4V3LF2jCy+l+swboTGcuA5KHT/HhY0bwX0a/QO/Qphc3mH6
	hasjC5uYcGEzJlTR0kWhl8ZI7KOr5JJXO5d4LS1nXKnMXQuiXxjiKDafxoYiEOUJuE5F
	v+FKbNMZi/bL2vM7R71XpBXoIO84nEcMH640UXb66YP1tRwkepB1brH+SceLY6MK6hQM
	Xr0K076aHUb/fKekwuIuKT+zR3Ocl2z23AkQwJUn27V0hLI3drRq4ySJwfdAcAYVaFgT
	9+bkZ52sqGU+ABVnt6U+fxBoX1b7S7h80Qy6YezwhCwyz4pHaXzLfU+Yjj6/bUXXjbpb
	P5dA==
Received: by 10.14.53.4 with SMTP id f4mr9427287eec.93.1341807716959; Sun, 08
	Jul 2012 21:21:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Sun, 8 Jul 2012 21:21:26 -0700 (PDT)
In-Reply-To: <4FF9F81B.2010204@linux.intel.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
	<4FF9F81B.2010204@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Jul 2012 21:21:26 -0700
Message-ID: <CAMKF1sorLj7iQHfrjCp=3gtYAW1HXfeaWuLRUdaBF89ObbCgYg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 00/14] eglibc 2.16
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
X-List-Received-Date: Mon, 09 Jul 2012 04:33:06 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 8, 2012 at 2:14 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Khem,
>
> Not sure if this one is on your radar:
>
>> | builtin-sched.c: In function 'get_cpu_usage_nsec_parent':
>> | builtin-sched.c:396:16: error: storage size of 'ru' isn't known
>> | builtin-sched.c:400:2: error: implicit declaration of function
>> 'getrusage' [-Werror=implicit-function-declaration]
>> | builtin-sched.c:400:2: error: nested extern declaration of 'getrusage'
>> [-Werror=nested-externs]
>> | builtin-sched.c:400:18: error: 'RUSAGE_SELF' undeclared (first use in
>> this function)
>> | builtin-sched.c:400:18: note: each undeclared identifier is reported
>> only once for each function it appears in
>> | builtin-sched.c:396:16: error: unused variable 'ru'
>> [-Werror=unused-variable]
>> | cc1: all warnings being treated as errors

Saul

I did not get this probably this is combination of new libc and new perf
Can you aff

#include <sys/resource.h>

to
builtin-sched.c in perf sources

and see if that solves the issue.

-Khem


