Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0F878500
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 21:18:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8DLITlb018521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 13 Sep 2017 22:18:30 +0100
Message-ID: <1505337509.18640.84.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Sep 2017 22:18:29 +0100
In-Reply-To: <CAKmqyKMoTxxiQJ5jsCP9bHdNinEHG5mfb=fWUCaS+_6C+ZFY9A@mail.gmail.com>
References: <20170905150847.32681-1-ross.burton@intel.com>
	<CAKmqyKPiyBMAMDQZ6RG0envtnUto=n7jx0dxwgsqJaZvV=yMzQ@mail.gmail.com>
	<CAJTo0LbmEOd=9_W4ru7=1VUY1c0eyOmEzr3rFvwsXnC_ftA1-w@mail.gmail.com>
	<CAKmqyKN-kxvENCrxR1bQ5Z7YDe5wO57GRgYZVmmy8-0eUOOicA@mail.gmail.com>
	<1505336969.18640.82.camel@linuxfoundation.org>
	<CAKmqyKMoTxxiQJ5jsCP9bHdNinEHG5mfb=fWUCaS+_6C+ZFY9A@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: recommend shared-mime-info
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
X-List-Received-Date: Wed, 13 Sep 2017 21:18:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-09-13 at 14:12 -0700, Alistair Francis wrote:
> On Wed, Sep 13, 2017 at 2:09 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Wed, 2017-09-13 at 13:55 -0700, Alistair Francis wrote:
> > > 
> > > On Wed, Sep 13, 2017 at 1:42 PM, Burton, Ross <ross.burton@intel.
> > > com>
> > > wrote:
> > > > 
> > > > 
> > > > Can you share a log showing that?
> > > This is the full log, so it's not just OpenSSL:
> > I suspect the new dependency means other things get built on mingw
> > which have never been needed until now. We may need to remove the
> > dependency for mingw to avoid this..
> Yeah, that is what I suspected. I tried the BAD_RECOMMENDATIONS in
> the
> mingw machine-sdk conf, but that didn't seem to work.

You want something like:

RRECOMMENDS_${PN}_remove_mingw32_pn-glib-2.0 = "shared-mime-info"

(I don't remember the exact mingw override offhand)

Cheers,

Richard


