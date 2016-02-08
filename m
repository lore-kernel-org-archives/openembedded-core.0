Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2A9731C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:10:07 +0000 (UTC)
Received: from comp-006-thk (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 657F0234A5A;
	Mon,  8 Feb 2016 12:10:06 +0100 (CET)
Message-ID: <1454929806.3938.16.camel@open-rnd.pl>
From: Maciek Borzecki <maciej.borzecki@open-rnd.pl>
Reply-To: maciej.borzecki@open-rnd.pl
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Mon, 08 Feb 2016 12:10:06 +0100
In-Reply-To: <CALbNGRSeKhSLWS8qxM5OFc-Fe8=mpuCKgx1j8ejB1XgGj7MYsg@mail.gmail.com>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1454926183-22439-4-git-send-email-maciej.borzecki@open-rnd.pl>
	<CALbNGRREKAXAW_0Z1e-_y21G477u9DrfKuAL8Sf1GL=ErDNi2Q@mail.gmail.com>
	<1454928241.3938.13.camel@open-rnd.pl>
	<CALbNGRSeKhSLWS8qxM5OFc-Fe8=mpuCKgx1j8ejB1XgGj7MYsg@mail.gmail.com>
Organization: Open-RnD sp. z o.o.
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] systemd: extend PACKAGECONFIG flags
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
X-List-Received-Date: Mon, 08 Feb 2016 11:10:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On pon, 2016-02-08 at 12:07 +0100, Andreas Müller wrote:
> On Mon, Feb 8, 2016 at 11:44 AM, Maciek Borzecki
> <maciej.borzecki@open-rnd.pl> wrote:
> > On pon, 2016-02-08 at 11:21 +0100, Andreas Müller wrote:
> > > On Mon, Feb 8, 2016 at 11:09 AM, Maciej Borzecki
> > > <maciej.borzecki@open-rnd.pl> wrote:
> > > > We currently ship a rather full-blown setup of system. Very few
> > > > configuration knobs are actually exposed through PACKAGECONFIG
> > > > flags. This patch adds new PACKAGECONFIG flags for some finer tuning of
> > > > systemd's functionality. By default most of functionality is disabled,
> > > > with exeception of:
> > > By disabling all those you kill huge amount of functionality by
> > > default - which at least my images need. Could you choose default as
> > > is and cut down your images please.
> > 
> > The default built pretty much everything, including machined, backlight helpers and
> > all
> > the other cruft. It would be great if we could come up with a sensible list of
> > defaults
> > and let people extend it as they see fit.
> > 
> > Since it's the first version of the patchset, the intention was to gather feedback,
> > see
> > what people use, and update the flags in v2 accordingly.
> > 
> > Can you list the features you need?
> From a quick glance firstboot / logind / bootchart / machined
> 
> But to be honest: I am not willing to spend huge testing efforts for
> you saving a few megabytes. Don't misunderstand me: adding
> PACKAGACONFIG knobs is fine but changing defaults totally is not.
> 

Fair point. I'll fix that in v2.

-- 
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079

Niniejsza wiadomość wraz z załącznikami może zawierać chronione prawem
lub poufne informacje i została wysłana wyłącznie do wiadomości i
użytku osób, do których została zaadresowana. Jeśli wiadomość została
otrzymana przypadkowo zabrania się jej kopiowania lub rozsyłania do
osób trzecich. W takim przypadku uprasza się o natychmiastowe
zniszczenie wiadomości oraz poinformowanie nadawcy o zaistniałej
sytuacji za pomocą wiadomości zwrotnej. Dziękujemy.

This message, including any attachments hereto, may contain privileged
or confidential information and is sent solely for the attention and
use of the intended addressee(s). If you are not an intended addressee,
you may neither use this message nor copy or deliver it to anyone. In
such case, you should immediately destroy this message and kindly notify
the sender by reply email. Thank you.




