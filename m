Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA007717D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 15:19:58 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:to:cc:message-id:in-reply-to:references:subject:mime-version:content-type:user-agent;
	b=G9BrlZKL0KQ2LVmtVj8SYPE/7cxuW0BmADMGt2vHU+COtyGGUWVc9ubGZ9/Y6TQ6/qeUr32l8SAs
	j2vQIqzlTcmDDzlo9jZ8koPiOlERCdSIh0EPoFrqwPQ/dDN8ZjsVhfOzkkThO+0baZyJu6JekjDE
	RwrRcqsnQioBL0HhYdY=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1464707993595357.5518725572356;
	Tue, 31 May 2016 08:19:53 -0700 (PDT)
Date: Tue, 31 May 2016 11:19:53 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
To: "ed.bartosh@linux.intel.com" <ed.bartosh@linux.intel.com>
Message-ID: <15507664fc6.c45b162328322.6290427595322992343@geekcentral.pub>
In-Reply-To: <20160524195145.GA21158@linux.intel.com>
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
	<20160523103623.GA18324@linux.intel.com>
	<154dd88c4a6.d1f78c40166145.7475080368514196708@geekcentral.pub>
	<20160524195145.GA21158@linux.intel.com>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Wic and "live" images
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
X-List-Received-Date: Tue, 31 May 2016 15:20:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


 ---- On Tue, 24 May 2016 15:51:45 -0400 Ed Bartosh <ed.bartosh@linux.intel.com> wrote ---- 
 > On Mon, May 23, 2016 at 08:13:28AM -0400, Ian Geiser wrote: 
 > >  > On Thu, May 19, 2016 at 05:52:45AM -0400, Ian Geiser wrote:  

[...snip...]

 > How about creating recipe to prepare content or your boot partition and then using --source rootfs --rootfs-dir=<your recipe> ? 
 > This is much more generic way of creating partitioned images from my 
 > point of view. Image recipes should take care of content and wic takes care of 
 > putting that content into partitions according to the partitioning 
 > scheme described in .wks 
 >  
 > Does it make sense for you? 

I am at a loss how to do this because it is a efi system partition.  Really all it needs is the kernel, initramfs and bootx64.  I see how to do the kernel and the bootx64 in the existing plugin.  What I get turned around with is the initramfs.  It seems like there is no way to put that in, or use a kernel with the initramfs appended.  Is this a limitation that is fixed by "send a patch" or am I missing something there.

 >  
 > >  
 > >  > You can probably do the same by using wic plugins, but I'd not suggest  
 > >  > to go this way. Using wic image type is simpler, more consistent, easier to do and provides higher level of automation.  
 > >  
 > > Is using the wic image type and a plugin mutually exclusive? 
 > No, not at all. However, I personally found the way I described above 
 > more consistent, flexible and easy to implement and maintain. 
 
I am not groking this concept because it seems without a robust library of plugins the wks files become very hard to implement.  Is this true, or am I again missing something obvious.

Thanks for your patience. 


