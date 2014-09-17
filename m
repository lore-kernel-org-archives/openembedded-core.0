Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3A93771427
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 23:11:34 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id r10so187187igi.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 16:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=+h9nC51sAwq6DS3u8pfL7FjNcqfv61SrI6FYwn7Ut18=;
	b=IHqUSuY2xHlGcvpy4qU2W/3cGGMDtyTh4AsAgPD9aIbjFRecdW/tDRIIfe2x3M1bkz
	0YzePWHHNAzZZNsRR8E4jyRIaUZXpKBs6GSN9c8S5y4q0iItJU8a2oTR8AblhhNrxEL/
	Xtb9BCcbA9k1kVC8jqGVn4Z6yBS0/h/sc725jH/GWh60Ov14EusJ/fsv50zZM55zKQrH
	Fc6KSngge0VoHFNReMo01eKLwVGonj5od2xDKQsyFuvQobx5tnx+IatHexwZT8wJamup
	ZBbzf9kUdIcOObxmR5goVv8nbo0kuIlD2VKjKiKMyRG+Q2fho4MioZgZTem0LB/6puE4
	RdTQ==
X-Received: by 10.50.4.67 with SMTP id i3mr10403285igi.4.1410995495950; Wed,
	17 Sep 2014 16:11:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Wed, 17 Sep 2014 16:11:05 -0700 (PDT)
In-Reply-To: <26724FB0BFCB3D4C91BDE184751AA3A428AC2289@SESTOEX04.enea.se>
References: <1410769631-5672-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZd_5dYP7sc-umCev+rzU_YzGNLWUq6o0Y0ZK9b6ayB3g@mail.gmail.com>
	<26724FB0BFCB3D4C91BDE184751AA3A428AC2289@SESTOEX04.enea.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2014 16:11:05 -0700
Message-ID: <CAMKF1sq0F=z4o-3T6KHLgsMC+CY87k1kO82WhJ-8-6GXVTyqAw@mail.gmail.com>
To: Tudor Florea <Tudor.Florea@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kmod: remove the setting of INHIBIT_PACKAGE_STRIP
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
X-List-Received-Date: Wed, 17 Sep 2014 23:11:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2014 at 3:11 AM, Tudor Florea <Tudor.Florea@enea.com> wrote=
:
> "Since kmod test files contain kernel modules for many different architec=
tures, strip and arch gets confused and throws errors"
> It means nothing if a specific platform doesn't exhibit the behavior. Kmo=
d ptest attempts to load a precompiled (and unstripped for that matter) ina=
ppropriate module and verify this is not possible. I still think we should =
not remove the line (e.g. we should not alter kmod precompiled modules from=
 ptest).

kmod should use strip and not cross-strip then

