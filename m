Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE51746A1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 03:49:32 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id a22-v6so14509354lfg.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 20:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZBEYP2fFGIO3tQb+ubaztZS7ohCf7oDr0dM9xM7muis=;
	b=naQIOkJVM3BE4RzBzmWU0/UZ/Qv1sxWgHLPiLK76msiJRulytV/3k6B2RhfI3Q9jht
	jL7LXnUoxVAzJ/IqL/N3yIJUP7FuLzBT+VnHy4hWho2ykP71lr7Sc+KY/F2RKE1BJDaU
	CMyHW/CVDd3McDvmhIO1J5HWkwVJqBHtk9/MwlzlDiv3JFBSTJVjTIH+zOX/BCnylW56
	izO/Rr3VDapR7u+TMa6l+ZSIvacYEss18ueUqPXByu9cMAAxhPCMoeOMcTUZznFJ6ROu
	XaUCCkTgxGK0X/JMsl0znmTV+WfOhIkUUl76J/2zRXps0aIoaPpnDVznsQJTKG6/eA0T
	x9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZBEYP2fFGIO3tQb+ubaztZS7ohCf7oDr0dM9xM7muis=;
	b=GfDLmYIBIweqT9EgmbCEm9JM/pCyKx+LTfdbn8RB+aBa+yGah+c9Z2J22DhBgLwfK2
	ZftinIyL2VKcXoEaxc1SV3XdTc6I1OyvOnbSPBOqpA9NrZuZ80YrQhhqN8+ARV7EgCHx
	Bhvqj3rr3CEYd2XuRLMGBaL//SQ1Q5LPJ1ZiTLBfgMd4CplGX9htRj1EQvBVDDyTXaAw
	6egU8KCYlPahcNJJj/G91qpgH7QUDPEcn18M4CkaLwLdJw/Qtt2O/Ke8r1sfRynqUE90
	OvJXdwxVvicTRbg0DZfzJhkbFHcxaQyEEAe2slI5FEP8lcA0LHkNYqHqo0NMu60n3EIL
	y8Ug==
X-Gm-Message-State: ALQs6tA+nHrDvnPrUW52XdpYyDPSR3kqprmFjB+UYsBb/6GOilD4yfCH
	VC7ZUKVYXzYwe7cIAyzg9OzA0aXA74z78vOjjdQ=
X-Google-Smtp-Source: AIpwx49WS4eXy4f0AJrWCaMGslCFzRpp6WYTH0GoJFyk4+c28vmrHK/xw6fYOyZJE0vN6k3k4F3ZXiXzTUjaJs1fXUg=
X-Received: by 10.46.117.2 with SMTP id q2mr826149ljc.12.1522468173303; Fri,
	30 Mar 2018 20:49:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Fri, 30 Mar 2018 20:49:32 -0700 (PDT)
In-Reply-To: <CAMKF1so_JMxhfKBRaVuroPUfe+0QiVSDPaG0bLqCGy7rUgVNCA@mail.gmail.com>
References: <1522443068-43048-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1so_JMxhfKBRaVuroPUfe+0QiVSDPaG0bLqCGy7rUgVNCA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Mar 2018 23:49:32 -0400
Message-ID: <CADkTA4OYBm5YHYaVwKaoU8UsPqcGytR9nrBJYBAfLsRd5dkaQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto_4.14.bb: fix for deterministic srcversion
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
X-List-Received-Date: Sat, 31 Mar 2018 03:49:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 30, 2018 at 7:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Mar 30, 2018 at 1:51 PM, Juro Bystricky
> <juro.bystricky@intel.com> wrote:
>> "srcversion" field inserted into module modinfo section contains a
>> sum of the source files which made it. However, this field can
>> be incorrect. Building the same module can end up having inconsistent
>> srcversion field eventhough the sources remain the same.
>>
>> This basically negates the whole purpose of the field srcversion,
>> and breaks build reproducibility as well.
>>
>> The problem is fairly easy reproduceable by comparing "srcversion" of
>> kernel modules built in a workplace of a short directory name with
>> "srcversion" of the same modules built in a workplace of a fairly long
>> directory name.
>>
>> The reason for incorrect srcversion is that some source files can be
>> simply silently skipped from the checksum calculation due to limited
>> buffer space for line parsing.
>>
>> [YOCTO #12544]
>>
>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> ---
>>  .../modpost-srcversion-sometimes-incorrect.patch   | 48 ++++++++++++++++++++++
>>  meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  4 +-
>>  2 files changed, 51 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
>>
>> diff --git a/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch b/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
>> new file mode 100644
>> index 0000000..1680293
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
>> @@ -0,0 +1,48 @@
>> +"srcversion" field inserted into module modinfo section contains a
>> +sum of the source files which made it. However, this field can
>> +be incorrect. Building the same module can end up having inconsistent
>> +srcversion field eventhough the sources remain the same.
>> +This can be reproduced by building modules in a deeply nested directory,
>> +but other factors contribute as well.
>> +
>> +The reason for incorrect srcversion is that some source files can be
>> +simply silently skipped from the checksum calculation due to limited
>> +buffer space for line parsing.
>> +
>> +This patch addresses two issues:
>> +
>> +1. Allocates a larger line buffer (32k vs 4k).
>> +2. Issues a warning if a line length exceeds the line buffer.
>> +
>> +Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10318141/]
>> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> +
>> +diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>> +index 9917f92..955f26e 100644
>> +--- a/scripts/mod/modpost.c
>> ++++ b/scripts/mod/modpost.c
>> +@@ -385,9 +385,10 @@ void *grab_file(const char *filename, unsigned long *size)
>> +   * spaces in the beginning of the line is trimmed away.
>> +   * Return a pointer to a static buffer.
>> +   **/
>> ++#define MODPOST_MAX_LINE 32768
>> + char *get_next_line(unsigned long *pos, void *file, unsigned long size)
>> + {
>> +-      static char line[4096];
>> ++      static char line[MODPOST_MAX_LINE];
>> +       int skip = 1;
>> +       size_t len = 0;
>> +       signed char *p = (signed char *)file + *pos;
>> +@@ -402,8 +403,11 @@ char *get_next_line(unsigned long *pos, void *file, unsigned long size)
>> +               if (*p != '\n' && (*pos < size)) {
>> +                       len++;
>> +                       *s++ = *p++;
>> +-                      if (len > 4095)
>> ++                      if (len > (sizeof(line)-1)) {
>> ++                              warn(" %s: line exceeds buffer size %zu bytes\n"
>> ++                                   , __func__, sizeof(line));
>> +                               break; /* Too long, stop */
>> ++                      }
>
> this should be upstreamed into kernel as well.

Yup. Juro had this in the actual patch:

Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10318141/]

So we can watch its progress as well.

Bruce

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

