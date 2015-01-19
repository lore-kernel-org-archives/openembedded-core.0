Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 27B5060670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 16:31:59 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 20so14949546yks.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 08:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=m6hQT+0CW+1aTcBxrp4Lb7qCtV2HVDis6ewJvR8NRr8=;
	b=lU1PbzWxQp2u93dNBTOw/ANQA0c7dhe5v9yi3ImZz9wQp1pCtytxWBVAKbhuf+A89F
	px7L09D7hAXiUtRPZ55M/hg7I9AUAKFcAtgPFVG3XZxkhBY9ZUeEzs7bHPQrPwcWzrvz
	tKz1sHSylg7JO9ZS7wZ50a1gyyqAMrgawFNPp+uuVwjGbEPQDS2TqIBMjI1rKRwdQAna
	3YNwYkGeBr+aPA94wjzn8nmqMXvvg+nv/6MchyVu4dBmgzooUiEGV9Ljmor1JRsJCyF6
	uRx81msQdCqriEti1Qq8mU7WIvPJmAkq7MtkN8xl7jDj7x9+TBetsqvv7GhRF0Osi6Cm
	wEEg==
MIME-Version: 1.0
X-Received: by 10.170.70.193 with SMTP id m184mr21297538ykm.50.1421685119726; 
	Mon, 19 Jan 2015 08:31:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 19 Jan 2015 08:31:59 -0800 (PST)
In-Reply-To: <54BC58EC.6070406@windriver.com>
References: <CADV-EXFaVwA2kjDo3e9VvO-sodxpxTo6HFDis1oD_36oq3NehA@mail.gmail.com>
	<54BC58EC.6070406@windriver.com>
Date: Mon, 19 Jan 2015 14:31:59 -0200
X-Google-Sender-Auth: M3jHRg50U4_udgDhsoFkOlq9c7g
Message-ID: <CAP9ODKqmXqdf8ruM6rinkqBPZCiviQJX1ztrmjCvm2iDpGekCw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RPM package generation architecture
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
X-List-Received-Date: Mon, 19 Jan 2015 16:32:05 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 18, 2015 at 11:07 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 1/18/15 4:55 PM, Yevhen Kyriukha wrote:
>> I'm building RPM packages for ARM board.
>> I'm getting packages generated for 3 architectures: all, raspberrypi,
>> armv6hf_vfp.
>> I can't install any of these packages with rpm as it uses "uname" to
>> get current machine arch and "uname" outputs "armv6l" arch. Also "all"
>> should be "noarch" for rpm.
>> I want that packages have "proper" arch: "noarch" and "armv6l".
>> Could someone give suggestions on this, please?
>>
>
> You are using the wrong version of RPM.  You need to use the version (RPM5) that
> is configured by the system during the filesystem generation, along with the
> platform file (/etc/rpm/platform) to specify to the system what is allowed.
>
> RPM4 (which it sounds like you are using) does not have an easily adjustable
> table of package names.  To install Yocto Project packages, you will need to
> patch it to define the additional names.

Shouldn't RPM4 to be removed from OE-Core in this case?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

