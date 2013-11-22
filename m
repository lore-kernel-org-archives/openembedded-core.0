Return-Path: <erik.boto@pelagicore.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id B5DE86C73C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 09:42:45 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id wm4so1032886obc.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 01:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=z+cqGdJhA/UQknPZbzH+9O1+s0wzrGTUWJTStyZZsAQ=;
	b=V3OGdZJaFZWjJPi8IZ3btjPfkId2G98+YbdarzaweGrAJpCh8gn7Rof1xFeFjv5ykA
	EPN2hXzPtrhbZeTg5JqwqN7q7wr/gUO7wsh48CBYvmZlleip4r2VSHSMmdZ6o4CxUyj9
	rhFFClv5uVCV48JtDlAVE+Zt1tE4e4E/1gS7BPTjc5OOOVnXNtB/b7EZWgn5ooV2kTy8
	GUE/MC1N8kDaKi3T/0ZMwL4iE0XxJAIFCwlv6desprLuI68PzI/+LJoK4T0Wf3qdLduY
	wYk0d0YJFZZowYJJFinXHtIUY1hUHWlCnHWr26wf+tC+wccizNsGElTbVyTF9DYZjg7x
	Vs7A==
X-Gm-Message-State: ALoCoQlwvuMRbrvmuyYRGF2yp+NKjE/zkoaRa9Jqa4tV8He8B3lS8tnHRF1dYW4HhvnFuJZtlt7e
MIME-Version: 1.0
X-Received: by 10.182.70.5 with SMTP id i5mr9964114obu.8.1385113364823; Fri,
	22 Nov 2013 01:42:44 -0800 (PST)
Received: by 10.76.28.70 with HTTP; Fri, 22 Nov 2013 01:42:44 -0800 (PST)
Date: Fri, 22 Nov 2013 10:42:44 +0100
Message-ID: <CA+AhUGyTC97_E=Yg1JOorHuBDG7SWQS8jfEX1Wg6Ue5pxZfcLw@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Subject: dbus depends on dbus-ptest-ptest if ptest in DISTRO_FEATURES - bug?
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
X-List-Received-Date: Fri, 22 Nov 2013 09:42:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed that dbus will pull in the ptest package as soon as ptest is
in DISTRO_FEATURES, the recipe contains: RDEPENDS_dbus =3D
"${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '',
d)}"

Shouldn't this be handled in image.bbclass via
COMPLEMENTARY_GLOB[ptest-pkgs] =3D '*-ptest' ? Then it will only be
installed if IMAGE_FEATURES contains ptest, which is how other
packages handle ptest packages.

If this is not intentional I can write up a patch and test it some.

Cheers,
Erik Bot=F6

