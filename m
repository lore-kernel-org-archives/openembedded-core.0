Return-Path: <jatedev@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id EF72C65D6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 19:29:13 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id j107so3895441qga.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Zr6ZNsOlpURMfp5YOMaxMDv5du9jD4OvRg/P/IaSENQ=;
	b=apDCd0CKgk63iM/Rq5exYiV5ySPqk+vc6ZS/HMD0dBDrjX7vdfUaPJCfO3E5SKH8Is
	7kb6L6BrOn0OIS1/K94dFn7kPL60EPcrDAadRj7cLdI6Wj4d/FqUTjsbfB4eHY0i7QWS
	nZ44RZlu0421uTe5i4beUIdNSW35bZoVWILYAUJ7RNjmcyF/r3GpUMl0cT3Z6A9LMRoH
	NpdeLs/wMvktWlV6IZm+roeZR2WHuPGndz3EIQj05CsARZQVMbfQdB6jSK1OM5usfZia
	9AEWurCBmE6yb5QfOCjh+FJG0aB9TELvt0fcbkan8cFGwlK/7andyco0qJJxX1kNHuKY
	QdCg==
MIME-Version: 1.0
X-Received: by 10.224.111.196 with SMTP id t4mr8280902qap.63.1403292554423;
	Fri, 20 Jun 2014 12:29:14 -0700 (PDT)
Received: by 10.140.91.84 with HTTP; Fri, 20 Jun 2014 12:29:14 -0700 (PDT)
Date: Fri, 20 Jun 2014 15:29:14 -0400
Message-ID: <CAPphmgZKCc=XCDgC8fHGaLqYLFOwrpocfRzz7BDZUhRkr5NkYQ@mail.gmail.com>
From: Jate S <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: resolvconf bugs
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
X-List-Received-Date: Fri, 20 Jun 2014 19:29:17 -0000
Content-Type: text/plain; charset=UTF-8

I have been using the resolvconf recipe, and I have discovered a few
things which keep it from working.

The resolvconf script uses /lib/resolvconf/list-records, but the
recipe does not install it. This causes an error when
/etc/resolvconf/update.d/libc runs. This can be resolved by adding the
list-records script.

I am using system V init. The initscripts recipe generates the
symbolic link to /etc/resolv.conf, but resolvconf checks this and
generates a warning. I have fixed this by adding the correct symbolic
link to this package. This overrides the link created by initscripts
Is this compatible with resolv.conf generated in a systemd based
system?


- Jate S.

