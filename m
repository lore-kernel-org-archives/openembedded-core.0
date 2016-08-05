Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A34D57713D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 21:18:43 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id h186so20646389pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 14:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2zO+cKhM4EycC0jBoNSdhE8DyLsI/jWiY6Pbx9HLvww=;
	b=Mha7KcAotATFMeUL+qSaxdsDo6Qo9NkZOVV+5+jBCy9KcJDnnQy+XIwA95V4USw+Si
	x0GrbI/oDipCRscaZLm1GuS+h7sioOoOUIudyah/0JA2vSSPAArRaTPTc5FeZe5Mcatc
	9ruJh1/8RYq5lCuhEvRSyazIc6FEZfYvSCxFQvg3xhT22J6/BgeCNmAGXy4Z4QdO2cOr
	GXGC6T7hiAa+wRIbr213SxNEKMVg+2SIs4YqOh0whrkQ8+Cjbs4mlc+aGPsYUgwf9oPc
	ThNvjfkx/2JJUlt/9kpIooA+1ybE/dWXFJa70/ZSrKZaghT1nLn0HURjQsi1jpNqaG/0
	L3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2zO+cKhM4EycC0jBoNSdhE8DyLsI/jWiY6Pbx9HLvww=;
	b=BVZyTU4Gh6x+n8RN/0RFVV5bctGMgETpjNjbU2wnh5zCYA5BAk7xKPedtxKCGx0NMM
	lParBLkMK6wY2tM9Adgg96TFP90yzEc4et6sF9BDfTw28W7jSh5c0jaNridQ0KkqTqcn
	oxThXA0M3KXJ79PDEd2HA98rrq2fgR7alSnoJX5dhdIuAR7L8R7IDLJuC203yP5X8fVD
	jmFYdMFIhzHKJAGT8vvBto08mREeTNDL4h/qGsnN+ugnDe9UfinezoDOcCAkF546Cg9W
	q+KC2bQ0qMp22MlVvrC+S+9rZX2U+ftzCju16tN0jzdq0Dy9FpaHWtYMA96fCp9Ym9sc
	uplQ==
X-Gm-Message-State: AEkoouu4qDhJOn658uTay0kinCOT+fEgXNngyPL97E/fDwJdZCXYcGmlYuepODYmY89EuQ==
X-Received: by 10.98.149.131 with SMTP id c3mr140853581pfk.73.1470431923962;
	Fri, 05 Aug 2016 14:18:43 -0700 (PDT)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	q4sm30149004pfb.18.2016.08.05.14.18.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 14:18:42 -0700 (PDT)
Date: Fri, 5 Aug 2016 14:18:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20160805211836.GA3009@haswell>
References: <alpine.LFD.2.20.1608051449110.5757@localhost.localdomain>
	<EA1E233F-E790-4830-A15F-D0FCE8E0A418@gmail.com>
	<alpine.LFD.2.20.1608051710350.7122@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1608051710350.7122@localhost.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what must i supply WRT UBOOT_CONFIG/UBOOT_MACHINE when u-boot isn't in BSP?
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
X-List-Received-Date: Fri, 05 Aug 2016 21:18:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 16-08-05 17:11:34, Robert P. J. Day wrote:
> On Fri, 5 Aug 2016, Khem Raj wrote:
> 
> >
> > > On Aug 5, 2016, at 11:52 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > >
> > >  i'm in the situation where i want to add the u-boot-fw-utils package
> > > to my image, but the corresponding u-boot source for the target is not
> > > part of the BSP layer; in fact, it's not part of a layer at all (built
> > > manually elsewhere), so it's unsurprising that, if i add that recipe
> > > to the image, i get:
> > >
> > > ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
> > > UBOOT_CONFIG must be set in the ... machine configuration.
> > > ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
> > > UBOOT_CONFIG must be set in the ... machine configuration.
> > >
> > > is there a short doc that explains what i minimally need to supply to
> > > build that package? i've never been in the situation where u-boot
> > > wasn't part of the BSP.
> >
> > perhaps you need to set UBOOT_MACHINE = "config"
> 
>   i apologize, but i have no idea what that means. does that mean i
> want to build that package, and it will consult /etc/fw_env.config
> when the executables are run?

well, the errors you reported above are issued when OE is trying to
build the u-boot-fw-utils recipe and BSP does not define the
UBOOT_MACHINE, I was merely pointing to a possible solution. I do
not know your usecase.

