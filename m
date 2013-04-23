Received: from mail-qe0-f48.google.com ([209.85.128.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UUehW-0006Uf-3p
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 17:00:30 +0200
Received: by mail-qe0-f48.google.com with SMTP id 9so417602qea.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 07:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=+FMXi4Yy5q1iXxPEhtPNNrKKGLutywCe4ek6N+RUGJo=;
	b=fJJwyrZpEIjfVrsUKULl2lNU/atcTcX1lueDmLqpfIgQpB71MH9IncSbmcAqpsMzvI
	CxdpDMZJs952vYS+Tl21TX23SAP2cwFQFT4n/rFvL+yeC2uXb7icbrMf0nIOOK3PDgTW
	9Z8qsZcy4UoNCOIhudCTYh6wXTxnM5ceNFXldd2vzTVR8zyiNYXB7whCrvYqXzMACgKi
	IiyeyLIdDdqlDQsX0Iu7nRalBTCbIxwMwkGIAqxdxyqFDckWLT4Tjtj3yq/9xULS0kd7
	/FKrSQ1fLBkGuqyUgBlXe8G15jwbKNJxL5nPD8vfPSduwrnTwrysXxb/qSYPxaJhhKeb
	pjng==
MIME-Version: 1.0
X-Received: by 10.49.106.40 with SMTP id gr8mr30313656qeb.42.1366728149342;
	Tue, 23 Apr 2013 07:42:29 -0700 (PDT)
Received: by 10.49.4.170 with HTTP; Tue, 23 Apr 2013 07:42:29 -0700 (PDT)
In-Reply-To: <CAJTo0LYPFJooqAA92hcyD5uX1URKW1wvNu-hv0pA1mMOkmXJzA@mail.gmail.com>
References: <1366708403-45429-1-git-send-email-kirgene@gmail.com>
	<CAJTo0LZsrvMLioXtKtZHmnRExnLVOqy9QmHOXUKJLEKNP4fXzw@mail.gmail.com>
	<1366725166.23738.63.camel@ted>
	<CADV-EXH6gLETd1-1uMX5e2KSdyw_ph_OGG9cveFy4ysf8Fq_NA@mail.gmail.com>
	<CAJTo0LYPFJooqAA92hcyD5uX1URKW1wvNu-hv0pA1mMOkmXJzA@mail.gmail.com>
Date: Tue, 23 Apr 2013 17:42:29 +0300
Message-ID: <CADV-EXFj=PKMXS5ZO0dPBK2hx91Piotp_MZBgkH6t_e29X1SKw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 23 Apr 2013 15:00:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

OK, and what about -dbg?
Best regards,
Yevhen


2013/4/23 Burton, Ross <ross.burton@intel.com>:
> On 23 April 2013 15:26, Yevhen Kyriukha <kirgene@gmail.com> wrote:
>> It isn't a pure python package but a combination of C library and
>> python therefore -dev and -dbg are needed.
>
> FILES_python-${PN}-dev = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"
>
> Nobody will be linking to that library as it's a shared module and
> Python won't read .la files when looking for modules, so you don't
> need this.  Just delete it instead of packaging a useless file in a
> useless package.
>
> Ross


