Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C03A77822B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:09 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id q124so7269901wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OvQus1N6biFcRSkvvtJEJMIoRdhc7rJisECzks31dxo=;
	b=jXBi1fLs0VTUntRkP3jISjJNFSX6eavqRQXd1LXE1COv1FtV7PGpQAL6NfOoKuQ514
	MrmyIQcUqOVAa2SEABVw1A5fB9dnEthi+9DV5sTQCA7nieUXPbHoOD7YjoQvXjmIUwyR
	1GihA+8Wv+V7S49OXAspVtwOtoWtABZ5CffDnIthcB+Vu012z9AfhqRRkl+2ruxivFro
	8/SOHQ/AHyNievwIg20Pb9nurKD+yg323nAN3dgQcwFuig6rU1xx4g0tyHfh4X1cF9Mg
	lp3LtczrV1DrqV01WmQXocdq2oIC3M4Y0dDLNi1qFgyz8Ml6iVHS5P+/81mrJbVklCp7
	cJoQ==
X-Gm-Message-State: AMCzsaXvzbYR67TX1VknauDS6MBA4ezOgB450TIQfxO2zp6xSgkkHeSS
	cbTgpN+/yPpl5fp34V1OzjkPVyQg
X-Google-Smtp-Source: AOwi7QBIYMvFFbsY0TKDZcVMfNit94Ed7amzgySVaMAFYxLRN9BhK96IddLov3dh8WuaXqMfyqx+lg==
X-Received: by 10.28.224.87 with SMTP id x84mr1484856wmg.118.1507291990294;
	Fri, 06 Oct 2017 05:13:10 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:09 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:42 +0100
Message-Id: <20171006121259.5817-1-git@andred.net>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Subject: [pyro] some backported patches
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Can these fixes/patches from master please be applied to pyro.


Cheers,
Andre'


