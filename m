Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 005B9780C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 07:41:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4U7fhkb031745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 30 May 2017 08:41:44 +0100
Message-ID: <1496130103.25229.155.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 30 May 2017 08:41:43 +0100
In-Reply-To: <1601098.y1ZEXWJiEU@peggleto-mobl.ger.corp.intel.com>
References: <1496034979-99713-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1496034979-99713-2-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1496100696.25229.150.camel@linuxfoundation.org>
	<1601098.y1ZEXWJiEU@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 30 May 2017 08:41:44 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] devshell.bbclass: ensure toolchains available for do_devshell
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
X-List-Received-Date: Tue, 30 May 2017 07:41:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-05-30 at 12:07 +1200, Paul Eggleton wrote:
> Hi Richard,
> 
> On Tuesday, 30 May 2017 11:31:36 AM NZST Richard Purdie wrote:
> > 
> > On Mon, 2017-05-29 at 13:16 +0800, Chang Rebecca Swee Fun wrote:
> > > 
> > > Toolchains are required to be prepopulated in sysroot before
> > > entering devshell.
> > > 
> > > [YOCTO #11464]
> > > 
> > > Signed-off-by: Chang Rebecca Swee Fun 
> > > ---
> > >  meta/classes/devshell.bbclass | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > This looks awfully complicated and I'm not sure this does much more
> > than this would:
> > 
> > -addtask devshell after do_patch
> > +addtask devshell after do_prepare_recipe_sysroot
> > 
> > Can someone explain to me why we want to do the below instead as I
> > think the effect is the same?
> > 
> > I did read the bug too but that didn't help answer my question.
> > 
> > Yes, this does mean devshell will now trigger a lot of more
> > dependencies and build but I think the change below would do the
> > same
> > thing too.
> I'd suggested the method Rebecca is using in the bug, but you're
> right, I'm 
> not sure why I didn't think of doing as you suggest instead.
> Presumably 
> however since do_prepare_recipe_sysroot doesn't depend on do_patch we
> would 
> still need to depend on that i.e.:
> 
> addtask devshell after do_patch do_prepare_recipe_sysroot
> 
> Right?

Yes, you're right that we still need do_patch too.

Cheers,

Richard




