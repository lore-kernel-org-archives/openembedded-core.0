Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QpETL-0004nh-UF
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 09:05:32 +0200
Received: by vxj14 with SMTP id 14so1617489vxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 00:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=100Sea/k+UN38WpbPMjbs3+hm22fXGk2AhbKUfpC0Fg=;
	b=nQqYhjTxBB5fqX7MiiV7fyYMZRaRhq3fzsJ7qQGZMkUp1sooOfJOfWIoMFewR/Ez8Z
	8+IV6nv6fQxn72OUNo3IB8U/slK2v6Bmz/RiCv6zwG0NVhpGxsSu5c0DIYYoaO1NiGBu
	ZvqqNI0sikfxz7qmk1Vt4GPBz/9LBEdA+L+uk=
Received: by 10.52.182.7 with SMTP id ea7mr1885012vdc.361.1312527667190; Fri,
	05 Aug 2011 00:01:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.112.194 with HTTP; Fri, 5 Aug 2011 00:00:46 -0700 (PDT)
In-Reply-To: <58CFE121-CAEA-4ADD-AC97-6A03DDBA56C3@dominion.thruhere.net>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
	<4E3B8082.5010909@linux.intel.com>
	<DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
	<CABcZANmC-K=S7E0vL_4B1ys4VA_OV_r8CHpk2DNFDY0wU+7cCw@mail.gmail.com>
	<58CFE121-CAEA-4ADD-AC97-6A03DDBA56C3@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 5 Aug 2011 00:00:46 -0700
X-Google-Sender-Auth: 7Vjtocyz2McReuEZWLy5GLBZfB0
Message-ID: <CABcZANng3sQzeLdBrk47a9O-8EzWVkAN0W8EUKLXvMinLNRUVw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Fri, 05 Aug 2011 07:05:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 4, 2011 at 10:55 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 5 aug. 2011, om 07:51 heeft Chris Larson het volgende geschreven:
>
>> On Thu, Aug 4, 2011 at 10:48 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>
>>> Op 5 aug. 2011, om 07:32 heeft Saul Wold het volgende geschreven:
>>>
>>>> On 08/04/2011 10:28 PM, Koen Kooi wrote:
>>>>>
>>>>> Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende geschreven:
>>>>>
>>>>>> On 08/01/2011 04:08 AM, Koen Kooi wrote:
>>>>>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>>>>>>
>>
>> Can someone explain why this patch added the dependency to the global
>> RDEPENDS, rather than the RDEPENDS_<pkg> for the pkg in question?
>
> Ah, I assumed it was local to 'pkg' when iterating over packages.
>
> So should it be:
>
> rdepends = bb.data.getVar('RDEPENDS_%s' % pkg, d, 1)
>
> [..]
>
> bb.data.setVar('RDEPENDS_%s' % pkg, rdepends, d)

Perhaps it is, I haven't read the code that closely. I just noticed
that the pkg_postinst below did use the pkg suffix, and assumed.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


