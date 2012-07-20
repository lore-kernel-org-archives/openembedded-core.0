Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1SsMt0-0004US-F5; Sat, 21 Jul 2012 01:45:30 +0200
Received: by wgbdr1 with SMTP id dr1so3868521wgb.24
	for <multiple recipients>; Fri, 20 Jul 2012 16:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=e0a6q4+9WHZ5sBBxyaqZqHfJq3182hjMPYWNOCx5RmU=;
	b=U3Xq9cRC8HfIiAPTTiRZVeDpCqjq+6Uu4KQ5F2rhlgd6qPYfRYHE0ZmUdngVT6K6Ej
	vjwlJXBi9FhLumyNL+nlM7yA5SSMcr4NlzCpEBDGR2JFlAWLcerRfurJKsrZtL1vyS7K
	u7v0orwIEedi+5bPLEzYkF7hd6O8WqDiDT/n/VGn6ZGNiXAQ7OJBc5Tdz2svsBTS+PYV
	B/WL0uObupGM776ZWupZi+Ue5mERuyM7q1Egh8TXZ2wBfhCVlBv0DqCyXmqZZxuTuUYu
	nZJTziRTQ3AahoCkoQJJBZsB54aKY0ACLGg32OM+mB0D2lYGGeRwespsy799VZ81VMxS
	tdlQ==
Received: by 10.180.96.3 with SMTP id do3mr18283727wib.5.1342827246847; Fri,
	20 Jul 2012 16:34:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.18.98 with HTTP; Fri, 20 Jul 2012 16:33:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jul 2012 16:33:36 -0700
Message-ID: <CAMKF1spBY0USM6d_o=F4fLUvyK1qi5hMz9rJBSUsjFE4n3KFCw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, yocto@yoctoproject.org, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Cross referencing git commit SHA info in commit logs
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
X-List-Received-Date: Fri, 20 Jul 2012 23:45:30 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I have seen some commit logs referring to poky commits but are applied
to OE-Core and there might be vice versa case too. In general I don't
see an issue
when there is a commit SHA id in log message but please add the
project info to it unless so someone can go and look for it in
particular repo

eg, poky/<id> OE-Core/<id> meta-oe/<id>  oe.dev/<id> would make it a bit better

Thanks
-Khem


