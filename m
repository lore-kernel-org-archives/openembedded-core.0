Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UDEmR-0000AC-IF
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 14:53:23 +0100
Received: by mail-vc0-f177.google.com with SMTP id m18so4784462vcm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2013 05:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=WwXjLsTjIE1wqr0hfoUl+OsIOPgY1zjzzd9AXL1u6go=;
	b=EIdVTxprQLIG5IxwYfnGKf4Fr5rjFIK90UGh8i7XTaMqPqZA3RV70EIR6mEV2x0pF+
	NomN9kiphAwH1DBUElupkBIfQU+M4TipGU65DXVPKS8nIKJgX9oASGEfDWsTHsKRTdRd
	GevnBpOKP8ZnzfAZ0H1IiCtm5pR89mqNN7HOzh6l3ZgUDW60qdSjwIr8/vHs9A8sawKW
	gOTLCIZpMGVCsgLiSd3srQ69yZE/6kVUiOoFX4WbZuY5mOQlnyN9X6jdwdG9Id5A/5E3
	7daPYyR9ZdBtmQkqMpNhYgCt9qb7RCuPVPO3xsQ8Xy0uSAbe0bmLTtHLz05GVbqwnWjg
	gk3A==
MIME-Version: 1.0
X-Received: by 10.59.11.199 with SMTP id ek7mr1120341ved.19.1362577004460;
	Wed, 06 Mar 2013 05:36:44 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Wed, 6 Mar 2013 05:36:44 -0800 (PST)
Date: Wed, 6 Mar 2013 14:36:44 +0100
Message-ID: <CALbNGRSZZ6EvJxonUo0nEoCs9s3W3gpV7iw2aQ_FY8e3t8ThAA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: gnu-configize / perl issue
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
X-List-Received-Date: Wed, 06 Mar 2013 13:53:27 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I saw the following in log.do_configure. I did not cause a build error
so I think there are several recipes affected:

autoreconf: running: gnu-configize
Can't load '/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/auto/Data/Dumper/Dumper.so'
for module Data::Dumper:
/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/auto/Data/Dumper/Dumper.so:
undefined symbol: PL_charclass at
/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/XSLoader.pm
line 71.
 at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/Data/Dumper.pm
line 36
Compilation failed in require at
/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/autoconf/Autom4te/C4che.pm
line 33.
BEGIN failed--compilation aborted at
/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/autoconf/Autom4te/C4che.pm
line 33.
Compilation failed in require at
/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autom4te
line 37.
BEGIN failed--compilation aborted at
/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autom4te
line 37.
autoreconf: Leaving directory `.'

Maybe it is related to perl update to 5.1.14 but I could not check.
Ideas how to solve?

Andreas


