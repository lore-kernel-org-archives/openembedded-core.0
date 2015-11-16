Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 66FBE7665F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 11:20:09 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so175126450pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 03:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=dREfq6Zr6a95WkjdvSg+4l/1PJEFsmrcenGZZCxtiqc=;
	b=GokF/fv/6IsYcRJnhmO3wxavnLQquss/0c1j6UlTe50nEAaOmfCW3gpeLarIgao4Zm
	qynvryuNDkz5TilzkXAbf5hakpGOZE1Bo/tfI8EarzlqovIUOV5QrPTcJJrVW4vjbzNd
	3J/Zy/M35WxZ1jzSymbL2T3K/n/v1Hdt9xo74P0uGFZ1vg7AgdI2xs8spX3ZueSZrsx7
	lJ4+Fj6lezHzj0UnxNO3UT1OKjHzbxHQzQUCBNpN7VHkDjrgMrBJG5F3NM1xy99M8dTZ
	8JHj1BfOInvcL/RIFx8ffkm8LrmrDEkRY+x9kSB+NF8DT5feB/8KoSrATrfV8bi+xUJK
	nXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=dREfq6Zr6a95WkjdvSg+4l/1PJEFsmrcenGZZCxtiqc=;
	b=R5Pxb+vZBfli3QNoI0njcOFfOaFMVBH5nYejzcbaLfQJ9dE0f20SBdiLTDOM6VtaFd
	HtZbyhpSSZCsjThDjG5tqkNkDY0QptcgWs/qhSG+LViUQv3uxXP6YQVR3Gz3mgPSbK6m
	obfJ10iiOJiHMXac8GEWNo+v2/7jusk4CEwg4SOrjX6r1ZWbZHr0mzfGCiDxn6SYDJFY
	12Iau15TpwNkrytTh2MmXkmBCpRglZ4hCqw+Ht6OgFo7mMjBvv+jPFNIvF3622U4DBU+
	RxndnHiKGcDVHtEfwNVQ1VcQDWZ/bH3oCd8B2NqQgNioR/rI6K29d+kzJSpRR7Hbd0fI
	UL1A==
X-Gm-Message-State: ALoCoQmFekexjV579zRKOq94Gvwdq7a5hiWKolDOh8F9z0Txslaqm+eRmqGfZMlnjfw2f+CExTvW
X-Received: by 10.66.162.38 with SMTP id xx6mr52431850pab.57.1447672809661;
	Mon, 16 Nov 2015 03:20:09 -0800 (PST)
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com.
	[209.85.220.43]) by smtp.gmail.com with ESMTPSA id
	ph8sm35953623pbc.8.2015.11.16.03.20.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 03:20:08 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacdm15 with SMTP id dm15so172584540pac.3;
	Mon, 16 Nov 2015 03:20:07 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.68.229.39 with SMTP id sn7mr53784260pbc.164.1447672807773;
	Mon, 16 Nov 2015 03:20:07 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Mon, 16 Nov 2015 03:20:07 -0800 (PST)
In-Reply-To: <5649A542.8000307@linux.intel.com>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
	<4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
	<20151113114617.GB2567@jama> <5649A542.8000307@linux.intel.com>
Date: Mon, 16 Nov 2015 09:20:07 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpU_6sVy6iidiCem8Sb+EWAgNCVrvOPmOhr4_uMt174Hw@mail.gmail.com>
Message-ID: <CAP9ODKpU_6sVy6iidiCem8Sb+EWAgNCVrvOPmOhr4_uMt174Hw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Mon, 16 Nov 2015 11:20:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 16, 2015 at 7:43 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/13/2015 01:46 PM, Martin Jansa wrote:
>
>>>>> 1) or even better in a separate repo
>>>>
>>>>
>>>> To be honest, I had anticipated this being a separate meta-qt4 repo
>>>> myself. It
>>>> would be consistent with what has been done with Qt 5 and much earlier
>>>> with
>>>> Qt 3.
>>>
>>>
>>> Agreed.
>>
>>
>> I'm also fine with separate layer.
>>
>> Even better for me, I'll be less tempted to include it in my world
>> builds and to fix qt-mobility-* issues.
>
>
> Making a separate repository with this layer is even more disruptive, and
> complicates administration and maintenance. I'm not going to handle those.
> So I'll make a meta-qt4 layer under meta-oe, and it's fine if there is no
> official maintainer or ongoing build testing for it at least until someone
> volunteers to pick it up.

I will nack the patch to include it onto meta-oe; I also guess that
Martin will also nack it.

Make it another layer as suggested, please.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

