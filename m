Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Rrrnm-0006rG-5G
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 15:01:48 +0100
Received: by wgbdt11 with SMTP id dt11so4069471wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 05:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=FbII49YFKTt2xUiWf3QEfEkFwCOZyWLFY90PpQFUIVk=;
	b=C3aaEDWNEYZLvStSCRAIcOYni3xl8E53UxzmJdz1YoB6E3Lb4QsH2m1eJHY8jdLnTj
	59O2mn95hHju0XKd2XCjVGlMP13izLGrIIJNgJlT3xWCdsdUY7aTgJmSWvs1qgUTrKk9
	jXyTaaY+z8WwVCuVG/8dwn9PQXJODoJ8kvNEM=
MIME-Version: 1.0
Received: by 10.180.102.169 with SMTP id fp9mr27547076wib.9.1327931633837;
	Mon, 30 Jan 2012 05:53:53 -0800 (PST)
Received: by 10.223.117.72 with HTTP; Mon, 30 Jan 2012 05:53:53 -0800 (PST)
In-Reply-To: <CAGiJk9efnMcaNSE9wreO3MtuEpm2H5vCv4+GGT9GqVL6+LcFMw@mail.gmail.com>
References: <CAGiJk9efnMcaNSE9wreO3MtuEpm2H5vCv4+GGT9GqVL6+LcFMw@mail.gmail.com>
Date: Mon, 30 Jan 2012 14:53:53 +0100
Message-ID: <CAGiJk9dZwSCVq-Z435nt8KTPvbWK7ti-7X-d1AW00O2yQ6Lb=A@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qt4 native broken include directories?
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
X-List-Received-Date: Mon, 30 Jan 2012 14:01:48 -0000
Content-Type: text/plain; charset=UTF-8

2012/1/30 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> Hi,
> qmake2.bbclass exports the Qt include directory to the qt4 directory:
> export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/qt4"
>
>
> But it seems like the do_install of Qt native went wrong and it was
> installed in the following directories:
> file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/Qt
> file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/Qt3Support
> file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtCore
> file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtDBus
> file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtGui
> file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtNetwork
> file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtSql
> file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtTest
> file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtXml
> file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtXmlPatterns
>
> Is this intended?
> It might be related to Otavios patch [1], but I can't connect it as I
> don't see Qt4-native including qt4-x11-free.inc.
>
>
> For me the result is: all native recipes that depend on Qt fail with
> missing include errors.
> As I am currently porting Plasma-Active two and the KDElibs + CMake
> (IMHO) is a BBOM,
> I currently see no way how to get around this by configuring CMake or
> setting any options.
>
> Help would be very appreciated.
>
>
> [1] http://cgit.openembedded.org/openembedded-core/commit/?id=73fc8f706b08ec74087754eacd2257856fe829d1
> --
> Regards
> Samuel

Ok, I cancel this thread because this is broken by design.
As the problems I am facing are based on a larger scale, I will post a
separate message about this later.

-- 
Regards
Samuel


