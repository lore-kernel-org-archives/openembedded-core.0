Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S28ZR-00062L-V0
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 22:57:26 +0100
Received: by lagw12 with SMTP id w12so1176081lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 13:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.147.1 as permitted sender) client-ip=10.152.147.1; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.147.1 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.147.1])
	by 10.152.147.1 with SMTP id tg1mr13202374lab.22.1330379339320
	(num_hops = 1); Mon, 27 Feb 2012 13:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=YrY9taNM20UStaGg9Pc2A0p2fND4htej+NsxMAYE8xY=;
	b=x2on8SI7gkpjnRAoOgWdcVvb7hxDIwXfSUz8alw2Vtg97jQx7eBlr7bl+eesLZiA21
	jSEJ1p+LsdbHiyPKqo5cWFagXnl/IqiJ+cOG/GsuuCFfpYl2TUzKS3t7+7pO0MTxkFsh
	wtCKc3LV5LL3wMNVDReONren4uzwbeMRANhpg=
Received: by 10.152.147.1 with SMTP id tg1mr11009612lab.22.1330379339257; Mon,
	27 Feb 2012 13:48:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 27 Feb 2012 13:48:29 -0800 (PST)
In-Reply-To: <4F4BF66C.7000706@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
	<1917f9e3ccf8558491f0f671ba0525319cd3cf02.1330369680.git.sgw@linux.intel.com>
	<CAMKF1sq+4=fD2kyK2BHjuCcompqcb01ThpJak+59VvD1EycDxw@mail.gmail.com>
	<4F4BF66C.7000706@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Feb 2012 13:48:29 -0800
Message-ID: <CAMKF1srGBvkQSUtfcGvfko+bYprwu9GdiRQ1a0gZDEKizhieFA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/13] util-linux: Update to 2.21
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
X-List-Received-Date: Mon, 27 Feb 2012 21:57:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 1:32 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/27/2012 11:31 AM, Khem Raj wrote:
>>
>> On Mon, Feb 27, 2012 at 11:10 AM, Saul Wold<sgw@linux.intel.com> =C2=A0w=
rote:
>>>
>>>
>>> -CACHED_CONFIGUREVARS +=3D "scanf_cv_type_modifier=3Das"
>>> +CACHED_CONFIGUREVARS +=3D "scanf_cv_alloc_modifier=3Das"
>>
>>
>> can you explain this change ?
>>
> The configure setup changed from the "type" -> "alloc",

ok thanks


>>
>


