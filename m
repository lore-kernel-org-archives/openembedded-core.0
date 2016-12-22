Return-Path: <freesilicon@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B81C177667
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:45:36 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id j10so36588631wjb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/P8FAYgVHrlKtDtCSGUzXVs+9ldRYz6uYx+k5G+pO34=;
	b=Ux/dQg32J1CWy2eWGEYHnr8CY1oSigDOoU/fTgAmF3Xzd2zilnkHJl/tx9Ffr2AYf0
	EhY94o0pm126j12HS/5rzl9u45eG7PjN0T9Rd2k+ZlrxyNfLHMHYez/d+P45o3ZnxYkf
	Jp17l1PRTDGEZcA399VjzbQof/PSkwhxESZT9tB5nFINsumv92Ya7ZsDDmnEmiBZVHLY
	fuoQrx8kz+RDs/mnzNRTvlycPVd7clrzmM+xiIKHyb5NR/tGIs9uNf8CFl+etZoM8CW7
	iBHm/X5SkEOdch/oDp8mON/xuTtYTt3e3jY/TFGqpBqpo2MyuBq2K0Q4c1cqN2KzgHxf
	42RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/P8FAYgVHrlKtDtCSGUzXVs+9ldRYz6uYx+k5G+pO34=;
	b=NUXIuwz3loJU8+cDAsLUIs8xpCmgYuqOWSJ2/h6yHYLbxNIGSfR92uJzRZFmT7DHBd
	4f2j0KwFgO/EZK4OyzL8VLHRgqCgDhhnYkX5SQCNHBruNG5m5xq/h727GRPpFljC9a8p
	O3RsmJ6N/GHnaIyodaPNLPGWHO4fIKXWIYfUMKQMdUB1C5/wWN0tLGw7MziHAJ+QPWpR
	WwbrcWpWy1DyLOcuZWf5nGCWdNBsiei/e9z6PEFtfsnbSuRe1cp6OPC8qFbnP4HXmgVz
	i9C9D8fh7tFBhPako00RIqUAu9i+7od7scN9o3jKSg3eVs8QLtKbaKWvHbkvCWiTpqEU
	2R2A==
X-Gm-Message-State: AIkVDXI59or0wIzUjYZTIUggEf8WQeadW8YfSm/SK9wXHs+KZP1bzrF5bc3LCnA8D7uuMA==
X-Received: by 10.195.12.1 with SMTP id em1mr8231561wjd.134.1482417937466;
	Thu, 22 Dec 2016 06:45:37 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	d8sm32499558wmi.21.2016.12.22.06.45.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 06:45:36 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Dec 2016 15:45:34 +0100
Message-ID: <5460018.mmGskV4KOr@crde-port-20.cahors.local>
User-Agent: KMail/5.3.3 (Linux/4.8.13-1-default; KDE/5.28.0; x86_64; ; )
In-Reply-To: <CAJTo0LY5hHkOfQuzSO-W6TjDFPXY5N=J0x5DKoCT1Rn2ZU+4TA@mail.gmail.com>
References: <20161220095122.11831-1-freesilicon@gmail.com>
	<20161222102320.15247-1-freesilicon@gmail.com>
	<CAJTo0LY5hHkOfQuzSO-W6TjDFPXY5N=J0x5DKoCT1Rn2ZU+4TA@mail.gmail.com>
MIME-Version: 1.0
Cc: "Plascencia, Daniela" <daniela.plascencia@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] rootfs: Modify RPM installation
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
X-List-Received-Date: Thu, 22 Dec 2016 14:45:37 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On jeudi 22 d=C3=A9cembre 2016 14:09:32 CET Burton, Ross wrote:
> Small problem: we always build rpm-native as we need it for some tools, b=
ut
> rpmlibdir is only defined in package_rpm.bbclass which doesn't have to be
> inherited.

I didn't know that rpm-native was built in any case, rpm being selected as=
=20
package manager or not.
=20
> This leads to just --with-path-database=3D being passed to configure.  Wh=
at's
> the behaviour of RPM when this happens? What does it default to?  If it's
> going to be safe (ie a sane default is used), please update the commit
> message to explain this.

Indeed, this can lead to undefined behavior. I can propose some solutions b=
ut=20
which one would you find better :
	- Setting a weak assignment for rpmlibdir inside rpm recipe
	- Setting a default assignment for rpmlibdir_class-native inside rpm recipe
	- Another option I didn't think of

> Ross
>=20

David

