Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id AC144719A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 07:13:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id ED60520894
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:13:07 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Wed, 15 Feb 2017 02:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=OG
	ld+xRLrh7GJWEdSQSU/EqBLnc=; b=mqmQdklsTUt1BA5cYNlf5qqAndL6Y/Q8G0
	r3KF4DJCB2VA00De0OglO2fL7syeSGOiyTcQSWU/q9mqNvFro1NOD2LyKitIwwT4
	YNjmi+TGBD3amovWsr53idO6y3I89kQwx5KwRAAMrASl8PgGvnZZ6mR7nIhRlYxO
	/m3tzNYJw=
X-ME-Sender: <xms:g_-jWKUQmKIJafQUboRmrJRpwqtf4dX9Ta-Y4eZ3SaNtHcRvxzr6lQ>
X-Sasl-enc: WlcfUZcuDRYamQp7XOQDntxlvHQYODMsSHSokVz+CUnd 1487142787
Received: from localhost.localdomain (unknown [192.40.95.8])
	by mail.messagingengine.com (Postfix) with ESMTPA id 51EEB7E0CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:13:07 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 09:13:00 +0200
Message-Id: <20170215071303.3244-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/3] alsa-lib update
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
X-List-Received-Date: Wed, 15 Feb 2017 07:13:08 -0000

Tanu Kaskinen (3):
  alsa-lib: 1.1.2 -> 1.1.3
  alsa-lib: fix softfloat enabling
  alsa-lib: merge alsa-conf-base into alsa-conf

 meta/recipes-multimedia/alsa/alsa-fpu.inc          |  8 ++----
 .../alsa-lib/0001-ucm-parser-needs-limits.h.patch  | 33 ++++++++++++++++++++++
 .../alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb}  | 30 +++++++++++---------
 3 files changed, 52 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb} (61%)

-- 
2.11.0


