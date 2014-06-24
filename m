Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id EA5A265E87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 06:06:18 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 24 Jun 2014 08:06:15 +0200
Date: Tue, 24 Jun 2014 08:06:02 +0200
From: Anders Darander <anders@chargestorm.se>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20140624060602.GB22071@ad.chargestorm.se>
Mail-Followup-To: Kang Kai <Kai.Kang@windriver.com>,
	"Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1403490121.git.kai.kang@windriver.com>
	<c33af6b8216db6c04c5a4114d818182a5438ed0e.1403490121.git.kai.kang@windriver.com>
	<CAJTo0Lb-bcLx4T1HHOEzsY3uXmNW8NzdKO9sBQtnottgEfyzXw@mail.gmail.com>
	<53A8D695.8060500@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53A8D695.8060500@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] iptables: add default rules
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
X-List-Received-Date: Tue, 24 Jun 2014 06:06:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Kang Kai <Kai.Kang@windriver.com> [140624 03:40]:

> On 2014=E5=B9=B406=E6=9C=8823=E6=97=A5 18:42, Burton, Ross wrote:
> > On 23 June 2014 03:32, Kai Kang <kai.kang@windriver.com> wrote:
> > Also, is it sensible to ship a static firewall configuration?  The one
> > thing we're not is one-size-fits-all.

> I just want users could start iptables without any professional work.=20
> And these static firewall rules are common for desktop/server.
> Or does the empty rule is better?=20

If these rules are common for a desktop/server, do they make sense here?
Or should a simplified rule set be your example configuration in that
case?

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB

