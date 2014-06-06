Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id D7B8C6FA3D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 09:34:12 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id r20so610321wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 02:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=G0UcboIO1SxkIMcMKj2Ujw3QMqOwiOM0mxESZjkZMa4=;
	b=mH2VjzOXxticI8uiHpDbgBkmAXgBVGwJ8dQ54nnjXNHSa63YXaRB0hmnqjJrn2EYwy
	NR3lKAAiwOqbZhcbs0y9/jbKTUCfFU1GLu0Rfu8JR9YEAJojjKnLONskXf9fcaj7aPKe
	8LQtkD0x0UI6pM8a15+rmL1j+K/4yw69KmBcsrsOzusz10rZmROnanNAklNrioo8c7sS
	ycYFC1M+4iffsuiSKpirL6P0wjO2Pn8IiHV53vEnVaV6CYpMM5SbZ5w8y/SuU+bhoT5n
	D01kRdfCvvOAtotSDWFO9IwmUTnY8KE22XDDRWUrrO6Vhjasjy8E/EWtS1crVmnm5NVM
	GVOA==
X-Gm-Message-State: ALoCoQkF5eb8CCQOVYIYgVDqYy5JOcfWCWIzclawDfOUaqM8C6aDpkWURfa5MGtrNJw11KYKOiXz
X-Received: by 10.194.48.38 with SMTP id i6mr5001506wjn.46.1402047253386;
	Fri, 06 Jun 2014 02:34:13 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id r5sm11572374wjq.26.2014.06.06.02.34.11
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Jun 2014 02:34:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <538D7214.6060805@windriver.com>
Date: Fri, 6 Jun 2014 11:34:10 +0200
Message-Id: <84CBFF32-DD26-44FD-8689-8C6CC982ACDF@dominion.thruhere.net>
References: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>
	<1391435033.14769.5.camel@phil-desktop.brightsign>
	<52EFA146.5010405@gmail.com> <538D7214.6060805@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] udev: add udev-utils to RDEPENDS
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
X-List-Received-Date: Fri, 06 Jun 2014 09:34:15 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 3 jun. 2014, om 08:58 heeft ChenQi <Qi.Chen@windriver.com> het =
volgende geschreven:

> On 02/03/2014 10:01 PM, David Nystr=F6m wrote:
>> On m=E5n  3 feb 2014 14:43:53, Phil Blundell wrote:
>>> On Mon, 2014-02-03 at 13:58 +0100, David Nystr=F6m wrote:
>>>> An intended fix for below error message with core-image-lsb,
>>>> Sending this as an RFC since I dont really know what constitutes
>>>> a RRECOMMENDS vs. RDEPENDS.
>>>> Is this clearly defined somewhere ?
>>>> Below should be an RDEPENDS, no ?
>>>>=20
>>>> INIT: version 2.88 booting
>>>> Starting udev
>>>> udevd[59]: starting version 182
>>>> /etc/rcS.d/S04udev: line 108: udevadm: command not found
>>>> /etc/rcS.d/S04udev: line 113: udevadm: command not found
>>>> /etc/rcS.d/S04udev: line 114: udevadm: command not found
>>>=20
>>> That depends (ha ha) on what the udevadm call in question is =
actually
>>> doing.  If udev is so badly broken without it as to be unusable then
>>> yes, it should be an RDEPENDS.  If udev will still work without then
>>> RRECOMMENDS is appropriate and the initscript should be tweaked to =
deal
>>> with it.
>>>=20
>>> p.
>>>=20
>>>=20
>>=20
>>=20
>> SNIP
>> --=20
>>   udevadm control --env=3DSTARTUP=3D1
>>   if [ "$not_first_boot" !=3D "" ];then
>>           udevadm trigger --action=3Dadd --subsystem-nomatch=3Dtty =
--subsystem-nomatch=3Dmem --subsystem-nomatch=3Dvc =
--subsystem-nomatch=3Dvtconsole --subsystem-nomatch=3Dmisc =
--subsystem-nomatch=3Ddcon --subsystem-nomatch=3Dpci_bus =
--subsystem-nomatch=3Dgraphics     --subsystem-nomatch=3Dbacklight =
--subsystem-nomatch=3Dvideo4linux  --subsystem-nomatch=3Dplatform
>>           (udevadm settle --timeout=3D10; udevadm control =
--env=3DSTARTUP=3D)&
>>   else
>>           udevadm trigger --action=3Dadd
>>           udevadm settle
>>   fi
>> --=20
>> SNIP
>>=20
>> Does this classify as essential ?
>>=20
>> If essential, we either need to move udev-utils to RDEPENDS.
>> If not essential, fix the script to detect if udevadm is available.
>>=20
>> Br,
>> David
>=20
> Hi All,
>=20
> I think it's essential.
> Without 'udevadm trigger --action=3Dadd', the system start-up process =
may have some problem. I can recall that once I removed this line from =
the init scripts in my live image, the image could not boot up =
correctly.

This only happens in sysv mode.

> I think this patch is reasonable and I'd like to acknowledge it.

Only for sysv based systemd, for systemd based systems it isn't needed. =
So please confine your change to sysv.=

