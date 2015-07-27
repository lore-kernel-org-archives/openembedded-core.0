Return-Path: <hugo.saldanha@aker.com.br>
Received: from bast.aker.com.br (unknown [177.159.144.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF1076380
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 18:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bast.aker.com.br (Postfix) with ESMTP id EEBCA3837B3;
	Mon, 27 Jul 2015 15:12:11 -0300 (BRT)
X-Virus-Scanned: Debian amavisd-new at bast.aker.com.br
Received: from bast.aker.com.br ([127.0.0.1])
	by localhost (bast.aker.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dh6PPxw57tN3; Mon, 27 Jul 2015 15:12:02 -0300 (BRT)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by bast.aker.com.br (Postfix) with ESMTP id A69BE3837BE;
	Mon, 27 Jul 2015 15:10:34 -0300 (BRT)
Received: from localhost (10.4.3.1) by mail.aker.com.br (10.0.0.20) with
	Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 27 Jul 2015 15:10:29 -0300
Date: Mon, 27 Jul 2015 15:15:51 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20150727181551.GD2195@saldanha.aker.com.br>
References: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
	<CAP9ODKp5X5bK_3-OuBi9RY=L6VSO7sXjdyes3UUG-pOv48FZOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp5X5bK_3-OuBi9RY=L6VSO7sXjdyes3UUG-pOv48FZOg@mail.gmail.com>
User-Agent: Mutt/1.5.23+102 (2ca89bed6448) (2014-03-12)
Cc: "wei.tee.ng@intel.com" <wei.tee.ng@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] [master][dizzy] Enable Marvel 8897 Wifi feature
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
X-List-Received-Date: Mon, 27 Jul 2015 18:12:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 27, 2015 at 01:41:45PM -0300, Otavio Salvador wrote:
> On Thu, Jul 9, 2015 at 2:10 AM,  <wei.tee.ng@intel.com> wrote:
> > I would like to add hostapd and iw configuration for enabling
> > Marvell 8897 Wifi feature. Hostapd and iw configuration were
> > created in the recipes-connectivity layer to enable Marvell 8897
> > module function in AP mode and STA mode.
> 
> It can be added for master, I think. For Dizzy it makes no sense to
> backport this feature.

FWIW, both recipes are available in meta-oe layer, including dizzy
branch.

-- 
		Hugo

