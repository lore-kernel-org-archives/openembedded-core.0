Received: from mail-vb0-f45.google.com ([209.85.212.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tq6q1-0006fj-2d
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Jan 2013 19:45:21 +0100
Received: by mail-vb0-f45.google.com with SMTP id p1so13586006vbi.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jan 2013 10:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=M3/yrTWFGgZTmdgayuhlx/4wShtni0UiNtcdzWNERVc=;
	b=L8/PJ6nz9RPq5Ny73YJTLauCAJxS4FMvtBkjYLVzCxzyM2K1W6G7vvXF2McGy9K1Pf
	2YFjmaxSmEs0Sm1vNPBEa8QcFsz00dz0dxbYEh9wyIdYxcWM/vutNaDalnZkUDXsjvrB
	WgCIVO1dmWb4pPRMsJiWg28xfd6l6aIJNvG9WIooZ/yy2TZLkfuH2yObkBu48OdrARre
	tZri9bJ1soa1w4O9Dybt+ujZrlNffn4WEgSmZhQyUygqgtBOG5vxPPZIoct4NWnyQG/5
	K94//rwroFbv5pKp5xBPIdGViNqkEHbrTXIge8CLSOjDnF5+qQCJxr5LSgA/jCbvrYT6
	T4IQ==
MIME-Version: 1.0
Received: by 10.52.89.242 with SMTP id br18mr59755516vdb.22.1357065019540;
	Tue, 01 Jan 2013 10:30:19 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Tue, 1 Jan 2013 10:30:19 -0800 (PST)
Date: Tue, 1 Jan 2013 20:30:19 +0200
Message-ID: <CAF6bG8fgx69uYhFVA2_SQSoEjnrRYAafaK6mHTt_TaDkcqOehw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Automake 1.13
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
X-List-Received-Date: Tue, 01 Jan 2013 18:45:21 -0000
Content-Type: text/plain; charset=UTF-8

I did brief test of update automake in oe to new version 1.13 (and now
to 1.13.1). First thing that failed (=prevented build to proceed to
next one) was libtool-native. Error was in execution of "missing"
script, so I guess these points from automake-1.13 NEWS are relevant:

* Automatic remake rules and 'missing' script:

  - The 'missing' script no longer tries to update the timestamp of
    out-of-date files that require a maintainer-specific tool to be
    remade, in case the user lacks such a tool (or has a too-old version
    of it).  It just gives a useful warning, and in some cases also a
    tip about how to obtain such a tool.

  - The missing script has thus become useless as a (poor) way to work
    around the sketched-timestamps issues that can happen for projects
    that keep generated files committed in their VCS repository.  Such
    projects are now encouraged to write a custom "fix-timestamps.sh"
    script to avoid such issues; a simple example is provided in the
    "CVS and generated files" chapter of the automake manual.


 I've not yet investigated this deep enough to tell if (timestamp?)
issue is something to be fixed in automake, oe, or libtool.


 - ML


