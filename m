Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 88A366007A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 22:47:58 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id h23so1047966iob.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 14:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PO3FTFbXvZp0nxliFrIJF0o9iJY/6gN1FzKPzWkCG04=;
	b=hBMehMfpPJuQ+GyrF2Evxs65JPB5UuhPZwJiBh8rTvM29/89hVTMeJc5fa+okFKXrs
	NKg6xqypzlMRNQ8SQQzUIkT/zsHVZq+DydrTALdt+uz4BkoyEvcrPurC1haku3mMRH0l
	wx/1MDw42caSoPJ3Hz6XTMJ2g4iRO0muKkLLy6t11uHD1xxCGMhldxRww2iuwq5MqoKp
	PuMhDldDTZRY5RLrzHfRFnqUx6my04BfuQSRbi6TL6qKc0Cx5PPzrvlO6V4H+TpxPinQ
	+MSPu2hnZ/Ack0FFSC0qyjFTuLXzVnl0PX390A4d1xTc+sR3Gl46ZXP4vKdRndX1h9xJ
	+uVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PO3FTFbXvZp0nxliFrIJF0o9iJY/6gN1FzKPzWkCG04=;
	b=gh9nLQZGuIjheCLZjVEeCs81xRezK7odiuIurcbn9Ni5EI6hYrmAbFQkXQ2GOGCG+P
	Bh51FGmg8T0mZ43y6y/7kmjTmIo3cWHe9/sqZ0hmUvJFk71nOiejQ9Lq7BEXBvb2Bkio
	xbh5VFwl2Rd9SH+b1P1jICjRguhDY09nh3FTRiZ35SI6aAruvCJYT5rgO3L64K6ualuE
	Gs1wWKfPwQruVsfGzEVMS+QmhyiTpDG3J+OAn9m4Wv3j/CwJLJ/18hhYdNIyV6wI6V1h
	3LaX242r7HsTfJSW4ekuk1bpR2IB/Cv38z+QCmsi79kuVrYmpuyJbwQKF6X0y/7SDb4G
	GmVA==
X-Gm-Message-State: APf1xPDKTs2kmUkSjFoxALJaJRm5Q5v33hcXUxcHir9BdLunF0Gqq0Yj
	YEt0vPoUDcSJ9fjdK0Lirh76XfFI
X-Google-Smtp-Source: AG47ELsQG/yCYE1rmTJ3RBDFfdrQ3GsLChTP7hnownUvYduw9qshDwaNfJtHsfUYkAlv8Cj0BQ9I3Q==
X-Received: by 10.107.82.1 with SMTP id g1mr18778311iob.203.1519771680065;
	Tue, 27 Feb 2018 14:48:00 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	r137sm373612ita.23.2018.02.27.14.47.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 14:47:59 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 16:47:50 -0600
Message-Id: <20180227224753.30881-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [RFC 0/3] Add wildcards to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Tue, 27 Feb 2018 22:47:59 -0000

Wildcard support in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS allows the native
tools that were in a hardcoded list to be specified in layer.conf with
the other exclusions.

Joshua Watt (3):
  sstatesig: Add recipe wildcard
  ref-manual: Update documentation for SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
  sstatesig: Move hardcoded native tools

 documentation/ref-manual/ref-variables.xml | 18 ++++++++++++++++++
 meta/conf/layer.conf                       |  5 +++++
 meta/lib/oe/sstatesig.py                   |  9 ++++-----
 3 files changed, 27 insertions(+), 5 deletions(-)

-- 
2.14.3


