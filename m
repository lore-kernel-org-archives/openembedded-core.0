Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B4822605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 00:58:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so707105wmu.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 16:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t4qYpGnAOmiIA8Cj2ym4D8Zy55vskV4MBi1b8K6C5LE=;
	b=uTS92bEeW9q+ekS+cNcdQr2kmnpi5CkksjhHicFzK1SrG9eOHEDt567YdVaoAtWvCI
	pd/xUQiOWDxxu05EJZQJAsrABSeP+B9rM/AUAETcPuXwHfixB1I4PY9gqKdLMMO0tqe0
	0HpOcW2d2703l6mRVyRB00RWS37pR6GNnajDH87DjwD/WhZl7XaHOKP3+sUI+vlIhpPi
	HagzOalCmEuZi+SMtTaLrpMnlisY2fpJGbwEqKqxAdrT4HUSytu9qbBjDT/MEO7VXoaB
	r5ob9b8cFGs5DVmzeZOvXqTuxpi9mmwBwYyLn8SX8+xAvz4Vt5uQx9rbe6PIvyGiDlKV
	/pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t4qYpGnAOmiIA8Cj2ym4D8Zy55vskV4MBi1b8K6C5LE=;
	b=AHCegEBDb1rMP71lmU/N2Ij0cZwTb0apSAhFbLsZ/6pwVZXs0v5lnfJQGUpibSE7++
	CWKGmcnjQ7Wv9lEFrqihp8nSVZZ3HB0jEjx1qnkpDy5BJ7I54kuqjhALhBxDwBZTsMb/
	RjTc0TctyHa2PM2AqI24MPNuw6NGkCIJdA3O5yU+IBmjBeSclY3oUsmtcKdGdI4x3ip/
	2OBn86vC/LV4XcPwrXJTM5DiQglnpFAuIx8q1KHWSO9/ZGm+yvpmZsrIYDSbtExGbrYc
	p4D/0+naueO5x4GDm+IJB0IrK8haTEbZlSz25ouM/oWDkuxJik8LpS70Vi31JiXjzelO
	RcYA==
X-Gm-Message-State: AIkVDXJwa4n2koX3N9Lke3MPlsj8h9u5M84x3SlHRW5amdHkYCu/S+gvn5RE8CNVGXqj8MN6FDMyyYzXejX9ag==
X-Received: by 10.223.145.45 with SMTP id j42mr10917551wrj.141.1486083534461; 
	Thu, 02 Feb 2017 16:58:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.195.17.228 with HTTP; Thu, 2 Feb 2017 16:58:53 -0800 (PST)
In-Reply-To: <CAJ86T=X6SmEw9eJQAmmGUuq33e2vreHAuGZ77WDC1dHwwEsymg@mail.gmail.com>
References: <1485489993-29677-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spAAtA=vjmUYx-WrpTmZjXrh0bdEmmesO=NS8BYEfNY8w@mail.gmail.com>
	<CAJ86T=X6SmEw9eJQAmmGUuq33e2vreHAuGZ77WDC1dHwwEsymg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 2 Feb 2017 16:58:53 -0800
Message-ID: <CAJ86T=XZSyyieay0Vdhm5Te+BXRKb5+SWjAUWwbLzSz-W4ni3g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: respect USE_LDCONFIG when setting default PACKAGECONFIG
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
X-List-Received-Date: Fri, 03 Feb 2017 00:58:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2017 at 12:42 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Jan 26, 2017 at 10:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Jan 26, 2017 at 8:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> Avoid trying to call ldconfig at run-time in distros which force
>>> USE_LDCONFIG to 0 and therefore don't provide it.

Ping.

Perhaps merge this simple patch first if there's no consensus on
adding a distro config.

>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/recipes-core/systemd/systemd_232.bb | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
>>> index cc8781e..cfe6958 100644
>>> --- a/meta/recipes-core/systemd/systemd_232.bb
>>> +++ b/meta/recipes-core/systemd/systemd_232.bb
>>> @@ -39,8 +39,10 @@ SRC_URI_append_libc-uclibc = "\
>>>  "
>>>  SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>>>
>>> +USE_LDCONFIG ?= "1"
>>
>> now that we have more recipes using this variables. I think it should
>> to global config space. May be have it as a DISTRO_FEATURE is more
>> appropriate
>
> Patches for both approaches have now been sent to the list.
>
>>> +
>>>  PACKAGECONFIG ??= "xz \
>>> -                   ldconfig \
>>> +                   ${@base_conditional('USE_LDCONFIG', '1', 'ldconfig', '', d)} \
>>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

