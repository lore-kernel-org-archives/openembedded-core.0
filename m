Return-Path: <sgw@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E60AE71CB7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 17:44:47 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 20 Feb 2017 09:44:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,187,1484035200"; d="scan'208";a="66952395"
Received: from jbryan-mobl3.amr.corp.intel.com (HELO
	swold-mobl2.amr.corp.intel.com) ([10.254.42.5])
	by orsmga005.jf.intel.com with ESMTP; 20 Feb 2017 09:44:47 -0800
Message-ID: <1487575265.10318.121.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0Lb5=tW_U4WizZBjmVTUzsmrOpaEmAmnVn5zJAZGZUPJVg@mail.gmail.com>
References: <1487356080-8124-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0Lb5=tW_U4WizZBjmVTUzsmrOpaEmAmnVn5zJAZGZUPJVg@mail.gmail.com>
Date: Sun, 19 Feb 2017 23:21:05 -0800
Mime-Version: 1.0
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt-package: use ${libdir} instead of /usr/lib
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
X-List-Received-Date: Mon, 20 Feb 2017 17:44:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-02-17 at 20:40 +0000, Burton, Ross wrote:
> 
> On 17 February 2017 at 18:28, Saul Wold <sgw@linux.intel.com> wrote:
> > -       install -m 0644 ${S}/debian/apt.systemd.daily
> > ${D}/usr/lib/apt/
> > +       install -m 0644 ${S}/debian/apt.systemd.daily
> > ${D}${libdir}/apt/
> >         install -m 0644 ${S}/debian/apt-daily.service
> > ${D}${systemd_unitdir}/system/
> >         install -m 0644 ${S}/debian/apt-daily.timer
> > ${D}${systemd_unitdir}/system/
> > 
> 
> The apt-daily.service unit is what fires the apt.systemd.daily
> script:
> 
> $ cat debian/apt-daily.service
> ...
> ExecStart=/usr/lib/apt/apt.systemd.daily
> 
> If you're going to change the install location of the script then the
> unit needs to be fixed.
> 
Hmm, since this is a script would it make more sense to have this
install create the "usr/lib" directory?  I am wondering is this will
bullocks up a single root solution or a different non-standard libdir?

Sau!

> Ross

