Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAmVE-0002d9-8b
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 20:45:05 +0200
Received: by pbcwy7 with SMTP id wy7so1579415pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Sep 2012 11:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=AUNM5obBmiqjXjeIZ4NIGMsx8yJ0CB0W7hIjclJjp1s=;
	b=JqupCuBnF6TjcwbGUogLKNbq2mPoJnIZNPVmFrG/8/nXTerPc9mtpgpQdGfMIXPyqG
	WOHZMkP1wmJf2jsu/E0py2N0HTarBTGQtXBviPqjMv1RAI7kGnnrP28RA8pCnjD5kSdF
	E05095KwzASBUggsVsyyk9SfzC6p9itfBvWhvzxB1/vSGQdzO2zaxgCwFl9y6uG9Nv/F
	yzpHONs3OPm8si8SFKK1/VbsIw/6lk/hR7OMBZX6P4ysYEk4aJMckR1vXYs+hFh+cVLh
	xrTQvSGmWBNZGyowPfsLEiOJyvW9MbSApDgCaSw6tiKUdggDn8PaGdjBxb6+mtVCL2nr
	aXTw==
Received: by 10.68.193.196 with SMTP id hq4mr1441056pbc.32.1347215555079;
	Sun, 09 Sep 2012 11:32:35 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ho7sm6636069pbc.3.2012.09.09.11.32.33
	(version=SSLv3 cipher=OTHER); Sun, 09 Sep 2012 11:32:34 -0700 (PDT)
Date: Sun, 9 Sep 2012 11:31:48 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120909183146.GA14698@sakrah.homelinux.org>
Mail-Followup-To: Phil Blundell <philb@gnu.org>,
	openembedded-core@lists.openembedded.org
References: <1347187725.4396.259.camel@x121e.pbcl.net>
	<CAMKF1soL0MPz7RPenc=SYV_7R7VRHvrHBjiFramP7xw3E4PBfQ@mail.gmail.com>
	<1347213501.4396.262.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1347213501.4396.262.camel@x121e.pbcl.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow-native: Ensure that ${sbindir} and ${base_sbindir} are respected
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Sep 2012 18:45:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/09/12 18:58), Phil Blundell wrote:
> On Sun, 2012-09-09 at 08:35 -0700, Khem Raj wrote:
> > On Sun, Sep 9, 2012 at 3:48 AM, Phil Blundell <philb@gnu.org> wrote:
> > > These values need to be passed on the command line to "make install" otherwise
> > > shadow will use its own built-in idea of where those directories are located.
> > >
> > 
> > why would we care for it in a native recipe.
> 
> Because the binaries won't get staged into the sysroot if they are in
> the wrong place.

OK. it seems its not respecting $prefix ?

> 
> p.
> 
> 

-- 
-Khem


