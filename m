Return-Path: <johnnymarler@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 006247F92B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:25:56 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id q11so1191581lfc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 15:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=v6Pxxx1x4MxpFw9wzYLDU5R+eFmoYBn9O+RSYsS49q4=;
	b=PwHGqZ5mF9Z1lZSwW39LTAkiV3dIXIdEuAgaZhUod3Ti1Rf5HBsuatAkDj3GSx6z2M
	Vj3Rchq+dx9xjQAv5s4YJxMdnHYXLFJlZTvqEiLJx9MRJ8PB/XLwlGq31KU2utcWkBv7
	LWZuPtdkXw2JkLg0QOHufWpKK89/W+Re4gq2MqpUGk6y5AwZHeyMzUjpud1wnFZmPQOb
	h/I45DvLEfHn+IPLH4oH9R+drEWXhB19WHq/QU/JFfpTA8kvrcGdc6ZPFPqKpO+0SoE3
	64kXwjY0iA5XaoSeRR7YAj56G4LR2NWUOOCFHxltV7K+G1JRSZFLwe4RqXBTnDbov4Cd
	3PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=v6Pxxx1x4MxpFw9wzYLDU5R+eFmoYBn9O+RSYsS49q4=;
	b=p6vmbFdicjag80zqZFnLWc8jsCbgCfFFHTSKak8tr6EXDl8sWV0kEn9aPIYj29k7QU
	HiIzcx+5Rh50Sp5pAetWG4c8odXxG7DTi2TQBsY76VoWDK721yz/MZ2l1HlaE/+fgk2R
	F/d/3VWudPdDXFObQKmYQ4HLDKPFWz/IpgbaySlwY+8fQ1v1OTl0eulTnb9L2uhjhVea
	ycKo4VgXyEk8/qs4sPs9KmsUIeqNP7AtVx80Zvotqy67AK2vaDqGvbSl5PGnT9muJSgr
	Z+UwJuyeupWVyfigjTqpviTZU556rQ5c97BoeI1BF3AdcBVND0Jk/VJQnbaHNpHZ5eFE
	yR4Q==
X-Gm-Message-State: APjAAAWVM3WPS0K0O0h1FeSQWCRSOg6ZqViQJg51FpZfpWCyYg2Qi7bD
	TWWNxmDrBwqm2EgtuHuhcoJwJHCXDihLuhZvJjcB3cWtVxE=
X-Google-Smtp-Source: APXvYqymAnNx1LPl8B2VhXPah0pI/yFvpfaEDo2m4pIGywZDM1MbswUYS6sswa438MPb1TK54JQEbjoL1UzAG+2m/nM=
X-Received: by 2002:a19:3fd1:: with SMTP id m200mr268375lfa.18.1568672757186; 
	Mon, 16 Sep 2019 15:25:57 -0700 (PDT)
MIME-Version: 1.0
From: Jonathan Marler <johnnymarler@gmail.com>
Date: Mon, 16 Sep 2019 16:25:46 -0600
Message-ID: <CACKT+AqXthjbHZZ86goPLEWqszrFd8+HRLj0JzfU=-AyrDx4Cg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Assert error when there are multiple shlib_providers for the same file
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
X-List-Received-Date: Mon, 16 Sep 2019 22:25:57 -0000
Content-Type: multipart/alternative; boundary="0000000000007604b30592b31621"

--0000000000007604b30592b31621
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 86b8a1d534bfcd70775c6e2b59eabe10de29f526:

  libevent: don't treat test stats line as pass/fail in ptest (2019-09-11
07:30:08 +0100)

are available in the git repository at:

  git://github.com/marler8997/openembedded-core assertMultiShlibs
  https://github.com/marler8997/openembedded-core/tree/assertMultiShlibs

Jonathan Marler (1):
  Assert error when there are multiple shlib_providers for the same file

 meta/classes/package.bbclass | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

-- 
2.7.4

--0000000000007604b30592b31621
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The following changes since commit 86b8a1d534bfcd70775c6e2=
b59eabe10de29f526:<br><br>=C2=A0 libevent: don&#39;t treat test stats line =
as pass/fail in ptest (2019-09-11 07:30:08 +0100)<br><br>are available in t=
he git repository at:<br><br>=C2=A0 git://<a href=3D"http://github.com/marl=
er8997/openembedded-core">github.com/marler8997/openembedded-core</a> asser=
tMultiShlibs<br>=C2=A0 <a href=3D"https://github.com/marler8997/openembedde=
d-core/tree/assertMultiShlibs">https://github.com/marler8997/openembedded-c=
ore/tree/assertMultiShlibs</a><br><br>Jonathan Marler (1):<br>=C2=A0 Assert=
 error when there are multiple shlib_providers for the same file<br><br>=C2=
=A0meta/classes/package.bbclass | 21 +++++++++++----------<br>=C2=A01 file =
changed, 11 insertions(+), 10 deletions(-)<br><br>-- <br>2.7.4<br><br></div=
>

--0000000000007604b30592b31621--
