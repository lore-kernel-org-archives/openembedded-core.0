Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 526FD6E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 15:38:41 +0000 (UTC)
Received: by igui7 with SMTP id i7so15064696igu.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 08:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=CiFjHsEdDzqyYrL09z3/tfM3aKpMt55UZP8UlBWZMzo=;
	b=XWT5P9PCpTwVBH/K96WFKkX2D97jkpLYrGQk7IHzM60pbitjax14ZWltB386euG6cY
	wwePu98moqGyqsG/b1Ea6VEbUAPGSw7k9OFNy/ruGOZUuEqDeezZuQdDagVvMsM19/aW
	bVEcFqYo3JGrSJTQ/jwDfitpr1d+OJRc9Hkkfl99ekAIjwpGG4IUCO9KgZY6efCgyF1C
	25Zl2i1oWTPQQDVL6vhwq0j12q4NFoiUWFELfOdq1pW8dB79RnykMy0gw72OHa/AZFwB
	algEAsUpAH8cL9aboeRPnRY99q84lbZ1/wpnohEBg4jGBF7qCV9bnKPIBLO53KZZRw5D
	Vhjg==
X-Gm-Message-State: ALoCoQktMmNEhPnBNZUPux7aaLFDLAMN+ABk99NigiLIjA87fKI00CPTbJcmMAjf4XjAAONkdpZP
X-Received: by 10.50.97.71 with SMTP id dy7mr3417239igb.76.1439566721973;
	Fri, 14 Aug 2015 08:38:41 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D814.dip0.t-ipconnect.de. [93.232.216.20])
	by smtp.gmail.com with ESMTPSA id vk8sm2826276igb.4.2015.08.14.08.38.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Aug 2015 08:38:41 -0700 (PDT)
Message-ID: <1439566718.28153.67.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 14 Aug 2015 17:38:38 +0200
In-Reply-To: <2022011.zuQSkpBHkd@peggleto-mobl.ger.corp.intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0La2Q-jeFBRND7pYoWW5HQByu7pgEcOzexqJw1FSe2fQiA@mail.gmail.com>
	<1439563928.28153.65.camel@intel.com>
	<2022011.zuQSkpBHkd@peggleto-mobl.ger.corp.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] tar-replacement-native: avoid race condition with host tar
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
X-List-Received-Date: Fri, 14 Aug 2015 15:38:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-14 at 15:56 +0100, Paul Eggleton wrote:
> On Friday 14 August 2015 16:52:08 Patrick Ohly wrote:
> > On Fri, 2015-08-14 at 12:03 +0100, Burton, Ross wrote:
> > > On 14 August 2015 at 12:01, Paul Eggleton
> > > 
> > > <paul.eggleton@linux.intel.com> wrote:
> > >         Or install the buildtools perhaps.
> > > 
> > > Yes, I had that in my head but someone failed to write it down.
> > > There's a fair chance that a host with a sufficiently old tar also
> > > needs other updates, and that's when buildtools is used (which
> > > includes tar).
> > 
> > The hosts we talk about (Debian 7, CentOS 6) work fine for normal usage
> > without having to install buildtools.
> 
> Really? You must have added *something* on top of CentOS 6 because last I 
> checked its git, tar and python versions supplied out of the box were way too 
> old to even get the build to start.

I thought someone had said that CentOS is okay out-of-the-box, but I may
have misunderstood.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




