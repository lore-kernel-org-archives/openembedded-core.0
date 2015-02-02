Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 7D41160043
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 07:36:54 +0000 (UTC)
Received: from localhost (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 1EA1B235C0B;
	Mon,  2 Feb 2015 08:36:53 +0100 (CET)
Date: Mon, 2 Feb 2015 08:36:52 +0100
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Otavio Salvador <otavio@ossystems.com.br>,
	Ross Burton <ross.burton@intel.com>, Saul Wold <sgw@linux.intel.com>
Message-ID: <20150202073652.GA3594@localhost.localdomain>
References: <1420706622-31273-2-git-send-email-maciej.borzecki@open-rnd.pl>
	<1420747144-11925-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<CAP9ODKp_eP8SpXzcKorcbbaXWd6be9Lpmx+V6J6PhCNALEzr0w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp_eP8SpXzcKorcbbaXWd6be9Lpmx+V6J6PhCNALEzr0w@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: cherry-pick patch fixing networkd gateway route handling
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
X-List-Received-Date: Mon, 02 Feb 2015 07:36:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 01/08 18:36, Otavio Salvador wrote:
> On Thu, Jan 8, 2015 at 5:59 PM, Maciej Borzecki
> <maciej.borzecki@open-rnd.pl> wrote:
> > Cherry-picking a patch that fixes gateway route handling in systemd-networkd.
> > The patch adds a source IP to the automatically added gateway static route,
> > thus allowing for proper IP communication in a scenario when a static or
> > IPv4-LL address is used alongside a dynamically obtained one.
> >
> > (From systemd rev: 46b0c76e2c355c0d0cc4792abb98cde07b28bc5)
> >
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>

Can we pick that up for master?

--
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079


Niniejsza wiadomość wraz z załącznikami może
zawierać chronione prawem lub poufne informacje i została
wysłana wyłącznie do wiadomości i użytku osób, do których
została zaadresowana. Jeśli wiadomość została otrzymana
przypadkowo zabrania się jej kopiowania lub rozsyłania do osób
trzecich. W takim przypadku uprasza się o natychmiastowe
zniszczenie wiadomości oraz poinformowanie nadawcy o
zaistniałej sytuacji za pomocą wiadomości zwrotnej.
Dziękujemy.

This message, including any attachments hereto,
may contain privileged or confidential information and is sent
solely for the attention and use of the intended addressee(s).
If you are not an intended addressee, you may neither use this
message nor copy or deliver it to anyone. In such case, you
should immediately destroy this message and kindly notify the
sender by reply email. Thank you.

