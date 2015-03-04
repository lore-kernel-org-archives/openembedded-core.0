Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9015C7375A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 02:53:12 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so53453127pdj.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 18:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pYL/yDQZxbocsISdnyxsB1+chirZ3d9tlpfFMP+5Uyc=;
	b=gakWpajgYFMBwX7c3OPvEJBdFe1MoRbzbjkG/TK6Y8DgH5XWKDGfAdsDJF8X5Infvh
	T1Ir+4/8T9hJhjFwbeUw7pOLHk6TA8QWZsjoSWNP8f+Z/aAx8GwnlJzZDdpjgtGLavx0
	1ICGNohglfNZruy40qZd0l6ZooaaFpUTe/QXkLheic5JD1G1ITwXN6vV1A5o35C7hU9V
	1cwQVlhcSQLVyGucaQlrKwMRdXp6T0wlxGFKdORy5RnYAQ8Yr/XYh0v8vuRbBOLDfuKV
	3gwIDyLpr5ILzByT4MucqOiTFKTKrCsL9ln7xo01OqipZuoZrGwxeqytwbkz04pqlA2M
	1sHQ==
MIME-Version: 1.0
X-Received: by 10.66.139.135 with SMTP id qy7mr3007905pab.144.1425437594212;
	Tue, 03 Mar 2015 18:53:14 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Tue, 3 Mar 2015 18:53:14 -0800 (PST)
Date: Wed, 4 Mar 2015 03:53:14 +0100
Message-ID: <CALbNGRTPXDcDzttwb95jDkkrJLF_QMODdw_je9+EmWZdtYAbiA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: root login broken
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
X-List-Received-Date: Wed, 04 Mar 2015 02:53:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

have built with oe-core

commit 530565c6cb77319f4cc49edeea6fec6be997415d
Author: Dan McGregor <dan.mcgregor@usask.ca>
Date:   Fri Feb 6 11:20:19 2015 -0600

    glibc: Update to glibc 2.21 release tag

    Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>


and can not login serial console or by su in GUI as root. I am asked
for password although that is empty.

Have checked securetty but found nothing suspicious. Anybody else with
similar experience?

Andreas

