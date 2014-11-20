Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBA765C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 18:17:07 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id im6so1642012vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 10:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=oq/X/DRCP6dKs9fTZRSS7PHS67M8tMKiJ5U1DFbBM1s=;
	b=dBvyl3CC2xt+RP4akNhipzyINn+DTtA+s9q6GRPdx2NMkET4z/hEprOdhNtUkAXXCd
	ojidPv+o30ZVLZK+MDKeAuRcBu+wHo9JzZUt4vbvPld0hNiw8lbXMV3c9HKSF0sjCBqg
	lf4UROP8/rzQ/Oj0bZoYvR966H+bwsGE1CTqmhyFxQvSfhEYg8JOTbi/pJRTOCN6Cml0
	AUhdmStPw8SQGO5N2dPO6Zd8MIP+0CASmavW7Gv1eL3OJdIEkEjQke/sZbdAZWRVg8cT
	lKNI9zVCmvPZuT9gfETRz2ssUQ1sca6vXAM+GbAB8htys1qsAA9B3TtHR4tB2TlcV4wc
	G0Dg==
X-Gm-Message-State: ALoCoQm/E0z7apd9xQoHnoiruk9+f26YWS0B9xZnohfPy7xZEOHKbhbCPQEO0eG9yZYErS37smvr
MIME-Version: 1.0
X-Received: by 10.220.177.138 with SMTP id bi10mr9350493vcb.1.1416507425881;
	Thu, 20 Nov 2014 10:17:05 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.129 with HTTP; Thu, 20 Nov 2014 10:17:05 -0800 (PST)
In-Reply-To: <1415101721.23396.20.camel@ted>
References: <CAOMwXhPbXCQ7ui+J0a8ryekeq5Yy5EXdgt-Qr26Z9w74=vyD5w@mail.gmail.com>
	<1415101721.23396.20.camel@ted>
Date: Thu, 20 Nov 2014 18:17:05 +0000
X-Google-Sender-Auth: FsheYUwDcud2EL9N0Ub5IZ3Sl64
Message-ID: <CAOMwXhP9GfyYB+_4qjZbcGO86dwWKW3hP3py1k1_Kon0wBiX-w@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Specifying 32 bit dependency for 64 bit software
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
X-List-Received-Date: Thu, 20 Nov 2014 18:17:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 4, 2014 at 11:48 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2014-11-03 at 17:29 +0000, Laszlo Papp wrote:
>> we have a tool that we run during our make run, but this tool is
>> hard-coded for 32 bit. It depends on software like ncurses. I could
>> add ncurses-native in an ideal world; no problem.
>>
>> The problem is that my host environment is 64 bit currently and it is
>> not possible to migrate the whole environment to 32 bit. I am happy to
>> explain the details if needed, but I would love you to trust me about
>> that. =)
>>
>> So, is it possible to say more than just DEPENDS = ncurses-native,
>> something like DEPENDS = ncurses-native:x86 or something?
>
> How much of a 32 bit system do you have? Do you at least have a 32 bit
> capable compiler and C libraries?
>
> If so, you could use our general class extension mechanism
> (BBCLASSEXTEND) to allow 32 bit variants of the native recipes, e.g. a
> "native32" form.
>
> Alternatively, a more easier approach would be to build a target like
> buildtools-tarball with SDKMACHINE="i686" and then install that onto the
> system you're building on.

I am just back from my long vacation. I am sorry about not replying
earlier. OK, thank you so much; I will give the buildtools-tarball a
go.

Cheers, L.

>
> Cheers,
>
> Richard
>
>
>
>
>

