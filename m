Return-Path: <giuseppe.condorelli@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 31CF16041E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 09:46:32 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id n10so13250676oag.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=fpKa/GODNRBt0L3aXmCi2ZBPAMQZXiwr5kdy0NCotgc=;
	b=WwEFJeHK37qpzsEBNlLNkZ0lqCNEIXwvgQqbFlDIQmQCgs+09D1KlwTI8v889FRz4y
	mLP7zJtT2k9rXmavT5hlkVAl5/TUQFBYvcwuZ1B9ToOAcjUG66CK+XhwwaXRuIZfT99g
	Fkn7FDdKTtAzCnKuh/BE6rVDKOJSehAlBTrDqWU/zmPeQXNvnpRdYEu2D8WWFYYyS06V
	hooKAPkruWXbHhm2NrSWbBIn/MgJZB7YzvVlXSqPBz9KEcgosg9wM3bFztTh0TEHfq9J
	ZWIjuHqHL7tzL/BKSY+C0FJYd4Nl3OIZjQPxKhJmAPkrhrmJgyRD1E1hgEXrR9w7oat/
	XcZA==
MIME-Version: 1.0
X-Received: by 10.60.15.71 with SMTP id v7mr12303095oec.42.1372153592494; Tue,
	25 Jun 2013 02:46:32 -0700 (PDT)
Received: by 10.182.142.65 with HTTP; Tue, 25 Jun 2013 02:46:32 -0700 (PDT)
Date: Tue, 25 Jun 2013 11:46:32 +0200
Message-ID: <CAOHjBZuT=59w2VQRUtRfYyEvn7iO_hUuw_pova-jVRSGdgu1PA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: csl_versions issue on latest update
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
X-List-Received-Date: Tue, 25 Jun 2013 09:46:32 -0000
Content-Type: multipart/alternative; boundary=089e013cc14a75417204dff767a8

--089e013cc14a75417204dff767a8
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I'm working with the best so far master openembedded-core repository plus
the bitbake version 1.19.1
Using the external toolchain csl I'm in trouble because it seems the latest
modification in the csl-versions.inc
breaks the csl_get_version routine. I mean, it is not able to find the gcc
version due to wrong binary name:
it doesn't attach the TARGET_PREFIX so it finds for gcc only (failing).
The issue seems located to the csl_versions_handler routine, backporting
it solves the issue.

Please can you look at that routine and let me know if I'm wrong in
something?

Cheers,
Giuseppe

--089e013cc14a75417204dff767a8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>I&#39;m working with the best so far m=
aster openembedded-core repository plus the bitbake version=A01.19.1</div><=
div>Using the external toolchain csl I&#39;m in trouble because it seems th=
e latest modification in the csl-versions.inc</div>

<div>breaks the csl_get_version routine. I mean, it is not able to find the=
 gcc version due to wrong binary name:</div><div>it doesn&#39;t attach the =
TARGET_PREFIX so it finds for gcc only (failing).</div><div>The issue seems=
 located to the csl_versions_handler routine, backporting it=A0solves the i=
ssue.</div>

<div>=A0</div><div>Please can you look at that routine and let me know if I=
&#39;m wrong in something?</div><div>=A0</div><div>Cheers,</div><div>Giusep=
pe</div>

--089e013cc14a75417204dff767a8--
