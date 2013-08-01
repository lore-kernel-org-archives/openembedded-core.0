Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0016C61883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 14:47:58 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id bi5so2212127pad.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=FWWBf8YOZpL5Pt1zj+10mq3Q5J061T2NZM+v/CmL6nk=;
	b=gG3gHws0tgEwzStmkdaLjsuCikouAh5lUqWI/5DHvqVTpm8GqGwLWW4+w/Kpn8i8mj
	Oh8xLiY93kwg5dLeKrl9CO0ThKmU3vo9OkdLC7QrTsRR64bHXhWUkh0TnOg4eX+9EGGP
	SZRhaJV602ztNFHZsFkDNHkPIafEY/8pW0TLDv0CkWQlptUmAkmfra2Lq1F8CVf3FNCj
	e6Bd8gCFgoeo3h0jHQav0INzynSEHrNQycwepmwTmOItooUZpDHSBJbNeKiAJFL8o19L
	zLayFpPiWkchAoy1B5YuK5Eiz1lC68QPuDccdOJEzgfwRgpYOw6Da6msUq5VLHhjWdsF
	4emQ==
X-Received: by 10.66.13.99 with SMTP id g3mr82710pac.51.1375368479806;
	Thu, 01 Aug 2013 07:47:59 -0700 (PDT)
Received: from sa-nc-spg-213.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id om2sm2174080pbb.34.2013.08.01.07.47.58
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 07:47:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51F99839.4020003@linux.intel.com>
Date: Thu, 1 Aug 2013 07:47:59 -0700
Message-Id: <0FFF5D30-5BE4-418A-8BA8-3EC9ACC1AB65@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
	<13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
	<51F9948F.1000908@linux.intel.com>
	<08E217DF-FA59-4DAB-BB7F-0369A4BB3165@gmail.com>
	<51F99839.4020003@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Thu, 01 Aug 2013 14:47:59 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jul 31, 2013, at 4:05 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 07/31/2013 03:51 PM, Khem Raj wrote:
>>=20
>> On Jul 31, 2013, at 3:49 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>=20
>>>=20
>>> Still seems to failing in Jinja, I wonder if the dependencies are =
correctly sinec it's nooking for native bits and the python3-native had =
not been installed yet.
>>>=20
>>>=20
>>=20
>> in my build from scratch several times, I never had this issue. Did =
you do an incremental build to get to this issue ?
>>=20
>=20
> Yes, most of my builds are incremental until I throw them against the =
Autobuilder!
>=20
> It seems that I also got a do_package failure, seems like it might be =
a host contamination issue
>=20
>> NOTE: DO PACKAGE QA
>> ERROR: QA Issue: python3: The compile log indicates that host include =
and/or library paths were used.
>>         Please check the log =
'/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/temp/=
log.do_compile' for more information.
>> NOTE: Checking Package: libpython3
>=20
> I attached my do_compile log.
>=20
> Sau!
>=20
> <log.do_compile>


Saul,

I have fixed the QA error too and pushed fixes and rebased the pull =
tree. Can you give it a try?

Thanks
-Khem



