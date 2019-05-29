Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2F08760069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 15:48:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id c2so2136907wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 08:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fo/4p0KRhR4TG359L9SfRrCmzn25brIoJXLE+xci++o=;
	b=CSFW4ClTk7eTjboki8z4DcPRbSSWRj/LfdtzlPq/d41XDODpis9imC2F24HGAjXHGl
	l/7OE+XxD+e3Zk5QEls2y+vGixZ9sRIlOv31NstD/6Y5z2baOezcmyWYT/UpVZ+xM12I
	EKAtbaO/VL2+QQoYolC9tDZXVpblkyl4nFLeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fo/4p0KRhR4TG359L9SfRrCmzn25brIoJXLE+xci++o=;
	b=ITSJF4TRIIA0wD/JmouCumDpEiEpMPywJV1rypmyNGZixI3+QIuL0Yann7mYVFQtHo
	LQt+s44tjZDvW7HZGdNXeBy0OGMzZhmW6yPScfJcRCFcWCABKEkLeT6g0VArh2bJV9pD
	a+27HS/Vm3XNzTjkBnCuxe4ghKUpLDu7vAsVFm/o+2gFrd0XGYpSrP6UmDrvykreK5NV
	kQpbTpiqNWzyGf7ekrSuZXQR/qgupBDoFPxcW8iHmo4kcN3H8mAWx8MqRd0LzoEYZxHA
	wtfd4PccIH5tWKrFot0NN835G7B5Tpm7+9i/dtw8160stJIkvGbVjqHEaxGxGzH1UXB8
	9LqQ==
X-Gm-Message-State: APjAAAV5JYSg8NWhA6NOrWAcvJ+zqipTSZzmd9iYpzS1EMUh5FS/fvqh
	P1jo0nxAqKSkp+jKNLqzaSZFkrUDFBo=
X-Google-Smtp-Source: APXvYqy69xded9WFT8cs5FbYt6MhtxHhftdpA9yH0U8//id5EQ3dZMk+xp1zUwaLWALtvykJPhkrMA==
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr3939311wrw.277.1559144897704; 
	Wed, 29 May 2019 08:48:17 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i9sm5593322wmf.43.2019.05.29.08.48.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 08:48:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 16:48:12 +0100
Message-Id: <20190529154814.2996-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529154814.2996-1-richard.purdie@linuxfoundation.org>
References: <20190529154814.2996-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/4] ptest-packagelists: Add mdadm
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
X-List-Received-Date: Wed, 29 May 2019 15:48:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index ec7ed6fa4d6..17deaa762a6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -65,6 +65,7 @@ PTESTS_SLOW = "\
     gstreamer1.0-ptest \
     libevent-ptest \
     lttng-tools-ptest \
+    mdadm-ptest \
     openssh-ptest \
     openssl-ptest \
     perl-ptest \
-- 
2.20.1


