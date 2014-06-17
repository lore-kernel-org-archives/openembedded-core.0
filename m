Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 493EE6FEB0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 07:52:48 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5H7pjex009607; Tue, 17 Jun 2014 08:52:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HXgrqqJG0SbD; Tue, 17 Jun 2014 08:52:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5H7qNfU009642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 17 Jun 2014 08:52:25 +0100
Message-ID: <1402991538.562.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jun 2014 08:52:18 +0100
In-Reply-To: <CAJTo0LZXUh1giimTFpdQYBpVJ640wCgr6j6vELaa9h3L+_huyw@mail.gmail.com>
References: <cover.1396927648.git.Chong.Lu@windriver.com>
	<539EDD51.9060508@digi.com>
	<CAJTo0LbcPqL+E78x1jUX6JH_BBc-uuEV8KDjELap9OJidPtYqA@mail.gmail.com>
	<539F08D0.7060602@digi.com>
	<CAJTo0LZXUh1giimTFpdQYBpVJ640wCgr6j6vELaa9h3L+_huyw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Javier Viguera <javier.viguera@digi.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [backport to Daisy] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Tue, 17 Jun 2014 07:52:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-06-16 at 17:36 +0100, Burton, Ross wrote:
> On 16 June 2014 16:10, Javier Viguera <javier.viguera@digi.com> wrote:
> > Attached the obvious cherry-pick of the commit from *master* with a basic
> > conflict solved. But I don't think this is acceptable in an already-released
> > stable branch "Daisy" as it involves a recipe rename (dbus-ptest_1.6.18.bb
> > => dbus-test_1.6.18.bb) that probably will break the projects of current
> > users of yocto Daisy.
> 
> +PACKAGES += "${@base_contains('DISTRO_FEATURES', 'ptest',
> 'dbus-ptest', '', d)}"
> 
> This was changed in master to use PTEST_ENABLED:
> 
> PACKAGES += "${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus-ptest', '', d)}"
> 
> If you could compare dbus.inc in this patch with master to ensure that
> there's nothing else that should be merged that would be great.  Also
> remove the Conflicts line from the message.

For what its worth I've pulled the two patches we need into the daisy
branch for this. I'd appreciate someone confirming it does the right
thing though.

Cheers,

Richard


