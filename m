Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id CBDFA60FCA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 00:38:36 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id z8so2755641ioh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 16:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=6VByQVCjO0V7eKDeoOIeABNS36ayIVTFjhSJ5ZAMHCs=;
	b=vAC5kuczPUSvYBEKVvkPs7kxfqCTz0QEDSBev89l2r5BbWyFiclJhTp5BKhUyoD6+D
	Zc+U2i8NdzQyGcDYixgup3aa0sCOLV7Rwmg0441RgmnUxkh5j9wiE6EosZY5Role0Cat
	7th1sHXtfDnmNfDXih8r6xEibl86aPhTQve91vSpDY21wyTSlt0MGTB7ovqDNofFXWe9
	Ic6iNCI6DWZ3UkiI0X9xdHGWVZFL0XYw5ON+Gwy/dD+IKSANmR+gz9pjDNRKKSXkyiw8
	uZdw0/lRO02aoAC6nnM0AbFw7rzE9Gp0rofl1VZ4ubS/Bzh9mPPiVSWhx00WowBubDWI
	gLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=6VByQVCjO0V7eKDeoOIeABNS36ayIVTFjhSJ5ZAMHCs=;
	b=gZ20CULn5vAiTDvarJABXmcwTwAThAvOOCYn4oA0vMgRhfnwaf/P8qChACVjpT7NW5
	xh001U+S20K8p7F7Wo7ELsGhFEYgqX3Z/rLd7fF8jWzrkVk8yhn1IuEMJxbl09+Xtog3
	SpBGtb12+tW+hnrDQSbrOkt69mkUtFpc/JTRyQkQH2Kjy9cp2FNPLvDLktk+roHPw0VU
	nt4L7YBvuA5x6PfkAdDc6llODNaJvmkg2v1eeA+Yq1r3Xlmy1X/NcXkOYibta/ejv1+t
	bDu7F5l9UnbuEikk3sYfXzvLPaJnkPaz0IJVPACtPbY4c9n/dVzCSYv/Q5g0GQwSpQee
	pkRA==
X-Gm-Message-State: APjAAAXEric0ZiTFHQrO9BnfCZ/WK/nW7s88SxL15DOeJB4DSb6u9gKo
	jW88BlGXvnkU1tKPOaCCY1GhAqdLdfyo/MYl0g/4ZA==
X-Google-Smtp-Source: APXvYqy1WYou8oN6fXfmwaX15Id4RToOqfZscPleDYTkWdD+RjGPvNcvqvrTV8Gx4W3/0SmzgyxiI0urzSPY7g5w5qM=
X-Received: by 2002:a6b:d912:: with SMTP id r18mr21016548ioc.306.1582159117617;
	Wed, 19 Feb 2020 16:38:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Wed, 19 Feb 2020 16:38:37
	-0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Thu, 20 Feb 2020 11:38:37 +1100
Message-ID: <CAA=hcWS60Jr0aQ+qVqMoxyU90VPvC_cUyWKjsujqkWxPXLL8NQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>
Subject: You advice to append environment set up to local root shell profile
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
X-List-Received-Date: Thu, 20 Feb 2020 00:38:37 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I want to setup export LD_LIBRARY_PATH and export PATH to the
/home/root shell profile, the oe-core base-files has a profile file,
is it a right way to copy that file to my application layer, to extend
it and to add new path to export LD_LIBRARY_PATH and export PATH? I'll
handle it by a base-files_%.bbappend in my application layer.

Thank you.

Kind regards,

- jh

