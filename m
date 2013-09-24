Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id B29F36C994
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:39:11 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so3953261pad.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 09:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=0AyjrXf2zg/PsdwxLibSdFqHQpb3rC2YucnvFHB8OKE=;
	b=B4PGJejoB45nT/o+Xu00wje2tpToqoeNhcU9+Mk07YZzHR3sVxlMcCgxkvrjz7logw
	0Xpcv4/4WW/WKQCzhduz4BZvHDFv0VtbVA+X5MvqrhzB7OXn21Mz2AydeLJyCOvClHLQ
	Cn///9LkqN23nfIsLocdc2xvxTGyffXy5S+STFu0Yy+8cPfGjd2bSlWPp5v7NyTDsoiA
	lKoMzHjmhKBakZiv2YCx2u4mLX2GcMBVSXYezNE6gavgMnroDc22O5OpEmU1tEoNAAXF
	McuDhqcXIlROxo8jrjFIFipXMarAJKeauHG2yR6tY9f1LI/MqiKSr45I55542IWyDSsn
	Iirw==
X-Received: by 10.66.146.42 with SMTP id sz10mr29369004pab.100.1380040753423; 
	Tue, 24 Sep 2013 09:39:13 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	xs1sm46869916pac.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 09:39:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Lb-kjzX_=zRLc5q67xG3tWM4hn5dztj2XDd1w2md_smJg@mail.gmail.com>
Date: Tue, 24 Sep 2013 09:39:12 -0700
Message-Id: <D9270C1D-FD75-474F-9288-655D4E40C612@gmail.com>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
	<CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
	<523501AC.4010208@linux.intel.com> <5237E49C.7090608@windriver.com>
	<CAMKF1sqDxGyVnrap0=Jsq=iMFGnXkupjuWnTSwxzBv8K4tqzPg@mail.gmail.com>
	<20130917103029.GA7313@jama>
	<CAJTo0LY0yOaFyn0+DiTgag2bJ4qJ5XM0-=Vz7EMN8ajXsseiiw@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF843C5198BB@ALA-MBB.corp.ad.wrs.com>
	<CAJTo0Lb-kjzX_=zRLc5q67xG3tWM4hn5dztj2XDd1w2md_smJg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1510)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Tue, 24 Sep 2013 16:39:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 24, 2013, at 9:34 AM, "Burton, Ross" <ross.burton@intel.com> =
wrote:

> On 23 September 2013 22:51, Slater, Joseph <joe.slater@windriver.com> =
wrote:
>>> Anyone else want to add a data point?
>>=20
>> I am the only user on the machine below.  I compiled twice, each way =
--
>=20
> [snip]
>=20
> Unless I'm reading that wrong, it looks like again its actually a
> small win to use -no-keep-memory.  Sounds like we should just add it.
>=20

yes indeed. Thanks all for chiming in.

> Ross


