Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UPWvw-0007JJ-4w
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 13:43:01 +0200
Received: by mail-wg0-f41.google.com with SMTP id y10so4733414wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 04:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Edavm3uQs2JKB956JEJ4csvkhZsXsTVNHEka4Y+HREM=;
	b=Q7VxAVcRHVliMArUIQJ1gsRu+LijtkbdEUWUq5EePP9zG3Sh/6yJ6pawAfPPuuLfSu
	5nr6EYkATOFy8sVSL34xb2HcY4knAmozZv4hxTL48WN+A8U+fBavFcRXfAxRCpzJ45oY
	360N35/ZRneSn5z/PbDckaojXBtRGbb5WkhkfLL3Yc3JEBXU8RNtWQRl5zcCIc39MySl
	XgxS/qATMqK8MUwDKBXrFHWnwz0gfZeV6MwHf1wkEUmHoKQ7MkJ1ayqxod5oMJpgGxgk
	pciJADP7HMJ7WHrJZ2UhwIfYLJQTO2gHqyStnKhgmtzzJ+HGonPltQoKLYACbaJjyLQ+
	WF4w==
MIME-Version: 1.0
X-Received: by 10.180.73.229 with SMTP id o5mr6514492wiv.8.1365506672000; Tue,
	09 Apr 2013 04:24:32 -0700 (PDT)
Received: by 10.194.45.100 with HTTP; Tue, 9 Apr 2013 04:24:31 -0700 (PDT)
In-Reply-To: <1365453260-32342-1-git-send-email-sgw@linux.intel.com>
References: <1365453260-32342-1-git-send-email-sgw@linux.intel.com>
Date: Tue, 9 Apr 2013 07:24:31 -0400
Message-ID: <CAHUNapRD5absUjjeRnA3O4jrBQ7DNJw_UJ-Zu9c79p_XLp-JKw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: Fix sys/io.h patch
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
X-List-Received-Date: Tue, 09 Apr 2013 11:43:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Excellent. Now all my qemu* "bitbake world"s succeed :-)


