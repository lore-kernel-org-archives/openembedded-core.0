Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8A14273001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 19:05:16 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id b140so54318945iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 12:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=035BtqhL0isF1kuhXrvbSUIP2YtCF573chHtOQCWI1E=;
	b=dvI3imP3lOmO8gpziUQutPzJ/EMvevm/Zal/pj1bai7oBMgv53tlu4jS6XN80C/Y0a
	K4dTTvkiGvHJCHJdSrPd9ECjYahuRMS57LUtt7Syn/yFWuhkvLiLjej2/jEg7VrqMcDi
	YTEJqP3hSa1Yk9/fbJj8cke+U4+hQ2IItuR9OLGov/QSFe4yCnyy/brAwucjmfmCAifK
	B6JMpEAFer+qhDuYR6tFWJKsdZidN2buewxdZIxPXXuB6i4OwAtw6eTH4KfIEUMo73Vj
	pxVprBkui3ok2eiEOoGhh/w21cA8mQ21T5kiTazCLXQ0PmFKLbQe99VrSC+vg5romd3f
	SXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=035BtqhL0isF1kuhXrvbSUIP2YtCF573chHtOQCWI1E=;
	b=l/4SgafEV7geFGP1akvwKN3n3QbG/tzkz9XHMAsCu36rP2bZ6I8nDgUO/Fzwo1wBzk
	g56EqC40pghJ/5iJ+ppys2MSSnKTan6dDAstKJ/uN8yXQpymwjvRDJWYR7cGL7AHTZj+
	NVyvQea2kpNKhCEnhPdMR7VGbWxzUBZyF/bFhbmFHzT7LTro8e2sY/1fh+LLHwBva7uJ
	jjsYQJLol5wETyK8onE2NuBdaRTXUX5rZYCpsSZVURR0+pdgCJtC1afF9PY4LKYEUtp/
	wCJbymiEIOtDXNGTPRBvvZxBcL1IF361rYOe7rkSGiGWNNeRL6AwliPu2rCl75sTFVk5
	p0wg==
X-Gm-Message-State: AFeK/H1zwPXtL+hk/zEp6PqRoq3MgUfCqKnnTsTxO+AjIVz6/nSstk5kqB75A4cOeNujgw==
X-Received: by 10.107.129.66 with SMTP id c63mr22306205iod.92.1490123117298;
	Tue, 21 Mar 2017 12:05:17 -0700 (PDT)
Received: from linux-uys3.suse (104-247-246-30.cpe.teksavvy.com.
	[104.247.246.30]) by smtp.gmail.com with ESMTPSA id
	h71sm10497483ioe.9.2017.03.21.12.05.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Mar 2017 12:05:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 15:05:12 -0400
Message-Id: <20170321190513.21469-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.12.0.rc1.48.g076c053
Subject: [PATCH 0/1] meta/classes/kernel.bbclass: revert 56fe5300ab5
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
X-List-Received-Date: Tue, 21 Mar 2017 19:05:16 -0000

Changes from v1:
 - fixed kernel config option to which this patch refers from
   CONFIG_LOCALVERSION to CONFIG_LOCALVERSION_AUTO

Trevor Woerner (1):
  meta/classes/kernel.bbclass: revert 56fe5300ab5

 meta/classes/kernel.bbclass | 6 ------
 1 file changed, 6 deletions(-)

-- 
2.12.0.rc1.48.g076c053


