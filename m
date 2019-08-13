Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2C23D60234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:24:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z11so6718061wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HowbNa4SKUE8auts3AWWOIUxbZPlcmrJiSnZiprGuRY=;
	b=M2KxwuaR8hG4bXV5CPgBeImTUfBtq/2Pw8GxV9cAqxQmcDhxR5A8tO+JOHs6xIOltg
	JmfuWp3vUIy3cfqoTR485kvC+K+pg8RByZ6E2cEUnA10w7guvI9mSu12I/+x0TaAgWi5
	BaKSnr/VnMrQUau1o/jAiz8AmBFsxdyh9Mp5gTOpoym0Z36u/oWsJs0kSVCfilrdHOLl
	NSmZahktUTTk907fErTeVPvQy5JHoQ/oIAHJofgTGtE7142jeKW5wJsUcEGFKJldbufJ
	0MMAA5y32/Tk/f6kAlm+Hdllc4hzq2U5jek5CszRV+sBbk5U9LJkoRSNQchcbLopmvH0
	A4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HowbNa4SKUE8auts3AWWOIUxbZPlcmrJiSnZiprGuRY=;
	b=e22J5924kZ5nI5ExyoSlaVgbJipTAIlRvN+oJr2o/NwTTcqJIA8bCsgY7pjU7q9cot
	G09b2UrpT3Ugl0fyDcns++7vKHiebz4G6MlU927ntueTCFZaFIHMrC31A7oS2B+MFcPp
	z1gCPE2W8lN+Jr4H6IIrwnUp/12JGpKcwGl45g+u7kZZ7IDxN0oE5rAQizWhUlEU7sg6
	VBeCFk5x2GoQ47MaNGtIBMlvM8NXQeUghQ6XtkXTQtBRzFzwhaYFG/vFNT1szqlnXf+o
	PWA+nUOFxJEN7oltsg8vqIFLjyHhWrtbuwoWytjVTh6o+fBRUQLKU/kI6JH9c9tnHtPZ
	Zsag==
X-Gm-Message-State: APjAAAUnLFFXo5i4mNHFxMFl3/QfkFh7jEC7Ne1DZvwZWx3NZeBH963U
	pFBYymELt75us/siXurnIOYlZUnuwNM=
X-Google-Smtp-Source: APXvYqw/9Tqz3qiQOf7MSq5flqDUuiEVRxU/KQpEncSbuVR0l2rto3dCD2Ot3VKYKlicIwXmmFuYAw==
X-Received: by 2002:a05:6000:128d:: with SMTP id
	f13mr13171816wrx.241.1565720663808; 
	Tue, 13 Aug 2019 11:24:23 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id c6sm3218230wma.25.2019.08.13.11.24.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Aug 2019 11:24:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 20:24:13 +0200
Message-Id: <20190813182414.2952-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190813182414.2952-1-alex.kanavin@gmail.com>
References: <20190813182414.2952-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/5] sudo: correct SRC_URI
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
X-List-Received-Date: Tue, 13 Aug 2019 18:24:23 -0000

The old URI returns 404, and has an invalid TLS certificate.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index 1a3b2be6b4c..9d2d6bd4299 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
+SRC_URI = "http://www.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            "
-- 
2.17.1


