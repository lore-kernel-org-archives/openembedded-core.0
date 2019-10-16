Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1387C556
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 09:18:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5so2066369wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RgCjFRyzv1VnsycBCjq3Dh6dswY3kYQL/JoNFSCTZgs=;
	b=uY0FcBLayVcJJBuIn85ZLbJhRdOVbxJccnzNMW7GwnesXPFIW4ssXOibYA1wkoi7Ly
	TjGrV5WC5JP7AFXfYQq3RrCY6qeXxIo/8ZrQMOoTHl/s+WqnEIzXvnISnCw6wi9Nt8ZI
	eGZueYLxvI07zuaxDD+w5Dj1JktretDu8yE17KTIod8ADZYIJ1zHRpClAaezUT1CYnnk
	7ALkqZ7cYJp+v9U3ULJ6u7NcptI+eSqQbF8dfuro5cU5LHSxw4BfJh/hlTBBJYnHTgD7
	+I46F0Daba3oqSrMAzJyhTdKJhqyrIBHGa82xp/Y6Dx1Q3zrQVd+xY2tHQGdNPf+ynq1
	kycw==
X-Gm-Message-State: APjAAAUef1BKe6RxnCjvK0gF2huOj6eLyRtW+Z/wL2nUPP/QR7kmxAd0
	jxw2IFk4B+l6z68olvtV6olBU6jO
X-Google-Smtp-Source: APXvYqyUGIKKWNaVX4eQDxwh0V23h5h98xhqhSG5SfWLfDPS7BOLysASYXs84+hlPxjxmb9iQ6oQBw==
X-Received: by 2002:a1c:5609:: with SMTP id k9mr2388729wmb.103.1571217512347; 
	Wed, 16 Oct 2019 02:18:32 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v8sm31907518wra.79.2019.10.16.02.18.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 02:18:31 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 10:18:19 +0100
Message-Id: <20191016091825.1910-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH 0/6] various oeqa fixes
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
X-List-Received-Date: Wed, 16 Oct 2019 09:18:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

These patches:
* allow hardware controlled targets work with testimage again
  In particular, I have a custom target hardware controller
  modelled after the ssh/qemu controllers and it works now
* fix a few issues

Cheers,
Andre'

PS: BTW, not related to this series, but it appears as if
meta-yocto-bsp's hardware controllers have suffered from
bitrot and can not work. Am I missing something?




