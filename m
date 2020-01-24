Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 23DFE7FDD1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 17:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 56B519C02CA;
	Fri, 24 Jan 2020 12:08:09 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id kIIElMeb8exc; Fri, 24 Jan 2020 12:08:08 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6A7C19C02BE;
	Fri, 24 Jan 2020 12:08:08 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id cOBmlYe82ADK; Fri, 24 Jan 2020 12:08:08 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id EC3A89C02E3;
	Fri, 24 Jan 2020 12:08:06 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 18:07:41 +0100
Message-Id: <20200124170743.20463-12-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124170743.20463-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200124170743.20463-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v6 11/13] recipetool/create: npm: remove the 'noverify' url parameter
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
X-List-Received-Date: Fri, 24 Jan 2020 17:08:08 -0000
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
index 7659862f58..6cbf4de674 100644
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


