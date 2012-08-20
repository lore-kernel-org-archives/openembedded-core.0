Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1T3P4U-0003wC-4e
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:18:58 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Mon, 20 Aug 2012
	12:06:55 +0200
X-TM-IMSS-Message-ID: <2c7e73d0000e4bb4@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 2c7e73d0000e4bb4 ;
	Mon, 20 Aug 2012 12:07:00 +0200
Message-ID: <50320C3E.8030009@nedap.com>
Date: Mon, 20 Aug 2012 12:06:54 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: can't login??
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 10:18:58 -0000
Content-Type: multipart/alternative;
	boundary="------------020105010808060900030800"

--------------020105010808060900030800
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Totaly stupid...
Can't login as root.
Have build an image with this:

    require recipes-core/images/core-image-minimal.bb

    # Use busybox as login manager
    IMAGE_LOGIN_MANAGER = "busybox"

    # Include minimum init and init scripts
    IMAGE_DEV_MANAGER = "udev"
    IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
    IMAGE_INITSCRIPTS = ""


Any hint is appreciated...

--------------020105010808060900030800
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Totaly stupid...<br>
    Can't login as root.<br>
    Have build an image with this:<br>
    <br>
    <blockquote>require recipes-core/images/core-image-minimal.bb<br>
      <br>
      # Use busybox as login manager<br>
      IMAGE_LOGIN_MANAGER = "busybox"<br>
      <br>
      # Include minimum init and init scripts<br>
      IMAGE_DEV_MANAGER = "udev"<br>
      IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"<br>
      IMAGE_INITSCRIPTS = ""<br>
    </blockquote>
    <br>
    Any hint is appreciated...<br>
  </body>
</html>

--------------020105010808060900030800--
