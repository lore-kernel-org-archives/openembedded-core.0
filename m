Return-Path: <sky.captin@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id 107837F819
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 22:30:49 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id f15so441741lfl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 14:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=caTtkfhKgyxsDvPh4AIMfNs+aDD8T4KxrbfjdIJOMgc=;
	b=fTi7PWmfOzvtghxf/tcfLdmv9b0ITlBLy8hRuiflGPRcF/YW4Uewn5o4YbFJoNbQIV
	JpDW+pbQ8+0geq5n3WY+35V9/omJhhaYLtk3MpxQzu2Rtdrcc1VvaQYVZGMu5eYcXkmC
	C6A7eoMlcXy71h/EoDMkvMB+A/XEEGj5x8CuDYIsitO3YKyUfVbAAwf08FGP2Gr1Zay+
	aRGX8q6NlBZyx8wcfmTGsWwb1LKIcWyWZyloyIta3oRoOO6wJh5Ex7fnmYtx7j7MYS3G
	sc8s81Rl592MjZAVlSc87TG2kcXWuB6GWzrakeT71zZJ8+QA7HBufG2zVEMZnU8vJWzb
	Migg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=caTtkfhKgyxsDvPh4AIMfNs+aDD8T4KxrbfjdIJOMgc=;
	b=is4EDe88fa9Adw/8nk0d6vt1DmDctMXB9T7+iniImVlKm6bZYfikIinSB0NlnJhopI
	4pEimh8s9TSRNNcL2nufXaF4ELsLsgDBoiQLuxS1SBEpdNiOTPvd2cY+JZ2GVrjt8Nor
	n6Qur3jc2SuleAL1olmlfd3k8l3uF7uuLJrMzHy6TayzjPXnQ7biqzvawdwzbB5SqwRw
	W2+qpPLMdgYlFFKCk84JOEdpSZEiSCo8NOiFpjTUVDARl758p5hx6tFMdQl54Uky5HTW
	c84JYIx9jbsFgE3tR7W/VUpUd4d/KTrlkbMs+Y1erDNKcKiOdAXB8iGdQzH5GyWCYPsr
	Q4cQ==
X-Gm-Message-State: APjAAAWr6rF+t/n7Oeol9vzaHrUkHSdypBzy6m4d4jie+lN6hgDxduS8
	HeID4ZWYODwYi4/yfCBOk+DBntp4i48Xmg==
X-Google-Smtp-Source: APXvYqzw2B03w85M+nQb1hR9h6ehYcrDn4S2+z42u2dt64s+hCrVMPKZPCpc6uE6p2RiKXMPnPkR1A==
X-Received: by 2002:a19:40d8:: with SMTP id n207mr7113240lfa.4.1576189850397; 
	Thu, 12 Dec 2019 14:30:50 -0800 (PST)
Received: from localhost.localdomain ([105.184.177.217])
	by smtp.gmail.com with ESMTPSA id
	i16sm3527052lfo.87.2019.12.12.14.30.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 14:30:49 -0800 (PST)
From: Slavic Brutalik <sky.captin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2019 00:30:43 +0200
Message-Id: <cover.1576185886.git.no@good.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/1] YOCTO:13685 systemd preset all fix
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
X-List-Received-Date: Thu, 12 Dec 2019 22:30:50 -0000
Content-Transfer-Encoding: 8bit

From: Slavic Brutalik <no@good.com>

The following changes since commit 0f04e81c797d5d337ece4e8638a6b71c75bc0a00:

  build-appliance-image: Update to master head revision (2019-12-12 14:21:40 +0000)

are available in the Git repository at:

  git://github.com/tactical-drone/openembedded-core master
  https://github.com/tactical-drone/openembedded-core/tree/master

Slavic Brutalik (1):
  systemd_preset_all: scanned targets that are aliases no longer fail
    sanity checks

 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.20.1


