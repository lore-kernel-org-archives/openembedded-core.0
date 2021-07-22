Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web12.7848.1626961161257073422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 06:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [192.168.10.12] (unknown [10.0.12.135])
	by kozue.soulik.info (Postfix) with ESMTPSA id 8F1EE101FEF
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 22:38:02 +0900 (JST)
From: "Randy Li" <ayaka@soulik.info>
Mime-Version: 1.0 (1.0)
Subject: proposal: using oe to build Android vendor image
Message-Id: <8DD70E68-65EE-432E-BEA4-D9E8988A44BB@soulik.info>
Date: Thu, 22 Jul 2021 21:39:17 +0800
To: openembedded-core@lists.openembedded.org
X-Mailer: iPad Mail (16D57)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello All

I am working with video, graphics and AI stuff all the time, although Andr=
oid has many good frameworks and published some good standards to following=
(as long as you could understand its documents). I am sure we would like st=
ill to use those packages that we are familiar with at GNU Linux. For examp=
le, if we want to use the Gstreamer on Android, you would need to compile a=
 bulk of dependency packages. Although I don't know a vendor would like to =
ship those frameworks in their product, they are very useful at the develop=
ment stage. I am sure AI staff would like this, there are too many neural n=
etwork frameworks for different platforms. Those frameworks may depend on t=
he other neural network framework for model parsing.

There is a project from Gstreamer called Cerbero, people may have already =
known that. It has done the most of work I want, but  I just don't want to =
port so many recipes to it.=20

I am not sure what I need to do, what the meta-mingw did may not be enough=
 for me. Do I need to start up a new distribution? There is not a library C=
 nor linker loader in the vendor's partition and many install files for gen=
eral Linux won't be used in Android.  The meta-clang may need to be adopted=
 as it would use an external Android NDK toolchain. And I don't need to sup=
port many target platforms based on Android One policy, only limited ABIs w=
ould be supported and no CPU variant tuning would be used.
After we could run that software only depending on the kernel's API, I thi=
nk I could move forward to support building those HAL modules(likes hardwar=
e decoders and encoders for codec2). That would require us to separate thos=
e codes from Android SDK repositories. Packing the APEX file should be in p=
lan as well.

ayaka
