Return-Path: <kirgene@gmail.com>
Received: from mail-qe0-f46.google.com (mail-qe0-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0BB6C850
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 12:04:15 +0000 (UTC)
Received: by mail-qe0-f46.google.com with SMTP id a11so2909011qen.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 04:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=FvKKxZ44KrRr3V5c1tumGnmXxCrBuruqkEjWMpsC0Zw=;
	b=f3xbmPGobqlRwc0nXrf4jkn0pcnDKUSiXGNXZSlD8oKRS+Akh/7YhEDLGwUlqQLoAE
	jMY0evh0IsF9Ciw5fcfNFpZgFlQSOUsYRxiYdAhjmbgGZ/dyfj1WKIZAwOmq+kVtxFiO
	8+lYXdqHrOvYoyi+Qa+VMP/AAZnMCdK7U9r5MliXQDAW+1HTYhH+JXXHqDqO79mm2mgG
	opXrb94xXTO7gWg1EJ8VBQ0oR2Y8wrT+RxT1MVCSq+D7oMY2OZMj9LNIg5/4efpa/JW+
	kIhNn143qsDF+3okiqisOGiyR9DIh5IpK1DYsX99w1avraXftk1fJMqUBwAE3z1/kr0o
	Ks8Q==
MIME-Version: 1.0
X-Received: by 10.49.106.37 with SMTP id gr5mr6356047qeb.75.1389269056169;
	Thu, 09 Jan 2014 04:04:16 -0800 (PST)
Received: by 10.96.177.105 with HTTP; Thu, 9 Jan 2014 04:04:16 -0800 (PST)
Date: Thu, 9 Jan 2014 14:04:16 +0200
Message-ID: <CADV-EXEygnQGWan8VLtZbieUozXPnfRNytXg9TBv1ALwJ_y3cA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Failed to build opkg with curl support
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
X-List-Received-Date: Thu, 09 Jan 2014 12:04:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

I define "curl" in PACKAGECONFIG for opkg.
After that I'm getting circular dependency errors during building opkg.

Best regards,
Yevhen

