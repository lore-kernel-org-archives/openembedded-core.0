Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SwE8f-0001EB-Rf
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 17:13:37 +0200
Received: by weyr6 with SMTP id r6so4037853wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ib05YdciDjfhoF2YLLnSKesTov541fxf3O7pwpChHVY=;
	b=Uej234QO7JKPBmYf+1W/VvKM7oEuhIftbYYkpuAALmloMDQfsdI/mTtZQTcLGYYC8E
	JPPB+AZ6zSI1654AzaPQ+1pKYhHg1sXldVuxg/Xa0YeGSs0I+QXaz95qafeklkAfRvSi
	mJ3wtqeiirrzJjj13pdm+ZSTrTGD5+jqi+EMstcu3mF/+OtLX0VqHC06jie+dLHgIL4f
	i5TX6KVszxxuQ2uqM6WiSH5vTHKkGb/O4tFX1aWeTUKbv/hLfDKbVbg5AVDpKd2li4Od
	iMM7iJ4tb1X4aFUfwgpFcl0+BAcBXMz+GmNNucHXSuPwtxFNRUiMrO7Oxd+Qm4yeWO+A
	zweQ==
MIME-Version: 1.0
Received: by 10.50.217.163 with SMTP id oz3mr2375276igc.5.1343746919742; Tue,
	31 Jul 2012 08:01:59 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 31 Jul 2012 08:01:59 -0700 (PDT)
Date: Tue, 31 Jul 2012 17:01:59 +0200
Message-ID: <CALbNGRSyCyCSX23dQXa1neOBior_vHbmKtk8SmSV8pKJdQt44w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: pango modules postinst issue
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
X-List-Received-Date: Tue, 31 Jul 2012 15:13:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

sorry fur disturbing again - but:

When starting X on a maiden image I receive:

No builtin or dynamically loaded modules were found.
PangoFc will not work correctly.
This probably means there was an error in the creation of:
  '/etc/pango/pango.modules'
You should create this file by running:
  pango-querymodules > '/etc/pango/pango.modules'

and have no fonts displayed. Followed the suggestion

pango-querymodules > '/etc/pango/pango.modules'

-> fonts are OK.

I checked: Besides other pango modules my image contains
pango-module-basic-x. In the postinst of this package I see

#!/bin/sh
if [ "x$D" != "x" ]; then
  exit 1
fi

if ! [ -e $D/etc/pango ] ; then
	mkdir -p $D/etc/pango
fi
/usr/bin/pango-querymodules > /etc/pango/pango.modules

This looks OK so far ( besides that I would not have the $D in second part ).

Additionally log.do_rootfs says:

Configuring pango-module-basic-x.
pango-module-basic-x.postinst returned 1, marking as unpacked only,
configuration required on target.

Any idea what is happening here?

Andreas


