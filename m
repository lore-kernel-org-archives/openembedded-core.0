Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UKXtd-0000jo-G3 for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:43:16 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UKXdB-0000An-Hd; Tue, 26 Mar 2013 18:25:53 +0100
Message-ID: <1364318752.6320.27.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 26 Mar 2013 17:25:52 +0000
In-Reply-To: <5482882.4phbAeRO1n@helios>
References: <cover.1363156578.git.Qi.Chen@windriver.com>
	<ab888a7abe849f3170d5386b577f8a92e8ff5385.1363156578.git.Qi.Chen@windriver.com>
	<5482882.4phbAeRO1n@helios>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rm_work.bbclass: inhibit rm_work per recipe
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
X-List-Received-Date: Tue, 26 Mar 2013 17:43:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-03-26 at 17:12 +0000, Paul Eggleton wrote:
> On Wednesday 13 March 2013 15:01:33 Qi.Chen@windriver.com wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> > 
> > Use RM_WORK_WHITELIST to inhibit rm_work per recipe. In this way,
> > one can use rm_work for the most of the recipes but still keep the
> > work area for the recipe(s) one is working on.
> > 
> > As an example, the following settings in local.conf will inhibit
> > rm_work for icu-native, icu and busybox.
> >     INHERIT += "rm_work"
> >     RM_WORK_WHITELIST += "icu-native icu busybox"
> > 
> > If we comment out the RM_WORK_WHITELIST line and do a rebuild, the
> > working area of these recipes will be cleaned up.
> 
> This is a great feature, but I just looked at it and realised that the term 
> "whitelist" isn't really correct - this is more of a blacklist.

This doesn't seem (at the risk of invoking an unintended metaphor)
entirely black or white.  Maybe it should just be "RM_WORK_EXCEPTIONS"
or something.

Of course, you can get the same effect in your distro configuration by
saying:

RM_WORK = "rm_work"
RM_WORK_pn-icu-native = ""
INHERIT += "${RM_WORK}"

so I must admit to being slightly ambivalent about whether the extra
syntactic sugar is all that valuable.  And then again you can always use
rm_old_work instead. :-)

p.




