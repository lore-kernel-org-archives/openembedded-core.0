Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQL1s-0008E3-WE
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 18:39:05 +0200
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 09:25:12 -0700
Received: by mail-bk0-f69.google.com with SMTP id jg15so2116311bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 09:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=CZKJtuGkp0ERFB6evGRyPJOCz10zZyJLPPEXG4j7CxY=;
	b=aNtP2w4VBvxXGOYKhb3Ja7OIpxQZ4gfWdyzcaeWoY/zhl/r9BbRjYc6jB6LlhiIZX7
	HNJGy8yGET1ibt60VePVY/0tSRHBzGGS8kUfTtwkaT2mFQ2WQl+X16S5bdSe86Re/VQE
	vVHvRO8Ysgbw1AKk1p/Kniv8QlGDz+0xXH/YHIcP5dhjddXmNEGz34Rz2tAiryaeKJHC
	NzMt20Ncc5CAdw29pMgGbEjHTJ/OxsFb8MkOF28jHWipeALMHf8wYABX4yqjVtwf3Jza
	oUlFfxpHHV1ECBhgSu0INHF0Fm70rltkotaFnhuUT+9odRRhtsv2TycoNpZuFoH7O67c
	F57w==
Received: by 10.180.82.34 with SMTP id f2mr38172901wiy.17.1350923133095;
	Mon, 22 Oct 2012 09:25:33 -0700 (PDT)
Received: by 10.180.82.34 with SMTP id f2mr38172894wiy.17.1350923132998;
	Mon, 22 Oct 2012 09:25:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hb6sm14976995wib.7.2012.10.22.09.25.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 09:25:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 17:24:19 +0100
Message-Id: <1350923060-1707-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1350907509.2520.86.camel@ted>
References: <1350907509.2520.86.camel@ted>
X-Gm-Message-State: ALoCoQkiUFKlOf9tqSldsfKS30ZTGl9DoQ6vd2iZypaW55pnsfcftsxyyzXRSYkdaBDP8fPFXn9CIE2eZ4d30czUHIJw5yG4Va2R0u0b+4NR6jvM7s+xMxopBSm7uYnLHud1XuFnHbNVP07wK5zvF0qBhFG7jQvB5cdAnl/vS875EcRTWWR6q2tf2sqdDDJPlSyzWzqzarC+
Subject: [PATCH V2] mesa: Build separate GLU library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 16:39:05 -0000

That's a good point well made.

V2, remove the virtual/libglu name and admit that Mesa's GLU is probably the
only GLU that people are going to use, so just package that up as libglu.  If
suddenly people have a burning need to package alternative implementations of
GLU then we can revisit this.

Ross


