Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SMZPA-0003XG-B2
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 08:39:16 +0200
Received: by wera1 with SMTP id a1so246054wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 23:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=p7KscP1xQTnukIIy630Ljq2E06kuFC9RORjVRdDFnFE=;
	b=CcG2xkSdBar6v5+8hzrTDgzkNPWt2toSb4/60GPv7eYFmn8t6PksquI069T2MzKQ5d
	ZKPcfZNsJnhcFwDgJFfs2D+wnsYt4bgluC0qoZpUjgY6piI2P8abZJkkpIw3a9aDXAID
	PmBZ20B6910Fi0Jo2atXIl2/nsf6Jf4yO/LmjR0Hr2OdrP0SNHPkJMIHW+cLaaxg5ZEU
	ad9yJIDGY800+0B63z0/8JQCuj5f+pkAl8K2/59fZ8kk+5TesWHXs5dAj3eTValYUZlV
	MCi/Hpba8iZQVNN77wKuOj97AuCaRkrFGUx+6Emzt8oK6eD7ckQaxufYAUoWZgENFFcv
	H0Kg==
Received: by 10.216.139.29 with SMTP id b29mr1038682wej.55.1335248981527;
	Mon, 23 Apr 2012 23:29:41 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm27900787wie.9.2012.04.23.23.29.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Apr 2012 23:29:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F964456.6050106@windriver.com>
Date: Tue, 24 Apr 2012 08:29:37 +0200
Message-Id: <71A92016-D7C8-4834-8E80-849F267B3B8C@dominion.thruhere.net>
References: <cover.1335245655.git.xiaofeng.yan@windriver.com>
	<fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
	<7334A38D-4148-4397-94A0-D721CD0BD924@dominion.thruhere.net>
	<4F964456.6050106@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkaT+kQjX/Jr2wHz9Oqnc0WnPY/X31e+XDpi+/l/R0zYKTJFEYMXaEoJftDS3YvB4dMEUe9
Subject: Re: [PATCH 1/1] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Tue, 24 Apr 2012 06:39:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Op 24 apr. 2012, om 08:12 heeft Xiaofeng Yan het volgende geschreven:

> On 2012=E5=B9=B404=E6=9C=8824=E6=97=A5 13:53, Koen Kooi wrote:
>> Op 24 apr. 2012, om 07:50 heeft Xiaofeng Yan het volgende geschreven:
>>=20
>>=20
>>> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>>>=20
>>>=20
>>> LSB Test Suite complain "no library libgdk_pixbuf_xlib-2.0.so.0" \
>>> because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
>>> For passing lsb test I add PACKAGECONFIG support to the recipe and \
>>> have poky-lsb turn on the poky-lsb distro for this recipe.
>>>=20
>>> [YOCTO #2284]
>>>=20
>> Shouldn't this be an 'x11' DISTRO_FEATURE instead?
>>=20
> because "--without-x11" is disabled when x11 exists in =
core-image-sato. Using 'x11' DISTRO_FEATURE instead will change the =
default set, which will cause enable "--with-x11" when x11 is in =
DISTRO_FEATURE. LSB Test Suite need this configuration but other image =
may not need it even if having x11.

What use-case is there for having 'x11' in DISTRO_FEATURES but not =
wanting x11 support in pixbuf?

Regardless of that, poky-lsb distro overrides have no place in oe-core, =
they should go into their own layer as bbappends.

regards,

Koen=


