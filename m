Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RxprB-0004No-29
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 02:09:57 +0100
Received: by lahc1 with SMTP id c1so1840934lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2012 17:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=spcmOv14jXj/iGpUoMNiXunNFME8eGGZc4aTKseYvVs=;
	b=s5uJCcVbSXQM5l/CDhCojEXHIbDVZrLSHRfVFjJVCaaV3vzuxPZzmiNdLXsOqBFWb6
	+trCyBfRG7FdkpmtAJKo2xecTV+CXTGNiMKoOiIfOHs4tY4OsOQf9IwHCtFs/TB+ZRnI
	rkCj8Tuk9XpsNC6+14DLTreDNT1IUVpKJ5Efc=
MIME-Version: 1.0
Received: by 10.112.38.37 with SMTP id d5mr157869lbk.5.1329354104523; Wed, 15
	Feb 2012 17:01:44 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Wed, 15 Feb 2012 17:01:44 -0800 (PST)
Date: Thu, 16 Feb 2012 02:01:44 +0100
Message-ID: <CALbNGRRKqfykT9nhNap+hJe+dVL5xWTQop+OypST2HXQuOSyFw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Source files missing in *.dbg packages after PR bump / incremental build
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
X-List-Received-Date: Thu, 16 Feb 2012 01:09:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

As supposed in [1] the source files in /usr/src/debug are missing
after a PR bump. To be sure I did:

* deleted all temp files
* bitbake poppler
* bumped PR in poppler
* bitbake poppler

From my experience you can try that with whatever recipe.

Andreas

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/037958.html


