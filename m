Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF0C6C856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 06:39:12 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id i7so261102oag.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 23:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=yoAZhBmvH/f2sy6D0bAoNeSl0edZ9Cg9grMNpLSYeNo=;
	b=in0id8k2ky9XwusPpuhNzT2nYLeIhwlae5zC0kX+yBI41h0T0kXh8LcyYJwLNyn31t
	d1Y48YO0bOZoGcp9yBaPqCx/iwkoFlhKFfy7rEH3lcjQIxH3GW1lnlDL4g5YacwVhE+R
	2Fy5LgsGkmaVAFIirncViW4I1iiKzBYO3el8P5/YW7IddKXMrtg9Ruj+QLnXrVKCEC6E
	ffGmBVpXfLW4cfzMNOOLmJkKcTADHVeRfVQEBZrFK/C6eWybVkv32dXNxrCF+CFC879A
	zQBgxbVwVky1sa0J9vK1fZglqxDNqUY33AN7UobEr9D+OLNnOPZfQjkpsnYJw+8pWS8n
	Yq3Q==
MIME-Version: 1.0
X-Received: by 10.182.117.195 with SMTP id kg3mr2049278obb.17.1381905554773;
	Tue, 15 Oct 2013 23:39:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 15 Oct 2013 23:39:14 -0700 (PDT)
In-Reply-To: <525E3378.3070604@windriver.com>
References: <1381902795-3187-1-git-send-email-rongqing.li@windriver.com>
	<CAP9ODKpm_zpo+TyFDe0TSAXHs=MvFjouPjRNE0GcE9i6Lk_7Aw@mail.gmail.com>
	<525E3378.3070604@windriver.com>
Date: Wed, 16 Oct 2013 03:39:14 -0300
X-Google-Sender-Auth: KUCwrot0xqdyvXgIbKeN-BcxA0E
Message-ID: <CAP9ODKpmjfkkNu=Cyrom8-WE-_QJ7+5CtvXwXzuHJBy9RwZg3Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: repeat to tar archive file five time
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
X-List-Received-Date: Wed, 16 Oct 2013 06:39:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 16, 2013 at 3:34 AM, Rongqing Li <rongqing.li@windriver.com> wrote:
>
>
> On 10/16/2013 02:24 PM, Otavio Salvador wrote:
>>
>> On Wed, Oct 16, 2013 at 2:53 AM,  <rongqing.li@windriver.com> wrote:
>>>
>>> From: Roy Li <rongqing.li@windriver.com>
>>>
>>> [YOCTO #5287]
>>>
>>> tar failed and reported that file changed as we read it, now
>>> we workaround it
>>>
>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>
>>
>> You must be kidding right?! loop 5 times?!? why not fix the root cause
>> of the change?
>>
>
> Sorry, I do not know the root cause, and I see many people spent
> lots of efforts to investigate, but do not find the root cause,
> sometime we suspect it is the building servers kernel issue,
> if it is true, we can not fix the building servers, we only
> workaround the code.

The only possible cause is it starting to prepare the tar /before/ all
packages are unpack. This would be a missing dependency against a task
or something like that.

How can I reproduce the issue?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

