Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T9ZCI-0006z5-Bf
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 12:20:30 +0200
Received: by iebc11 with SMTP id c11so2795628ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 03:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=4RSjeWiTXsmgQMdWDD8dPrBhSXQlizXeP7i0e94kIAg=;
	b=fqicMzhecG4de3K3uKSTdeIdxVi/EpCvNRY6cmgUUdv2CfBlCWkGMgbmzQ4UuuClQS
	XuMrDhh0nOy8k/YOi/g+5spqTc8MGLMLihLhV5hajrU/1/y4RzJQ6eFn76WvggP6a9CH
	+NyG2aM8k/I4Oh3nmZbZ4jfsy201qrjIWvbarGyj3Zq+GJaxUHn6IOH3+3qZZbYQf34J
	9QfUeVlZgqYLhOp3DyffmtA12L4E9t5YVu1cDhs6AThc9EX52Z+ybT4w1xcQqE4hFEUc
	oFOmeJFCsgb48Z97ZsIESvmnIhI0W6cQNOmcD1SQx0s2RA1pOW0WQ6P6RGSX8DzoIcEe
	nYcg==
Received: by 10.50.159.201 with SMTP id xe9mr1940741igb.63.1346926085628; Thu,
	06 Sep 2012 03:08:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.129.232 with HTTP; Thu, 6 Sep 2012 03:07:45 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 6 Sep 2012 13:07:45 +0300
Message-ID: <CAK18fxHp3-+VET0HN_4Ror3Sami8tJkeO187nyRS+VaXoJbdxQ@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmG5D5nsLI8snnDSvzV3JQPdzpxmQ5HGX8vZfd7N8pScigcwqLu2iYwsoIhDUKlTHyG26x6
Subject: In dash there is no "echo -e"
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
X-List-Received-Date: Thu, 06 Sep 2012 10:20:30 -0000
Content-Type: multipart/alternative; boundary=14dae93405b3df629304c905aa01

--14dae93405b3df629304c905aa01
Content-Type: text/plain; charset=ISO-8859-1

Hello,

oe-core / yocto removed the prerequisite to have sh pointing to bash. This
means that echo -e in dash will actually print "-e" and interpret
backslashes by default.

http://www.mail-archive.com/yocto@yoctoproject.org/msg06000.html
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=550399



Now, in oe-core / yocto there are a couple of occurrences of "echo -e".
Generally these are scripts with bash shebangs - so no problem here. But
there are 4 classes which use this:

buildhistory.bbclass
package_rpm.bbclass
package_deb.bbclass
package_ipk.bbclass


My solution would be to replace echo with print in these cases.

ag

--14dae93405b3df629304c905aa01
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>oe-core / yocto removed the prerequisite to have sh pointing =
to bash. This means that echo -e in dash will actually print &quot;-e&quot;=
 and interpret backslashes by default.=A0<div><br></div><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px">

<div><a href=3D"http://www.mail-archive.com/yocto@yoctoproject.org/msg06000=
.html">http://www.mail-archive.com/yocto@yoctoproject.org/msg06000.html</a>=
</div><div><a href=3D"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D55=
0399">http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D550399</a></div>

</blockquote><div><br><br>Now, in oe-core / yocto there are a couple of occ=
urrences of &quot;echo -e&quot;. Generally these are scripts with bash sheb=
angs - so no problem here. But there are 4 classes which use this:<br>
<br>
</div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>=
buildhistory.bbclass</div><div>package_rpm.bbclass</div><div>package_deb.bb=
class</div><div>package_ipk.bbclass</div></blockquote><div><br></div><div>

My=A0solution=A0would be to replace echo with print in these cases.</div><d=
iv><br>ag
</div>

--14dae93405b3df629304c905aa01--
