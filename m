Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1Rk8WT-0000gG-Dp
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 07:15:58 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Mon, 9 Jan 2012 14:08:26 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Mon, 9 Jan 2012
	14:08:24 +0800
Message-ID: <1326089201.27569.10.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: McClintock Matthew-B29882 <B29882@freescale.com>, "Patches and
	discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jan 2012 14:06:41 +0800
In-Reply-To: <CAEsOVNeAuF5u2J_MhZg9tVezexCNyK2rGsZ2sUgBpTeJ90ZVqw@mail.gmail.com>
References: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
	<CAEsOVNeAuF5u2J_MhZg9tVezexCNyK2rGsZ2sUgBpTeJ90ZVqw@mail.gmail.com>
Organization: Insigma
X-Mailer: Evolution 3.2.2 
MIME-Version: 1.0
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jan 2012 06:15:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

indeed, I think maybe providing specific config file for specific
machine is better, but not spliting the config to fragments.

On Mon, 2012-01-09 at 13:08 +0800, McClintock Matthew-B29882 wrote:
> Is anyone working on more fine grained control of busybox? Some ideas include:
> 
> 1) configure via PACKAGECONFIG?
> 
> 2) supply a defconfig for busybox?
> 
> 3) multiple busybox recipes?
> 
> -M
> 
> On Sun, Jan 8, 2012 at 6:03 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > From: Andrei Gherzan <andrei.gherzan@windriver.com>
> >
> > Enable 64-bit math support in the expr applet. This will make
> > the applet slightly larger, but will allow computation with very
> > large numbers.
> >
> > [YOCTO #1767]
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> > index 1990f28..ebd751d 100644
> > --- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> > +++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> > @@ -214,7 +214,7 @@ CONFIG_FEATURE_ENV_LONG_OPTIONS=y
> >  # CONFIG_EXPAND is not set
> >  # CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
> >  CONFIG_EXPR=y
> > -# CONFIG_EXPR_MATH_SUPPORT_64 is not set
> > +CONFIG_EXPR_MATH_SUPPORT_64=y
> >  CONFIG_FALSE=y
> >  # CONFIG_FOLD is not set
> >  # CONFIG_FSYNC is not set
> > --
> > 1.7.5.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



