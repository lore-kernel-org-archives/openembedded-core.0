Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB01373286
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:55 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id e195so1566770oig.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sGrScDIFhOI7okgCLnKk5oBRD+VeWxFoNREiGweV/F0=;
	b=fKdT/utgZPMh+zhKZaVUKRTMQWsJ+PzxmjYQ9PehUJlEWTDLtFXt4+vuYoR0GsMIjG
	ApYxW4dGa/z0me1Z8tNxOPemsuvlYIZDajJQDyyanJIu39FAbOeaILtGPLBrrk6onjvX
	LSnIiaokNxcBUNOyit9nmwunBquo8Sfv2xndGwVkHqS/dAvExlxLgA0ypm/UHBfoeBqc
	b5ANF0szkrPE/6p/lUYOs6IssPBWblLmwYdi9CXQFV7vdvbo5aNJEp46oVu+j3m6Sp8b
	3hDeuKfLH7VhvB5EvFrEeMJyqihN7s8ic2qwSSR9JEuGAZNV1Z8Pj3o/mWfN3+IfQXdK
	Rd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sGrScDIFhOI7okgCLnKk5oBRD+VeWxFoNREiGweV/F0=;
	b=dpQLHduDroKtAzwJ7Z3YkxfA8pFIwSBw1nKIVN2nARsXsNsuooolMZiobY/eDwOD4e
	8AfzZ+RnwwLQDyOonBW9byaQX5ZRgeqfIcSc8eB2OqD3hyYsSMGVW3DNzF49MYJtH8TI
	FfhdvqTGo+SY++eN6hTQOCSe+Kb6tRQcxclSCPAEeU30BKWcQfVEvWDPh5u4vvvT2EiV
	+17O2QLkp/cuOFm5Dj6VSpL5Fad/3RbNlKO9w9M7Hpr5eDWAfsimDa3FO3baWdAsZ18N
	uPYKYbxJN9UEgmhivpQ757QJ6oFNrbUrVWBHlOt5QGQJJ3oymp7EiTA2cHep49x/14Ae
	5aVw==
X-Gm-Message-State: ALoCoQmJRdZFXd5idm4J29plzXUJ0Wmx12eEa/pMICskUqMHUlEgQCKAODzAxREtRLwZDJMn/wjftW8lMFh10Gy87LZG+9dQAQ==
X-Received: by 10.202.108.207 with SMTP id h198mr29360486oic.47.1453354676471; 
	Wed, 20 Jan 2016 21:37:56 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:55 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:44 -0800
Message-Id: <1453354610-19218-27-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 26/32] gstreamer1.0-libav: update 1.6.2 -> 1.6.3
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:55 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../{gstreamer1.0-libav_1.6.2.bb => gstreamer1.0-libav_1.6.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.6.2.bb => gstreamer1.0-libav_1.6.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
index 77e0655..3439981 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
 "
 
-SRC_URI[md5sum] = "09644a38827d233f53edeac815dd0ec0"
-SRC_URI[sha256sum] = "2597acc00171006d49f0d300440a87df51b113d557466e532153abc740db3469"
+SRC_URI[md5sum] = "cfe9a06913d4fd4067e9e47f6e05fac2"
+SRC_URI[sha256sum] = "857b9c060a0337de38c6d26238c47352433c02eabf26c2f860c854dbc35bd4ab"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
1.9.1


