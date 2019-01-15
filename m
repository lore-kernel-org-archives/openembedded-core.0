Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id EBB7C7C119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:14 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id s12so3726575wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=k9NrlisDw1r21WdK0e51ADQcGewFGjEsZ1dUzppD5w0=;
	b=mxs3L/K3WI3rDsFYGLkM15T4Mp4caNoB+viG1ux70MIBDvQeBwQjCpfqsGNkyuZa8r
	+nOPyALd/3zTKuRdm5u4nIcO55fUHea0wb6GRc5K9sdRhzPduJZtES0KT+4DtJbCcLDv
	fiYswXSCl4CqNSMznZFstkotEckqssIus4sO/E/6mUgPzncx6ZhfuYc3nLqv3Gg85ORM
	4l7JikjQxMlGhiA4qITudPMLTEWrkohU++29ijmLeM1XgfnXfvsPbsz26hZ6kWjWzeWa
	OkO817chDPageLBRcRtcig4v65Y/AcNfzEwUg8kDGS3OA/tgdIF29mQWIP0gSI+PZ91R
	oPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=k9NrlisDw1r21WdK0e51ADQcGewFGjEsZ1dUzppD5w0=;
	b=skMhndqtDjAVvEZZB1NUbhxE3gh+dUn//CAps0H/HffYPd3OknEPotl5HiawTJfG7r
	q/DRE7BDKNt1HuGL45VfUqgHDRyvStSv32HEw0OOIDEKmNV88nJD14JXX0+WDr8dHo29
	c2dazJ7Om1Yvc52VivWZWOKQXreMFJvEAbD0XbXdMt+Oq7QHw6P887dSgOO/2/CowWV7
	OjaaEAlLku5KKMYjo7e/RvM0MQaS9i9CmRcqnnUu/zg8ZuRhASrlgIJZMwa97nNKR2D1
	ONnY7ltJ9n+97Ma56zzinmpDYqXwJaPe5BniLt3HIK0LApNwQOki8ZSDga1rfSUvGBC3
	yFwQ==
X-Gm-Message-State: AJcUukd/HR0+qFNc4aVRy3oiYtk/gB7fGOCrQUr/oiA/odmRTxI1fP/K
	RIijcXxO5sYddwfxzPgK1fPwVD2dmlk=
X-Google-Smtp-Source: ALg8bN6R9ZDU16IggRiDAg+R4hFtCfrrlcuVlNIFWGIXemW0TdwGGCG6u7h7YG7FB1QOwrCvXMI6CA==
X-Received: by 2002:adf:8228:: with SMTP id 37mr3790747wrb.160.1547570355403; 
	Tue, 15 Jan 2019 08:39:15 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:46 +0100
Message-Id: <b09e21c0ebe6919e6f491a3270289c477affdc06.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 11/22] mesa-gl: do not enable nativesdk variant to avoid clashes with main mesa recipe
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:15 -0000

An alternative would be setting PREFERRED_PROVIDER, but for native/nativesdk
builds mesa-gl is not a viable alternative to mesa, as it lacks all of the
bits that make accelerated qemu possible. Using PREFERRED_PROVIDER would
imply otherwise.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
index 73267eb4f0d..030db6c1440 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
@@ -7,3 +7,5 @@ PROVIDES = "virtual/libgl virtual/mesa"
 S = "${WORKDIR}/mesa-${PV}"
 
 PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+
+BBCLASSEXTEND_remove = "nativesdk"
-- 
2.17.1


