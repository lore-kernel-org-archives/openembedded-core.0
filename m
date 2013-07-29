Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 77CCD6B20C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:26:34 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V3pLG-0003O8-0t; Mon, 29 Jul 2013 17:26:34 +0200
Message-ID: <1375111593.13247.41.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Qi.Chen@windriver.com
Date: Mon, 29 Jul 2013 16:26:33 +0100
In-Reply-To: <c73f95c035bb32208d7da8be11a50b15f4611174.1375065009.git.Qi.Chen@windriver.com>
References: <cover.1375065009.git.Qi.Chen@windriver.com>
	<c73f95c035bb32208d7da8be11a50b15f4611174.1375065009.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 08/10] irda-utils: make /etc/sysconfig writable in read-only rootfs
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
X-List-Received-Date: Mon, 29 Jul 2013 15:26:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-07-29 at 10:33 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> This diretory needs to be writable, the following error will appear
> at system start-up.
> 
>    /etc/rc5.d/S20irattach: /etc/sysconfig/irda: Read-only file system

The whole chunk of code in that script that's trying to write
to /etc/sysconfig seems bogus.  I think the right fix is just to delete
it rather than trying to provide a a volatile implementation
of /etc/sysconfig (which seems like a contradiction in terms).

p.



