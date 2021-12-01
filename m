Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <778f60e30d7fbfd9d4a63d87cb8824a5a9f0120a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 01 Dec 2021 22:33:35 +0000
In-Reply-To: <CAJ86T=WH+HJPV7MMJFcuNyx+VmgUvPRD=wfHCTcKGyyJ3GTANw@mail.gmail.com>
References: <20211130165313.3816904-1-ross.burton@arm.com>
	 <20211130165313.3816904-2-ross.burton@arm.com>
	 <CAJ86T=V_9Y=xCbswnjV5ZkfihQ-KOWk13xYW7FNQaj7ahBUcjw@mail.gmail.com>
	 <CAAnfSTsvgBF1EUZ3t+FNAwGB9j0p8y41c2Mgfv2DMHoMVJWnfg@mail.gmail.com>
	 <CAJ86T=WH+HJPV7MMJFcuNyx+VmgUvPRD=wfHCTcKGyyJ3GTANw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Andre McCurdy <armccurdy@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>

On Tue, 2021-11-30 at 13:45 -0800, Andre McCurdy wrote:
> On Tue, Nov 30, 2021 at 1:20 PM Ross Burton <ross@burtonini.com> wrote:
> > 
> > On Tue, 30 Nov 2021 at 19:32, Andre McCurdy <armccurdy@gmail.com> wrote:
> > > This isn't equivalent - it will cause a change in behaviour for anyone
> > > using PACKAGECONFIG += "foo" from a .bbappend.
> > 
> > Correct, but this is likely the only recipe in the greater ecosystem
> > which has this behaviour, so I'm not that bothered to be honest. :)
> 
> The only recipe? There are many recipes which set a default
> PACKAGECONFIG with ?= and many which set it with ??=. Your change is
> effectively switching the vim recipe from one approach to the other.
> The fact that adding PACKAGECONFIG options from a .bbappend with +=
> sometimes works OK and sometimes not is a source of confusion for new
> users.
> 
> You are right that no one seems to care though...

Some of us very much do care, it is actually bothering me a lot and I've posted
several times on the architecture list about this kind of issue. 

We haven't worked out what we can agree to do about it though :(.

Cheers,

Richard

