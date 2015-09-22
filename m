Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 535F373243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 23:30:37 +0000 (UTC)
Received: by pacbt3 with SMTP id bt3so4102961pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=RzrZnXbg4wo4wiKT8fmGHx+GgwW9wIwSmOZJK5VJoyc=;
	b=SUvx2HCfuDQD5jTKhM7JxtkxQcCmuzEemROQ+j+kGkfL/qFIKakVRSC32gB5k3ueKO
	fCBu9Alpwx4dMiErxhpdlm5VOL+MLHiwgPDQtYYeSz8T1lhbAfg6+gHF/CTd3x4CnITd
	6kxyI4rDTEsMig4Asxvd2NPm3mp8Z78a3K6yISbVaHRoo5q1BJ/tixtX3R7ETPZhW+RT
	6ROF38/GythksEJpOH5cokTrphJwf7kqdsINlvCX9TYxJQ8oEzf6oYIoMi+/DVukH6MX
	IoeY/1JKh495vciJibbD3w7hkkmf+hMXNG6AlWj8i0w8viEkBhaLXSqievfdrJKoDJFc
	sL/Q==
X-Received: by 10.66.250.197 with SMTP id ze5mr24582496pac.50.1442964638360;
	Tue, 22 Sep 2015 16:30:38 -0700 (PDT)
Received: from [172.16.4.54] ([70.35.39.2]) by smtp.gmail.com with ESMTPSA id
	yi8sm4303397pab.22.2015.09.22.16.30.36
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Sep 2015 16:30:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKrmkLw2NQ8SWtSxjXCoUi-Xzmo+4xP3rYmfgkLCPQgqvw@mail.gmail.com>
Date: Tue, 22 Sep 2015 16:30:29 -0700
Message-Id: <19D16A42-669F-4A59-A1ED-D05C26508E00@gmail.com>
References: <560173B5.1000408@mlbassoc.com>
	<CAP9ODKpcr+YgGsvnRrsxy9Z2xsN5+KP4KiP-UvYij5eyN+1V1g@mail.gmail.com>
	<56019A6B.3070206@mlbassoc.com>
	<CAP9ODKpQDhCL9QbACgMRzV=N_Z7476a1_OxkhV7z0O7PfVd_rQ@mail.gmail.com>
	<5601A857.7060404@mlbassoc.com>
	<03ABB337-6070-4E3E-9D23-151E454481D4@gmail.com>
	<CAP9ODKrmkLw2NQ8SWtSxjXCoUi-Xzmo+4xP3rYmfgkLCPQgqvw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.3094)
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error building gdk-pixbuf-native
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
X-List-Received-Date: Tue, 22 Sep 2015 23:30:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 22, 2015, at 4:28 PM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> On Tue, Sep 22, 2015 at 8:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> its normal for build to use libraries from build host for native =
tools. If we want to abstract that
>> from host deps then creating a dependency on package-native is the =
way
>=20
> The point is this seems to be not deterministic. Sometimes this works,
> others it does not.


you can debug it by moving the dependency from default task to earlier =
or later task and see where its failing sometimes
some configure might run where we do not expect it to.
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


