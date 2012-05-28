Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SYzwG-0007Lk-Mr
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 15:24:48 +0200
Received: by yenl13 with SMTP id l13so1359644yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2012 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=2lzLixY/ApNmRzzhrOY3hcY+8w7oaaBsVuK5yYd0Cxk=;
	b=XFHYV486xlz7KPS7AGD6+dE6F3nRaOlNE2pevYcW2mGuMnIjvrPBAv9LIAIplaakJi
	XDYi1XUJxOhOvDfV41zOcbPJayJNga2bx3e2n26A4+BTVY5x/tOXXwK9YP0VWjRLZpaz
	GIkmKnBhKpD1YnB6UB19uhWo87xV/yYs2ib1UOO3sJXEGUwWUlZQIU5Tq1NIHYa0lnFc
	0g4H45OVfQ+5b0vBvsEhy3ZC7RPGCsRUdsLoZVenPbnzCuxcXNpQQ7sJmAnEnqqifGQe
	Fu8GMVa6Rxv08JK32gpmX63Lc1eqUcHQQu20IbtWH0FROvx97cUHeQRIkW5kVL9pxDiX
	4nbQ==
MIME-Version: 1.0
Received: by 10.50.158.161 with SMTP id wv1mr4490295igb.43.1338210872039; Mon,
	28 May 2012 06:14:32 -0700 (PDT)
Received: by 10.231.238.69 with HTTP; Mon, 28 May 2012 06:14:32 -0700 (PDT)
Date: Mon, 28 May 2012 15:14:32 +0200
Message-ID: <CAOHjBZsyWoca=JkLy==aqwYGwLeYYrNgR6PwwWMyNVjP0LSv5g@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: How to query installed rpm packages
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
X-List-Received-Date: Mon, 28 May 2012 13:24:48 -0000
Content-Type: multipart/alternative; boundary=14dae9340c75a9999704c1187ff0

--14dae9340c75a9999704c1187ff0
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I need to query, via rpm command, the packages installed building an own
image recipe.
I know the populate_rootfs step for images uses rpm to install the packages
(if we set PACKAGE_CLASSES).
To do this it sets a dbpath and a root path for installing the packages.
I need to know how to query them (rpm -qa ....) given that dbpath is set to
/var/lib/rpm but I think it actually doesn't override
the real /var/lib/rpm database (also I'm not building as superuser).

Please can you help me?
Best Regards,
Giuseppe

--14dae9340c75a9999704c1187ff0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>I need to query, via rpm command, the =
packages installed building an own image recipe.</div><div>I know the popul=
ate_rootfs step for images uses rpm to install the packages (if we set PACK=
AGE_CLASSES).</div>
<div>To do this it sets a dbpath and a root path=A0for installing the packa=
ges.</div><div>I need to know how to query them (rpm -qa ....) given that d=
bpath is set to /var/lib/rpm but I think it actually doesn&#39;t override</=
div>
<div>the real /var/lib/rpm database (also I&#39;m not building as superuser=
).</div><div>=A0</div><div>Please can you help me?</div><div>Best Regards,<=
/div><div>Giuseppe</div>

--14dae9340c75a9999704c1187ff0--
