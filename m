Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SQMd8-0004Uw-7W
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 19:49:22 +0200
Received: by wibhj13 with SMTP id hj13so1371156wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 10:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=2EVsRwgh7N4sOji3CPMsNEyYV06YtCMCObbn29uWwh8=;
	b=QsxWwcMrhKkBnHmweFcffb1iJDJkN/C55xRLQs1/FmZaIa8VduutN3UGEglrp5gFWR
	uTQ+KmrjSoovVtPEEa6gWwk5QTEo17i0YyiwDpN27wSciw4Jm+zw0KvRjoKddSQLwrG5
	UnkIn1lnaATK9gr9GPi4RFisdPVj7xViAkB62aXYD/aBOSzBzQkG0gtpyl0wgLXRFm00
	PDrVbM2KF01iDREGwVADw6GkvKcv+M3Hi54tSZUDAgLKuTI3CXkHY3v0/EuplBoGx1hm
	ewwjJ/JLr7tojXfiqWpOp6tAGhLsj6cjinZiWJeIjwh815eY4KV+K5+IPfQ0ubjvKkci
	vyUw==
Received: by 10.180.8.231 with SMTP id u7mr14936031wia.9.1336153175393;
	Fri, 04 May 2012 10:39:35 -0700 (PDT)
Received: from [192.168.1.35] (39.Red-81-33-71.dynamicIP.rima-tde.net.
	[81.33.71.39])
	by mx.google.com with ESMTPS id l5sm2565070wia.11.2012.05.04.10.39.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 10:39:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <20120504173337.GA14692@denix.org>
Date: Fri, 4 May 2012 19:39:32 +0200
Message-Id: <1930BED7-1C2F-4F35-AEBA-F0C02C7F10A0@gmail.com>
References: <D54EB56C-3187-439B-BF54-4C4ACD76C8CC@gmail.com>
	<20120504173337.GA14692@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
Subject: Re: [meta-openembedded] [PATCH] networkmanager: silence systemd bbclass WARNING.
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
X-List-Received-Date: Fri, 04 May 2012 17:49:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Denys,

On May 4, 2012, at 7:33 PM, Denys Dmytriyenko wrote:

>>=20
>> -SYSTEMD_PACKAGES =3D "${PN}"
>> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
>=20
> That might be an overkill. I'm personally not yet very familiar with =
all the=20
> systemd specifics and not clear when to create ${PN}-systemd =
subpackage and=20
> when to just silence the warning...
>=20

Me neither :-) ,... but this is what the warning message, suggested be =
done.

It fixed the warning for networkmanager, though.

Best regards,

Elvis



