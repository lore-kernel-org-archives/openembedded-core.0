Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3pQZ-0006og-Hx
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 15:59:48 +0100
Received: by mail-vc0-f169.google.com with SMTP id n10so2449549vcn.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 06:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=3OWd7YyDQ9AyZh28Cr6n1BtwPaL0aNcX9c4HGRUFimI=;
	b=Kzz5SPPdBYk2SsYq27WJ9kq6OhxBF0BNHubl1sT98INHBoI9EplKYMDepTFIHZBDb2
	r2WdejGauYOrD8NIdhXvIVBrrQA2HU1XcDdK2Fk0LNbHJRzSdfODfz+cF7L2sHs+fIFY
	iVWOVhd+7rEt8rq+SsWgPws5rvi1fFQX2RKQDytr445umupx6iXPtWbr63eOyzHiaq64
	JgqLmSY74uUCWxAYxiWmkRUvuWaBPeA0LCbpXfZ36GzTDGUwt8w8BBO8bfK0lZia8HP8
	SoPw1TJvRjg8MNnUwdLPPVcfPIemddOjEdOCgEZP4qpBEBDIrBNf7Y7ipxOhMsO6OF90
	cKUg==
X-Received: by 10.52.90.243 with SMTP id bz19mr5973228vdb.112.1360334633321;
	Fri, 08 Feb 2013 06:43:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 06:43:33 -0800 (PST)
In-Reply-To: <CAP9ODKoYkBks7_o9U3SjUW6gEjV9u3A47NTGLEPUBQQvCqGTYQ@mail.gmail.com>
References: <1360323133-28592-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LaOcn5Kr64Ga7zfuP5q1ixO8Ag4Uy+JrOmDe7AEhDDmpQ@mail.gmail.com>
	<CAP9ODKomOChKyoVD=-O9vNpnRFSyj+N+bz8C=mSLV3rky-hD2Q@mail.gmail.com>
	<CAJTo0LbOcirp-VJT1u9g9Xp8jTREb=UD+dJRftidVpt6tQ3HRg@mail.gmail.com>
	<5114E8E5.70203@r-finger.com>
	<CAP9ODKqRoNRNKqeZ6AyLd_ALjVu3Zo-7ZDtsmmvdj=m5CGwQWQ@mail.gmail.com>
	<5114EF31.6000304@r-finger.com>
	<CAP9ODKoYkBks7_o9U3SjUW6gEjV9u3A47NTGLEPUBQQvCqGTYQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 14:43:33 +0000
Message-ID: <CAJTo0Lb=0Ewt4yDGO5LPFXZtYL5g+i3gQSA58cBqLQXh8Bpfjw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQl6WdQe8ZiwY8LpZnlN7ql2GJYfuQKd0kZzZbagQAWwNsC0f/KXBmmDdkMYuSAgIE/ZKZQ/
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 14:59:49 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2013 12:36, Otavio Salvador <otavio@ossystems.com.br> wrote:
> I agree about the commit log. I'd for ignore the possibility to use
> /etc without /usr as the applications running at very beggning will
> start using GMT and move to timezone when /usr is ready. I see no
> problem with that.
>
> Ross, we are at same page? If yes I will send a v3 with improved commit log.

Unless someone has a good argument against this, I agree with you.

Ross


