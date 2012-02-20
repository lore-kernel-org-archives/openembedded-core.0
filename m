Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sidebranch.openembedded@gmail.com>)
	id 1RzbPX-0005kU-Ao for openembedded-core@lists.openembedded.org;
	Mon, 20 Feb 2012 23:08:43 +0100
Received: by bkwq11 with SMTP id q11so5131089bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2012 14:00:25 -0800 (PST)
Received-SPF: pass (google.com: domain of sidebranch.openembedded@gmail.com
	designates 10.205.122.73 as permitted sender)
	client-ip=10.205.122.73; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	sidebranch.openembedded@gmail.com designates 10.205.122.73 as
	permitted sender) smtp.mail=sidebranch.openembedded@gmail.com;
	dkim=pass header.i=sidebranch.openembedded@gmail.com
Received: from mr.google.com ([10.205.122.73])
	by 10.205.122.73 with SMTP id gf9mr1698751bkc.4.1329775225331 (num_hops
	= 1); Mon, 20 Feb 2012 14:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=AvRo2KKzH5pbjKYNehb3uJ2oyuR/TZQMBJYtdDAZujw=;
	b=myTsnjZIG5y7nRFi1MyQflaiaqz2grqlYGVCi1k+/SqGkDlAKqFlsgDeIDmRju+VQd
	IDGHGVQgUitmmQv1Et0ZzNFoQiOgK1Cosnxqiqq3H02v9ZGKLiPgB64lW+R9a0PeqFS2
	DnSXcT0JMrNq43rpfO1hjcQOy6zutNP7r7vcA=
MIME-Version: 1.0
Received: by 10.205.122.73 with SMTP id gf9mr1369552bkc.4.1329775225245; Mon,
	20 Feb 2012 14:00:25 -0800 (PST)
Received: by 10.204.225.70 with HTTP; Mon, 20 Feb 2012 14:00:25 -0800 (PST)
Date: Mon, 20 Feb 2012 23:00:25 +0100
Message-ID: <CAMvUbCwy5UL3YWXS=2SkeKff2WDQE9EX7-CGUv9s5SH+9uSK1g@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: bitbake parsing of IMAGE_INSTALL += # tslib mtd-utils" extremely user unfriendly.
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
X-List-Received-Date: Mon, 20 Feb 2012 22:08:43 -0000
Content-Type: multipart/alternative; boundary=000e0ce0d2eeee90e604b96c6b05

--000e0ce0d2eeee90e604b96c6b05
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

bitbake can really braindump on us when we insert typo's.  The result of
bitbake 1.14 parsing this one wasn't pleasant:

IMAGE_INSTALL += # tslib mtd-utils"

(Yes, it's a typo. No, I wouldn't expect bitbake to give me that much
output :) )

Regards,

Leon.

--000e0ce0d2eeee90e604b96c6b05
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,<br><br>bitbake can really braindump on us when we insert typo&#3=
9;s.=A0 The result of bitbake 1.14 parsing this one wasn&#39;t pleasant:<br=
><br>IMAGE_INSTALL +=3D # tslib mtd-utils&quot;<br><br>(Yes, it&#39;s a typ=
o. No, I wouldn&#39;t expect bitbake to give me that much output :) )<br>
<br>Regards,<br><br>Leon.<br>

--000e0ce0d2eeee90e604b96c6b05--
