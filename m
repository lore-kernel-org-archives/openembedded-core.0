Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 761927E868
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 13:05:15 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x15so2296235wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 06:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=cG+HvkSjVWTFmg6m7m4R4yppYF7gy7+B41z0RC3kTgA=;
	b=MPs/LYS9562wybCMN/7j+cTlmeCIrjw7/YTDnGXzgcsccVAwYhIHDdhXRe7qmFLSjy
	lonwDhssha4k0eaULQWzhN5GMdbxuewZWOWVotz1DWt7ZuYW4KtUtIVbJbedoSrDg4aO
	wpKj1q+FlJ6kREEQqslx7Bi/Zomg1QcVIGp5cjJhjGRCez3Ue5ITR5jrXe9ybzZsMW1Y
	3I6+8EzpXuzlxUfxyfacP4inFZiDB6M26GAlNEhN44VF7mgCevuLXjmPvLSJfSmCoSh3
	PnmWpbrZ9p9dsY/8DOIgKfVJqrMOQYamS5n4UQH3i5kL5G33426/9YSA7u7JWi/v3In1
	RM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=cG+HvkSjVWTFmg6m7m4R4yppYF7gy7+B41z0RC3kTgA=;
	b=d/8iURZ8yNHGzR3VUIE95Vtw+GMV1GvX7bU1+Y/GfE872ToCKGd6O+Oh7Mq/9Digc2
	mt7hykrEaZkKJBqYLhAKyIT9WKoqfz8VFknST600o6Wft3heWhA6TfFrUFvjlD6svNpM
	hHJtH/8RCjr5XQDuiCztGSSWFwcW4nMphibJrGQRsfpDirf7/nMNx/7PxTa28ANXgA1K
	AaHEyf0r8l/StewVX+tB/U/gFyHzsZD6maBzxgYa+0nvnI6Hjgp1YMW+SFYTuz3MnMh7
	6TxZA7HJu1uhN85CblOWbi6nWzkvi+Dv+SMYIRAeehmqAM16LSx0luClkeuXk0tbjVTu
	jilg==
X-Gm-Message-State: APjAAAVxd4jjzmUFPbjkH/zBYwcg4+1cDEeLhrjsdBI0Ez3fYRcLCEmH
	bmBOvI/tufO4VDbnMhvXKLI=
X-Google-Smtp-Source: APXvYqz6/bhiCVDMTkik8CFrTu5AAKWzGqmWudWwpMswpBi75NqKN4K8nmUOnRu9SMNUTADXlgtlEQ==
X-Received: by 2002:a1c:c706:: with SMTP id x6mr7803188wmf.162.1560517516116; 
	Fri, 14 Jun 2019 06:05:16 -0700 (PDT)
Received: from ?IPv6:2a01:598:818e:6af7:c91:7af5:47fd:35df?
	([2a01:598:818e:6af7:c91:7af5:47fd:35df])
	by smtp.gmail.com with ESMTPSA id t63sm3358643wmt.6.2019.06.14.06.05.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jun 2019 06:05:15 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <f2348016a0867fd986bbe4965dcb88a5b652055f.camel@linuxfoundation.org>
Date: Fri, 14 Jun 2019 15:05:13 +0200
Message-Id: <99B005A2-CD21-4AA8-B960-54121098F850@gmail.com>
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
	<f2348016a0867fd986bbe4965dcb88a5b652055f.camel@linuxfoundation.org>
To: richard.purdie@linuxfoundation.org
Cc: kernel@pengutronix.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Fri, 14 Jun 2019 13:05:15 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I guess the patch needs a small tweak so that swrast remains enabled, but be=
comes optional. Then Marco can set packageconfig exactly as he wants.

The second patch is fine as it is, I think. Only qemu implements virgl devic=
e at the moment.

Alex

> On 14 Jun 2019, at 14.50, richard.purdie@linuxfoundation.org wrote:
>=20
>> On Fri, 2019-06-14 at 14:34 +0200, Marco Felsch wrote:
>>> On 19-06-14 13:11, richard.purdie@linuxfoundation.org wrote:
>>>> On Fri, 2019-06-14 at 14:04 +0200, Marco Felsch wrote:
>>>> Anyway thats
>>>> interessting. IMHO it isn't a good solution to rely on that fact
>>>> that
>>>> the package have some 'random' default enabled drivers. Should we
>>>> fix
>>>> the qemu configs or should I add:
>>>>=20
>>>> PACKAGECONFIG_append_qemuall =3D " swrast"
>>>=20
>>> The assumption is that swrast makes a good fallback and would be
>>> available in most cases.
>>=20
>> No I don't think that it is a good fallback, following my patch
>> description. If you are on a embedded device you want the hw-renderer
>> and not the sw one. A good example: After I updated my kernel, my
>> hw-renderer wasn't available anymore and my application didn't start.
>> Thats a very good indication that something went bad. With the swrast
>> enabled I wouldn't see that immediately.
>=20
> Alternatively, if swrast is available the system is more usable and you
> can then have a more usable system to track down the problem and fix
> it?
>=20
> My point is you can argue that both ways.
>=20
> I did read your commit message.
>=20
>>> I suspect qemuall might not fix beaglebone-yocto or some of the
>>> hardware BSPs.
>>=20
>> As I discribed in the patch description if you want that fallback you
>> have to enable it. IMHO this is the better way instead of to be a
>> 'smart' package.
>=20
> As things stand this patch will likely break a significant number of
> BSPs. This isn't acceptable.
>=20
>>> Its also assumed these packages are shared amongst multiple
>>> machines
>>> which may need different drivers.
>>>=20
>>> I suspect this means the defaults should be on but I am happy to
>>> have
>>> more PACKAGECONFIG options to control things for people who want to
>>> customise/micro-optimise.
>>=20
>> Optimising wasn't my main motivation. Avoiding 'random' performace
>> issues after a upgrade (kernel, mesa) was my main motivation. Do you
>> get me?
>=20
> I understand why you're doing it however I don't like the implications
> of the change which mean breakage for a significant number of BSPs, and
> the fact it breaks the way distros would use this recipe from a
> packaging perspective as its not marked as machine specific, nor should
> it be.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

