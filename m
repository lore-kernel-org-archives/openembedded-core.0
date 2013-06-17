Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6160F60655
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 07:12:33 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so1595588eak.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:date:message-id:in-reply-to:references:user-agent:subject
	:mime-version:content-type:content-transfer-encoding;
	bh=TXnBePKEl2FDxbXRANOUwr/clnZFXnwVE0H8eMTBbEM=;
	b=o1ZrW03k3pshC5BklGTYLxvVh00Cegv4Gjay7mKusQ/iXhalVUru6LNCxHTJ5yCkqV
	P+8f3m63jhSvfQ8lViG6Z2g1beJ5BMob5X/mP6UD62gO7g1/sJp79aNUawRmBRgZUvkl
	1T/haiI8z6H6hqXG8mM4USV4z4Xdj73GvDVCSzlKrKpoyGBZrNBiguo0Qwc+WyUtcnLz
	f1+DwISmnXUpwVop1ZFsR2ECtiV/GGbBo1xIzBwT2R9UXf2Hy5nffuHdnZ5XonUhjHQu
	ryvhrkoKTLpBAlX+2BfVgXf3vpIjdZc2SX11KOS/HtlhBmNSdJT4w9Pu8vvLY+S7Szda
	PXZA==
X-Received: by 10.15.94.131 with SMTP id bb3mr15260527eeb.20.1371453154025;
	Mon, 17 Jun 2013 00:12:34 -0700 (PDT)
Received: from [90.152.178.44] (090152178044.atmpu0034.highway.a1.net.
	[90.152.178.44]) by mx.google.com with ESMTPSA id
	l42sm11531005eeo.14.2013.06.17.00.12.29 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 00:12:33 -0700 (PDT)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Kai Kang <kai.kang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 09:15:58 +0200
Message-ID: <13f50fd5c00.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <30a61ca7883e5f9d8858c7b89884874e74a972c5.1371392062.git.kai.kang@windriver.com>
References: <cover.1371392062.git.kai.kang@windriver.com>
	<30a61ca7883e5f9d8858c7b89884874e74a972c5.1371392062.git.kai.kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.4.0 (build:
	2100294)
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] strace: update depends
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
X-List-Received-Date: Mon, 17 Jun 2013 07:12:33 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 16 June 2013 16:16:25 Kai Kang <kai.kang@windriver.com> wrote:
> Build strace with libaio and acl to support more features. Because no
> native libaio package, just add dependencies for target.

Do you mind updating to 4.8 while you touch it?
Thanks,


Sent with AquaMail for Android
http://www.aqua-mail.com



