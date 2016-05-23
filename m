Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 4FFD160290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 12:13:33 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:to:cc:message-id:in-reply-to:references:subject:mime-version:content-type:user-agent;
	b=aGxRVxPlojDgbOu56E/w44/8FpJ2LYaxsg6UodXJFNZ/UmB4sK9EPlHAtH2SbQVkXpuHAR83ymaQ
	hNi+oBryf+H6qsKGsnqOuE/XwQG50nNhUTGLxXgOd8d7Jf/r6+sdmCHRzO3NqA6VS7Oi4XF8JO1K
	Q+QMafD1fwlR2Es2b0M=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1464005608671678.7818523027096;
	Mon, 23 May 2016 05:13:28 -0700 (PDT)
Date: Mon, 23 May 2016 08:13:28 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
To: "ed.bartosh@linux.intel.com" <ed.bartosh@linux.intel.com>
Message-ID: <154dd88c4a6.d1f78c40166145.7475080368514196708@geekcentral.pub>
In-Reply-To: <20160523103623.GA18324@linux.intel.com>
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
	<20160523103623.GA18324@linux.intel.com>
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
X-List-Received-Date: Mon, 23 May 2016 12:13:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

 ---- On Mon, 23 May 2016 06:36:23 -0400 Ed Bartosh <ed.bartosh@linux.intel.com> wrote ---- 
 > On Thu, May 19, 2016 at 05:52:45AM -0400, Ian Geiser wrote: 
 > > Greetings, I am trying to learn "wic" and have been confused as how to create a "live" style image.  I am following "http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html#creating-partitioned-images" but am getting confused on the target to use to create the a file system that has a single squashfs file containing my root file system.   
 > >  
 > > My desired partition layout is as follows: 
 > >       40MiB                 40MiB               300MiB 
 > > +--------------------+-----------------+-----------------------------+ 
 > > |      BOOT (esp)    |    DATA (fat)   |          ROOT (live)        |   
 > > +--------------------+-----------------+-----------------------------+ 
 > >  
 > > BOOT - efi boot partition with kernel and initramfs 
 > > DATA - generic fat filesystem to hold configuration files 
 > > ROOT - an ext4 filesystem that contains a single os.img, which is a squashfs file. 
 > >  
 > > I have ROOT and DATA figured out but I am at a loss as how to generate the os.img file and copy it into ROOT.  If I generate the os.img file with bitbake and then use the "-r" option to manually supply a directory structure it works, but I would rather have it done from a wks file for automation reasons. 
 > >  
 > > Any hints? 
 > I'd suggest to use wic image type and generate your image by bitbake. 
 > You can find example wic-image-minimal.bb and wic-image-minimal.wks in ../meta-selftest/recipes-test/images/ 
 >  
This is where I started.  I was able to make it work but not with my configuration above.  It looks like I can use a type of "fsimage" for my "ROOT" partition, but I have not been able to figure out the syntax there yet.  For "BOOT" I am at a complete loss.  In theory "bootimg-efi" but there doesn't seem to be a way to provide an initramfs.

 > You can probably do the same by using wic plugins, but I'd not suggest 
 > to go this way. Using wic image type is simpler, more consistent, easier to do and provides higher level of automation. 

Is using the wic image type and a plugin mutually exclusive?

Thanks!




