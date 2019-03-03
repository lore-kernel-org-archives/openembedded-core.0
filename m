Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id E19CC7CB20
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 18:19:16 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id b20so2403807edw.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 10:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=UdUSIJesK7IfJhcnYbjyiv3TwJCANbVFXfusMmha6BM=;
	b=QktQB8OhJqHG1ZC0XS4OLg6V5G4RsDLlCET+grJZrAYANveNYBzoHxRf2M0fd/bcJo
	opLT2yGcTwNXpcLEfRH0itKigktN9SxwngCJT0460nsH5XukeLy2nHLSjpx1jdpKQdb6
	nK1YiyO5SNRvALyZlEBnekC4Ky+cAheRxf5sWL9QTcXu4aU7LtpmbUfnfHq5/1aCtfK1
	1mOY4AByE/pkxhwtigavSRxssbFgLNbPK6HC3FCiP0IaO+9acoWTBXGiDvBF0t0/Z8H2
	83Xr/oj535NCg548nalQNqrkwHLg99aNdjbhlsuj3xtnvhopxr4OSanruL2DzRLfFZ0f
	l3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=UdUSIJesK7IfJhcnYbjyiv3TwJCANbVFXfusMmha6BM=;
	b=pG/muFwnslDKLKgfze+w0iGBxe2jXKAAZEePjf5wz+Ob1bduGcFDcOww7t6Cj78pyU
	iH+ulSb4yVhTdg9GBk7Wodwf42RqYiTiSQKLxIDF7chJC8uwwk/9ce/3TPKL7y1QpXJl
	A9xsEgZsS85N4x9Y5Ww3hp7xpI7NncWgcnvq9V/N4nuJ5FEgut53HcxOut6Z36WWeve8
	5bscrRhAweAcT26uq/6iCkYY+7VPlq66Sp+xMWa2nYrdVwp/J5b0w2HrT8YhxAxeS5XM
	Jl9XIT4R+2pGiAu4RsCdCIIwaqzPigUo0PiWd9q52Qk78OlmPh25jvgyUtS9OVWwbchV
	H/Aw==
X-Gm-Message-State: APjAAAVRhLzTUXFNa83apJLFseydDhIRgbsH3T5XyRyhi+zEetW0efPS
	mw4ofl0OWzQzDamQB3xZ1zFYOOQP
X-Google-Smtp-Source: APXvYqxgd+EAWbQX/BBvwRECMCjB6q4zlxvuSrlakbCfZldU2OHStyyfLn7lUX7NX338SbrfKG44nA==
X-Received: by 2002:a50:b16c:: with SMTP id l41mr12530809edd.209.1551637157169;
	Sun, 03 Mar 2019 10:19:17 -0800 (PST)
Received: from ?IPv6:2a02:8109:b5c0:1a5d:74f3:3c88:e592:590f?
	([2a02:8109:b5c0:1a5d:74f3:3c88:e592:590f])
	by smtp.gmail.com with ESMTPSA id 31sm1390812edr.7.2019.03.03.10.19.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 10:19:16 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <1506785607.339541.1551635862625.JavaMail.zimbra@inango-systems.com>
Date: Sun, 3 Mar 2019 19:19:14 +0100
Message-Id: <4E7327D3-AE28-45C7-8C3E-591ACBCBA830@gmail.com>
References: <20190303173808.12198-1-i.efimov@inango-systems.com>
	<CANNYZj9z-899=vC9upcBMX2azcKuNvr4qOMF6E6Hcw9+FtpVwA@mail.gmail.com>
	<1506785607.339541.1551635862625.JavaMail.zimbra@inango-systems.com>
To: Ivan Efimov <i.efimov@inango-systems.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] perl, do_install_ptest_base: add "--" into "tar" command line
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
X-List-Received-Date: Sun, 03 Mar 2019 18:19:17 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

No, I simply pointed out that the upstream-status line is unnecessary. The p=
atch itself is fine.

Alex

> On 3 Mar 2019, at 18.57, Ivan Efimov <i.efimov@inango-systems.com> wrote:
>=20
> Hi Alex,
>=20
> Do you mean "master" branch of OE-core?
>=20
>   I tried to reproduce the same bug on "master" branch, but fail.
>   I know, that the same bug with "--" missing in "tar" command line is pre=
sent in "master" branch,
>      but if it does not prevent success compilation, so i'm not sure, that=
 my patch will be accepted.
>=20
> Best regards,
> Ivan
>=20
> ----- Original Message -----
> From: "Alexander Kanavin" <alex.kanavin@gmail.com>
> To: "Ivan Efimov" <i.efimov@inango-systems.com>
> Cc: "OE-core" <openembedded-core@lists.openembedded.org>
> Sent: Sunday, March 3, 2019 10:40:43 PM
> Subject: Re: [OE-core] [morty][PATCH v2] perl, do_install_ptest_base: add "=
--" into "tar" command line
>=20
>> On Sun, 3 Mar 2019 at 18:38, Ivan Efimov <i.efimov@inango-systems.com> wr=
ote:
>> Upstream-Status: Pending
>=20
> This is used only in patches to upstream source, and so not needed here.
>=20
> Alex

