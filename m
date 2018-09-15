Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 27E747963D;
	Sat, 15 Sep 2018 08:51:57 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id x7-v6so10951961qtk.5;
	Sat, 15 Sep 2018 01:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=2wIGOHBHpdJardW9hO8MLkCogGfCFmGn/H3JOmGfLjU=;
	b=GAAMRhnASE5u32QqRQliEA9MWCaaT4BESDSsQgYJzvHfO04Mta+T9zy9joGicoj+fV
	zb/kstpKiHOEEujQVNjVR543YnrNSLeudaiwJwJIutdKyy8rgfDoMrRyC74VAwUm/qYw
	IMsPUJP61+6OLfem3BbKzqzH0pJ+noGR+K3rz2JcYhqZkrneb6fzA1xyEyHPUowEBQW9
	2EBr4XP+7oR/lIO68s7Fe5CTxk30GkBhH4zPukGhlLmNsKSsFGONSeKwklFlRzMgJfLS
	XLNTBHaEtqmpgmVpcBzhRjvLTTsEeUr8CiHYcK67S5Na2oqzkiQ0SPTOsP6pekp3WhZ7
	c21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2wIGOHBHpdJardW9hO8MLkCogGfCFmGn/H3JOmGfLjU=;
	b=KN+0EW879JYaNESSW8eDIoNoH5ULXtf/rmKGTq6aDFGez6MfRJddR7Py6BB1bjC/LL
	oNx+0PhqrYJzdCDdDS6Giaii47OMdz+c+GzP+zcj/s7SuQsfCjst9sXLN/MQFUw6Df4V
	E3aAi4NcrhPOWn583jbQ/CWttWscn9OtkGRZVSmtG8xqxsseazrAQkSaOv+00I9+exZY
	/Tw9GakuZ7rZxksSm1VTqZERs7ax+E05iQB/pCT3T78DBFsDf+HZzH98aXP0KhR5zhEO
	hS3FdlQXbbMa6wjXEPaRUuYJyvL8CRseb8hSF6PsFOYXclxjZ0mJ51wBc3mLNRdcgYvl
	cuEA==
X-Gm-Message-State: APzg51B74AEWujfFv88lIqCtJAEEFaIsIOtIidDmWy+YK/zxwfQI7kCe
	AqDiqlGbRJd8PARsXFLrFz55YTL5sfwqRKWZEyAxqg==
X-Google-Smtp-Source: ANB0VdaX1H+d+hH1KPPDdmF5elAFbyuMKI8gHCtfbjcRAn4XvrM3WyoEFYni85411sWA+ykss3oIm8S246Yom3xhkTQ=
X-Received: by 2002:a0c:e847:: with SMTP id
	l7-v6mr11457347qvo.196.1537001518781; 
	Sat, 15 Sep 2018 01:51:58 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Sat, 15 Sep 2018 10:51:47 +0200
Message-ID: <CAGCTLNRJaBrHJmR3McmfUdMaaqStfbwwBGtnzRbtWVff_yuCqQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Subject: [openembedded][Qt5]: typing problem.
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
X-List-Received-Date: Sat, 15 Sep 2018 08:51:58 -0000
Content-Type: multipart/alternative; boundary="0000000000008bd8f30575e50d5e"

--0000000000008bd8f30575e50d5e
Content-Type: text/plain; charset="UTF-8"

HI everyone,
I am trying to build custom image supporting wayland weston instead of x11
and support qt5 apps.
I successfully built it but when I try to type any thing in the text box in
the qt5 app.
no thing happen !!
also the initial text in text boxes appears very small!!
I added "fontconfig" and "frretype" to the PACAGECONFIG variabl in
qtbase_git.bb recipe..

How to solve this problem ?

Thank you in advance,
Regards,

-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--0000000000008bd8f30575e50d5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>HI everyone,</div><div>I am trying to build custom im=
age supporting wayland weston instead of x11 and support qt5 apps.</div><di=
v>I successfully built it but when I try to type any thing in the text box =
in the qt5 app.</div><div>no thing happen !!</div><div>also the initial tex=
t in text boxes appears very small!!<br></div><div>I added &quot;fontconfig=
&quot; and &quot;frretype&quot; to the PACAGECONFIG variabl in <a href=3D"h=
ttp://qtbase_git.bb">qtbase_git.bb</a> recipe..</div><div><br></div><div>Ho=
w to solve this problem ?<br></div><div><br></div><div>Thank you in advance=
,</div><div>Regards,</div><div><br></div><div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--0000000000008bd8f30575e50d5e--
