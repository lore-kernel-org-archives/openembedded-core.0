Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3bc65ae2dd1e67cb213b667525b0c8fd7df5c0da.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 01 Mar 2022 12:22:15 +0000
In-Reply-To: <85ec6efd-44f0-4f9c-8844-b65ec255b2d1@www.fastmail.com>
References: <20220228235433.3948994-1-andrei@gherzan.com>
	 <16D81CEE77B62019.3953@lists.openembedded.org>
	 <CADkTA4MEqxJc7=RNEKS4emNKOy_7ytPs4rF6F5E=EPCCMTLQSQ@mail.gmail.com>
	 <85ec6efd-44f0-4f9c-8844-b65ec255b2d1@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Andrei Gherzan <andrei@gherzan.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>, zygmunt.krynicki@huawei.com

On Tue, 2022-03-01 at 11:42 +0000, Andrei Gherzan wrote:
> On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
> > On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > > 
> > > On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wrote:
> > > > 
> > > > From: Andrei Gherzan <andrei.gherzan@huawei.com>
> > > > 
> > > > Compile pulls in the go.mod list requiring network. Without this, do
> > > > compile would fail with a similar error to the following:
> > > > 
> > > > dial tcp: lookup proxy.golang.org: Temporary failure in name resolution
> > > 
> > > This is something that needs to be carried in your own layers, IMHO it
> > > isn't appropriate for core.
> > > 
> > > It isn't about the fetching, it is the entire gap in functionality
> > > that we are missing if go starts fetching dependencies during compile.
> > 
> > A further thought is that if this is for go.mod issues, there is the
> > go-mod.bbclass.
> > 
> > Perhaps enabling it in that class and doing a bbwarn about go fetching
> > dependencies would be appropriate ?
> > 
> > Otherwise, someone may not know that this is happening and that a no
> > network configuration has no chance of working.
> > 
> 
> I reckon that is reasonable. I'll personally go down the recipe level to workaround 
> this change but understanding and agreeing with the reasoning behind this change, 
> I want to invest a bit into trying to find a proper solution in the core. Bruce, 
> I know you invested a fair amount of time into this already. Would you be willing 
> to sync up and see how we can work together in tackling this? 
> 
> Added Zyga to CC as he is also interested in this as part of his go development activities.

I'd like to ask that anyone working around this does leave a bb.warn() in the
code so that the issue is visible. We need to make sure there is awareness of
the problem and hopefully that will encourage people not to forget about it.

Cheers,

Richard


