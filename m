Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T9Zmj-0007lp-CH
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 12:58:09 +0200
Received: by iaky10 with SMTP id y10so1951492iak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 03:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=+fVhLCBlm6ThMG1Is0eGAEiKKmjj4AnZnu7W2CgeUEw=;
	b=tit2xDRwmzAuZhciboXOUWqRsrj/vBfdYuUMDfjAmXX1oU3hKHxiC4dr7+XFHSCerv
	UXnp5oFIyRcK/kG/pZoTz+Nsb50kSjbwUXUItqjO/UCe9U1kjukO5/wip16DB8bffRca
	gNnmOl6oEle4pIzNWG8kyDrrxZJcicLnhKk0+7pK5m17+HGuMKV7aacgZftatug3D4IA
	Q9muQZzgx6eNTeor1egvn82ocNv7/1JhtpXyTYw+kZTVhWg18Vpa9nv1JLV3mZMn7sKL
	OU4gS4Fmn9YpcCPhhy9xGtr4iE1n/nA64npYQH3bhVhPHLSkvJsD6FbCEwRb2y6f7q6b
	4s5A==
MIME-Version: 1.0
Received: by 10.50.104.230 with SMTP id gh6mr13877148igb.50.1346928344640;
	Thu, 06 Sep 2012 03:45:44 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 6 Sep 2012 03:45:44 -0700 (PDT)
Date: Thu, 6 Sep 2012 12:45:44 +0200
Message-ID: <CALbNGRR0tpkqGtN6szJc5dLqYKPRFnyeaD2tyRAk6nV50aOT8w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: PREFERRED_VERSION_virtual/..
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
X-List-Received-Date: Thu, 06 Sep 2012 10:58:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

In meta-gumstix I am working on a central include-file where I can
switch kernel-sources/-versions at one single place.

For this I need PREFERRED_VERSION_virtual/... working.

Is there a specific reason why this is not implemented or would it
cause huge efforts to implement?

Andreas


