Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKR9z-000768-08
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 11:26:47 +0200
Received: by wgbdr12 with SMTP id dr12so6041508wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 02:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=uc9uy+qC21AZ6O4E+88vTLlkJbLot6KEaNsmmtCwl9M=;
	b=hVAWIwawCnLtMRdA01uessl2+PhQa40/r/5B6Zq3GCSptriKdubiiudu3tsX2qNitt
	iMHnnfWjHGa3sGz7yRr9I2QSugslKsW9Rk5kHzRGFt5SYauK9VWUg8jkI+XCP8SElEwz
	oHqNZ5A9LUgjUbL/fIaF/E+pu9oamij1r8Un1uapaoU+xPoAvzcfasG1HGzhvlV96blt
	ulKbQoQ27VtokbibazGsDqwPuBPEz1QT8gcbv4tyBPBMENNkyk7IVxiX9heNqDEz1sC5
	P7UL7rl4R3CgOnXQunfHzEPnlW6RTdN/HOWYMDEsr0wa3eJppUFT+kERjYufq07DZA/d
	RSRg==
Received: by 10.216.135.105 with SMTP id t83mr937687wei.105.1334740639645;
	Wed, 18 Apr 2012 02:17:19 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id u9sm33239800wix.0.2012.04.18.02.17.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 02:17:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRRi3peWrpGyN68Rr7tF17y1qv49AfyoqqTQx7WCDEsz+w@mail.gmail.com>
Date: Wed, 18 Apr 2012 11:17:16 +0200
Message-Id: <9AAD89B7-59E0-45F3-92DE-1945F571765F@dominion.thruhere.net>
References: <4F8D8AB7.7000002@opendreambox.org>
	<20120417153919.GG3665@jama.jama.net>
	<E06E57AF-94D1-42DF-9435-ECE3DAC0DBC4@dominion.thruhere.net>
	<CALbNGRRi3peWrpGyN68Rr7tF17y1qv49AfyoqqTQx7WCDEsz+w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQl/NKPJrRH1X1gkEFDWlnzxmYS8/FFuEXBU/H4MSHmO1Z/yhtE1H+BXuTEtZ8lmaRqPcEN7
Subject: Re: [oe] waning "it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd"
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
X-List-Received-Date: Wed, 18 Apr 2012 09:26:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 18 apr. 2012, om 11:02 heeft Andreas M=FCller het volgende =
geschreven:

> On Tue, Apr 17, 2012 at 5:45 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 17 apr. 2012, om 17:39 heeft Martin Jansa het volgende geschreven:
>>=20
>>> On Tue, Apr 17, 2012 at 05:22:31PM +0200, Andreas Oberritter wrote:
>>>> Hi,
>>>>=20
>>>> the following warnings keep appearing on every fresh invocation of
>>>> bitbake since a few months, I think:
>>>>=20
>>>> WARNING: .../meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb: it is =
recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>>>> WARNING: .../meta-oe/recipes-connectivity/gateone/gateone_git.bb: =
it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>>=20
>> The above 2 only have systemd support, so the WARNING is completely =
bogus and should be silenced.
> Another chapter of 'eat systemd or die'

At the risk of feeding the troll: I've not seen anyone contribute decent =
sysv scripts for those recipes. So what is your point exactly?=


