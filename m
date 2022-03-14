Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <0292fbe9d87d083d81c08cad35ac28da82b27f41.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] shadow-native: Simplify and fix syslog disable patch
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 14 Mar 2022 23:00:15 +0000
In-Reply-To: <c886e8beebb74603a78b97bc68b026b4@axis.com>
References: <20220314175732.827665-1-richard.purdie@linuxfoundation.org>
	 <20220314175732.827665-2-richard.purdie@linuxfoundation.org>
	 <c886e8beebb74603a78b97bc68b026b4@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Mon, 2022-03-14 at 19:10 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 14 mars 2022 18:58
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 2/2] shadow-native: Simplify and fix syslog
> > disable patch
> > 
> > Shadow is happily spamming the host syslog with messages and shouldn't be
> > which suggests the patch isn't working. Redo it to work at the configure
> > level which is simpler and hopefully more effective.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  ...01-Disable-use-of-syslog-for-sysroot.patch | 122 ++----------------
> >  1 file changed, 13 insertions(+), 109 deletions(-)
> > 
> > diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-
> > for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-
> > syslog-for-sysroot.patch
> > index 4d6f6d68ec2..23640824f14 100644
> > --- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-
> > sysroot.patch
> > +++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-
> > sysroot.patch
> > @@ -13,112 +13,16 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> >  Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> 
> Since this is a completely new patch you should replace the 
> Signed-off-by's above as they obviously no longer apply.

I've removed them on the branch.

Cheers,

Richard

