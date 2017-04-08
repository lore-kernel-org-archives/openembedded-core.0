Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7444277BCD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Apr 2017 08:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v388cWiq001184; 
	Sat, 8 Apr 2017 09:38:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id E7Ei0Rd8fIqs; Sat,  8 Apr 2017 09:38:34 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v387QjmG030772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 8 Apr 2017 08:26:46 +0100
Message-ID: <1491636405.17200.107.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 08 Apr 2017 08:26:45 +0100
In-Reply-To: <1491601656.17200.104.camel@linuxfoundation.org>
References: <cover.1491483222.git.jussi.kukkonen@intel.com>
	<1491601656.17200.104.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/4] Use fixed DISTRO_FEATURES for native
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
X-List-Received-Date: Sat, 08 Apr 2017 08:38:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-04-07 at 22:47 +0100, Richard Purdie wrote:
> On Fri, 2017-04-07 at 09:08 +0300, Jussi Kukkonen wrote:
> > 
> > Avoid signifant native task churn when DISTRO_FEATURES is changed
> > by defining a fixed DISTRO_FEATURES value (default is "") for
> > native
> > recipes.
> > 
> > The xorg changes are all removals of x11 requirements (that were
> > not
> > real) from recipes that have native versions.
> > 
> > I added a configuration default in bitbake.conf, let me know if
> > this
> > is not a good place.
> > 
> > This seems to work fine (tested multiple different images) but I am
> > not really sure how to test it further... Suggestions are welcome,
> > as
> > are results from autobuilder. 
> Close, but:
> 
> https://autobuilder.yocto.io/builders/nightly-no-x11/builds/225/steps
> /BuildImages/logs/stdio

and also https://autobuilder.yocto.io/builders/nightly-qa-extras/builds
/218 which I traced back to the api-documentation piece in gtk-doc-
native (see PACKAGECONFIG).

Cheers,

Richard




