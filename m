Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sidebranch.openembedded@gmail.com>)
	id 1RbSjz-0004QQ-NT for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 09:02:04 +0100
Received: by eaal1 with SMTP id l1so2700544eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 23:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=qUKZ3fa2BvPtpP42DCZktasVYwmgLMLniF5v77MxUnE=;
	b=Cp47RwcrB8HFI48z3obBL/FzBClwEBexqx7VlvxTuc19jzl2LxvT/k3DpEX4TiMJ5I
	Vh/tPdGlholHNvr6Wu5GjMrQHKkuuZbiNntpGKqIZHNfClJ+HD4lUABCsBbOGUCzeElv
	0I+us/TZLz0/TJN3F7y3kql4bnl1R5Di6m9+k=
MIME-Version: 1.0
Received: by 10.204.136.219 with SMTP id s27mr2658291bkt.122.1324022105069;
	Thu, 15 Dec 2011 23:55:05 -0800 (PST)
Received: by 10.204.185.76 with HTTP; Thu, 15 Dec 2011 23:55:05 -0800 (PST)
Date: Fri, 16 Dec 2011 08:55:05 +0100
Message-ID: <CAMvUbCzceL3owJH51JnUYYC90ExEHkbEOcd4887sjWAKEV83=A@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: after modifying source code in work/, how to rebuild package?
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
X-List-Received-Date: Fri, 16 Dec 2011 08:02:04 -0000
Content-Type: multipart/alternative; boundary=0015175ccff23f576d04b430eb81

--0015175ccff23f576d04b430eb81
Content-Type: text/plain; charset=ISO-8859-1

Hello all,


after modifying source code in the work directory, what is the set of
commands to rebuild the package (from the compile stage and further)?

Under classic OpenEmbedded, I removed the compile, install, package stages
stamp files and ran bitbake. However, shared staging "broke" that workflow.

Is there an equivalent approach with OpenEmbedded Core?  Possibly disabling
'sstage' on a per build, or per package basis?


Thanks,

Leon.

--0015175ccff23f576d04b430eb81
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,<br><br><br>after modifying source code in the work directory, wh=
at is the set of commands to rebuild the package (from the compile stage an=
d further)?<br><br>Under classic OpenEmbedded, I removed the compile, insta=
ll, package stages stamp files and ran bitbake. However, shared staging &qu=
ot;broke&quot; that workflow.<br>
<br>Is there an equivalent approach with OpenEmbedded Core?=A0 Possibly dis=
abling &#39;sstage&#39; on a per build, or per package basis?<br><br><br>Th=
anks,<br><br>Leon.<br><br><br>

--0015175ccff23f576d04b430eb81--
