Return-Path: <Liam.Howlett@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C80886072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 16:06:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6PG6TVc029926
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Jul 2016 09:06:29 -0700 (PDT)
Received: from yow-lhowlett-d0.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 25 Jul 2016 09:06:28 -0700
Date: Mon, 25 Jul 2016 12:06:26 -0400
From: "Liam R. Howlett" <Liam.Howlett@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160725160626.GG16105@yow-lhowlett-d0.wrs.com>
References: <1469211845-21125-1-git-send-email-Liam.Howlett@WindRiver.com>
	<CAJTo0LbM1Jvcq59TPNHnU6NwOBwp2yfVEPE1KNMx2bw4YDfR-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbM1Jvcq59TPNHnU6NwOBwp2yfVEPE1KNMx2bw4YDfR-A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Originating-IP: [128.224.56.205]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: Add --ssh-askpass support
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
X-List-Received-Date: Mon, 25 Jul 2016 16:06:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Burton, Ross <ross.burton@intel.com> [160722 15:21]:
> On 22 July 2016 at 19:24, Liam R. Howlett <Liam.Howlett@windriver.com>
> wrote:
> 
> > wget: Add --ssh-askpass support
> >
> > This adds the --ssh-askpass option which is disabled by default.
> >
> > --ssh-askpass will request the username and password for a given URL by
> > executing the external program pointed to by the environment variable
> > SSH_ASKPASS.  If the environment variable is not set, an error is
> > returned.  If an error occurs requesting the username or password, wget
> > will exit.
> >
> > Upstream-Status: Pending
> >
> 
> That's a fairly big patch to be carrying and forward porting everytime they
> release, have you sent this upstream?

Yes.  I am working with upstream to get this patch integrated.

Thanks,
Liam

> 
> Ross

