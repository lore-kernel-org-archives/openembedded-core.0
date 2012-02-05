Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuC6J-0004yl-H0
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 01:06:31 +0100
Received: by lahc1 with SMTP id c1so2638668lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 15:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=eRhKuyb2JQiFGg//hzYFMVgS1TXpMJMQvHxXtVcNjq8=;
	b=M6GtMe0x/QB9mpaF8mTUjPpf4LlpQ9QN61Axp61+jEDRLo4YNTwjfN5piFAmDPb1Q8
	/9Dd82TtwYre6Nus32pwX3kBobAXhC/01yzuKZfSDEx2En1jrKuDDEpnxrNPVeryZjPR
	vjGJDCCDoKO4R6eBK/oG977zyFHIollOpFIso=
Received: by 10.152.125.20 with SMTP id mm20mr3634320lab.6.1328486311221; Sun,
	05 Feb 2012 15:58:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sun, 5 Feb 2012 15:58:01 -0800 (PST)
In-Reply-To: <CALbNGRS0DRnMd2Ss2EnfvLPyU1WbaSMDdtypJsmvZBWMXtZjEw@mail.gmail.com>
References: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
	<CAMKF1spvxgnEb39qe1scw2k7Vqk--oSdVO18wcK3RFc5kqTqag@mail.gmail.com>
	<CALbNGRS0DRnMd2Ss2EnfvLPyU1WbaSMDdtypJsmvZBWMXtZjEw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Feb 2012 15:58:01 -0800
Message-ID: <CAMKF1srMR9pEuB1JTkq750SJ_-dx5fENnk69RpWduj9SBK9a-g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: do rootfs does not create log files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 00:06:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 5, 2012 at 3:47 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
>
>
> deploy/images/<machine-name> was a sub-folder for each image created
> containing helpful files (which packages were installed / licenses /
> file in image...

I am thinking you are talking about testlab you might have had
inherited this class
in your setup

on oe-core there is buildhistory which provides similar functionality


