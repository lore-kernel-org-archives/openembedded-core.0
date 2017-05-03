Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F1BF871AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 12:53:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v43CrK1g031966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 May 2017 13:53:21 +0100
Message-ID: <1493816000.23535.73.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Wed, 03 May 2017 13:53:20 +0100
In-Reply-To: <1493813847.4241.251.camel@intel.com>
References: <aec82a5d8c1b622749a12bea2c478a8ff7f363b1.1493808889.git-series.patrick.ohly@intel.com>
	<1493810039.23535.57.camel@linuxfoundation.org>
	<1493812409.4241.247.camel@intel.com>
	<CAJTo0LaHhRHzxmUaaF8MCHgKTvJPqKa0Q+rOjAd1vx4Ps0RE2Q@mail.gmail.com>
	<1493813847.4241.251.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 03 May 2017 13:53:21 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] QemuRunner: avoid tainting os.environ
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
X-List-Received-Date: Wed, 03 May 2017 12:53:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-05-03 at 14:17 +0200, Patrick Ohly wrote:
> On Wed, 2017-05-03 at 13:00 +0100, Burton, Ross wrote:
> > 
> > 
> > On 3 May 2017 at 12:53, Patrick Ohly <patrick.ohly@intel.com>
> > wrote:
> >         Then it wouldn't get logged. Not a particularly strong
> >         argument, though.
> >         If that's preferred, I can change the implementation.
> >         
> > 
> > 
> > I prefer the clarity of copying os.environ and adding to it over
> > running env, especially as you have whitespace/quoting to deal
> > with.
> > The variables added to the environment could easily be logged
> > separately, surely?
> They could be logged in start(), but at the moment the logging is in
> launch(), and if we keep the semantic the same as in
> subprocess.Popen()
> (i.e. caller provides entire environment), then that logging doesn't
> know which env variables might be worth logging.
> 
> Anyway, the variables weren't logged before either, so I'll just keep
> that and change to passing an env dict.

You could pass in the specific env delta you want to the function and
leave launch to infill anything which isn't set?

Cheers,

Richard

