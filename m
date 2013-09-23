Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9FE610DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 14:35:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8NEnnnS008796; Mon, 23 Sep 2013 15:49:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ravFyUfD8FDW; Mon, 23 Sep 2013 15:49:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8NEnjl8008793
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 23 Sep 2013 15:49:46 +0100
Message-ID: <1379946892.18603.216.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Mon, 23 Sep 2013 15:34:52 +0100
In-Reply-To: <20130923135312.3b7f5089@e6520eb>
References: <1379923619-27142-1-git-send-email-eric@eukrea.com>
	<1379935457.18603.215.camel@ted> <20130923135312.3b7f5089@e6520eb>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH/RFC] autotools: handle dependency on intltool-native
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
X-List-Received-Date: Mon, 23 Sep 2013 14:35:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2013-09-23 at 13:53 +0200, Eric Bénard wrote:
> Le Mon, 23 Sep 2013 12:24:17 +0100,
> Richard Purdie <richard.purdie@linuxfoundation.org> a écrit :
> 
> > On Mon, 2013-09-23 at 10:06 +0200, Eric Bénard wrote:
> > > autotools' class can use intltoolize but has no dependency on it
> > > which can leads to :
> > > /test/setup-scripts/build/tmp-defaultsetup-eglibc-eglibc/work/cortexa9hf-vfp-neon-oe-linux-gnueabi/gnokii/0.6.31-r0/temp/run.do_configure.7559: line 179: intltoolize: command not found
> > > 
> > > This patch fix this problem by adding the dependency on
> > > intltool-native which can be tricky as it triggers
> > > circular dependencies very easily.
> > > 
> > > Signed-off-by: Eric Bénard <eric@eukrea.com>
> > > ---
> > >  meta/classes/autotools.bbclass | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> > > index 883eb06..eb988cb 100644
> > > --- a/meta/classes/autotools.bbclass
> > > +++ b/meta/classes/autotools.bbclass
> > > @@ -16,6 +16,7 @@ def autotools_dep_prepend(d):
> > >                          and not bb.data.inherits_class('cross', d) \
> > >                          and not d.getVar('INHIBIT_DEFAULT_DEPS', True):
> > >              deps += 'libtool-cross '
> > > +            deps += 'intltool-native '
> > >  
> > >      return deps + 'gnu-config-native '
> > 
> > Its expected that recipes using that add to DEPENDS. Please lets not add
> > in the dependency for everyone since it isn't actually used in that many
> > places. Its small details like this which end up causing significant
> > performance issues :/.
> > 
> OK agreed. Would you accept a patch to add this in comment in
> autotools.bbclass so that this gets documented somewhere ?

Yes.

Cheers,

Richard


