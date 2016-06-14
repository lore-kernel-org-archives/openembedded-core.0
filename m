Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 777FA6010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 12:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5EC3a8j014849; Tue, 14 Jun 2016 13:03:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bKeajtIHFFGa; Tue, 14 Jun 2016 13:03:36 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5EC3YAN014844
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 14 Jun 2016 13:03:35 +0100
Message-ID: <1465905814.13979.208.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>, "Maxin B. John" <maxin.john@intel.com>
Date: Tue, 14 Jun 2016 13:03:34 +0100
In-Reply-To: <575FD133.1030008@windriver.com>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
	<c7d3b5b5d732304a31a843147fd123eda27a4794.1465697985.git.Qi.Chen@windriver.com>
	<20160614043843.GA22248@mbabyjoh-desk.ger.corp.intel.com>
	<575FD133.1030008@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] gzip: upgrade to 1.8
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
X-List-Received-Date: Tue, 14 Jun 2016 12:03:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-06-14 at 17:41 +0800, ChenQi wrote:
> On 06/14/2016 12:38 PM, Maxin B. John wrote:
> > Hi,
> > 
> > On Sun, Jun 12, 2016 at 10:21:02AM +0800, Chen Qi wrote:
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >   meta/recipes-extended/gzip/{gzip_1.6.bb => gzip_1.8.bb} | 0
> > >   1 file changed, 0 insertions(+), 0 deletions(-)
> > >   rename meta/recipes-extended/gzip/{gzip_1.6.bb => gzip_1.8.bb}
> > > (100%)
> > > 
> > > diff --git a/meta/recipes-extended/gzip/gzip_1.6.bb
> > > b/meta/recipes-extended/gzip/gzip_1.8.bb
> > > similarity index 100%
> > > rename from meta/recipes-extended/gzip/gzip_1.6.bb
> > > rename to meta/recipes-extended/gzip/gzip_1.8.bb
> > > -- 
> > > 1.9.1
> > gzip-1.8 build failed on qemux86 - musl:
> > http://errors.yoctoproject.org/Errors/Details/69401/
> > 
> > Best Regards,
> > Maxin
> > 
> 
> Thanks.
> I'll look into it.

I've updated the patch in -next to deal with this, and the
PREFERRED_VERSION warning it introduced too...

Cheers,

Richard

