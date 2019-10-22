Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9EAE96C4D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 09:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 853AA9C046B;
	Tue, 22 Oct 2019 05:04:04 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id CmBsvVWdIVbF; Tue, 22 Oct 2019 05:04:04 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 100169C0473;
	Tue, 22 Oct 2019 05:04:04 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id Dq4hy2Vw1pR4; Tue, 22 Oct 2019 05:04:03 -0400 (EDT)
Received: from sulaco.home (lfbn-1-7821-217.w92-167.abo.wanadoo.fr
	[92.167.224.217])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 5CE119C046B;
	Tue, 22 Oct 2019 05:04:03 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 11:03:53 +0200
Message-Id: <20191022090353.21151-7-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: brendan.le.foll@intel.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com
Subject: [RFC][PATCH 6/6] recipetool/create.py: remove the 'noverify' url parameter
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
X-List-Received-Date: Tue, 22 Oct 2019 09:11:21 -0000
Content-Transfer-Encoding: quoted-printable

This commit removes the 'noverify' parameter which was added to the url
to fix warnings with the shrinkwrap / lockdown file generation. This is
not needed anymore with the new npm fetcher.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/recipetool/create.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
index e49e73ed9b..b4ab1117b8 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -477,8 +477,6 @@ def create_recipe(args):
             storeTagName =3D params['tag']
             params['nobranch'] =3D '1'
             del params['tag']
-        if scheme =3D=3D 'npm':
-            params['noverify'] =3D '1'
         fetchuri =3D bb.fetch2.encodeurl((scheme, network, path, user, p=
asswd, params))
=20
         tmpparent =3D tinfoil.config_data.getVar('BASE_WORKDIR')
--=20
2.20.1


