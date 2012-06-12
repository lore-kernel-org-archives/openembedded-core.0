Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SeTDG-0002cQ-6H
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:40:58 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 12 Jun 2012 08:30:22 -0700
Received: by qaeb19 with SMTP id b19so2751074qae.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 08:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=AhjPgY/TLcXBawj0Zx2n/7AV2orBev65DGS8oFvqmM4=;
	b=lcAAyfvQFbYlDqIgjVZWGc5B7Aw3XzYHlufkrcUrJe69IlNkTSbzY6HPjFWqWse5OF
	WN97eBGueLx2gryMyUShdRdOtbgKc4MOQ7BS/hSrivDHmNG+d7kfSKXdzRbux5BNrbwI
	n6omc26Py1DkFbNzBHLmuC88xVuMnEC3qwbeo8Bes9qzwdX/H0VPgV8ZgYRxzO2yjAhe
	JqCxXtLUjAscWILwXgSgV7TAWqV8t5sY0AT4g0x0MDcurEIEzuadeIXzL/XCWbRlYTEi
	wIQjIgSaSDgXLbTU2qzec5DZBv10eJN5eVu9KS7NkVCTStczDR5b5aAocJDP/JxbqH9q
	8mSA==
Received: by 10.229.137.135 with SMTP id w7mr8250842qct.48.1339515021324; Tue,
	12 Jun 2012 08:30:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.251.142 with HTTP; Tue, 12 Jun 2012 08:30:00 -0700 (PDT)
In-Reply-To: <1339514272-7427-3-git-send-email-laurentiu.palcu@intel.com>
References: <1339514272-7427-1-git-send-email-laurentiu.palcu@intel.com>
	<1339514272-7427-3-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jun 2012 16:30:00 +0100
Message-ID: <CAJTo0LYD01xo2R5r+x9UU0AnB8fVFM+pPBqmUtrmLPN1bhsSRw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQloAmCZqLJqCnFP89nqNg474McYL7+NfVe0r6+BGXGx2QHRLe0T5UTS0IEa9cs/Cu8dWDNK
Subject: Re: [PATCH 2/2] connman: make useradd parameters consistent with rootless X
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2012 15:40:58 -0000
Content-Type: text/plain; charset=UTF-8

On 12 June 2012 16:17, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Both connman and rootless X share the same xuser. However, useradd
> parameters are not consistent and if connman runs useradd first,
> rootless X will be broken.

It's probably a good idea to put a comment in X package where the
xuser is also created saying that any changes should be mirrored to
the connman package to avoid this happening again.

Ross


