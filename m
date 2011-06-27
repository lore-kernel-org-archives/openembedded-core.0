Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbAiK-0002Q2-AV
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 14:14:52 +0200
Received: by wyg30 with SMTP id 30so1209096wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 05:11:12 -0700 (PDT)
Received: by 10.216.135.133 with SMTP id u5mr4190006wei.61.1309176671568;
	Mon, 27 Jun 2011 05:11:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n21sm2731954wed.19.2011.06.27.05.11.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 05:11:10 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 27 Jun 2011 14:11:09 +0200
Message-Id: <A8286FFC-6451-4E36-8C99-37A595A7EF44@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Cc: Chris Larson <clarson@kergoth.com>
Subject: Bitbake master broken
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
X-List-Received-Date: Mon, 27 Jun 2011 12:14:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

After updating bitbake this morning I get:

/OE/tentacle/sources/bitbake/lib/bb/msg.py:95: DeprecationWarning: =
object.__init__() takes no parameters
  super(set, self).__init__(args)
Traceback (most recent call last):
  File "/OE/tentacle/sources/bitbake/bin/bitbake", line 34, in <module>
    import bb
  File "/OE/tentacle/sources/bitbake/lib/bb/__init__.py", line 63, in =
<module>
    import bb.msg
  File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 133, in =
<module>
    def get_debug_level(msgdomain =3D domain.Default):
  File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 100, in =
__getattr__
    raise AttributeError
AttributeError
/OE/tentacle/sources/bitbake/lib/bb/event.py:101: RuntimeWarning: Parent =
module 'bb' not found while handling absolute import
  from bb.msg import BBLogFormatter
/OE/tentacle/sources/bitbake/lib/bb/msg.py:95: DeprecationWarning: =
object.__init__() takes no parameters
  super(set, self).__init__(args)
Error in atexit._run_exitfuncs:
Traceback (most recent call last):
  File "/usr/lib/python2.6/atexit.py", line 24, in _run_exitfuncs
    func(*targs, **kargs)  =20
  File "/OE/tentacle/sources/bitbake/lib/bb/event.py", line 101, in =
print_ui_queue
    from bb.msg import BBLogFormatter
  File "/OE/tentacle/sources/bitbake/lib/bb/__init__.py", line 63, in =
<module>
    import bb.msg
  File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 133, in =
<module>
    def get_debug_level(msgdomain =3D domain.Default):
  File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 100, in =
__getattr__
    raise AttributeError
AttributeError
Error in sys.exitfunc:
Traceback (most recent call last):
  File "/usr/lib/python2.6/atexit.py", line 24, in _run_exitfuncs
    func(*targs, **kargs)  =20
  File "/OE/tentacle/sources/bitbake/lib/bb/event.py", line 101, in =
print_ui_queue
    from bb.msg import BBLogFormatter
  File "/OE/tentacle/sources/bitbake/lib/bb/__init__.py", line 63, in =
<module>
    import bb.msg
  File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 133, in =
<module>
    def get_debug_level(msgdomain =3D domain.Default):
  File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 100, in =
__getattr__
    raise AttributeError
AttributeError

Rolling back 2 revisions to the umask one fixes things.

regards,

Koen=


