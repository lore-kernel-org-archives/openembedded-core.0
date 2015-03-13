Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 66D1A71F1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:31:16 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so102070106iec.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=WfTVD/sqx9xY9Y1MXKCZL/HBAR4YxOGcSfiBNATiGS0=;
	b=TfHJ9B0tUgbXGWwNoTBmENPKlHeiY03b4IT+i2rPaM6fQJcxlHLxK5XjLMGP/bncw2
	epHrI0CiZWcQ2e7zcV62GeEFwLk5Z0EDIgxL0XwD3WbtD0ea75TrbtN5Vt+p0/8M2a8V
	HFgSeb+tjwRa81hKUuxqp/nAbK8D8o8wUDxCLB3BbdQtvMX9lGxKWviDY0WqgD7ittvJ
	JASgTO4LLw8F9ylkGAkIsxd2TKKUGggxhuopKo4oI1xCNhWDQL/sW9GehwAQkTh+acat
	59oLWUmhALqB4vGR3e/YFKkQgZZyqtsUNd4guNgy0DGfuNGh5uEzv/Ac+hJaOQ0MR0ep
	TZew==
X-Gm-Message-State: ALoCoQkt2yerUojKQCEFS+qmIp3NWVNvf8w7A168LhwqyYqF58SQRW6u5fEPqsIG6aJ1MxPsfpuX
X-Received: by 10.50.142.38 with SMTP id rt6mr84368488igb.39.1426253469947;
	Fri, 13 Mar 2015 06:31:09 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C8C2.dip0.t-ipconnect.de. [93.232.200.194])
	by mx.google.com with ESMTPSA id 130sm1270207ioz.10.2015.03.13.06.31.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 06:31:08 -0700 (PDT)
Message-ID: <1426253465.3602.19.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:31:05 +0100
In-Reply-To: <1782246.kyus0MKleI@peggleto-mobl5.ger.corp.intel.com>
References: <1425905799-9101-1-git-send-email-patrick.ohly@intel.com>
	<1687842.XY6UoZ3apI@peggleto-mobl5.ger.corp.intel.com>
	<1426189532.3602.9.camel@intel.com>
	<1782246.kyus0MKleI@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] combo-layer: make Signed-off-by optional
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
X-List-Received-Date: Fri, 13 Mar 2015 13:31:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-03-13 at 08:57 +0000, Paul Eggleton wrote:
> On Thursday 12 March 2015 20:45:32 Patrick Ohly wrote:
> > On Thu, 2015-03-12 at 18:21 +0000, Paul Eggleton wrote:
> > > On Monday 09 March 2015 13:56:39 Patrick Ohly wrote:
> > > > +# global options
> > > > +[DEFAULT]
> > > > +
> > > > +# Add 'Signed-off-by' to all commits that get imported automatically.
> > > > +signoff = True
> > > > +
> > > > 
> > > >  # component name
> > > >  [bitbake]
> > > >  # mandatory options
> > > 
> > > So I'm OK with adding this in as an option. However to me a name like
> > > DEFAULT implies you're establishing a general section to apply default
> > > settings for all components where the component can override those
> > > defaults if it chooses, which doesn't really represent what this does -
> > > so a different name might be more appropriate (GLOBAL or _global_
> > > perhaps?)
> > 
> > "DEFAULT" is the special string that Python's ConfigParser uses, well,
> > by default for that special section which does not show up in the list
> > of sections. I don't know how to rename that.
> > 
> > I'm probably abusing this concept a bit here: it seems that special
> > section is meant to provide default values that get returned also for
> > the other sections when they don't have their own value.
> > 
> > Here's a cleaner solution:
> >       * Get rid of the [DEFAULT] section in the file.
> >       * When reading it, on-the-fly prepend the string
> >         '[this-is-not-really-a-repo'].
> >       * When reading global properties, get it from that section.
> >       * When listing sections to find repos, ignore it.
> > 
> > How about that?
> 
> Hmm, ok, I wasn't aware of this built-in "DEFAULT" section behaviour. A simple 
> solution then would just be to make this setting per-component and keep the 
> DEFAULT usage in the example config - although I do realise it's unlikely to be 
> very useful on a per-component basis, at least it will work in the same way as 
> other values we read from there.

Okay, I'll do that. It has the additional benefit of introducing the
[DEFAULT] section in the example. It may be useful also for other
properties, like a "branch = master".

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




