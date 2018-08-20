Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id A04547909B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 20:46:29 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id t4-v6so7184032vke.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BRcnJPvt7uWwVZB0sC3A2IA555Hw0z5kI5omTF43NvU=;
	b=UEPf7E2g81K/X2voxb8fu1pglBcMroMafwoNSPTLLUA6Ly4iUeoNZLMijICcngaFK6
	yEun+46atfDXZNkvojLfSoPL2+ATyiVcOsAaPkvHGJElxjQzfo/KFtR/HgD464vRi+E5
	JdlFQZyGku2LN/Q7Tma4gah+5XLkFMKHSRHUpURenV5Iy+4ZvOTO5R+MeeaU2vCPm5SU
	ImVz0lKKNmoGHv6ObmysVeNFEisfdJ75oLo3t9OpL8VslcB6vi3S3zQ8akOBYfaTZPbI
	O/t7aoV+7zJuGfeMweSbGNfjha677eCEwB+0+Lh6Zd07qitblWWRz9fp6mIJojdm4ROu
	bSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BRcnJPvt7uWwVZB0sC3A2IA555Hw0z5kI5omTF43NvU=;
	b=hcDgqtsMpKr5xiij60fASIoKCaD8i9fdDFKdyMO7fitpUmj2dler6KKkf7CAGuuCDG
	sigKTxOjGfNNWU1pACkx5v5tZUjCc7REeuM8k/6ez+UWnHR5IOtwTka9uhX5Pu492YgO
	TksCiwngJ+HJUM+8dyKdw4hT6YBCbrQYqRXppbxLZatmRgxVVxUvkc0xNj7suMjSXgdY
	5NmsR2Yyb1zbdR2f+lUhOAtp8h4foOd7eblkksPFuu0v6UfQpkMOdg4kIsYXNSoF3rlL
	lULuuMyiMqhCBCR9arzd85LHDOVO575xCLVR9qvVIdVEZZO7h/PCR17XHynWNS9phOIG
	KAqw==
X-Gm-Message-State: APzg51CXrGW5M/VULNCEhENKPalGF+Kzv5hxF5L+5uc1ZHDBsmqldKk1
	CR/87v9rN75Vww71ztpXf4HT1jebVezZh1znasQ=
X-Google-Smtp-Source: ANB0VdbGUy70V5P/Pn9fQF9P1Sf5awRNGqlYq06vEp+kGJcGE+Uu+VTcO2S8ZiGEfWXSIlDf+tRCCsHGAgday7uKOpI=
X-Received: by 2002:a1f:8b88:: with SMTP id
	n130-v6mr4388288vkd.83.1534797990546; 
	Mon, 20 Aug 2018 13:46:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 20 Aug 2018 13:46:29 -0700 (PDT)
In-Reply-To: <c658c3fa-b055-ba33-af4e-e5f599fe53e4@gmail.com>
References: <20180817141411.31825-1-akuster808@gmail.com>
	<CAJ86T=WfkmRWbrj6EgQXyRNhYxTxhzEfNvCkLySa3q1=hNmK_Q@mail.gmail.com>
	<c658c3fa-b055-ba33-af4e-e5f599fe53e4@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 Aug 2018 13:46:29 -0700
Message-ID: <CAJ86T=XSDSZdzTiJD3DDFekUcKQ21vhK1gtPPJfMP+YYBq9TQw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] gnutls: Update to 3.6.3
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
X-List-Received-Date: Mon, 20 Aug 2018 20:46:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 17, 2018 at 3:39 PM, akuster808 <akuster808@gmail.com> wrote:
> On 08/17/2018 02:31 PM, Andre McCurdy wrote:
>> On Fri, Aug 17, 2018 at 7:14 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>> [v2]
>>> Fix new config options form with to disable.
>>>
>>> [v1]
>>> release notes: https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008584.html
>>>
>>> add ssl3 and tls1.3 config options now supported.
>>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>  meta/recipes-support/gnutls/gnutls.inc                       | 2 ++
>>>  .../gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb}              | 5 +++--
>>>  2 files changed, 5 insertions(+), 2 deletions(-)
>>>  rename meta/recipes-support/gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb} (53%)
>>>
>>> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
>>> index 04c0fd2af8..f204e5f4c0 100644
>>> --- a/meta/recipes-support/gnutls/gnutls.inc
>>> +++ b/meta/recipes-support/gnutls/gnutls.inc
>>> @@ -30,6 +30,8 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
>>>  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>>>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>>>  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
>>> +PACKAGECONFIG[ssl3] = "--enable-ssl3-support,--disable-ssl3-support,"
>>> +PACKAGECONFIG[tls13] = "--enable-tls13-support,--disable-tls13-support,"
>> I'm not sure whether either of these should have PACKAGECONFIG options.
>>
>> SSL v3 is obsolete and if gnutls is disabling it by default now then
>> it's probably best to leave it that way (dead and buried). Experienced
>> users can always enable via EXTRA_OECONF if they really need it.
>>
>> TLS 1.3 is the opposite - it's brand new. If we add a PACKAGECONFIG
>> option to control it then it becomes the gnutls recipe maintainer's
>> job to figure out when to enable it by default. I think it's better to
>> leave that decision to upstream gnutls.
> No change in behavior in the way its setup now.
>
> You can send a patch to correct them. I am not doing a v3 for this.

No, not a big issue either way.

I thought we might be getting a v3 anyway to move the [v1] and [v2]
comments below the "---" line but the v2 got merged as-is...

