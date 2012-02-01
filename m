Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rsepu-0008Hk-TN
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 19:23:14 +0100
Received: by lbol12 with SMTP id l12so221900lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 10:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=WZEP+O76KgbkdskgnphiHAti8e4PvnIaQHtS855slII=;
	b=R1rfeQdFzYt40AfBO8/jXETgkcH/nyRxTsEmxglV81LYulDoCVygbJnVI+0Xsn0puj
	SOi5Zn5u9oi+J8rL/z/Q+pvBU7ui3m1fdznVmUWUlvCPsPAVpLEAIHDkvjQeDnq9Ie4o
	ondMCDx8yk0JQMukV3pilZwjkMChD4OfiW3xY=
MIME-Version: 1.0
Received: by 10.112.27.165 with SMTP id u5mr5327117lbg.48.1328120119248; Wed,
	01 Feb 2012 10:15:19 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Wed, 1 Feb 2012 10:15:19 -0800 (PST)
Date: Wed, 1 Feb 2012 19:15:19 +0100
Message-ID: <CALbNGRSKUfru5Z-jAJmywTieJUALfLAZgxW_NEhLBK8W5pw1VA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: accessing variables
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
X-List-Received-Date: Wed, 01 Feb 2012 18:23:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

another stupid question from my side:

do

bb.data.getVar('foo', d, 1)

and

d.getVar('foo', 1)

access the same data?

Thanks in advance

Andreas


