Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C1DE26D666
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:18:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j18so7368515wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gevt5lUSAKzVeI4jvNMBS0j787Ow3FK8+CZVKuNamLM=;
	b=qDR4F4xjOYzSnf1rZu4zzDDL5Ktn648+RedHEOsjPyVme35AhM4BMEUeyKZvhnH3ZC
	koMu7+jqRHepPeNsfZMjcj2xySSiNoaz+65hmR4ujV6qPwreExNx3sPF5twrzxEhuh0Y
	MeClpfVLJKOzcJoXoXrVNte0tSIWs4yXsqlajL/ouSQzgAN9r7MXyv2YPocBawIDKBd5
	+4tc7IjMvDm4WR6+WJA7HRv0wsC6U715Gw0MANcU3ndqjmH14wr+O+Zl8ptTurMr/gkV
	y9VAgnsKtirWhTOpDlbeXH433ARwuo0i/jrfLoz4S/v6Tzeotv05cp5VTdEYxEvYx4eJ
	RifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gevt5lUSAKzVeI4jvNMBS0j787Ow3FK8+CZVKuNamLM=;
	b=eD/7Yr4DIu2p2zTHKafMiYBGaU7Xy+o6xw4YnZ7ABPZNFls/4SVlIdxSU6+8+bjPoD
	c8aj4B5U+PBaDZaL643PIJ0R1hX1qTghQ3JuROP/OsG6ifhDzuCSVNxXhCRk+OnP3A4f
	AIUet5DmZFEljNJHIVLKhF1lh/T7MhnBAp3nE9kz+/HptWMPLFgCfILf5QnCXnC//bqZ
	9whZ1aC5P5SQqzww2FdzEJhXoscgQmZ7GCuUZ4ohUn/hojEHRidhA9e96jH7XQuWlQYy
	k9b7yb4WzA8hc4y5I8PJKt5FLWDqN5i1drzsaO8GkD3hVJaTs2NW0SRiCWwKyNSokdcq
	9OVg==
X-Gm-Message-State: APjAAAVfHGFypz3yTXKpAxwFZYTBhAyodnoDf+bCWAYNxUNC0W/IKIy9
	47IQ9fOCv1rDYP+dpwewuslC6tt/GbY=
X-Google-Smtp-Source: APXvYqwM3qr9wH2KMszL8KKkdJOwRchs2MIyr6fkYbFxbreVy0CoWzM/rNtJynKYV76cSrxGKi5qmw==
X-Received: by 2002:adf:dc8c:: with SMTP id r12mr7846399wrj.107.1570706336339; 
	Thu, 10 Oct 2019 04:18:56 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l13sm5831372wmj.25.2019.10.10.04.18.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:18:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:18:40 +0200
Message-Id: <20191010111848.3825-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010111848.3825-1-alex.kanavin@gmail.com>
References: <20191010111848.3825-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/10] perl: make gdbm optional
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
X-List-Received-Date: Thu, 10 Oct 2019 11:18:56 -0000

Recent versions of gdbm are gplv3, so in some scenarios
it is beneficial to not depend on it.

(thanks Ross for leading the way with the db option :)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.30.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.0.bb
index ba2a8437d47..1d906a75150 100644
--- a/meta/recipes-devtools/perl/perl_5.30.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.0.bb
@@ -35,12 +35,13 @@ S = "${WORKDIR}/perl-${PV}"
 
 inherit upstream-version-is-even
 
-DEPENDS += "gdbm zlib virtual/crypt"
+DEPENDS += "zlib virtual/crypt"
 
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
-PACKAGECONFIG ??= "bdb"
+PACKAGECONFIG ??= "bdb gdbm"
 PACKAGECONFIG[bdb] = ",-Ui_db,db"
+PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
 
 # Don't generate comments in enc2xs output files. They are not reproducible
 export ENC2XS_NO_COMMENTS = "1"
-- 
2.17.1


