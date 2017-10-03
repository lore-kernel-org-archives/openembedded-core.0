Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id AF2D660557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 01:19:24 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id d2so584265pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 18:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qGgZfLNYNpss4bL9Wb7XyB1dmmGsftiFP5XmBtUZ99A=;
	b=mns8uyJ2sKY8kg6QXL8/SFnGURirzqmdE03pH8O1D/eZIC2f5if5/2JsTAqF2Ra/ZJ
	MQQITzZTY6HMsTFL7rDmzal1QUa9P9+k6qRMqvtOmrrR8qQ/mczEFhrBUeJOUhEXTNsR
	nLmOKWSqXxytNQWl/qRn3ko+dMjTsN4K6/rJQZuJCgd8DJNpXitgM4Yj1rO0CRd3ExY/
	oofikzfgDdiEYlFKLvPPtshurZyO8GU8JCO4rrJRz0WbLu3MsmoI1doJ0jQE7TPAnjSu
	lCjZIl8vLQkV7qrYj8v46MK66f43cfrDoiyLdZjCSERqmjWUId+fimZsywf9Mq91i2sL
	s8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qGgZfLNYNpss4bL9Wb7XyB1dmmGsftiFP5XmBtUZ99A=;
	b=P3DduKPSOLi4jg+PNuKGJmG3DJ7G3FEKF7Xh6yi52VvB4cqtMNqm8FQIfZdrKSr7YO
	RfudlTk9w+EoTmvd/E8U+MwVwEQ+53jY0/NnbdS2RzGqKwvm9ONRdMxlVjCjRs9CqoLr
	QEEBYuHGZ34oTnWTBnKPsB0jFLKHtMEAmo/FJtXC4oTK1tXxjPzjnVvnhX9DPDJI/m8a
	upb85PESIwrz2EbvfBZ6Y76Md2Bx3kD6yQnQFQ+kVkbMXU+XRBCc3pOA6ADcQmqfVhyH
	sRbW2bOM/k2/4OrAdVNzRLetaR87Lj9soVtAwLvHAw3lHuLFCpg/eqhBk719gHogLpV9
	MppA==
X-Gm-Message-State: AHPjjUhen/Xw4q4xZAsz5gTV7Ix7/4kB494V32MpGN246USIwdpnYY8D
	bJtc8l70U0sctSTgT+CbnXjghA==
X-Google-Smtp-Source: AOwi7QAQxCIGDCU26ImfcAFB4VJT8wRdxx60KystR6P7zFGGaf+tC0DRi1XjD2fboNd02bi7QBPrgw==
X-Received: by 10.84.240.196 with SMTP id l4mr15508610plt.399.1506993565585;
	Mon, 02 Oct 2017 18:19:25 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	v10sm19769813pgf.8.2017.10.02.18.19.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Oct 2017 18:19:24 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Oct 2017 18:19:17 -0700
Message-Id: <1506993559-15731-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty][PATCH 0/2] coreutils: musl build fix for gplv2 coreutils recipe
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
X-List-Received-Date: Tue, 03 Oct 2017 01:19:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two minor patches backported from meta-gplv2 for the gplv2 coreutils
recipe in oe-core morty.

André Draszik (1):
  coreutils: fix musl compilation

Richard Purdie (1):
  coreutils: Disable broken man pages

 ...-need-charset.alias-when-building-for-mus.patch | 44 ++++++++++++++++++++++
 .../coreutils/coreutils-6.9/no-man.patch           | 19 ++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |  2 +
 3 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/no-man.patch

-- 
1.9.1


