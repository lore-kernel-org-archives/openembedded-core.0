Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5004771ADD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 10:45:18 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v58AjCQJ026473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 8 Jun 2017 11:45:13 +0100
Message-ID: <1496918712.6630.237.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>
Date: Thu, 08 Jun 2017 11:45:12 +0100
In-Reply-To: <1496901892.30163.119.camel@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<7942e5efccf0ee4fa360948d892b4508e3f1f00c.1496849345.git-series.patrick.ohly@intel.com>
	<13cfc543313a4c59bb8c9688c91db3c4@XBOX02.axis.com>
	<1496901892.30163.119.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 08 Jun 2017 11:45:13 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Thu, 08 Jun 2017 10:45:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-08 at 08:04 +0200, Patrick Ohly wrote:
> On Wed, 2017-06-07 at 16:11 +0000, Peter Kjellerstedt wrote:
> > 
> > Rather than requiring that the wanted DISTRO_FEATURES that should
> > be 
> > available as overrides are defined in DISTRO_FEATURES_OVERRIDES
> > (which 
> > should not be confused with the similarly named
> > DISTROFEATURESOVERRIDES 
> > variable that you also add...),
> I had thought about those names and in the end went ahead with the
> similar names because the customizable one made sense to me and the
> internal one is similar to the other entries in OVERRIDES.
> 
> > 
> >  why not add them all but with a prefix. 
> > I.e., similar to how package names are available as overrides
> > prefixed 
> > with "pn-", how about all distro features are made available as 
> > overrides with a "df-" prefix?
> That would be fine with me.
> 
> I just have a few concerns:
>       * How performance-sensitive is OVERRIDES? How can the impact of
>         both approaches be benchmarked? The idea behind the
> configurable
>         subset was to add only a few new overrides. We currently have
>         almost 70 individual entries in DISTRO_FEATURES.
>       * I've seen confusion about the pn- prefix. At least df- would
> be
>         named appropriately (in contrast to PN, which is historic),
> but
>         it's yet another convention that might not be immediately
>         obvious. The same is true for selecting a subset with the
> same
>         name as the feature, though.
>       * Can distro features contain characters that are invalid in an
>         override? _ and : would have to be avoided, for example by
>         mapping them to -.

My feelings are:

* We need to use a prefix. We've been burnt too many times in the past 
  when not using these. "df-" is fine, users will just have to deal 
  with it.

* We should filter the list of overrides to those which the distro 
  wants to nominate. I really don't want to encourage wider spread of 
  things than we need to, these need to be conscious decisions.

Cheers,

Richard





