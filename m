Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3fecf1daa318df34df728aeaf932b7de0411e6de.camel@linuxfoundation.org>
Subject: Re: [OE-core] [honister][PATCH] insane.bbclass: Add a check for directories that are expected to be empty
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 11 Nov 2021 10:30:48 +0000
In-Reply-To: <d62d07f792e4450c981095d86eee280c@axis.com>
References: <20211108171057.23971-1-pkj@axis.com>
	 <a5024677e6141ec6c93bda07a2d77c6b0a9a5110.camel@intel.com>
	 <bd35b97c54314581be874f9bd8adcf83@axis.com>
	 <0acd0e851fab2cbbc1580ec45b1765d5c22e26b5.camel@intel.com>
	 <d62d07f792e4450c981095d86eee280c@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "OE Core (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>

On Thu, 2021-11-11 at 09:42 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Mittal, Anuj <anuj.mittal@intel.com>
> > Sent: den 11 november 2021 04:06
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Subject: Re: [OE-core] [honister][PATCH] insane.bbclass: Add a check for
> > directories that are expected to be empty
> > 
> > On Wed, 2021-11-10 at 20:53 +0000, Peter Kjellerstedt wrote:
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > core@lists.openembedded.org> On Behalf Of Anuj Mittal
> > > > Sent: den 9 november 2021 15:36
> > > > To: openembedded-core@lists.openembedded.org; Peter Kjellerstedt
> > > > <peter.kjellerstedt@axis.com>
> > > > Subject: Re: [OE-core] [honister][PATCH] insane.bbclass: Add a
> > > > check for
> > > > directories that are expected to be empty
> > > > 
> > > > On Mon, 2021-11-08 at 18:10 +0100, Peter Kjellerstedt wrote:
> > > > > From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > > 
> > > > > The empty-dirs QA check verifies that all directories specified
> > > > > in
> > > > > QA_EMPTY_DIRS are empty. It is possible to specify why a
> > > > > directory is
> > > > > expected to be empty by defining
> > > > > QA_EMPTY_DIRS_RECOMMENDATION:<path>,
> > > > > which will then be included in the error message if the directory
> > > > > is
> > > > > not empty. If it is not specified for a directory, then "but it
> > > > > is
> > > > > expected to be empty" will be used.
> > > > > 
> > > > > Change-Id: Ic61019528f4b22f26e42e78125a99666ae27c7f5
> > > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > > ---
> > > > > 
> > > > > Compared to the corresponding patch for master, there are two
> > > > > differences:
> > > > > 
> > > > > * "/var/volatile" is not added to QA_EMPTY_DIRS by default.
> > > > > * "empty-dirs" is added to WARN_QA instead of ERROR_QA.
> > > > > 
> > > > > This should make it safe to add this QA test to Honister without
> > > > > introdusing any new QA errors, while still allowing the QA test to be
> > > > > activated for those who wants to use it.
> > > > 
> > > > Does it have to be enabled by default?
> > > 
> > > Well, it doesn't have to be enabled. However, without /var/volatile in
> > > QA_EMPTY_DIRS, there should be no warnings generated for OE-Core or
> > > OpenEmbedded so it should not hurt to have it in WARN_QA.
> > 
> > Right, but there could be unexpected warnings for other downstream
> > layers in release versions.
> 
> True, but they would still just be warnings.

In the context of backports, this needs to be handled carefully. You're
effectively asking for new feature backport here and people aren't happy when
stable branches suddenly show new warnings.

If the issue was of huge importance, that would be ok but I'm not sure that is
the case here, we've managed with the code as is for a long time.

Cheers,

Richard

