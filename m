Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QbCcB-00050S-No
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 16:16:39 +0200
Received: by vws2 with SMTP id 2so3719226vws.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=i4DziWFOq8NZ9bqLl0inP652Trkp0S8F64lBUs3COgI=;
	b=ELGCdgYiYEzFocQm+UFtCTEUrTSchMoLXdGxoRD75lHmEosnGdlgVPGMh5LmfjL9wO
	R6CAwN+UsUWHEQ/bigwEDmJdorz0O1Pv934SSUHpmD2YYU5iVdIShuo9eilVSSzkchkp
	DWb3QW/3ZAviTnxSKpkumnSRuwR0++lOASfgM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=S25zoRmuIc8ZuyFb4blj05Cu3gE46RPtP1uu3D84Kv4rJFJ96PFAYSgpwHPOIZxmIn
	BC4ZsyFoQu+eqSFEIA7c4XDRGlGeS2I9g/aS2OLniEMJ3EKUsWZdOPBS+hV9XSWwaSxJ
	BKq+/cedxhIAzUE8D5QHb6f+MhJI9A6aSjoZw=
Received: by 10.52.111.71 with SMTP id ig7mr8822173vdb.209.1309183597145; Mon,
	27 Jun 2011 07:06:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.2 with HTTP; Mon, 27 Jun 2011 07:06:16 -0700 (PDT)
In-Reply-To: <A8286FFC-6451-4E36-8C99-37A595A7EF44@dominion.thruhere.net>
References: <A8286FFC-6451-4E36-8C99-37A595A7EF44@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 27 Jun 2011 07:06:16 -0700
X-Google-Sender-Auth: 3wNdRfcHXZEGroQAHPTc-W3TEQI
Message-ID: <BANLkTi=yBp2UuphfhDZNRQzp8HiwS3MMpg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bitbake master broken
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
X-List-Received-Date: Mon, 27 Jun 2011 14:16:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2011 at 5:11 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> After updating bitbake this morning I get:
>
> /OE/tentacle/sources/bitbake/lib/bb/msg.py:95: DeprecationWarning: object=
.__init__() takes no parameters
> =C2=A0super(set, self).__init__(args)
> Traceback (most recent call last):
> =C2=A0File "/OE/tentacle/sources/bitbake/bin/bitbake", line 34, in <modul=
e>
> =C2=A0 =C2=A0import bb
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/__init__.py", line 63, in=
 <module>
> =C2=A0 =C2=A0import bb.msg
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 133, in <mo=
dule>
> =C2=A0 =C2=A0def get_debug_level(msgdomain =3D domain.Default):
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 100, in __g=
etattr__
> =C2=A0 =C2=A0raise AttributeError
> AttributeError
> /OE/tentacle/sources/bitbake/lib/bb/event.py:101: RuntimeWarning: Parent =
module 'bb' not found while handling absolute import
> =C2=A0from bb.msg import BBLogFormatter
> /OE/tentacle/sources/bitbake/lib/bb/msg.py:95: DeprecationWarning: object=
.__init__() takes no parameters
> =C2=A0super(set, self).__init__(args)
> Error in atexit._run_exitfuncs:
> Traceback (most recent call last):
> =C2=A0File "/usr/lib/python2.6/atexit.py", line 24, in _run_exitfuncs
> =C2=A0 =C2=A0func(*targs, **kargs)
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/event.py", line 101, in p=
rint_ui_queue
> =C2=A0 =C2=A0from bb.msg import BBLogFormatter
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/__init__.py", line 63, in=
 <module>
> =C2=A0 =C2=A0import bb.msg
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 133, in <mo=
dule>
> =C2=A0 =C2=A0def get_debug_level(msgdomain =3D domain.Default):
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 100, in __g=
etattr__
> =C2=A0 =C2=A0raise AttributeError
> AttributeError
> Error in sys.exitfunc:
> Traceback (most recent call last):
> =C2=A0File "/usr/lib/python2.6/atexit.py", line 24, in _run_exitfuncs
> =C2=A0 =C2=A0func(*targs, **kargs)
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/event.py", line 101, in p=
rint_ui_queue
> =C2=A0 =C2=A0from bb.msg import BBLogFormatter
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/__init__.py", line 63, in=
 <module>
> =C2=A0 =C2=A0import bb.msg
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 133, in <mo=
dule>
> =C2=A0 =C2=A0def get_debug_level(msgdomain =3D domain.Default):
> =C2=A0File "/OE/tentacle/sources/bitbake/lib/bb/msg.py", line 100, in __g=
etattr__
> =C2=A0 =C2=A0raise AttributeError
> AttributeError

Damnit, sorry about that, I'll revert.  I didn't intend to push it to
master -- was intending to push it to github for now.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


