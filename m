Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RceZs-00025X-4c for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 15:52:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBJEjTbf017064
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 14:45:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16055-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 14:45:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBJEjIvN017057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 14:45:19 GMT
Message-ID: <1324305920.4568.176.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2011 14:45:20 +0000
In-Reply-To: <201112190148.16063.schnitzeltony@gmx.de>
References: <1324170197-10720-1-git-send-email-schnitzeltony@gmx.de>
	<201112190148.16063.schnitzeltony@gmx.de>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pBJEjTbf017064
Subject: Re: [PATCH] xorg-font-common.inc: break runtime dependency loop
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
X-List-Received-Date: Mon, 19 Dec 2011 14:52:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-12-19 at 01:48 +0100, Andreas M=C3=BCller wrote:
> On Sunday, December 18, 2011 02:03:17 AM Andreas M=C3=BCller wrote:
> > required since opkg update [1]
> >=20
> Hope there is no need to apply this one. Will test RP's patch tomorrow

To be honest the font-* dependencies look rather wrong to me and in need
of disentangling. I'll hold off this patch and see if we can some up
with something better though.

I suspect the better fix would be to have the actual fonts have a
separate.inc with the dependencies so encodings/utils/alias don't get
those defaults...

Cheers,

Richard



