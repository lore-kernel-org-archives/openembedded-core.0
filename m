Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SILLi-0007mi-Jf
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 16:50:14 +0200
Received: by wibhj13 with SMTP id hj13so1815637wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 07:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=2BN2jNmsnI20cfpjcRL9VcW4HWYtKsQpd3UOvnCcGEw=;
	b=eCb+LaB8qj3vlC4PsbbAvJjLDZDxtyRriRgJ43QBupQgCr6tdzpedBFQASg8JEXUQu
	jv+bIJM9o9TkP1xPqh0jdW3UfpGLpCYukj2TyrOf3YsWfQPXQ0KySDT91hgMLR9LAqVW
	B9t6cuMqT1s9rggvd/MvYjdZRHwtrspVr2CxoKPADFUCWnGJMAWAsPhq0foXK+sqExFT
	PYO+QI+nufFbiQ2QZoUhtU+n/q+kni+4shkwi974IRyfpuVwcEbj3utrQa+EF8/YSk1o
	5KxvWtzvXlO7nXKqf0uViGNyw1mXbzhPmB8J9l0O5aKs8XWuAaNEsO8OzxCFtFAWxR04
	C5zg==
Received: by 10.180.76.240 with SMTP id n16mr6553765wiw.10.1334241654208;
	Thu, 12 Apr 2012 07:40:54 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n8sm22212993wix.10.2012.04.12.07.40.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Apr 2012 07:40:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F86E8D9.30608@opendreambox.org>
Date: Thu, 12 Apr 2012 16:40:51 +0200
Message-Id: <0FAFCFF9-3DB3-46A9-9D7D-078126CCE1C3@dominion.thruhere.net>
References: <1334238147-15338-1-git-send-email-ml@communistcode.co.uk>
	<2244DB0D-6E70-4128-BBBA-EFABB2C489EE@dominion.thruhere.net>
	<4F86E3FF.3050905@communistcode.co.uk>
	<4F86E8D9.30608@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlpmaAF46Z2yD9PXqjqsePD6tMnEIBYNSdKLBYdjA7Mwj4XSmKj6t4fX0IOZCIxP6HuqYwG
Subject: Re: [PATCH] New recipe - jansson, C library for encoding, decoding and manipulating JSON data
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
X-List-Received-Date: Thu, 12 Apr 2012 14:50:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 apr. 2012, om 16:38 heeft Andreas Oberritter het volgende =
geschreven:

> On 12.04.2012 16:17, Jack Mitchell wrote:
>> On 12/04/12 15:08, Koen Kooi wrote:
>>> Op 12 apr. 2012, om 15:42 heeft ml@communistcode.co.uk het volgende
>>> geschreven:
>>>=20
>>>> From: Jack Mitchell<jack.mitchell@dbbroadcast.co.uk>
>>>>=20
>>>> Signed-off-by: Jack Mitchell<jack.mitchell@dbbroadcast.co.uk>
>>>> ---
>>>> meta-oe/recipes-support/jansson/jansson.inc    |    8 ++++++++
>>>> meta-oe/recipes-support/jansson/jansson_2.3.bb |    4 ++++
>=20
>    ^^^^^^^
>=20
>>> I'll ask the standard question: why is this needed in oe-core?
>>>=20
>>> regards,
>>>=20
>>> Koen
>=20
> I think there's a misunderstanding. Jack sent the patch to the wrong =
list.
>=20
> Jack, patches for meta-oe should be submitted to
> openembedded-devel@lists.openembedded.org, with [meta-oe] as part of =
the
> subject. See http://www.openembedded.org/wiki/Mailing_lists.

Or read the dang README in the meta-oe layer, it's called README for a =
reason.=


