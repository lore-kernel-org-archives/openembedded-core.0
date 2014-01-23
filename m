Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9F9776C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:49:46 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id i11so1959533oag.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=i6VxPW4oamn/N35CkEtB2LO2F9cy2XPFchfCNvXGHOk=;
	b=M9IqPMUov/wY781DhEYl73IQV0ZK8T+VUqzCeQlJ2j2MJ4G3nHkBUUn5+be808xnBt
	DJ7+oaxHPIGRmIEmUUkmSDM6El2MNgNW7xfAd1v+pkznAHwV6CX4nf0oCi+lz1uy58r2
	0e1uuE9Y22ljXgLnUfspaH9awc3+AsjaAUN6GYkWxeG7mCp6xjEW9QlNJcns3ddl+o2E
	IikPkROCqZf8GREYKcr+ZCOmN4I8l0sRHNYhJ1+wvxtSaTcLa2oGs+u34zFkgB6AO7S5
	/VxqwsZ2M56bzsr3XDuDaW+zXD4qjw7Zgoh7Kwg5m9lv2mxU46qnF3pr+2AIK6GsZrBt
	MB+Q==
MIME-Version: 1.0
X-Received: by 10.182.241.8 with SMTP id we8mr360728obc.62.1390477787394; Thu,
	23 Jan 2014 03:49:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 03:49:47 -0800 (PST)
In-Reply-To: <CAJTo0Lb3xQTSJdfXHpMyGTPMALcCHki4pgG5MvEFHiX-yNYezw@mail.gmail.com>
References: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoU+va9SbCJAfZ4HMkz+==Ec9va0KjJX07c4d4cZ90bjg@mail.gmail.com>
	<17C27E68-3F62-414D-A02A-8AD06ACE0B66@dominion.thruhere.net>
	<CAP9ODKrUBJJJHTTBkRmq9j+yOrgGyUfX3TC5L69-ynaDbefo0A@mail.gmail.com>
	<B6D70178-C80E-4804-9786-47A67B9EB230@dominion.thruhere.net>
	<CAJTo0Lb3xQTSJdfXHpMyGTPMALcCHki4pgG5MvEFHiX-yNYezw@mail.gmail.com>
Date: Thu, 23 Jan 2014 09:49:47 -0200
X-Google-Sender-Auth: roLuUlgBD18JA5TKty4dlVmmtzo
Message-ID: <CAP9ODKoOqcghweT8ta5tx4=5hqxHdt6Hi75ksuegxikvYFAj+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: actually install things
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
X-List-Received-Date: Thu, 23 Jan 2014 11:49:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 9:47 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 23 January 2014 11:40, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>>> Couldn't it inherit autotools?
>>>>
>>>> It's a handcrafted Makefile, not autotools :(
>>>
>>> No problem, it works as well.
>>>
>>> The do_configure checks for configure.ac/configure.in and it avoid you
>>> to handcraft do_install and like.
>>
>> The recipes that used such a workaround have all been changed to remote autotools.bbclass over the years, so I'm not sure how encouraged it is.
>
>
> Personally a recipe should only inherit autotools if it actually uses
> autotools.  Hand crafted makefiles should mean hand-crafted recipes.

I will respect your opinions but I see no reason to not use autoconf
if do_configure checks for it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

