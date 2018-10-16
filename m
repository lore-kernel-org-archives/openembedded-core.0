Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ECAEB745F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 09:55:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9G9ssEk004478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 16 Oct 2018 10:54:55 +0100
Message-ID: <9f182627633f75c8383901510cc11e4b87349084.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Victor Kamensky
	<kamensky@cisco.com>
Date: Tue, 16 Oct 2018 10:54:54 +0100
In-Reply-To: <CAJTo0LYWG7O+VryaFi9r4kc5JagPtuynWHi9gV6nV+cLPUw+SQ@mail.gmail.com>
References: <20181015182128.13115-1-kamensky@cisco.com>
	<CAJTo0LYWG7O+VryaFi9r4kc5JagPtuynWHi9gV6nV+cLPUw+SQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: 3.3 -> 4.0
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
X-List-Received-Date: Tue, 16 Oct 2018 09:55:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-16 at 10:27 +0100, Burton, Ross wrote:
> On Mon, 15 Oct 2018 at 19:22, Victor Kamensky <kamensky@cisco.com>
> wrote:
> > Upgrade systemtap from 3.3 to 4.0: Removed backported patch.
> 
> WARNING: systemtap-4.0-r0 do_package_qa: QA Issue: systemtap:
> /systemtap/etc/stap-exporter/EXAMPLE is owned by uid 1000, which is
> the same as the user running bitbake. This may be due to host
> contamination
> systemtap: /systemtap/etc/stap-exporter/EXAMPLE_NOERROR is owned by
> uid 1000, which is the same as the user running bitbake. This may be
> due to host contamination
> systemtap: /systemtap/etc/stap-exporter/errno.stp is owned by uid
> 1000, which is the same as the user running bitbake. This may be due
> to host contamination
> systemtap: /systemtap/etc/stap-exporter/syscalllatency.stp is owned
> by
> uid 1000, which is the same as the user running bitbake. This may be
> due to host contamination
> systemtap: /systemtap/etc/stap-exporter/timeout.stp is owned by uid
> 1000, which is the same as the user running bitbake. This may be due
> to host contamination
> systemtap: /systemtap/etc/stap-exporter/topsys.stp is owned by uid
> 1000, which is the same as the user running bitbake. This may be due
> to host contamination [host-user-contaminated]

There are also other issues from the addition of systemd unit files in
4.0. I've a patch in -next which tweaks both issues which I'll put in
for testing.

Cheers,

Richard


