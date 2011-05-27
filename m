Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPxYU-0006zB-Ib
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 15:58:22 +0200
Received: by wye20 with SMTP id 20so1448680wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 06:55:17 -0700 (PDT)
Received: by 10.216.235.22 with SMTP id t22mr3446918weq.89.1306504517708;
	Fri, 27 May 2011 06:55:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 74sm985615wem.41.2011.05.27.06.55.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 06:55:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306504037.2525.449.camel@phil-desktop>
Date: Fri, 27 May 2011 15:55:15 +0200
Message-Id: <E0D7DF36-90A8-4BE0-BCF0-CE4ADC014290@dominion.thruhere.net>
References: <1306503625-719-1-git-send-email-koen@dominion.thruhere.net>
	<1306504037.2525.449.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] dbus 1.4.1: create UUIDDIR in postinst
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2011 13:58:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 mei 2011, om 15:47 heeft Phil Blundell het volgende geschreven:

> On Fri, 2011-05-27 at 15:40 +0200, Koen Kooi wrote:
>> +	mkdir -p $UUIDDIR || true
>=20
> Why "|| true"?  If this creation fails then the following chown will
> surely fail as well, except with a different and less illuminating =
error
> message.
>=20
>> +     chown "$MESSAGEUSER"."$MESSAGEUSER" "$UUIDDIR"
>=20
> The dot syntax is nonstandard and obsolescent.  It would be better to
> use ":" there.

I matched the postinst for these additionsm, but I can cleanup the =
complete postinst if you wish.

regards,

Koen




