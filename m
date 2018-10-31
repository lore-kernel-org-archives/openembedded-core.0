Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 971E179B8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 14:40:02 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z2-v6so5140083pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VhCDds8FkX5mu19iZZ5KsGpm0+VHrCv2tUZjAlcfyhQ=;
	b=t7Xe3B4e/QMlUoJeYq7QyZbBXyc2hD9nS5XlkTz9tZtsMIOsiD+nCdtQhi1Dsl2bKQ
	OtY20nO8aTEaqbVPG6nte0uA2QiCMop4hvaU1ZqNRmIiooPMeyfIjhuci7DquY83PkF1
	lzk6C53IAOoeZ0ndzkUMiN1Z44878/IJZNYHaeq7/HRpa9HGLDEZFueE4CBoPg2fIvp8
	N6gvVWSnZ9G0T60EaYxtMEILbi2667AnHMslf2sNeGZBIWkWRm2vLsfMagQEkXIYqz3y
	L/YpX6BrbifJ3Q6dYXQz5SKHOE9ej+G0bzHDQO6ilNMP0s5wvQpd1wgR27yb6cv2bxGW
	Vv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VhCDds8FkX5mu19iZZ5KsGpm0+VHrCv2tUZjAlcfyhQ=;
	b=kDHk4iGolLYM+Mp+HGUC7mQxXmPmxTP9RMzexYsYwns7lU+Ia1ApZGcqDa6TCngmDV
	66rUGUFOv/89wDAwFp/kHhF2SKyAdu6PuKu5KJieD6/4hfmPUWaF4KzpzZN+Xbn2WjM/
	f9VJ79pS3GKF/He5UYloN3GhSomMQXRhC4C1cDsEqyxSTUVPjIx239/3CqbbocelplKW
	4C7+9v78OkabkkWu6huqu6IlENApUvCSe0zyjlP939wdRTPOsLKo6MlKwvpzb3oVm1Qf
	Z58jtcUyXk8ksiwSDjHdKxco1K3OCGkHVgUeWq94C0CHgb2ODGwbGCYs6H4p9ArkoRHJ
	fEBg==
X-Gm-Message-State: AGRZ1gITmD4B+na8dTMPF6EHQfWSTgjDw7veA1aSKLlyMRmAousDaeIh
	R7eHctjYhfNe7aqB1CTbyLOJFual
X-Google-Smtp-Source: AJdET5dOWqRLWmtCLG5wN36eHa+hxT3LpdRjP6XxMFmSU48JIBPx2vKdFR8Wnw+ElGDW+Iyp6Z/aDA==
X-Received: by 2002:a62:8c93:: with SMTP id
	m141-v6mr3632187pfd.239.1540996803266; 
	Wed, 31 Oct 2018 07:40:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:571:f5d0:d940:5c94])
	by smtp.gmail.com with ESMTPSA id
	h17-v6sm7123568pfj.125.2018.10.31.07.40.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Oct 2018 07:40:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2018 07:39:57 -0700
Message-Id: <1540996800-29855-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540996800-29855-1-git-send-email-akuster808@gmail.com>
References: <1540996800-29855-1-git-send-email-akuster808@gmail.com>
Subject: [master-next][PATCH 2/5] tzdata: update to 2018g
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
X-List-Received-Date: Wed, 31 Oct 2018 14:40:02 -0000

  Changes to code

    When generating TZif files with leap seconds, zic no longer uses a
    format that trips up older 32-bit clients, fixing a bug introduced
    in 2018f.  (Reported by Daniel Fischer.)  Also, the zic workaround
    for QTBUG-53071 now also works for TZif files with leap seconds.

    The translator to rearguard format now rewrites the line
    "Rule Japan 1948 1951 - Sep Sat>=8 25:00 0 S" to
    "Rule Japan 1948 1951 - Sep Sun>=9  1:00 0 S".
    This caters to zic before 2007 and to Oracle TZUpdater 2.2.0
    and earlier.  (Reported by Christos Zoulas.)

  Changes to past time zone abbreviations

    Change HDT to HWT/HPT for WWII-era abbreviations in Hawaii.
    This reverts to 2011h, as the abbreviation change in 2011i was
    likely inadvertent.

  Changes to documentation

    tzfile.5 has new sections on interoperability issues.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2018f.bb => tzdata_2018g.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2018f.bb => tzdata_2018g.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2018f.bb b/meta/recipes-extended/tzdata/tzdata_2018g.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2018f.bb
rename to meta/recipes-extended/tzdata/tzdata_2018g.bb
index b167540..dba82ac 100644
--- a/meta/recipes-extended/tzdata/tzdata_2018f.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2018g.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "e5e84f00f9d18bd6ebc8b1affec91b15"
-SRC_URI[tzdata.sha256sum] = "0af6a85fc4ea95832f76524f35696a61abb3992fd3f8db33e5a1f95653e043f2"
+SRC_URI[tzdata.md5sum] = "e71cb1f9d8d53c43904d79d7aeeedc1b"
+SRC_URI[tzdata.sha256sum] = "02dfde534872f6513ae4553a3388fdae579441e31b862ea99170dfc447f46a16"
 
 inherit allarch
 
-- 
2.7.4


