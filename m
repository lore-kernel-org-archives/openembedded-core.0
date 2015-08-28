Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2ED60043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 08:33:56 +0000 (UTC)
Received: by ioej130 with SMTP id j130so3326064ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 01:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=6G3HdCdcQppfqfEu+T3qPMwOgboQ5VLlVaGefVBw2AE=;
	b=LjG5DMMG+243Mr+75xEx8Lb64eo+SOLv8oyfm7NuZbXNWwi0O5sjxp8LkuaLwwhIV/
	sz+Jzuyz6+8w9jqPEzepUy9h9Jph4PICTcBu9l4HiSECql8ePraKeV9d+8NvzyXcKJ3w
	FHuqoR02lT60KInYmgZ2RQr+6bQr9yiS3+v6M5K+QqBsLXjzgGcHHsxAS8edLGJ5e682
	dFy/7LAmFR13orh3/lqnB5rqdI2qeVFS7Xz1ga876stGSZrnvK6xPKoCpINhGpnCkzcQ
	fnurcNxal3a/b4wY8OAyzhioqv+VWxIGk6sSBL+5drXRCwyIJcr/mJF8WA+pBYQhC3Me
	vQDA==
X-Gm-Message-State: ALoCoQmqes2u7y3kHoQ6IaHf/YiQqijijdAyBqL6C0lbysb+7cWwG5ftD/1Tb2ulc2+m5dC4davw
X-Received: by 10.107.10.9 with SMTP id u9mr12150702ioi.118.1440750836305;
	Fri, 28 Aug 2015 01:33:56 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F655.dip0.t-ipconnect.de. [93.232.246.85])
	by smtp.gmail.com with ESMTPSA id
	o189sm1261128ioe.30.2015.08.28.01.33.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 01:33:55 -0700 (PDT)
Message-ID: <1440750833.3006.85.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Fri, 28 Aug 2015 10:33:53 +0200
In-Reply-To: <55DF69EF.9050303@linux.intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1440681597.3006.35.camel@intel.com> <55DF69EF.9050303@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/3] Add UEFI firmware for qemux86*
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
X-List-Received-Date: Fri, 28 Aug 2015 08:33:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-08-27 at 14:50 -0500, Leonardo Sandoval wrote:
> On 08/27/2015 08:19 AM, Patrick Ohly wrote:
> > When I use runqemu, it ends up invoking qemu with "-vga vmware". With
> > that, I don't see any output from TianoCore and booting hangs. It boots
> > when disabling graphical output ("serial nographic" as parameter of
> > runqemu) or when explicitly selecting a different graphics
> > ("'qemuparams=-vga std'"). Might be worthwhile adding to the commit
> > message.
> 
> In the 3/3 commit's description, there is a command line with the 
> nographic parameter. I did not test with any other kernel command line.

True, that example works. But it is not clear that the "nographic" is
important. Being explicit about it and adding the graphical case would
be useful.

> > Do you happen to know how non-volatile EFI variables are handled? There
> > are several posts from around 2012 saying that qemu does not support
> > storing nvram persistently (for example, [1]). I've not seen anything
> > more recent directly contradicting that, but there seems to be
> > something, at least in Fedora [2]. That patch mentions that "OVMF [...]
> > works in two
> > modes: 1) Code and UEFI variable store is mixed in one file. ...".
> >
> 
> sorry, I do not know.

I think this will require further work - see my comment on the runqemu
patch.

Do you have time for a forth revision?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




