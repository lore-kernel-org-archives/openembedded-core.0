Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (unknown [209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 87E3065F99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 12:24:57 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 20so764706yks.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 05:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=BKxi0K0YoweJ+pBOhlmNcUxLf2pAYyYfXqeFaKmcXDk=;
	b=KndF9PL1SGPFTpbc+FEwIDUBrdncPBBPjEZ4Vu1noFsLHE1FAHRi3OlcW6vEFWrEFv
	KE//zNyTbydYF96umBGx4ID+Zw+TKDjX1Ob509h2D8vi4+slLtsg5Du0uZ0DrWkMF6lF
	hM0ZQa/ZMDYb2jvOSqMiaQdZ4Fd221ZUSRHqsUECpw1cGQwgpaCsqqbaXzmEg4b6QUfN
	f4ZPiX/viLRH+V00ef2WlFnvUT9+1TF8enQIB3n7nfQCbDDHZeDQztkk55ltKvRMJv/o
	mWYcsPu/ev4klusB2HWypL8yQ8PWa7nwGwb4nQCBD0eRae6iZN2eys02UvMqEx+BrVuf
	G6UQ==
MIME-Version: 1.0
X-Received: by 10.236.129.43 with SMTP id g31mr3374650yhi.155.1400156698171;
	Thu, 15 May 2014 05:24:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Thu, 15 May 2014 05:24:58 -0700 (PDT)
In-Reply-To: <CAMKF1srwzW+pU4K2wgSG6GPmRGmGdGqCbaJi34ZjF0Npi4TOcQ@mail.gmail.com>
References: <1400099434-22527-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1srwzW+pU4K2wgSG6GPmRGmGdGqCbaJi34ZjF0Npi4TOcQ@mail.gmail.com>
Date: Thu, 15 May 2014 09:24:58 -0300
X-Google-Sender-Auth: oMto__aSiyI-QZajwI-MTShQGnw
Message-ID: <CAP9ODKrwxJ85rn5sPqaW7cvu3cu0+NFcgHOL_My3oUWR1dok5A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/4] tcf-agent: add systemd support
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
X-List-Received-Date: Thu, 15 May 2014 12:24:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 14, 2014 at 7:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 14, 2014 at 1:30 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> +       install -d ${D}${systemd_unitdir}/system
>> +       install -m 0644 ${WORKDIR}/tcf-agent.service ${D}${systemd_unitdir}/system
>> +       sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tcf-agent.service
>
> shouldn't this happened if systemd is enabled in distro

Agreed. Added Chen Qi in Cc.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

