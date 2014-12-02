Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 15345601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 15:16:22 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id u20so9198275oif.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 07:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=NpGPXxqjwSxm+B1z8aRX+Ee+XUEGRhTtyTgQ2GmLPE0=;
	b=flbV9f/TGBC9qA9de6y48ABVYURh6mfHaiGl6atixLR+0VZToHBj7Qo/BsSirOMtU+
	cjIo+/86hxYfTyvBzwAek/10x07ahWEpg70yq7zp4kNs86fB3XhfjEeRO4RO+mwHfmr0
	9jglKzeXckb0i/jz2vALzPz3mRnvmCesDnBTchzlWqGn7jkWbReQxA8ID/PFYo74WL3N
	It5crDrajYVmoVwfiXJjuoy5jpz/JX4Diprlkneeg7bFy/zHtZhancVYCxq22mBnQtUm
	lAzvhIs6vTyRjTq+1ZmPtWIeSU4IeD59SX1A3jedpa6EvaccTN23KdQSrarAGdEKzCTM
	AZmw==
X-Gm-Message-State: ALoCoQnguBHhkdSQavISJYdxMYJRXvAgtuL9i3MGuxlZXEwuuGuiI5PVDzeAFkByxJqOxMZCIwvn
X-Received: by 10.60.124.69 with SMTP id mg5mr1637153oeb.73.1417533383114;
	Tue, 02 Dec 2014 07:16:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.159.138 with HTTP; Tue, 2 Dec 2014 07:16:02 -0800 (PST)
In-Reply-To: <547DD1A8.6040006@linux.intel.com>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<434556f7b955c934a5eabbd8125d46aab0ffbde2.1417466738.git.anibal.limon@linux.intel.com>
	<CAP71WjzO2sg-RbY=51Nu89=hcahNqP0NhVYUCCJX3=eTYz87Hg@mail.gmail.com>
	<547DD1A8.6040006@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 2 Dec 2014 16:16:02 +0100
Message-ID: <CAP71WjwUKcu4EOLR_5j0z7jkjWfk9+yHHkabo2C1JRaKRigBOg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] xorg-xserver: Upgrade to 1.16.2
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
X-List-Received-Date: Tue, 02 Dec 2014 15:16:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2014 at 3:50 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> I don't see this warning, i ran with (log attached),
>
> $ bitbake xserver-xorg -v -D


xserver-xorg does auto-detection for dbus in configure.ac

=3D=3D
PKG_CHECK_MODULES(DBUS, $LIBDBUS, [HAVE_DBUS=3Dyes], [HAVE_DBUS=3Dno])
if test "x$HAVE_DBUS" =3D xyes; then
    AC_DEFINE(HAVE_DBUS, 1, [Have D-Bus support])
fi
AM_CONDITIONAL(HAVE_DBUS, [test "x$HAVE_DBUS" =3D xyes])
=3D=3D

i am building core-image-x11 , which pulls in dbus i believe. hence
the warning in my case, since I have dbus in my sysroot..

