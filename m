Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id BCC10790F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:52:59 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id 13-v6so1063546ois.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 02:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cVNIIKOh66I/XZGiuO0sP17QZCJ3kMALWeIANMuPV38=;
	b=MdricYsTBWf6UkMZMyckjcUfWT4kGaBAJX9HaflCvG260KNjZkjA5nhTFd3uk9IYjn
	P9YHk1VbQN37MXSenVi3oMm+YqirQeU6azPrJsJZ1GCQX5k+aXyWdpjScKPZCdwaphMW
	/3rX/unjm+CT2GBLMGQewOSWLmENIzLbwKp3/MwLLnuWjAy/Gtkrx5AHQHUuCpWdm6RX
	bKGsGyJdE5Hr+tTcYFEUch2B1ygrPECGtPVvaR6xE4wDJMDhTtHErLI7QRxdRiL0Gf6I
	Oba0yJJs21NPrshyeuEapmTkBwaxM+9JS6idIVdQ3MvSUFrDlCSJh85l98tM7C7JVCev
	Cevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cVNIIKOh66I/XZGiuO0sP17QZCJ3kMALWeIANMuPV38=;
	b=tU7BpGXwU7Tze2B8ojrrxXqWHMARWoLk/7bQBV0ctBW/7uKQdcGGDBWxiaabvVonnE
	3pB4L0aJKOIMnYmHgu28TgLR88mX2EzEyIA99n3ouMZHvIBb1+qu3X++K0pc5URVjyB5
	TDwlsJKnyaivIucIXYCUqeHUeWaO/JQ/eTcK/8ukF26Gng+vLZifSh06mE0cPj5QByQv
	VfXLmjtTo8cyoomKLzOkUr1VdLpLWicCU2BytzSeANxTbsR2zb95BvwZJdGKveuRjnHH
	IMzQnP5hXDFf1Y4iN48u8t1r2s8ZOqL1jLCcazGzmPMkGHBmX3jxr87nx6uYxB14eZrm
	l3EA==
X-Gm-Message-State: AOUpUlFzcMvB1U+fJO5oAZzdS4cat4DKrsDBZCK9OhtqUs040qcDc+AX
	8dV34pC5g+jb1Qg/KutPTXvPHXe+kjxWeV79iow=
X-Google-Smtp-Source: AA+uWPwW+32k6cmr1++SY9Qn4NBw3r4uP3HQ0VZ1cdv6lI6blaZBrFIaywdpsrs+qv1Iu8L56ahMCo69N5SKSC85Kdg=
X-Received: by 2002:aca:e80c:: with SMTP id
	f12-v6mr28102889oih.38.1534326780785; 
	Wed, 15 Aug 2018 02:53:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 02:53:00
	-0700 (PDT)
In-Reply-To: <1534326204-395700-1-git-send-email-changqing.li@windriver.com>
References: <1534326204-395700-1-git-send-email-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Aug 2018 11:53:00 +0200
Message-ID: <CANNYZj9TY_Z6ocQZzqMgf6iNk2rZd_ppUhOB5pKirxok_PnLxQ@mail.gmail.com>
To: cli10 <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] unzip: fix CVE-2018-1000035
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
X-List-Received-Date: Wed, 15 Aug 2018 09:53:00 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-15 11:43 GMT+02:00  <changqing.li@windriver.com>:
> From: Changqing Li <changqing.li@windriver.com>
> +Upstream-Status: Backport
> +
> +backport from unzip6.10c23

The new versions of zip/unzip are now published here
http://antinode.info/ftp/info-zip/

I wonder if we should still consider them 'betas' or as it has been a
decade since the last release, we should just treat them as new
releases.

Alex

