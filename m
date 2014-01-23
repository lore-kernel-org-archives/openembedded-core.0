Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id AF0EE6C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:40:19 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so358559eek.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=5cPemuCpZyaNkpoaq/P1bDFg0ChehCv0Kh5TKYERZDU=;
	b=GkYteya9ONdcxJrvG5/9lVZO9qIeA1/pzpvtiNNZPn+xZdyywZik38e0FMy+6y0Nxr
	fpjH2FzXLO5ACh3XdWriDOJTmYjEDlLb+d5su4pbsXEMyOKbaNSXx/MeaBA9Gjiefqa4
	iLNlUf1kC7V/dDXEcSau58vGQJT97+xmSFpAS1c8fMb+LfVXFeKUsn4Kb9E3l/Y5+SDn
	w/pfheIjPU7G6lfK9TgYkwMjoX5Z4J/s5HTlhjKLcpvpO+hvsj9G+wdp15MsjOx5ty+l
	9CaHpFrAPAGzYrMmsBthNgryHTN+UTEjeBpJtwBJ8WkSO9GUbmelo3Hr5XjlrLv4jN57
	6phw==
X-Gm-Message-State: ALoCoQnzYUYNdm00tyhM0sqVjwTp+M2v7W8omASj8nuxdfloHYL6VONM4op1TbhYBNaKFQsI4Vic
X-Received: by 10.14.210.130 with SMTP id u2mr750928eeo.108.1390477220335;
	Thu, 23 Jan 2014 03:40:20 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id u7sm38661520eep.11.2014.01.23.03.40.19
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Jan 2014 03:40:19 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrUBJJJHTTBkRmq9j+yOrgGyUfX3TC5L69-ynaDbefo0A@mail.gmail.com>
Date: Thu, 23 Jan 2014 12:40:31 +0100
Message-Id: <B6D70178-C80E-4804-9786-47A67B9EB230@dominion.thruhere.net>
References: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoU+va9SbCJAfZ4HMkz+==Ec9va0KjJX07c4d4cZ90bjg@mail.gmail.com>
	<17C27E68-3F62-414D-A02A-8AD06ACE0B66@dominion.thruhere.net>
	<CAP9ODKrUBJJJHTTBkRmq9j+yOrgGyUfX3TC5L69-ynaDbefo0A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1827)
Cc: Koen Kooi <koen.kooi@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: actually install things
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
X-List-Received-Date: Thu, 23 Jan 2014 11:40:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 23 jan. 2014, om 12:36 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:

> On Thu, Jan 23, 2014 at 9:35 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 23 jan. 2014, om 12:31 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:
>>=20
>>> On Thu, Jan 23, 2014 at 7:06 AM, Koen Kooi <koen.kooi@linaro.org> =
wrote:
>>>> This failure was masked by having lz4 installed on the host system =
:(
>>>>=20
>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>=20
>>> Couldn't it inherit autotools?
>>=20
>> It's a handcrafted Makefile, not autotools :(
>=20
> No problem, it works as well.
>=20
> The do_configure checks for configure.ac/configure.in and it avoid you
> to handcraft do_install and like.

The recipes that used such a workaround have all been changed to remote =
autotools.bbclass over the years, so I'm not sure how encouraged it is.

regards,

Koen=

