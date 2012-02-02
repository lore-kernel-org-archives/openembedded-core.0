Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rt1fr-0004B4-Cc for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:46:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q12IcQtQ010852
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 18:38:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10526-05 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2012 18:38:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q12IcHQx010845
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 18:38:18 GMT
Message-ID: <1328207902.3895.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Feb 2012 18:38:22 +0000
In-Reply-To: <1327795253-24794-2-git-send-email-schnitzeltony@googlemail.com>
References: <1327795253-24794-1-git-send-email-schnitzeltony@googlemail.com>
	<1327795253-24794-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q12IcQtQ010852
Subject: Re: [PATCH v2 1/1] atk: add native / disable introspection / merge atk.inc->recipe / change license
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
X-List-Received-Date: Thu, 02 Feb 2012 18:46:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-01-29 at 01:00 +0100, Andreas M=C3=BCller wrote:
> Native support currently is appended in meta-oe. Native build failed wi=
th:
>=20
> | /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
> | /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1=
'
> | error parsing file Atk-1.0.gir: Failed to parse included gir GLib-2.0
> | make[3]: *** [Atk-1.0.typelib] Error 1
>=20
> build tested in meta-oe / angstrom environment
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-support/atk/atk.inc      |   13 -------------
>  meta/recipes-support/atk/atk_2.2.0.bb |   17 +++++++++++++----
>  2 files changed, 13 insertions(+), 17 deletions(-)
>  delete mode 100644 meta/recipes-support/atk/atk.inc

Merged to master, thanks.

Richard



