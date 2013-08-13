Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9359560664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:18:04 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V9Bfs-00076T-1V; Tue, 13 Aug 2013 12:18:00 +0200
Message-ID: <1376389073.10241.1.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Laszlo Papp <lpapp@kde.org>
Date: Tue, 13 Aug 2013 11:17:53 +0100
In-Reply-To: <CAOMwXhPqdK9WvKmPD6rO33x==c8Dt0z5DrMBEx_s8G+t4nrLpg@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
	<CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
	<CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
	<CAJTo0Lbp4fUNEoyehK6KtMQm2-GXTg_Jiift37gXgCDjmh676Q@mail.gmail.com>
	<CAOMwXhPqdK9WvKmPD6rO33x==c8Dt0z5DrMBEx_s8G+t4nrLpg@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 13 Aug 2013 10:18:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There's no magic involved in the python function: all it does is
generate a config fragment which is then passed to merge_config.sh along
with everything else.  If you supply your own fragment as Ross suggested
then it should override the values from the Python-generated one and
everything ought to work as you would expect.

p.

On Tue, 2013-08-13 at 11:00 +0100, Laszlo Papp wrote:
> Why are you referring to defconfig when I mentioned several times, the
> problem is the inc file and a python function; i.e. not the kernel,
> nor the busybox config?
> 
> 
> On Tue, Aug 13, 2013 at 10:58 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
>         On 13 August 2013 10:52, Laszlo Papp <lpapp@kde.org> wrote:
>         > As we have already discussed that, it is not any clear at
>         all without
>         > example. Yes, the end user does not really care about the
>         internal
>         > implementation of the feature ....
>         >
>         > Please provide useful examples and tutorials how to use a
>         feature especially
>         > when a user (and apparently others posting here) is such
>         clueless.
>         
>         
>         Personally I've never touched busybox configuration so this is
>         untested.  However it claims to support configuration
>         fragments as
>         used by the kernel (as both busybox and the kernel use the
>         same
>         configuration system), so this section in the kernel
>         documentation
>         should be useful:
>         
>         http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration
>         
>         tl;dr: put a file such as myconfig.cfg in SRC_URI which
>         contains the
>         configuration variables you want set.
>         
>         Ross
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



