Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQFgE-0000X3-DB
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 11:19:34 +0200
Received: by wye20 with SMTP id 20so1975472wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 02:16:28 -0700 (PDT)
Received: by 10.227.10.210 with SMTP id q18mr2952227wbq.44.1306574187835;
	Sat, 28 May 2011 02:16:27 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m8sm1720825wbh.28.2011.05.28.02.16.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 02:16:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DE02216.1010003@intel.com>
Date: Sat, 28 May 2011 11:16:25 +0200
Message-Id: <B424D198-12A5-4C45-93D7-C5CFA6C97BA5@dominion.thruhere.net>
References: <4DE02216.1010003@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/1][v3] license.bbclass parsing changes rebased sans debug
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
X-List-Received-Date: Sat, 28 May 2011 09:19:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 mei 2011, om 00:13 heeft Elizabeth Flanagan het volgende =
geschreven:

>=20
> Using python abstract syntax trees as a parser and an ast visitor =
class, I've
> begun the first steps to being able to put some sanity to license =
selection.
>=20
> One note. License modifiers have traditionally been limited to the "or =
greater"
> modifier "+". I've added another modifier "with exceptions" for =
licenses that
> have no generic ie common-licenses/GPL-2,0-with-GCC-exception

When building shadow I get:

| WARNING: =
/home/koen/angstrom-core/sources/openembedded-core/meta/files/common-licen=
ses
| ERROR: Error executing a python function in =
/home/koen/angstrom-core/sources/openembedded-core/meta/recipes-extended/s=
hadow/shadow_4.1.4.3.bb:
| RuntimeError: maximum recursion depth exceeded while calling a Python =
object
|=20
| ERROR: The stack trace of python calls that resulted in this =
exception/failure was:
| ERROR:   File "do_populate_lic", line 121, in <module>
| ERROR:
| ERROR:   File "do_populate_lic", line 118, in do_populate_lic
| ERROR:
| ERROR:   File "/usr/lib64/python2.7/ast.py", line 243, in visit
| ERROR:     return visitor(node)
| ERROR:
| ERROR:   File "do_populate_lic", line 13, in generic_visit

and a few hundred more lines, I had to change the scrollback buffer from =
512 lines to unlimited to catch this :) I can send the full log on =
request.=


