Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ua5tC-0002GI-Bj for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 17:02:45 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r48EksGq000768; Wed, 8 May 2013 15:46:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vcPmEgFgD-DU; Wed,  8 May 2013 15:46:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r48EkooB000760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 8 May 2013 15:46:51 +0100
Message-ID: <1368024261.27116.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 08 May 2013 15:44:21 +0100
In-Reply-To: <cover.1367995796.git.sgw@linux.intel.com>
References: <cover.1367995796.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r48EksGq000768
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/23] Updated Pull
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 15:02:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-05-07 at 23:52 -0700, Saul Wold wrote:
> Andreas M=C3=BCller (2):
>   systemd: do not recommend udev-extraconf for udev
>   udev: do not recommend udev-extraconf
>=20
> Andrei Dinu (1):
>   SLiRP support in runqemu

This reverts the various other changes made to the script to fix locking
races.

> Bruce Ashfield (4):
>   linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes
>   kern-tools: anchor and delimit regexs
>   linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56
>   linux-yocto/3.8: udpate to v3.8.11
>=20
> Carlos Rafael Giani (1):
>   gstreamer: Fixed dependency problem with -meta packages

Shouldn't we remove the -glib package and friends as they don't seem
very general?

Cheers,

Richard



