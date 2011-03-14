Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzCAG-0003r8-OQ
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 19:06:51 +0100
Received: by fxm19 with SMTP id 19so3099644fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 11:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=u9xnpdqCXAD69p/Mx1oG2HuqH1oUgaphhjU95Vz2ETE=;
	b=oPFItwQ3CSAunnglnODf9yQSk/VK6iFhaCqjcKxwn+Lx+aFCAyAK29oNuylhnzx2Kb
	v61mDIgqR+2C+aKU91rasFdYiX8vZISe3O6ivn8EuvjrA7luErwBD9CkTLia6vevptrB
	wFeE2Vn65ZMcYeaibqQlG9dqmiNIJ1R3ga940=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Im5TmQWrK8CCRE8U2N0m7be/18e4BY6hBjVE+8or2cZHqq3LJqzVM+vSIWFFkri1Tf
	i5YdHP/l40pXYh5et/PohmwHYl8R70Aq9LnGL1lHscp8NIU+eqED4CmWjVpMnRI5igXj
	/GlCizC2MNmoe0Qrm8dTgS7QZgKN3Bmy/pP44=
Received: by 10.223.56.220 with SMTP id z28mr1356828fag.11.1300125741037; Mon,
	14 Mar 2011 11:02:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.41.89 with HTTP; Mon, 14 Mar 2011 11:00:27 -0700 (PDT)
In-Reply-To: <4D7E4660.5050808@mentor.com>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
	<1299958038-25216-6-git-send-email-otavio@ossystems.com.br>
	<AANLkTimiahf+8xJ_nNePkXzB3Lhton2+5JqquPmruN24@mail.gmail.com>
	<EC0F161F-7C09-42FD-929D-67914A54AC25@dominion.thruhere.net>
	<4D7E4660.5050808@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2011 11:00:27 -0700
Message-ID: <AANLkTik7cEA=Yw7fwkEbvOUeV28YseMjpexnBfQuM-jT@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Mon, 14 Mar 2011 18:06:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2011 at 9:46 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/12/2011 03:03 PM, Koen Kooi wrote:
>>
>> Op 12 mrt 2011, om 21:21 heeft Otavio Salvador het volgende geschreven:
>>
>>> On Sat, Mar 12, 2011 at 16:27, Otavio Salvador<otavio@ossystems.com.br>
>>> =C2=A0wrote:
>>> ...
>>>>
>>>> -PACKAGES =3D+ "libudev libgudev udev-utils"
>>>> +PACKAGES =3D+ "libudev libgudev udev-utils udev-consolekit"
>>>
>>> ...
>>>
>>> Koen, can you take a look on this change?
>>>
>>> It seems Angstrom is the only used of this version and seems better to
>>> not provide support for consolekit by default so adding it as
>>> recommends or suggests seems wrong to me.
>>
>> If someone can quickly explain me what it does then we can see what need=
s
>> to get changed. Without having looked into it I think adding
>> RRECOMMENDS_${PN} +=3D "udev-consolekit" to the consolekit recipe should=
 fix
>> most possible breakage.
>>
>> Adding oe-core to CC:
>>
>> What are the plans in oe-core for udev? There currently is a recipe
>> overlayed in meta-oe because I haven't had time to look into the differe=
nces
>> between the oe-dev and oe-core version. If we're going to touch udev we
>> might as well do it properly :)
>
> Not sure off hand yet, but udev is one of the things we might need to kee=
p a
> few versions around of, depending on how far back we want to support kern=
els
> out of the box.
>

I would think this should be recommended into BSP layers then

> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


