Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 162FA6D6C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 09:47:03 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wm4so4044844obc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 01:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=NEhunatY2TJWlQefpCFFSTVrKCSinIu02BXPXW00YHc=;
	b=iSMzW3sdGdd/i4DxfhHZw1YJW6UTzODeThgPe4wQWsWBcV8BaCHxUFPfCiVMZGCiWF
	l+XYxnQiljKUkBshIEZeGb0MokaXOOSw8XpDTz1W3a0Gcwj2aF+ujZAO/kvscwysQLoF
	aT5giqomXZLZy/n8L3ix6ImPJmbq0JaSD3du5ctjAqMvhfGZtiatFKiuzRXNK46oVh/h
	Rzt0FYCuZ0OPoNFahANqvDzvCJYSlp3llzV+gkFawm4dGWzqUS7794FIWK9ZPt0VLndA
	0iOC1AVG/PPLAdszhRPcFWl/6q/EpiO9H3ym4Nr4Vasd24DX3P3YGGAv686awDNpU1UY
	n8kQ==
MIME-Version: 1.0
X-Received: by 10.60.145.207 with SMTP id sw15mr17570903oeb.38.1384163224308; 
	Mon, 11 Nov 2013 01:47:04 -0800 (PST)
Received: by 10.182.44.8 with HTTP; Mon, 11 Nov 2013 01:47:04 -0800 (PST)
In-Reply-To: <1384163113.22454.11.camel@ted>
References: <1383923880.2345.4.camel@ted> <527D0624.3060407@windriver.com>
	<1383926139.2345.7.camel@ted> <527D0A44.7020005@windriver.com>
	<1383929419.2345.11.camel@ted>
	<1383931424.5378.131.camel@dvhart-mobl4.amr.corp.intel.com>
	<CAAQYJAv9BxmjsskLP+-26b=HkRWpLYxzsmzQVyo-norREhSUOA@mail.gmail.com>
	<1384037896.22454.5.camel@ted>
	<CAFyqS9q_HMp+WDgcxQ9QeoDtDP3JCmpWwLSu5NVH+unqyCQ4GA@mail.gmail.com>
	<1384163113.22454.11.camel@ted>
Date: Mon, 11 Nov 2013 10:47:04 +0100
Message-ID: <CAFyqS9ok48dunSejx8NDrz744NKnp7tEQQfGcbP+ha8SuXLQvg@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use hardlinks for do_populate_sysroot for speed
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
X-List-Received-Date: Mon, 11 Nov 2013 09:47:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2013 at 10:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-11-11 at 09:06 +0100, Hans Beck=E9rus wrote:
>> I am having some trouble with these patches :( The new approach is
>> using the '-n' flag to the 'cp' command.
>> That is not supported on our SuSE11 based system. To be honest, I do
>> not know how portable '-n' is?
>> Some system have it, others seems to provide '-u' instead. I guess by
>> removing '-n' part of the performance gain is lost?
>> Would it be possible to test for error from the 'cp' command and if it
>> fails try '-u' instead (and cache the result)? Or maybe
>> even better, make this configurable in local.conf (or the distro) for
>> the build platforms that does not support  '-n' but can
>> instead fall-back to using '-u'. From what I can tell most systems
>> support  one or the other, but never both.
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t2&=
id=3D276b9df3588ecd438c3e2f502d56cd6b9fb24676
>
> Thankfully the above works just as well. I used -n to get rid of an
> error, then added -l for efficiency. We can get away just with -l.
>
Great! Will try it asap.
Btw, cp was from coreutils back in 2008.

cp (GNU coreutils) 6.12
Copyright (C) 2008 Free Software Foundation, Inc.

Thanks.
Hans

> Cheers,
>
> Richard
>
>

