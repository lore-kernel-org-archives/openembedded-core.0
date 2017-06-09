Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E448278267
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 10:02:34 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v59A2TOK007462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 9 Jun 2017 11:02:30 +0100
Message-ID: <1497002549.6630.258.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 09 Jun 2017 11:02:29 +0100
In-Reply-To: <1496932588.30163.135.camel@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<4e9ae0188740bcab90705399321c8db4631ecbc0.1496849345.git-series.patrick.ohly@intel.com>
	<1496913653.6630.233.camel@linuxfoundation.org>
	<1496932588.30163.135.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 09 Jun 2017 11:02:30 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] utils.py: helper function for optional include files
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
X-List-Received-Date: Fri, 09 Jun 2017 10:02:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-08 at 16:36 +0200, Patrick Ohly wrote:
> On Thu, 2017-06-08 at 10:20 +0100, Richard Purdie wrote:
> > 
> > require ${@bb.utils.contains(d, "DISTRO_FEATURES", "xyz", "x.inc
> > y.inc z.inc", "")}
> > 
> > How about simply:
> > 
> > require ${@oe.utils.distro_features(d, "foo bar", "foo-or-
> > bar.inc")}
> > require ${@bb.utils.distro_features(d, "xyz", "x.inc y.inc z.inc")}
> That works for me, I just wonder about the exact semantic of listing
> multiple features: "and" as in contains(), or "any"?
> 
> I'm leaning towards two functions where that is explicit:
>   oe.utils.all_distro_features(d, "foo bar", "foo-and-bar.inc")
>   oe.utils.any_distro_features(d, "foo bar", "foo-or-bar.inc")

I think you're right, this distinction is easily missed and I think its
an idea to highlight it as you propose...

Cheers,

Richard


