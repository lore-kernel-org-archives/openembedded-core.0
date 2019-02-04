Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB5B6D9AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 10:05:56 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id y20so10671244edw.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 02:05:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jfdviNDsizJGLbKvy0b9rH2qPvb8WjvbjORDHQ6OytM=;
	b=nf5i/IihJ6P1NqqxaeE/v1a40j+37gRcvlI3uPBdGhNsnI4/eP/H920veuCD8+h4ag
	n13Cn52y6KJOcc0L81z5av+Ut5ej3m1xn2De8irXEAqjY31bt0QpusS0Tw8stbpUCrgt
	GI9vLlIwHAI4txJxw22LiOqif+xyDxmVq2yUtJiNwmOkpZrVaj4wFkhwXXK9gGQdnBjC
	cpeRUEt/c2YGvnq5m6sNKPEeVrKMP7ifpSR/Ln+YctrIITwS3B2Ht28SgSg1qHyFNEt5
	YcyhEr+p9s3wsVweTd+c2n1lJtHXMVjBQN4+RIHFijqJ+uNmEnYsT+/6ZqGzTevigJRP
	5lqg==
X-Gm-Message-State: AJcUukdtuYRdJFoJDkojdY57VOllp9nCajHf8hwcyYbTyRuwIElmV6Sk
	urx2+LozxIhw2D7n7h7OiQdQZJUg
X-Google-Smtp-Source: ALg8bN6F9ugy6GAcF9BdGKUhdYTy5JuRTiluPX9Z5KTzT3ZSxchrBxKY+ZZoa7CSjdxRHLocyKC1rw==
X-Received: by 2002:a50:ae8f:: with SMTP id e15mr50926936edd.250.1549274756519;
	Mon, 04 Feb 2019 02:05:56 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	p36sm4102358edc.78.2019.02.04.02.05.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 02:05:55 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:05:41 +0000
Message-Id: <20190204100552.25880-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v5 00/11] util-linux: one package per binary
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
X-List-Received-Date: Mon, 04 Feb 2019 10:05:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v5:
* rebase against current master
* introduce patch 04:
      "util-linux: one package per binary (pt 1b: symlinks)"
  This is to automatically package symlinks into the same package
  as the binary they're pointing to, without having to hard-code
  the list of symlinks in FILES_${PN}-xxx
* update patches 03 05 06 07
      "util-linux: one package per binary (pt xxx)"
  cosmetic changes
* patch 11
  fix subject line typo



