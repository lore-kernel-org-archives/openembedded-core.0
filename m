Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UFrWx-0006Ac-6u for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 20:40:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2DJVrpj031092; Wed, 13 Mar 2013 19:31:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Hrf8e+elmO9z; Wed, 13 Mar 2013 19:31:53 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2DJVf9Y031089
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 13 Mar 2013 19:31:48 GMT
Message-ID: <1363202574.28128.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 13 Mar 2013 19:22:54 +0000
In-Reply-To: <923A8385-1063-4C78-92ED-9441F19E338B@dominion.thruhere.net>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
	<1363010209-18220-3-git-send-email-cristian.iorga@intel.com>
	<20130312070053.GE9724@jama.dyndns-home.com>
	<CAJTo0LZtUg+fUrLd6sVfSk1gQrauyq60ukMg5jh-_kcgeaK0Lg@mail.gmail.com>
	<20130312100713.GJ9724@jama.dyndns-home.com>
	<CAJTo0LZdYx9RLJ9an7LnALUOL5PkeUapnrMA5GyiDROcgwXbKw@mail.gmail.com>
	<923A8385-1063-4C78-92ED-9441F19E338B@dominion.thruhere.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 2/2] bluez5: new package for v5.3
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
X-List-Received-Date: Wed, 13 Mar 2013 19:40:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-03-13 at 10:14 +0100, Koen Kooi wrote:
> Op 12 mrt. 2013, om 16:13 heeft "Burton, Ross" <ross.burton@intel.com> het volgende geschreven:
> 
> > On 12 March 2013 03:07, Martin Jansa <martin.jansa@gmail.com> wrote:
> >>> You can't just upgrade from bluez4 to bluez5 like you'd upgrade from
> >>> glib 2.10 to glib 2.12 - the API was totally rewritten and the reason
> >>> that we're maintaining both is because removing bluez4 would mean
> >>> removing bluetooth support is most of the integration points (connman
> >>> being the notable exception).
> >>> 
> >>> A distro upgrades from 4 to 5 when they've made the explicit decision
> >>> to do so, and changes all of their dependencies to reflect this.
> >> 
> >> That would work with bluez_5.3 with negative D_P too, wouldn't it?
> >> 
> >> Now they need to refine RREPLACES/RCONFLICTS/RPROVIDES combo in distro
> >> config too when they do explicit decision to change bluez version.
> > 
> > Yes, so bluez4 and bluez5 should explicitly conflict each other.  This
> > should be be done.
> > 
> > Obviously both approaches are valid.  the approach of major-in-name
> > was taken so that packages could depend on the version that they need
> > for clarity.  As the linkage is over DBus there won't be any shlib
> > dependencies, so it would be simple to build an image which contained
> > bluezN but was using the bluezM APIs.
> 
> And I remember the pain and churn when bluez4 was renamed to bluez. I
> don't want to go through that again.

For reference we still have "bluez4" in OE-Core as nobody wanted the
pain from a rename...

Cheers,

Richard



