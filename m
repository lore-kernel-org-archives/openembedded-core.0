Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 01B1E6D45D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:12:34 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id i4so3876113oah.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=teOAE0aMdOnPC5nC517UuI3BHx9+VaxH7meBL5Div1o=;
	b=xxt4NVoLT1fAIBH0XUS+y9oIb2mMMMxsHhGa7DNPx7QsdU/jbRUquky24B9YONskyg
	Sc9fFj376JK5FC5TViSA4g/baaFE5xwHh9FBjsR7HrvCGpfeTsSm9P9d3BTwRz9QSyUS
	RC/Hjf2yYguevop1t+Di+B4i8BAFfnF+zq1rIGWEocE2pnrL4JXHuCdQo5OU/pD6sBrg
	4r0m1Q5eViR5atYWc0PNezNf1SYQNb/PBV2zHE8JslIFOUOaq9Aqap0qbZipnXKTJpYm
	fGMuXFeDOc/kNmEUuSJTSI71Alh6ricogYcNJf5gtKjwuLkqBPc+irofWYzovdpRdnI9
	+VUg==
MIME-Version: 1.0
X-Received: by 10.60.155.145 with SMTP id vw17mr2658822oeb.50.1382980356027;
	Mon, 28 Oct 2013 10:12:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 28 Oct 2013 10:12:35 -0700 (PDT)
In-Reply-To: <CAJTo0LZ4Qbt-fc=H9cRszfSUwUiMq4H0KQq-GvPij81fUVrgPQ@mail.gmail.com>
References: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKogpWd7aU2U5qpQ1mztUPwHtQjOQF0krwiLi5wm921pRg@mail.gmail.com>
	<CAJTo0LZ4Qbt-fc=H9cRszfSUwUiMq4H0KQq-GvPij81fUVrgPQ@mail.gmail.com>
Date: Mon, 28 Oct 2013 15:12:35 -0200
X-Google-Sender-Auth: Gi-1GUXPYKh5rGGtmFl3R1MpJQk
Message-ID: <CAP9ODKrrbudNyd=GDcpOvxanODV6zc=_iPgqzgDh7A1HJ29q7A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] gnome: set UNKNOWN_CONFIGURE_WHITELIST
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
X-List-Received-Date: Mon, 28 Oct 2013 17:12:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 28, 2013 at 3:08 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 28 October 2013 15:59, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Mon, Oct 28, 2013 at 12:33 PM, Ross Burton <ross.burton@intel.com> wrote:
>>> This class passes --disable-introspection to everything that inherits it but not
>>> all GNOME modules support introspection, so add that option to the
>>> unknown-configure-options sanity test whitelist.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>
>> I understand the change but it does not match with the commit log.
>
> How so?
>
> -EXTRA_OECONF += "--enable-introspection=no"
> +EXTRA_OECONF += "--disable-introspection"
>
> This is a semantically identical change as far as autoconf is
> concerned, that makes the whitelist clearer.

For autoconf it is but for a human it is not. Please add this to the commit log.

> +UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"
>
> This is the unknown configure options whitelist.
>
> Ross



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

