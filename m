Return-Path: <silvio.fricke@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id CA3F76B463
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 06:02:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id x10so9171137wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2019 22:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tBE0PCQMA9cRa8/p3quAA4sSkRIc3+sRtZnT4a2eBPM=;
	b=kPb9X1BxK5urVVx9WFnm13giBnOh6+Rz9zKubZQ7L1BQgnoPJ6eEXL+yxv+6gD/t7l
	7h22Qw+1Iw8VMEu/hjedAcVILPk4hM/UjxG+d2axY1ldWoEiQbqSm6Y2nX7mnXDdlGl0
	e08jF9GSyhHKB26bDBQqelZg1mGNT+T0X2e9FGcE+iRZjmCdHopgZ9pcwaID48RSn88d
	zW1KKGcRGs4gYZIJqCtOgUC/uOrSF+zLXpHHdx5IcxyC/vZ1uAGEPfv8YPbU9AwQbh4h
	L/XgiLJufwEY6GeGtv0vvCiTfaO+MV8IgU5Q1v5ijfdkBHzrVkHC7hJSpUfM4kXy0sNS
	sDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tBE0PCQMA9cRa8/p3quAA4sSkRIc3+sRtZnT4a2eBPM=;
	b=aawMqDDS4H1NGCF8bCgOlKGI3kvDCb9937CH/gIGMEBbE6kMQdKZJww2Uw2kdwrk44
	q3y2AedFM2dCHE6Vnb3vTLbRVstZecJvKz5busH+3j1YjJwPxkQTst1f4TVvZuoDDi1g
	VsutNCDSEuSilGaIMQbxFiaems+xhyIXzvuz4f1yT2syUWnpeRQv2qXRE/repT6MChB4
	Y+1mIpvaFVTgyUbd/4WYHOYVDU2R/JiyvgzBh05qo4iD/wTYCLxSdQzH7VmtGGpkgtrD
	/G0iCIa+ihlE7y8uuKyUcjbOtQD5ifrSO5yy8L0inHUgpvImztfK2dhSASApF1jB+E+h
	R9CA==
X-Gm-Message-State: AHQUAubuJirQLVnHBOUa1JiyYROeY9zsH/NZoW27YNd2fY3VPV5LrR1N
	J4SYEmxR6OhFOpox3KoB8IMuyert
X-Google-Smtp-Source: AHgI3IaGUS+d/eTG9ILPB6vtrr9GacFlvGlFBmlwVRoPhgd8XLcgSVFBUkEP6lNX9frXRMZ76t90GA==
X-Received: by 2002:a1c:740d:: with SMTP id p13mr3423698wmc.46.1549864972341; 
	Sun, 10 Feb 2019 22:02:52 -0800 (PST)
Received: from localhost.localdomain
	([2a02:8070:89b1:6700:be5f:f4ff:fe36:3eb6])
	by smtp.gmail.com with ESMTPSA id
	u134sm4702022wmf.21.2019.02.10.22.02.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Feb 2019 22:02:51 -0800 (PST)
From: Silvio Fricke <silvio.fricke@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 07:02:47 +0100
Message-Id: <cover.1549821635.git.silvio.fricke@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v1 0/1] Add base64 as conversion type
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
X-List-Received-Date: Mon, 11 Feb 2019 06:02:52 -0000
Content-Transfer-Encoding: 8bit

Hi #oe,

please add this small patch to your openembedded-core layer. It adds
support to get base64 encoded images as output.

Cheers,
	Silvio

Silvio Fricke (1):
  image_types: add base64 conversion

 meta/classes/image_types.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.20.1


