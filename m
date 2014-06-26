Return-Path: <tom.rini@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2494260889
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 13:47:18 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id f51so3014072qge.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 06:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=RwSRwa/RfeqKi4SY3TDYG6Tl9NOJm/nlqQMtjeV73tY=;
	b=IQ0CFHcM7Z4GKiv9Vg03NgRDRZSbIgGrrIagQZm8YOpBKctHqArEKFNNUwsz2JwNgm
	aHl6aqVOswc7GHPrFwx0ISTbf7jE96RadlVJbJb6JRExxokaJv89frXiCLBEbm/8gJhy
	0048q46KSjtUpB1f5a+/EtFwm/kfbiUkxA764IMx1cgZkn5xzsaM9pz5N+BAazKjF3Lo
	FA8a8QpI8FgmZ1mvf9wB/6erwzEZmmsjuL4Qq9dipEks0aHRa3PZxYDO+Xw5zntmBw+E
	LKGnCT+gbFZwzi/e43xL+hM9cIia4yHqXJxGC9T/uJsVlDJETuJuP6xyLEOU8KDbznnU
	0RrQ==
X-Received: by 10.140.27.229 with SMTP id 92mr20500308qgx.18.1403790439538;
	Thu, 26 Jun 2014 06:47:19 -0700 (PDT)
Received: from bill-the-cat (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id g8sm11309705qam.38.2014.06.26.06.47.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 26 Jun 2014 06:47:18 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Thu, 26 Jun 2014 09:47:20 -0400
From: Tom Rini <trini@ti.com>
To: "Maxin B. John" <maxin.john@enea.com>
Message-ID: <20140626134720.GO9006@bill-the-cat>
References: <1403687639-13030-1-git-send-email-maxin.john@enea.com>
	<20140626122700.GM9006@bill-the-cat>
	<20140626133407.GA20735@sestofb10.enea.se>
MIME-Version: 1.0
In-Reply-To: <20140626133407.GA20735@sestofb10.enea.se>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot-fw-utils: install config file
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
X-List-Received-Date: Thu, 26 Jun 2014 13:47:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2014 at 03:34:07PM +0200, Maxin B. John wrote:
> Hi Tom,
> 
> On Thu, Jun 26, 2014 at 08:27:00AM -0400, Tom Rini wrote:
> > On Wed, Jun 25, 2014 at 11:13:59AM +0200, Maxin B. John wrote:
> > > From: "Maxin B. John" <maxin.john@enea.com>
> > > 
> <snip>
> > > +  install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> > >  }
> > >  
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > We should really provide some way for the BSP to provide a functional
> > fw_env.config file as the one in the sources is mainly an example and
> > unlikely to work on most systems.
> I do agree that it is just an example file. However, without the configuration 
> file, fw_printenv will fail with this warning:
> 
> #fw_printenv 
> Cannot parse config file: No such file or directory
> 
> IMHO, those who want to use a "real" config file, should use a proper ".bbappend"
> eg:
> 
> do_install_append() {
> 
> case "${MACHINE}" in "mymachine" )
>         echo ' myargs '> ${D}${sysconfdir}/fw_env.config;;
> *);;
> 
> esac
> }
> 
> Is this an acceptable way or should we modify it ?

Ah, OK, cobwebs dusted off.  The u-boot recipe currently provides
fw_env.config correct for the board in question, so long as it's
provided.

-- 
Tom

