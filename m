Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC416BC88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 20:04:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2DK3iVZ012582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Mar 2019 13:03:54 -0700
Received: from yow-masselst-lx1.localnet (128.224.60.174) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Wed, 13 Mar 2019 13:03:33 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 13 Mar 2019 16:03:32 -0400
Message-ID: <1756056.MITzs3jtI9@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAJ86T=U2oLy-10Y-OGVHC5r8bzEQBh_M1mAaZNK5SznQcLJqSQ@mail.gmail.com>
References: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
	<1552499826-26884-2-git-send-email-mark.asselstine@windriver.com>
	<CAJ86T=U2oLy-10Y-OGVHC5r8bzEQBh_M1mAaZNK5SznQcLJqSQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Mar 2019 20:04:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, March 13, 2019 3:56:10 PM EDT Andre McCurdy wrote:
> On Wed, Mar 13, 2019 at 10:57 AM Mark Asselstine
> 
> <mark.asselstine@windriver.com> wrote:
> > The cortexa7 tunings use 'cortexa7' in their tunings and do not
> > include 'arm7' so we need to look for both when setting TARGET_GOARM.
> 
> Is cortexa7 a special case? Or will the same issue be there for
> cortexa5, cortexa9, cortexa15, etc?

Damn, was too fucused on the 1/2 patch of this RR I had my blinders on. Yes I 
should be looking for cortexa* as I believe they all fall in to the "7" 
bucket. I will redo this and after we sort out 1/2 I will send a v2.

MarkA

> 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> >  meta/classes/goarch.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> > index 39fea5e..077c967 100644
> > --- a/meta/classes/goarch.bbclass
> > +++ b/meta/classes/goarch.bbclass
> > 
> > @@ -74,7 +74,7 @@ def go_map_arch(a, d):
> >  def go_map_arm(a, f, d):
> >      import re
> > 
> >      if re.match('arm.*', a):
> > -        if 'armv7' in f:
> > 
> > +        if 'armv7' or 'cortexa7' in f:
> >              return '7'
> >          
> >          elif 'armv6' in f:
> >              return '6'
> > 
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core





