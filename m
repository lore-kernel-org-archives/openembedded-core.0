Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1U2kzU-0003p5-6c
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:03:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r15FlW1J009829
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Feb 2013 07:47:32 -0800 (PST)
Received: from windriver.com (128.224.169.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 5 Feb 2013 07:47:31 -0800
Date: Tue, 5 Feb 2013 17:47:34 +0200
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130205154733.GE8509@windriver.com>
References: <1360066533-20693-1-git-send-email-andrei.gherzan@windriver.com>
	<CAJTo0LYQAy5-RzTU4aYN0jqAX10cbMNSUPu3i+CMBFo8G4vD1w@mail.gmail.com>
	<CAP9ODKqnZtMCkSpR7m7CJ=Z5YvERgTX71AdmuYOU16BUv9PFGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqnZtMCkSpR7m7CJ=Z5YvERgTX71AdmuYOU16BUv9PFGg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH] wpa-supplicant: Package systemd service in -systemd
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
X-List-Received-Date: Tue, 05 Feb 2013 16:03:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 05, 2013 at 01:42:38PM -0200, Otavio Salvador wrote:
> On Tue, Feb 5, 2013 at 11:54 AM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 5 February 2013 12:15, Andrei Gherzan <andrei.gherzan@windriver.com> wrote:
> >> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> >> ---
> >>  .../wpa-supplicant/wpa-supplicant-2.0.inc          |    6 ++++--
> >>  .../wpa-supplicant/wpa-supplicant_2.0.bb           |    2 +-
> >>  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > NACK.
> >
> > Please don't add -systemd packages.  I've almost got a systemd.bbclass
> > that I'm happy with, but if you must add integration now then just
> > package the unit files alongside the daemons, respecting the distro
> > feature.
>
> I'd prefer to hold it until the class is out.
>

Fair.

--
Andrei Gherzan | Wind River Systems
m: +40 734 450 615 | p: +40 236 320 307



