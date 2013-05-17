Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UdAru-0003Cg-CT
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 04:58:10 +0200
Received: by mail-pa0-f53.google.com with SMTP id kq12so3110351pab.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 19:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=BUiHwTn2cLi4BnEntCOemTercogo3CMpk/NOGRktaoU=;
	b=Fi9kBLzr2JqiiYq5XAOfOLJCI9A0dkU1J1nxR91QAVH8DHGcF4Qs1f9adddNRv/NVo
	sqCFhoBO2/7Mr98ZdrjbfhMxsgS4eBa4MQQWFwNIevKEa/wJF8DUtf4sCJ+VSYMZ7r44
	uG/n76iQ3JcoVZ0qzRi2JIVXr93ypiW5eSvYte8FAIBwq1j1fQClw0w0pOtmxCWN1U97
	FG2j36gtxrmELt2F/PpNyuRCvvYMr+aqNOf684QlZrYxRkt4oIcSsUVdEf2/Hh4gfYO/
	mAiN5sxH+SqGf+GcPDC+C6KvxP72cEcj4AdC2K0J+4pc3cthl9h3p17+ggnObw+6s6hH
	rpiQ==
X-Received: by 10.68.178.130 with SMTP id cy2mr21887503pbc.106.1368758390670; 
	Thu, 16 May 2013 19:39:50 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id yj2sm9099967pbb.40.2013.05.16.19.39.49
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 May 2013 19:39:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5195927E.2000604@windriver.com>
Date: Thu, 16 May 2013 19:39:49 -0700
Message-Id: <82DBF427-50AB-479C-B0FC-FB338ECFC3EA@gmail.com>
References: <cover.1367921762.git.liezhi.yang@windriver.com>
	<5195927E.2000604@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] image_types.bbclass: remove the obsolete images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 02:58:16 -0000
X-List-Received-Date: Fri, 17 May 2013 02:58:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 16, 2013, at 7:14 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:

>=20
> Ping.
>=20
> // Robert
>=20
> On 05/07/2013 06:26 PM, Robert Yang wrote:
>> The following changes since commit =
3472c1f7ab409cd91c1d4782d9e00880b84e3ae8:
>>=20
>>   grub-efi-native: Cleanup whitespace (2013-05-03 16:37:05 +0100)
>>=20
>> are available in the git repository at:
>>=20
>>   git://git.pokylinux.org/poky-contrib robert/rm_old
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drobert/rm_old=



looks like a good change=20

>>=20
>> Robert Yang (1):
>>   image_types.bbclass: remove the obsolete images
>>=20
>>  meta/classes/image_types.bbclass     | 6 +++++-
>>  meta/conf/local.conf.sample.extended | 3 +++
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



