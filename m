Return-Path: <slemieux.tyco@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id B248D77853
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 20:55:33 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id g138so1899763itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 12:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=E/iAjgYnF9WGPNuIl22nEUrUPXZB98qWS3BSejZkFOA=;
	b=Rlp8+GkE+Q0Smlm8VIvl5Nt51nqH6R8Vh9AnQn/o4p8EagbV041rJgAQaf+UKyjSTW
	2z1fW53L0Zv8TCMtW+znmmbFIapG2mUqzGQZBN+rN+JYbaIokRNwA2ONGQJcf2EENA8s
	NA1JmVM9bAxVgxUfM7mfp2v5pyKpdjj+L9sDxAA0WIXqc3lNBXg1TEhtCAn2hLs4q3K1
	vJEvQm68pIBnUmkYyloMzBCuFFaDflAs4hnaDyrLQcJNB7+y8dCJcJdowgVJsKJgEPTZ
	4XFKmjercN7AR5b4N7QwUSkTIrc6Q4W1k+8GhdE4UQNsvQ4peWC6oYnHwAHsZx1Zfrct
	jLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E/iAjgYnF9WGPNuIl22nEUrUPXZB98qWS3BSejZkFOA=;
	b=BIyaZjmCX4RlEQzh1KE9esUihLqUx0HL4EDwCY29Zpdf7uwZKyhaxubzXFCn76cDnG
	lI+zEbxJpnslZlXm44GAO0OHvF7YIzQ+11FBvK/slMpN+j4F+eNz+Ge03dL7zWj0wUbX
	K/ldkOpAukzxZo5i0As7+QYSxL+VEchYvZ20JGmI2Rcpnew/1ENK4FgxmFJxz/CVW20v
	D2jC1LaPBcrQylUaaqKrTV0/qb3tyT2Y+wnVxPUvOcESdVQ1/rUXdpO65JtTXiVf2YgW
	jHpm2LJAVAeNnhAMPwzXxG1YeEYA2egWlu00TzPgQ0Opc0A513phGIzlFZKYdjlI8sA5
	ssog==
X-Gm-Message-State: AMke39mn96coTA342eEpI871trefUsPG2nJwEQL1mzN8qVSeZHJd6hGPk6nWANceC2u2eQ==
X-Received: by 10.36.89.74 with SMTP id p71mr23743643itb.72.1488920134574;
	Tue, 07 Mar 2017 12:55:34 -0800 (PST)
Received: from CABRO3AP00510.localdomain ([74.51.240.241])
	by smtp.gmail.com with ESMTPSA id 202sm6742079ith.7.2017.03.07.12.55.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Mar 2017 12:55:34 -0800 (PST)
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Mar 2017 15:55:00 -0500
Message-Id: <20170307205502.14261-1-slemieux.tyco@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: gary@mlbassoc.com
Subject: [PATCH v2 0/2] recipes-core: busybox: setup "cron" & "inetd" sub-package
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
X-List-Received-Date: Tue, 07 Mar 2017 20:55:34 -0000

From: Sylvain Lemieux <slemieux@tycoint.com>

Setup "cron" & "inetd" as a sub-package in "busybox" and
add the support to install "cron" & "inetd" as a startup script.

Changes from v1 to v2:
* Rebased on latest master.
* Submitted as a patchset to avoid a conflict when submitted as independent
  patch (two individual patch in v1).

Sylvain Lemieux (2):
  recipes-core: busybox: setup "cron" sub-package
  recipes-core: busybox: setup "inetd" sub-package

 meta/recipes-core/busybox/busybox.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.11.0


