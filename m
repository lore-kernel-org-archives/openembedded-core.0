Return-Path: <d.falko@partner.samsung.com>
X-Greylist: delayed 603 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 Jun 2016 09:43:46 UTC
Received: from mailout4.w1.samsung.com (mailout4.w1.samsung.com
	[210.118.77.14])
	by mail.openembedded.org (Postfix) with ESMTP id 222F060124
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 09:43:46 +0000 (UTC)
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
	by mailout4.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0O8W00FMZT865H30@mailout4.w1.samsung.com> for
	openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2016 10:33:42 +0100 (BST)
X-AuditID: cbfec7f5-f792a6d000001302-ba-5763c3f60899
Received: from eusync4.samsung.com ( [203.254.199.214])
	by eucpsbgm2.samsung.com (EUCPMTA) with SMTP id 66.FD.04866.6F3C3675;
	Fri, 17 Jun 2016 10:33:42 +0100 (BST)
Received: from falko-work.rnd.samsung.ru ([106.109.129.11])
	by eusync4.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTPA id <0O8W00H0ET8519A0@eusync4.samsung.com>; Fri,
	17 Jun 2016 10:33:42 +0100 (BST)
From: Dmitriy Falko <d.falko@partner.samsung.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 12:33:39 +0300
Message-id: <1466156019-32399-1-git-send-email-d.falko@partner.samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMJMWRmVeSWpSXmKPExsVy+t/xa7rfDieHGxy9qWJx8PA0Zos7P9+x
	OzB5nNu4gtHj4Ls9TAFMUVw2Kak5mWWpRfp2CVwZPbsvsBW0sVZ0/33M1MDYxdLFyMkhIWAi
	8a/xKiOELSZx4d56ti5GLg4hgaWMEqvvXWSGcFqZJI5+PMsOUsUmYCjxp/kgUxcjB4eIgI7E
	m49eIGFmAX2JTzf7mUBsYQEric/LHoKVsAioSnx+mQ8S5hXwltjS+pYZYpecxM1zncwTGLkX
	MDKsYhRNLU0uKE5KzzXSK07MLS7NS9dLzs/dxAjx6tcdjEuPWR1iFOBgVOLhXSGaHC7EmlhW
	XJl7iFGCg1lJhHfuQaAQb0piZVVqUX58UWlOavEhRmkOFiVx3pm73ocICaQnlqRmp6YWpBbB
	ZJk4OKUaGPWfFj/Oet/tveCXV9jfIq9zVyzsrRKzQk6UnwsstS1aGmZ34VHd6fcd3zSmrgy7
	OKNF2c4nf8+eDrXPHg0vN87ddXbVAnn9QyX3jtWy+a/ra7bcePDZrNLaqPXbTr7cHdV44NDE
	FyWdjmt2yl/9X6fSPy3c4ePOmV/vK84TXVD/R9WTr5bdOlOJpTgj0VCLuag4EQAqB5QO5gEA	AA==
Subject: [PATCH] Alias _obstack_free to fix binutils build
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
X-List-Received-Date: Fri, 17 Jun 2016 09:43:47 -0000

Signed-off-by: Dmitriy Falko <d.falko@partner.samsung.com>
---
 libc/misc/gnu/obstack.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libc/misc/gnu/obstack.c b/libc/misc/gnu/obstack.c
index 38cfd83..2689263 100644
--- a/libc/misc/gnu/obstack.c
+++ b/libc/misc/gnu/obstack.c
@@ -385,11 +385,11 @@ obstack_free (struct obstack *h, void *obj)
     abort ();
 }
 
-# if 0
+
 /* Older versions of libc used a function _obstack_free intended to be
    called by non-GCC compilers.  */
 strong_alias (obstack_free, _obstack_free)
-# endif
+
 
 int
 _obstack_memory_used (struct obstack *h)
-- 
2.7.4


