Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5F25178475
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 17:24:48 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id k77so3870391oib.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 10:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Gd4NYStUaN0g27jd98hSfDfnxUIqNaHocHFUALIyiZU=;
	b=aiAwDxZ7yJQwxfJJQByM/jUsZYyAoQO8TgabIICgsWZ7cbqsedRlGLAzmx7LX5N3h9
	a8Cysn3Ur4VW4DcIPkZd/vqQ3m2JX/W4kotqm6LQOCn34+VlHv5jKDq1+SbbkG4jgCFr
	1NMJw94dobfYrBaG4Hyf2UO2vN5ycmLgkNWLqZ43ZfztlrduSQ9WvAmLk2GmEJYAhTuV
	haQ65g5a+dcdegJtXtdFygogBufUcUUzybkH9Agraz3WnsXPf0361dY0MGVbOUn8BgpP
	CGqptnpdITBeCFJp/KdOikwxSEUrnpsU3ku3I9JnrTlISG3dkpTVS6zIE90SpSOaGa/s
	SjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Gd4NYStUaN0g27jd98hSfDfnxUIqNaHocHFUALIyiZU=;
	b=scbbZVJS0rEU2ZmPmxudJm1LFZBOP5cag8sF699aieNhEPXi/VV/LBCm2bRvo+KqsD
	ClRTXIubxPvhuAgqPqO1jDVj2bo3jYTGobzXDfx+sAgnIIk1tmDiKdPyx924dwhCHo4V
	P6lkEMCZVTN/detnhDxWyHl7x7GesM1adTtTizZagMQKb8Vw+ngSkKLvwZdCamGEFhvD
	HpmiZ7pDTUswZhtzUUaFH2tQZt+kPMuGu815pYzM41IeLr4/7strDDni+cmll93L6ZON
	QDZb7gnIdjlpnC5oOwlV3ATTIx6/c1euk4HNO4pFXfeuDoNhcYhoa7GwaXQBDO/D79US
	VLPg==
X-Gm-Message-State: AHYfb5iaWqUT11wcwFXyT2oIAlGI3NQNi9HAa5f7Qx52nxffCwWThADt
	9Oo/M2PsU0AdivLiknY=
X-Received: by 10.202.73.130 with SMTP id w124mr13030877oia.249.1503681889929; 
	Fri, 25 Aug 2017 10:24:49 -0700 (PDT)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54])
	by smtp.gmail.com with ESMTPSA id j9sm9171060oiy.31.2017.08.25.10.24.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Aug 2017 10:24:48 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id j144so4065283oib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 10:24:47 -0700 (PDT)
X-Received: by 10.202.92.130 with SMTP id q124mr12936349oib.294.1503681887364; 
	Fri, 25 Aug 2017 10:24:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.1.183 with HTTP; Fri, 25 Aug 2017 10:24:46 -0700 (PDT)
In-Reply-To: <cover.1503667857.git.ed.bartosh@linux.intel.com>
References: <cover.1503667857.git.ed.bartosh@linux.intel.com>
Date: Fri, 25 Aug 2017 14:24:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqZc3seGRmqMBtPav2PidTAnLUsTje-FVFamwSZbDJrEQ@mail.gmail.com>
Message-ID: <CAP9ODKqZc3seGRmqMBtPav2PidTAnLUsTje-FVFamwSZbDJrEQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] #11278 - wic: create an option to use entire disk
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
X-List-Received-Date: Fri, 25 Aug 2017 17:24:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Ed,

On Fri, Aug 25, 2017 at 10:41 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
...
>   wic: add help and usage content for 'wic write'
>   wic: add 'wic write' command
>   wic: implement 'wic write' command

Those should be squashed as they are in fact one logical unit.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

