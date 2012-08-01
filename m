Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SwaUV-0002ae-G4
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:05:39 +0200
Received: by eekb57 with SMTP id b57so1624144eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 07:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=v49mnKwq3f1/tcRw28F16ABpLmN71FCwiNtWruZfVXY=;
	b=VTgrcRQQaTrsytWrOIdAMAogMGp56W6t1mMfvNfN5emmU0dqDUTuYMsScDABXdwDKz
	TdOKCNn2LpgKFcBTWa6k22NlWyO0EMlNobOxxHh4yAFI3no0+gcbfKoVoSGnijDzbUTO
	ymufkuxf0mt3KJ9aruT6XJnSyPKbwZGToIZUTRfVZkcbxDtLI4sKxyBi4Nt7iar5JATM
	r+0LPchOAcH7gUsao0Du3y5Nf7GEkan8BmupCzx67sYXG6v9CfPta/VBwGwkdgJm5BS1
	dO+hPn7T0OHJtXaBOg6UbqiYp+7+tesmdBNobPAHuawGx/+E7l3jS7VsYqtWbjj9ZQiA
	XcSw==
Received: by 10.14.178.134 with SMTP id f6mr23018121eem.2.1343832841230;
	Wed, 01 Aug 2012 07:54:01 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a1b9:594:e8d9:e8db?
	([2001:610:612:0:a1b9:594:e8d9:e8db])
	by mx.google.com with ESMTPS id t6sm9509084eeo.17.2012.08.01.07.53.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 07:53:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LaJ9mM_yyU+ZYoDACig5E30qBaPU+Y5BDTrrA1bOdK78A@mail.gmail.com>
Date: Wed, 1 Aug 2012 16:54:20 +0200
Message-Id: <6D85FA88-63A9-4673-B10A-CCF4063407D0@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
	<CAJTo0LbVvVqDSPpUs36JTROeq6fWendJwaVQDataN_nD6O=+Ew@mail.gmail.com>
	<17FC0BB5-80B8-4AB8-A3E8-57261EB7D561@dominion.thruhere.net>
	<CAJTo0LaJ9mM_yyU+ZYoDACig5E30qBaPU+Y5BDTrrA1bOdK78A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkaP6+IvbL4D3x7b7cobPDvOzjXnDk7XVsq8QEcd+QHGK98wldwikyy7PkldTkR65PLNYJH
Subject: Re: [PATCH 00/12] Mesa upgrade/improvements
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
X-List-Received-Date: Wed, 01 Aug 2012 15:05:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2012, om 16:34 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 1 August 2012 15:33, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> Rename the mesa ones to libegl-mesa (etc), and encourage TI to use =
libegl-ti?
>>=20
>> Recipe names don't matter, the .so files in sysroots and shlibdeps =
do.
>=20
> I meant the name of the generated package.  libegl-mesa and libegl-ti
> shipping the same libraries is expected and desired.

That won't work with debian renaming and shlib will pick up both anyway. =
You can only have one libegl.so *ever* during the build.=


