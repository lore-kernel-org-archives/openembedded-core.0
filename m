Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9F47C71C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 12:45:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2FCjnHc013849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Mar 2019 05:45:50 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.22.17) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Fri, 15 Mar 2019 05:45:49 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Mar 2019 08:45:47 -0400
Message-ID: <4673863.JtzmKTIgp5@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAMKF1sox3QV+OzT9kKmrpF7pt-fa4yBGUhCeAkBXdAY8a8AKFg@mail.gmail.com>
References: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
	<1756056.MITzs3jtI9@yow-masselst-lx1>
	<CAMKF1sox3QV+OzT9kKmrpF7pt-fa4yBGUhCeAkBXdAY8a8AKFg@mail.gmail.com>
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] goarch.bbclass: set TARGET_GOARM as '7' for cortexa7
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
X-List-Received-Date: Fri, 15 Mar 2019 12:45:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, March 15, 2019 1:42:55 AM EDT Khem Raj wrote:
> On Wed, Mar 13, 2019 at 1:04 PM Mark Asselstine
> 
> <mark.asselstine@windriver.com> wrote:
> > On Wednesday, March 13, 2019 3:56:10 PM EDT Andre McCurdy wrote:
> > > On Wed, Mar 13, 2019 at 10:57 AM Mark Asselstine
> > > 
> > > <mark.asselstine@windriver.com> wrote:
> > > > The cortexa7 tunings use 'cortexa7' in their tunings and do not
> > > > include 'arm7' so we need to look for both when setting TARGET_GOARM.
> > > 
> > > Is cortexa7 a special case? Or will the same issue be there for
> > > cortexa5, cortexa9, cortexa15, etc?
> > 
> > Damn, was too fucused on the 1/2 patch of this RR I had my blinders on.
> > Yes I should be looking for cortexa* as I believe they all fall in to the
> > "7"
> keep in mind we might have cortex-a53 etc which are v8

GOARM is not applicable to ARMv8, only v5, v6 and v7. I added the link to the 
documentation in the V2 along with additional notes to make this clear.

MarkA

> 
> > bucket. I will redo this and after we sort out 1/2 I will send a v2.
> > 
> > MarkA
> > 
> > > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > > ---
> > > > 
> > > >  meta/classes/goarch.bbclass | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> > > > index 39fea5e..077c967 100644
> > > > --- a/meta/classes/goarch.bbclass
> > > > +++ b/meta/classes/goarch.bbclass
> > > > 
> > > > @@ -74,7 +74,7 @@ def go_map_arch(a, d):
> > > >  def go_map_arm(a, f, d):
> > > >      import re
> > > > 
> > > >      if re.match('arm.*', a):
> > > > -        if 'armv7' in f:
> > > > 
> > > > +        if 'armv7' or 'cortexa7' in f:
> > > >              return '7'
> > > >          
> > > >          elif 'armv6' in f:
> > > >              return '6'
> > > > 
> > > > --
> > > > 2.7.4
> > > > 
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core





