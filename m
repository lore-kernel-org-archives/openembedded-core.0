Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QVKOK-0005WP-Nq
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 11:22:04 +0200
Received: by wye20 with SMTP id 20so2627380wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 02:18:43 -0700 (PDT)
Received: by 10.227.43.9 with SMTP id u9mr3021427wbe.74.1307783915630;
	Sat, 11 Jun 2011 02:18:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm2644590wbh.46.2011.06.11.02.18.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 02:18:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DF113DF.4000900@linux.intel.com>
Date: Sat, 11 Jun 2011 11:18:32 +0200
Message-Id: <7F100711-DE52-4D1B-9457-595CD24683F2@dominion.thruhere.net>
References: <cover.1307558785.git.mark.hatle@windriver.com>
	<4DF113DF.4000900@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/2] pseudo: Update pseudo to 1.1.1 version V3
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
X-List-Received-Date: Sat, 11 Jun 2011 09:22:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 jun 2011, om 20:41 heeft Saul Wold het volgende geschreven:

> On 06/08/2011 11:48 AM, Mark Hatle wrote:
>> Hopefully third and final version.  The patch that is part of this =
has been
>> contribed to and reviewed upstream.  (Not yet accepted upstream)
>>=20
>> V3 fixes an issue with building on a 32-bit host.
>>=20
>> The following changes since commit =
30101d4153aa8e116892063933b868d325bdd79c:
>>=20
>>   distro tracking: Manual Updates (2011-06-06 23:51:26 -0700)
>>=20
>> are available in the git repository at:
>>   git://git.pokylinux.org/poky-contrib mhatle/pseudo
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/pseudo=

>>=20
>> Mark Hatle (2):
>>   pseudo: Update pseudo to 1.1.1 version
>>   distro_tracking_fields.inc: add pseudo
>>=20
>>  .../conf/distro/include/distro_tracking_fields.inc |    6 ++
>>  meta/recipes-devtools/pseudo/pseudo.inc            |   20 +++++--
>>  .../recipes-devtools/pseudo/pseudo/oe-config.patch |   58 =
++++++++++++++++++++
>>  meta/recipes-devtools/pseudo/pseudo_1.0.bb         |    9 ---
>>  meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |   10 ++++
>>  meta/recipes-devtools/pseudo/pseudo_git.bb         |    7 ++-
>>  6 files changed, 92 insertions(+), 18 deletions(-)
>>  create mode 100644 =
meta/recipes-devtools/pseudo/pseudo/oe-config.patch
>>  delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.0.bb
>>  create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
>>=20
>=20
>=20
> Merged into OE-Core

This also seems to fix the bugs that all my ipks had the +x bit set, 'ls =
--color' looks far more pleasing now!

regards,

Koen=


