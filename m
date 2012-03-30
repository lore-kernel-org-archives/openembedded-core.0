Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SDjrK-0007Hr-8u
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 23:59:50 +0200
Received: by pbcum15 with SMTP id um15so2067778pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 14:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=LHMNAaZ5bXsWwWAb1NH7vjgjxQ+u5u3WKXfXsS8XvYU=;
	b=nk43S3v9IOcMCTaeXs4rPCKFF+jeNRUtfSGx5KsmWlbVNDwRN/NP/MHmzaClKvXU+V
	JRIErQX2YovvYj2ZrY6SferUDdSIHfonjSivbh5rylLKoYrxx1LDt2M3oyaGl2Oy37gU
	16gpWw1GcfTSumtm7dOBf6zIoZvax/Vs9jWkL05A9AZItezSeS7YymdRG+LUdXQ5IbI4
	lsrSdEWFrU0Hax/4lHdcUkDn8eGXDJz8NAVAoiFwInP2k5HcL8KtOBz1OrXRvS/itefM
	DLFxT3oRbQkqiyS4u3JA+s6iyjOiIiIAbmKoojZabKFgD6foM6jqy/VCuCH2sVEk2Qd+
	PVyQ==
Received: by 10.68.229.73 with SMTP id so9mr563366pbc.163.1333144244701;
	Fri, 30 Mar 2012 14:50:44 -0700 (PDT)
Received: from [10.61.32.129] ([69.38.219.78])
	by mx.google.com with ESMTPS id w10sm3393154pbk.30.2012.03.30.14.50.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 14:50:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1333144186.18082.134.camel@ted>
Date: Fri, 30 Mar 2012 14:50:51 -0700
Message-Id: <29172D2A-CF64-4DFF-BE98-AAB8B131E3D9@dominion.thruhere.net>
References: <cover.1332952962.git.dexuan.cui@intel.com>
	<1333058859.18082.44.camel@ted>
	<3ABC0140-1A7C-45A2-A601-3D8BDCB839D6@dominion.thruhere.net>
	<1333144186.18082.134.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmcQVFl8eg4y2V4cJKuFhxheWECYZBd9SH5LpjXq1A8D1FTLKb0FFM4GGhRx8BDCGs4iPUL
Subject: Re: [PATCH 0/1] genext2fs: support large files and filesystems without using large amounts of memor
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
X-List-Received-Date: Fri, 30 Mar 2012 21:59:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 mrt. 2012, om 14:49 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-03-30 at 13:43 -0700, Koen Kooi wrote:
>> Op 29 mrt. 2012, om 15:07 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Thu, 2012-03-29 at 00:51 +0800, Dexuan Cui wrote:
>>>> Hi RP, Saul, Paul, Darren, Mark, Josh and joaohf and all, please =
comment.
>>>>=20
>>>> Let's figure out if this big patch is accepatable or not...
>>>>=20
>>>> With this patch, I can successfully create a 8.5GB .ext3 file with =
genext2fs.
>>>> The speed is slow -- I spent about 1.5 hours.
>>>=20
>>> If these patches solved all the problems and made things work
>>> wonderfully I'd probably say we'd take them. Unfortunately I don't
>>> consider taking 1.5 hours to build am 8GB filesystem "wonderful", =
its
>>> rather worrying and I don't think its performing any where need fast
>>> enough for our needs :(.
>>>=20
>>> Patching genext2fs at this point in the cycle is a rather risky
>>> undertaking too and I'm getting very concerned about this.=20
>>=20
>> The biggest issue I have with genext2fs is that it currently =
allocates
>> RAM for the complete image, which in my case will cause it to swap =
and
>> for other users cause it to crash, since image > (ram + swap). Fixing
>> the memory issue before the release would be greatly appreciated.
>>=20
>> What about putting it on the shortlist for backports after the
>> release? That should give us all more time to test it and eventually
>> get into the hands of stable branch users. Of course I'd still prefer
>> it to go in before the release and backport fixes :)
>=20
> I should point out one of the patches in this mega patch set is one =
for
> the memory issue.

Hence my mail :)=


