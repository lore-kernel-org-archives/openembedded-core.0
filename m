Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THRMh-0006rn-VP
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 05:35:48 +0200
Received: by pbbro12 with SMTP id ro12so4575269pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 20:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version:x-mailer;
	bh=Vvr/tdeZdrcTG3KjW+e1/J0jXiMF1s//OQiIBOftIoM=;
	b=dA0EH6XnytO0gzbnkrwLgt/AfBqy9Nxjy8fXH7axy4ZOCaJj7c+Qc5ceOnrs1lq4Lj
	264hHdtERkYZwhzNl2NxlEvkaeJEjsA9iH5BHbYZ2/qxG6yVcNztdmWi8EGBvp8d0zqV
	awreoez4wkJcemRYgovc3pDonUDPVuKgWBETYV7KjVKNta5OHUpCEavKCsXnikJU8oUk
	U8iV3HITdv1nrQD2PaOrGbg3BKh9qFDSD9ClJ+w8RALTwuPYF5wViPx7IIKYJff2ik39
	IjDGa8qGq7XmlML25Mu83ISRX7biEJWmHccw+7pNK2hp7fF3OCK1F7cLuVtuknHfCIpD
	0bow==
Received: by 10.68.231.67 with SMTP id te3mr16810269pbc.134.1348802574837;
	Thu, 27 Sep 2012 20:22:54 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	qa4sm4838390pbb.70.2012.09.27.20.22.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 20:22:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <9CAE2E57-84BE-44B7-A7BE-BCE8F728EFE8@gmail.com>
Date: Thu, 27 Sep 2012 20:22:52 -0700
To: "openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
X-Mailer: Apple Mail (2.1498)
Subject: perl install error
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
X-List-Received-Date: Fri, 28 Sep 2012 03:35:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi

On ppc64 I am getting=20

| Warning: perl appears in your path in the following locations beyond =
where
| we just installed it:
|     =
/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl
|
| make[1]: Nothing to be done for `install.man'.
| make[1]: Leaving directory =
`/work/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/perl-5.14.2-r10/per=
l-5.14.2'
| ln: failed to create symbolic link =
`/work/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/perl-5.14.2-r10/ima=
ge//usr/lib64/perl5': No such file or directory
| ERROR: Function failed: do_install (see =
/work/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/perl-5.14.2-r10/temp=
/log.do_install.6656 for further information)
ERROR: Task 1679 =
(/work/yocto/poky/meta/recipes-devtools/perl/perl_5.14.2.bb, do_install) =
failed with exit code '1'
NOTE: Tasks Summary: Attempted 4082 tasks of which 4057 didn't need to =
be rerun and 1 failed.


It was working fine yesterday
anyone else seeing it ?=


