Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QwzVp-0002E7-Sj
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 18:44:10 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QwzRC-0006QR-G0 from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 09:39:22 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 26 Aug 2011 18:39:18 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5068A57F9@eu2-mail.mgc.mentorg.com>
In-Reply-To: <cover.1314370503.git.noor_ahsan@mentor.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [meta-oe][PATCH 0/4] pull request #1 for bechmark recipes
Thread-Index: AcxkDalacgklJIQ7Rx2RLLBlTUY28QAAQKPQ
References: <cover.1314370503.git.noor_ahsan@mentor.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/4] pull request #1 for bechmark recipes
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
X-List-Received-Date: Fri, 26 Aug 2011 16:44:10 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this pull request. thanks

> -----Original Message-----
> From: Ahsan, Noor
> Sent: Friday, August 26, 2011 9:32 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Ahsan, Noor
> Subject: [meta-oe][PATCH 0/4] pull request #1 for bechmark recipes
>=20
> From: Noor Ahsan <noor_ahsan@mentor.com>
>=20
> *** BLURB HERE ***
> The following changes since commit
> 22ec18224f7a7c64850c76b14017dff2ff4345f2:
>   pespin (1):
>         elfe: Add LIC_FILES_CHKSUM to recipe
>=20
> are available in the git repository at:
>=20
>   git://github.com/Noor-Ahsan/meta-oe master
>   https://github.com/Noor-Ahsan/meta-oe/tree/master
>=20
> Noor Ahsan (4):
>   dbench: Add version 4.0 (initial recipe)
>   lmbench: Add version 3.0-a9 (initial recipe)
>   iperf: Add version 2.0.4 (initial recipe)
>   tiobench: Add version 0.3.3 (initial recipe)
>=20
>  meta-oe/recipes-benchmark/dbench/dbench_4.0.bb     |   26 +++
>  .../recipes-benchmark/dbench/files/destdir.patch   |   28 +++
>  .../recipes-benchmark/dbench/files/makefile.patch  |   18 ++
>  .../iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff |  164
> ++++++++++++++++++
>  .../001-cast-to-max_size_t-instead-of-int.patch    |   14 ++
>  .../003-fix-hyphen-used-as-minus-sign.patch        |  178
> ++++++++++++++++++++
>  .../iperf/iperf-2.0.4/004-svn-r43-ro.patch         |  117
> +++++++++++++
>  .../iperf-2.0.4/005-iperf-die-on-bind-fail.patch   |   15 ++
>  .../006-iperf-die-on-connect-fail.patch            |   15 ++
>  .../iperf-2.0.4/007-iperf-reporter-deadlock.patch  |   68 ++++++++
>  .../iperf/iperf-2.0.4/008-numofreport.patch        |   15 ++
>  .../iperf/iperf-2.0.4/009-delayloop.patch          |   22 +++
>  meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb     |   47 +++++
>  .../lmbench/lmbench-3.0-a9/obey-ranlib.patch       |   30 ++++
>  .../lmbench-3.0-a9/update-results-script.patch     |  160
> ++++++++++++++++++
>  .../recipes-benchmark/lmbench/lmbench/lmbench-run  |   23 +++
>  .../lmbench/lmbench/rename-line-binary.patch       |   19 ++
>  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |   56 ++++++
>  .../tiobench-0.3.3/tiobench-makefile.patch         |   49 ++++++
>  .../recipes-benchmark/tiobench/tiobench_0.3.3.bb   |   25 +++
>  20 files changed, 1089 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
>  create mode 100644 meta-oe/recipes-
> benchmark/dbench/files/destdir.patch
>  create mode 100644 meta-oe/recipes-
> benchmark/dbench/files/makefile.patch
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-
> Iperf_Fix-CPU-Usage.diff
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/001-
> cast-to-max_size_t-instead-of-int.patch
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/003-
> fix-hyphen-used-as-minus-sign.patch
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-
> svn-r43-ro.patch
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/005-
> iperf-die-on-bind-fail.patch
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-
> iperf-die-on-connect-fail.patch
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/007-
> iperf-reporter-deadlock.patch
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/008-
> numofreport.patch
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-
> delayloop.patch
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
>  create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-
> a9/obey-ranlib.patch
>  create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-
> a9/update-results-script.patch
>  create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-
> run
>  create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/rename-
> line-binary.patch
>  create mode 100644
meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
>  create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-
> 0.3.3/tiobench-makefile.patch
>  create mode 100644 meta-oe/recipes-
> benchmark/tiobench/tiobench_0.3.3.bb



