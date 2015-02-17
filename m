Return-Path: <priyaiitmandi@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4637F73556
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 10:33:17 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id z20so28766353igj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 02:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=nMtcsROGQIh1s4Z7aAZ3VYI8vfSxajl69qzjnRWWcxw=;
	b=r4cuZYto+pRgQyabVyCQiKLhmV//tjf9EebEbu5gewLWtRc3xMddn4hJURJkSD2jYw
	NBD5/YLa3w6/XA0arIMqvcVEfXKdbH6GAn8cnaL5tF1xOHv67ibQvdEbl9EIgY/3WAs/
	ILAFbWr2DEtbW6iyfxGNPNfcny9Gup6zSvXlRPwQDWqXTswnY+FOl5dGfIS2DHFMv2Hk
	/cA+j1ZVZMQb1k7pOElDF0hWsUrO4BudEBDPifzEzd8KYNkeayRL9V+EflAl43uUGCnq
	r4etygZBZO2CMg+BsiJpVrMQ8x5dJo2+qTkqw5pLhC2a3Db4hp4hq7dSNVqFxbsfxVMX
	pNow==
MIME-Version: 1.0
X-Received: by 10.107.130.196 with SMTP id m65mr35160196ioi.19.1424169198339; 
	Tue, 17 Feb 2015 02:33:18 -0800 (PST)
Received: by 10.107.134.207 with HTTP; Tue, 17 Feb 2015 02:33:18 -0800 (PST)
Date: Tue, 17 Feb 2015 16:03:18 +0530
Message-ID: <CALTPfpHrYrWhPje7ippkoTUwPgBAuzmhcTKWa0Knec-iSLtgBQ@mail.gmail.com>
From: Priya Agarwal <priyaiitmandi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Error while trying to enable selinux support in custom image
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
X-List-Received-Date: Tue, 17 Feb 2015 10:33:19 -0000
Content-Type: multipart/alternative; boundary=001a113ed1582acd35050f463b77

--001a113ed1582acd35050f463b77
Content-Type: text/plain; charset=UTF-8

Hi,

I want to add SELinux support in my custom imgae I am building for
Freescale's T4240QDS Machine.
I followed the steps given in FAQ section included in meta-selinux
directory.

However I am getting this error. How do I remove this.

ERROR: Layer 'selinux' depends on layer 'meta-python', but this layer is
not enabled in your configuration
ERROR: Layer 'selinux' depends on layer 'networking-layer', but this layer
is not enabled in your configuration

I need to do this urgently.
Thank You.

Regards

--001a113ed1582acd35050f463b77
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hi,<br><br></div>I want to a=
dd SELinux support in my custom imgae I am building for Freescale&#39;s T42=
40QDS Machine.<br></div>I followed the steps given in FAQ section included =
in meta-selinux directory.<br><br></div>However I am getting this error. Ho=
w do I remove this. <br><br>ERROR: Layer &#39;selinux&#39; depends on layer=
 &#39;meta-python&#39;, but this layer is not enabled in your configuration=
<br>ERROR: Layer &#39;selinux&#39; depends on layer &#39;networking-layer&#=
39;, but this layer is not enabled in your configuration<br><br></div>I nee=
d to do this urgently.<br></div>Thank You.<br><br></div>Regards<br></div>

--001a113ed1582acd35050f463b77--
