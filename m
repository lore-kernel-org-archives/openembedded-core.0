Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0C944609AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 10:58:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Jun 2013 03:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,888,1363158000"; d="scan'208";a="331437930"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 18 Jun 2013 03:58:26 -0700
Date: Tue, 18 Jun 2013 13:58:25 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130618105824.GF16785@lpalcu-linux>
References: <cover.1371471166.git.laurentiu.palcu@intel.com>
	<6a4980046a3175ecdd4216cdd75c754b0b0ffa16.1371471166.git.laurentiu.palcu@intel.com>
	<CAJTo0LbPGDehVTaspjcZBCL2F0DRS-HondvaO-6K0ntZj_Zu6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbPGDehVTaspjcZBCL2F0DRS-HondvaO-6K0ntZj_Zu6A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Tue, 18 Jun 2013 10:58:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2013 at 04:15:58PM +0100, Burton, Ross wrote:
> On 17 June 2013 13:26, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> > People using xserver-xorg that need to calibrate their touchscreen
> > devices would also need meta-oe. Bringing the recipes to oe-core will
> > make it easier for them.
> >
> > Aditionaly, drop xterm RDEPENDS. Terminal is not needed to run the menu
> > item.
> 
> I don't really like how there's a xdg-autostart desktop file and a
> systemd service file for loading the calibration and performing
> calibration - a single xsession file as xtscal does will be sufficient
> and actually work in Sato as it can block the rest of the UI before
> continuing.

I'm not sure I understand what's wrong with using xdg-autostart.
Xsession parses each .desktop file in xdg/autostart and executes the
application listed in 'Exec'. Having a separate xsession file created
in /etc/X11/Xsession.d (like xtscal does) is, basically, the same thing.
Only the moment of execution differs. Or, maybe, I misunderstood your
point.

> 
> Also persistent calibration doesn't work with non-root X users, so
> maybe the tool should use ~/.pointercal.xinput if it can't write to
> /etc.

We could easily change xinput_calibrator_once.sh to save/read the calibration
data either to/from /etc or ~.

Laurentiu

> 
> Apart from that I've got a touchscreen that isn't X-axis-reversed now. :)
> 
> Ross

