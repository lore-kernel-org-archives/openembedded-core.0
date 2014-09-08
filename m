Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id BBA217117C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 12:54:13 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id f73so736392yha.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 05:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+LtWtZatMW2CL9b6UMZF3k/8WpFUyRLQpnlEKWgVicc=;
	b=q7r1gJ8c2S+rN/l/wezB0NM6K1gTRyxFETtqT2GQ4YnWjAj0KB6AZbls7OOlwfmifV
	54LDNWJkTCeovtay1mVlSKNTWlxiaYLiGqBf2YdbRsOEj8F3U2A9K2U3g1f6oqculm/5
	D0g8M/AuaNW0/ZP3aziXwag4zJJSa7Th2qeQJN2WzfeWOT0zLZsJ/gsinHxEF3PFXTD6
	93PDQ1bGc872xicNl/QsuJEh6Rzumg/ch9mvb+FzrhxMRUqunizuitZxHQsPr8fUgOZK
	ZZXofMi0MJCNXNd7e/UG1+rNEjnWzcw00Ncki0S510ddT9uK6nlvnzARCoTBRehhQuev
	3H9w==
MIME-Version: 1.0
X-Received: by 10.236.45.33 with SMTP id o21mr3421081yhb.109.1410180854458;
	Mon, 08 Sep 2014 05:54:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Mon, 8 Sep 2014 05:54:14 -0700 (PDT)
In-Reply-To: <540D9C5A.2020204@pseudoterminal.org>
References: <1410174256-3263-1-git-send-email-dv@pseudoterminal.org>
	<1410175101.19272.1.camel@ted>
	<540D9C5A.2020204@pseudoterminal.org>
Date: Mon, 8 Sep 2014 09:54:14 -0300
X-Google-Sender-Auth: oE-Rvd4FyV00aE9et3EUhU8QQ0g
Message-ID: <CAP9ODKoRhgq5DuPe8Toa7iXoCex_FuEJ_1yuaCMykt_JuU=DjA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: handle .dsp firmware
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
X-List-Received-Date: Mon, 08 Sep 2014 12:54:18 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 8, 2014 at 9:08 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> On 09/08/14 13:18, Richard Purdie wrote:
>>
>> On Mon, 2014-09-08 at 13:04 +0200, Carlos Rafael Giani wrote:
>>>
>>> A few firmware files use this filename extension, like korg/k1212.dsp .
>>> Create respective packages.
>>>
>>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
...
>> Perhaps its time to improve the regex slightly here and use something
>> like file_regex='^(.*)\.(bin|fw|cis|dsp)$ rather than multiple calls to
>> do_split_packages?
>
> I had the same thought. However, I figured that perhaps it would be better
> to do this in a followup patch, to keep the two distinct changes separate
> (add .dsp support + modify regex to the new and improved version).

Agreed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

