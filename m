Received: from mail-qc0-f174.google.com ([209.85.216.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1URgss-00036k-An
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:43:40 +0200
Received: by mail-qc0-f174.google.com with SMTP id z24so1480581qcq.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=FLtZIvprbCjcSN2bVGAX9hLODPbTak6qV+YrUkXC9xU=;
	b=L8KY4DueiY2YkJNFJCPoSruLAQ3OjKFmTyvqWMN6m82hhLbW/6zMY+QuAxOBa1lwce
	y8L2Wd7ky83DnNGm2D0qWvY9xCYIyOQYIu1w9AidSxk4mg39w9UB5MPZgjopeOBW7oX8
	8a49ahfe668OMaX+YJ8Ea8e+nhR25oA62mSAYy/CqH6T7KOR40f7CUK2txaVNO0THzd0
	RG2GgD7BtfPr7LowUYxg2Dd+EOlPtmEVGeCGAqNoW5mI2hW9kJK3dcFycOuWIhBTA9q5
	tGL/zYD+D10a05r4K4w6/8trhIgF/WOVU4m2lVYOsGtc2RO8drMhyemyKyZPoZ9xvHqq
	VylA==
MIME-Version: 1.0
X-Received: by 10.224.94.4 with SMTP id x4mr21559413qam.60.1366021569283; Mon,
	15 Apr 2013 03:26:09 -0700 (PDT)
Received: by 10.49.4.170 with HTTP; Mon, 15 Apr 2013 03:26:09 -0700 (PDT)
Date: Mon, 15 Apr 2013 13:26:09 +0300
Message-ID: <CADV-EXFrm6O3x7mNEz4X87inG-jLd6Kb5UNDhszh4hLXGgOvXw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Multiple *.bbappend files support
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
X-List-Received-Date: Mon, 15 Apr 2013 10:43:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is there a way to use multiple *.bbappend files in different layers?

I'm using meta-raspberrypi and my own layer.
Both extend base-files with *.bbappend and both have PRINC = "1".
But only first of *.bbappend files applied (that is in meta-raspberrypi).
PR of base-files also increments by one (not by two).

Best regards,
Yevhen


