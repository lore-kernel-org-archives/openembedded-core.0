Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 2653C607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:50:02 +0000 (UTC)
Received: from comp-006-thk (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id F08182D6030;
	Tue,  9 Feb 2016 16:50:00 +0100 (CET)
Message-ID: <1455033000.3663.5.camel@open-rnd.pl>
From: Maciek Borzecki <maciej.borzecki@open-rnd.pl>
Reply-To: maciej.borzecki@open-rnd.pl
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 09 Feb 2016 16:50:00 +0100
In-Reply-To: <CAMKF1spPPJYxpF4mNpqXT=_aQdCR9meet=NRQqqjDzwGuoFdGg@mail.gmail.com>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1454926183-22439-7-git-send-email-maciej.borzecki@open-rnd.pl>
	<CAMKF1spPPJYxpF4mNpqXT=_aQdCR9meet=NRQqqjDzwGuoFdGg@mail.gmail.com>
Organization: Open-RnD sp. z o.o.
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] systemd: remove unnecessary code
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
X-List-Received-Date: Tue, 09 Feb 2016 15:50:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On wto, 2016-02-09 at 07:19 -0800, Khem Raj wrote:
> On Mon, Feb 8, 2016 at 2:09 AM, Maciej Borzecki
> <maciej.borzecki@open-rnd.pl> wrote:
> > Remove unnecessary chown on journal file.
> > 
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > ---
> >  meta/recipes-core/systemd/systemd_228.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-
> > core/systemd/systemd_228.bb
> > index
> > 40ed81a37e78c67bae13f7ee7018d85efa2f6b7d..03434ff9d5ff19fe043332b0b53a4fa96ab2b120
> > 100644
> > --- a/meta/recipes-core/systemd/systemd_228.bb
> > +++ b/meta/recipes-core/systemd/systemd_228.bb
> > @@ -209,7 +209,7 @@ do_install() {
> >                 sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd%
> > ${D}${sysconfdir}/init.d/systemd-udevd
> >         fi
> > 
> > -       chown root:systemd-journal ${D}/${localstatedir}/log/journal
> > +        # chown root:systemd-journal ${D}/${localstatedir}/log/journal
> > 
> 
> journald requires these perms on this directory. Can you describe the
> issue it fixes ?
> 

I should use non-root user a bit more often. Apparently journalctl becomes useless without
systemd-journal chown on /var/log/journal. I'll revise this and the other useradd/sysusers
patch. Thanks for catching this.

 
-- 
Maciej Borzęcki
Open-RnD Sp. z o.o., Poland
www.open-rnd.pl



