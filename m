Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9A0A16C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:01:48 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id wn1so1912131obc.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=TKbmeQXcDVDvSzvVH9ZPvNcGQ39JIDMIsKHaKDIdwG0=;
	b=o2jYDxg6r3dcjd8a0lhySPd6PAsy1KnvI+hVvunDqtATCkE1+kl5s5sB3zNOaqI+ox
	vEUpsyYEmyEwvZ2EH0QrpnvNEaSinxMFvuQvfXK7qaX5Vf3xGYSyBPt5yJby+xrgrpS4
	Vfjn90kEQWXD55jq8Pze8cg6+7xJnevmUEqgOt8hDCucFX+iBrzqWcKkJxZGJ+0YLvD3
	Erc0/7Al91r698S0xf3tF+yLfUKTBKK4K6ILuetBIXWbEngj0mYB4z47DPAHnrmIGcsF
	G+eFa6WFOOxl52HMdaexGjIFd3P9S8JWJDDe7wOPIMf+OK/sKD2f5fUm5feKGr+FtIkE
	+NgA==
MIME-Version: 1.0
X-Received: by 10.182.250.163 with SMTP id zd3mr6511515obc.20.1390478509297;
	Thu, 23 Jan 2014 04:01:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 04:01:49 -0800 (PST)
In-Reply-To: <CAJTo0LYNfpP6k9e8GTEgX=fr99BxG-sEv-BUJVzSO3uFnBeYPg@mail.gmail.com>
References: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoU+va9SbCJAfZ4HMkz+==Ec9va0KjJX07c4d4cZ90bjg@mail.gmail.com>
	<17C27E68-3F62-414D-A02A-8AD06ACE0B66@dominion.thruhere.net>
	<CAP9ODKrUBJJJHTTBkRmq9j+yOrgGyUfX3TC5L69-ynaDbefo0A@mail.gmail.com>
	<B6D70178-C80E-4804-9786-47A67B9EB230@dominion.thruhere.net>
	<CAJTo0Lb3xQTSJdfXHpMyGTPMALcCHki4pgG5MvEFHiX-yNYezw@mail.gmail.com>
	<CAP9ODKoOqcghweT8ta5tx4=5hqxHdt6Hi75ksuegxikvYFAj+Q@mail.gmail.com>
	<CAJTo0LYNfpP6k9e8GTEgX=fr99BxG-sEv-BUJVzSO3uFnBeYPg@mail.gmail.com>
Date: Thu, 23 Jan 2014 10:01:49 -0200
X-Google-Sender-Auth: G1E7oy9DdLDl2UwTYaW7sH7RfR8
Message-ID: <CAP9ODKp1SOXfKojD1TmRtWmRueZ9+eZaKeG2DLEHJRS-zWT1YQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Jan 2014 12:01:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 9:53 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 23 January 2014 11:49, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> Personally a recipe should only inherit autotools if it actually uses
>>> autotools.  Hand crafted makefiles should mean hand-crafted recipes.
>>
>> I will respect your opinions but I see no reason to not use autoconf
>> if do_configure checks for it.
>
> Extra build dependencies, extra logic beyond what is needed, the need
> to be careful in the future when we can't assume that
> autotools.bbclass is used with autotools-using recipes.

Ok; you won.

heheh

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

