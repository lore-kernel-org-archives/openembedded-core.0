Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 92A5461883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 20:19:05 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so2475169pbc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 13:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=wGoBBNnhAFsao+YMS8z7I71MFoZ1lHbg92HaLkyE8Zo=;
	b=OmjtRFmT2Zdk3mlgR1I0a63WeotFNJGHXWZVdNbzTrcpO9Kuhnw36BjioKyaM9eynp
	tjMw5YW7UvXRIG8QpVvtO5tYV+Uhvh7NccYlbs1ovxMWqDSFqH8otf2yIEtUvdJ2BKEY
	SUyVv8Jq/N6qZnPU5PyoeoJKX1B4iSomtBLecBWnsSQMP8xBjF24hGw9K8ogy+FOP4PV
	eP7UpkueX2jZXJsSrjP0IqNHCptTj/Eu68PEZ4/XhqI092dPnQqNz4cuTNc2dJzvjstl
	wPwCZtegyPKqPA0I3OBKsaE/U22LXQJiekvKCdndQs8j3i9q6lAzRHLT6cGPJh9pUTFT
	HAzg==
X-Received: by 10.66.246.66 with SMTP id xu2mr6279880pac.134.1375388346406;
	Thu, 01 Aug 2013 13:19:06 -0700 (PDT)
Received: from sa-nc-spg-213.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id lk9sm4683087pab.2.2013.08.01.13.19.04
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 13:19:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51F99839.4020003@linux.intel.com>
Date: Thu, 1 Aug 2013 13:19:03 -0700
Message-Id: <FEC3604F-BE31-4146-AA6B-A16CB22C8D3F@gmail.com>
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
X-List-Received-Date: Thu, 01 Aug 2013 20:19:06 -0000
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

Saul,

I was able to reproduce the incremental build issue. I have now fixed it =
and pushed a rebased branch to pull tree
in contrib. Please try it out

Thanks
-Khem


