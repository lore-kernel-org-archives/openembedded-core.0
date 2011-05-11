Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QKBe5-0006RE-AD for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 17:48:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BFjVvw021375
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:45:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20995-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:45:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BFjNs6021369
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:45:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305103217-18419-1-git-send-email-michael.lippautz@gmail.com>
References: <1305103217-18419-1-git-send-email-michael.lippautz@gmail.com>
Date: Wed, 11 May 2011 16:45:17 +0100
Message-ID: <1305128717.30391.382.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	p4BFjVvw021375
Subject: Re: [PATCH] python-native: Add ctypes patch to native build (as in cross-compilation)
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
X-List-Received-Date: Wed, 11 May 2011 15:48:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-05-11 at 10:40 +0200, Michael Lippautz wrote:
> This fix makes ctypes build for python-native which may be needed by ex=
tensions
> that utilize ctypes and use setuptools/distutils as their build system.
>=20
> Tested building pyudev for beagleboard target using =C3=82ngstrom distr=
o.
>=20
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>

Merged to master, thanks.

Richard



