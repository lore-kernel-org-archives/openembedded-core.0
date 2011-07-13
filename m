Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgxLy-0001yF-5d
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:11:42 +0200
Received: by wyg30 with SMTP id 30so52412wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 04:07:44 -0700 (PDT)
Received: by 10.227.162.133 with SMTP id v5mr893088wbx.14.1310555263426;
	Wed, 13 Jul 2011 04:07:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 20sm1291055wbw.2.2011.07.13.04.07.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 04:07:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 13 Jul 2011 13:07:37 +0200
Message-Id: <A84789EE-49E1-4E8D-BB65-73C2FF2B1CB5@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: target python problems
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
X-List-Received-Date: Wed, 13 Jul 2011 11:11:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

After a recent update to python (the past week by the looks of it) =
python modules only install the .so files and not the .py and .pyo files =
anymore. This leads to breakge like this:

root@usrp-e1xx:~# opkg install python-dbus --force-reinstall
Removing package python-dbus from root...
Installing python-dbus (0.83.2-r0) to root...
Downloading =
http://feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a/python=
/python-dbus_0.83.2-r0_armv7a.ipk.
Configuring python-dbus.

root@usrp-e1xx:~# systemd-analyze blame
Could not find platform independent libraries <prefix>
Could not find platform dependent libraries <exec_prefix>
Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
'import site' failed; use -v for traceback
Traceback (most recent call last):
  File "/usr/bin/systemd-analyze", line 3, in <module>
    import dbus, sys
ImportError: No module named dbus

Prior to the 'opkg upgrade' yesterday systemd-analyze blame was working =
properly

regards,

Koen=


