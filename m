Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 806FE6D2F5;
	Fri,  8 Nov 2013 16:28:50 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id e14so3604318iej.36
	for <multiple recipients>; Fri, 08 Nov 2013 08:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EGkGdlCt87+Yqfvmk3C87JOq0RlQvJMFdoTpexxNkHc=;
	b=O8cCGrRonm0kNBoy5pHYo3DUIaTmRe1upKwjH+nMccZy4yKvPwuhAD0rZlg3pt+FO1
	Xvaw6gacVn9CccQFFjbFruYpnXkd8MGLWjjgxnWRC236eavjI7wZkhTo8aYUfrdGK64f
	tk84SvbDExOR5FXAwvMHwWnj2cekewpSDuah8+IPAtn8ivs0hmGsZb0xIolIUYPPRcgW
	luKhxtCxDplro5qDQb+rtq/+VYQJw91z0fbDyVy0Giv0bN6YtcDnEnBkKeTbikMy05A3
	EOenlWzAkFQc3mystfxmvAzOeIT771mLuholMSg6GUl+6h+H2p/bA6bUnpA2JUGN8hFu
	jeNQ==
X-Received: by 10.50.22.67 with SMTP id b3mr2918502igf.39.1383928131999; Fri,
	08 Nov 2013 08:28:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Fri, 8 Nov 2013 08:28:21 -0800 (PST)
In-Reply-To: <1383904061.6271.297.camel@ted>
References: <1383866326.6271.286.camel@ted>
	<CAJTo0LYq5PmQtBdwghmDGLs2ccTO6BBwJNGw7s37Yt+zjkWU6Q@mail.gmail.com>
	<CAAQYJAuMoE6gOMmM2trSN1MY7weCF+07JAJuhQu1K=p5KxO=Yg@mail.gmail.com>
	<1383904061.6271.297.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Nov 2013 08:28:21 -0800
Message-ID: <CAMKF1spkbD03MT2x8vbXBQkN+Jv5PE3EQvZek35bC40NHmy1iw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Default DISTRO to nodistro
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
X-List-Received-Date: Fri, 08 Nov 2013 16:28:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 8, 2013 at 1:47 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-11-08 at 10:33 +0100, Andrea Adami wrote:
>> On Fri, Nov 8, 2013 at 10:25 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> > On 7 November 2013 23:18, Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> >> +DISTRO ??= "nodistro"
>> >
>> > Wouldn't "oe-core" be a better name, considering that's what
>> > DISTROVERSION becomes if DISTRO is unset?
>> >
>> > Ross
>>
>>
>> Agreed, we already have DISTRO_VERSION = "oe-core.0"
>> This sounds also the right name for THE default distro.
>
> I disagree and I feel quite strongly about this. OE-Core is not a
> distro. The whole idea was that OE-Core should build with sane defaults
> without any distro set. This is a dummy placeholder value and it really
> does mean to say that no distro is set.
>
> We did put a value into the DISTRO_VERSION field so you could tell what
> was being used but again its a placeholder.
>
> So in my view "nodistro" is clearer about what is meant.

yes I concur. change it to nodistro or distroless and please change
DISTRO_VERSION accordingly as well
to be called nodistro.X or distroless.X


>
> Cheers,
>
> Richard
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

