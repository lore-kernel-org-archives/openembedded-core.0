Return-Path: <twoerner@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB7A7FAA8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:23:47 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t8so4374238qtc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=ck/L7bJOXHrcDIImB+JSy2TajreIb6/DN/7x6kM/lYY=;
	b=txBuI/qY0AX0wSpJU26f3Br8x5l2Y4mE7sHlMjKWLYqzje+8CkIiMxIbaG5N9sDAjP
	YPshADhK27nhpcdUlbUD0eJZbXzedQzti4J7EVXTq8dbAcofa9werrjzSBsnVCRzbSBq
	nLqnGhosDidvinZmVTEAOGkwNpNEdqcUtjzBYNmjsC4gOkO3W2rGLAZBKF2dsjpi1PgU
	W9zlSC4f8vn6NnQbzGbX4IH1FEFiBBTxELaxXIVNsWQU47AnaRSyqDW5cAESooXvoB3V
	lxsqJXkJYXovbiO0XCEB+cjjbvrepEgaTKrg40M4+4KSM/lXRyc/iJ/GrLh5MwVen9XK
	wizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=ck/L7bJOXHrcDIImB+JSy2TajreIb6/DN/7x6kM/lYY=;
	b=cYw2wSz+vXSFjDK3ZqGF4vyg7IiP/ILZJbJSCCCP5OGX1RMByAL6KtpMpLicGSh8+j
	mz13a32/XbZll+ODw/xbAYgtmiCBM4I9zY6zy4tK1mx/zPIexj4HcJwpEgfk4B0EmBL+
	7mwtail6pG0v1ZABW8vsiSIL8EAwyHgMuoYNGdCBY7PeIXZrV94TnngeLyVL+gSUZ8Dz
	KDPZDtsrMDsQSzhofElGI2PsXSWqCMVTqjUC8TDoL3tOhT7LIf/OVFmggsRbcacFkFH6
	ZJARuchuHyxawfRUV+smRhmmJGStUmKKD+4ZaT569wMOgy3xB76mgRsyVtex/O5z6Cf4
	PrJw==
X-Gm-Message-State: APjAAAUcHGYd/91537eVhEC5UPGN2Uy1W4BRHnzkrRRW/Jrafrtu40lK
	58nJSVZrIC5sy+IEj+8efZ8=
X-Google-Smtp-Source: APXvYqzD53iWTPC2p0zCL/Y7SPTtImGrrJm0Rmiv23pCU950HuEhcJQH4iDnIhJLr0tlLHJiuKpGOQ==
X-Received: by 2002:ac8:43d9:: with SMTP id w25mr4299481qtn.65.1572024228510; 
	Fri, 25 Oct 2019 10:23:48 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id j5sm1384638qkd.56.2019.10.25.10.23.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 10:23:47 -0700 (PDT)
Date: Fri, 25 Oct 2019 13:23:45 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191025172345.GB25729@linux-uys3>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
	<20191025132204.GB19333@linux-uys3>
	<20191025134458.GA22739@linux-uys3>
	<CAMKF1soqoREE7p+XoaEzNpfVQPi=7e+w4ujvbRJ2gMaVB7_rqQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soqoREE7p+XoaEzNpfVQPi=7e+w4ujvbRJ2gMaVB7_rqQ@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 17:23:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri 2019-10-25 @ 06:01:54 PM, Khem Raj wrote:
> On Fri, Oct 25, 2019 at 2:45 PM Trevor Woerner <twoerner@gmail.com> wrote:
> > Yes, adding the following line fixes it:
> >
> >         LDFLAGS_append_class-native = " -lpthread"
> >
> > (unless there's a distro-override way of doing it...?)
> >
>  There is no need to make it disto specific it should work always and I
> think it’s better to use -pthread so gcc driver can decide where to add the
> pthread library in link order

Excellent, thanks for your input! :-)

