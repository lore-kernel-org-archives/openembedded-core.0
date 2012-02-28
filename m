Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2H1A-0002o3-L4
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 07:58:36 +0100
Received: by ghbz2 with SMTP id z2so985933ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 22:50:09 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.236.192.138 as permitted sender) client-ip=10.236.192.138; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.236.192.138 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.236.192.138])
	by 10.236.192.138 with SMTP id i10mr27053202yhn.3.1330411809256
	(num_hops = 1); Mon, 27 Feb 2012 22:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=EMT9+oRA1SvY38Ek2nMMINY9HcS6us69cqLKmy1fWu4=;
	b=QmSejuc20WAk7MSdYP7kLByC99giTnYjP9Mmqq1xq5Q682KSutmNCmDtDdadk9Q68j
	PURIAB0CBzDC3ieuK0JcqWbTmsSftuOjsGL2uxjton0e3MTrGfCGDDUfQF23DTsLRDdH
	g4FE/aIh7uG35xgm3A6YMM9vhp+7/3Zg1IK9k=
MIME-Version: 1.0
Received: by 10.236.192.138 with SMTP id i10mr20353603yhn.3.1330411809219;
	Mon, 27 Feb 2012 22:50:09 -0800 (PST)
Received: by 10.236.103.14 with HTTP; Mon, 27 Feb 2012 22:50:09 -0800 (PST)
In-Reply-To: <CAP9ODKo=z7tARxZ1yc0sFWf8nhnPn7px9WwyGOJHksC7shqTnw@mail.gmail.com>
References: <1330362610-12851-1-git-send-email-obi@opendreambox.org>
	<CAP9ODKr1faEWrO877gfeMkutp8_STOvNp81iA00uiC0w46A1qQ@mail.gmail.com>
	<1624619.CXJLtNuTG7@helios> <4F4C279E.8020801@opendreambox.org>
	<CAP9ODKo=z7tARxZ1yc0sFWf8nhnPn7px9WwyGOJHksC7shqTnw@mail.gmail.com>
Date: Tue, 28 Feb 2012 07:50:09 +0100
Message-ID: <CA+chaQdCwS+hwFrt+wcBts3B_jewa1mF_P8JpehySaCNwv-Qwg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] qt4.inc: depend on tiff
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
X-List-Received-Date: Tue, 28 Feb 2012 06:58:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 28, 2012 at 2:46 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Feb 27, 2012 at 22:02, Andreas Oberritter <obi@opendreambox.org> wrote:
>> In this case, bumping PR just wastes everybody's CPU cycles for no gain.
>> Anyway, here's an updated patch:
>
> Not really; let's say if you had done a typo on the depends list it
> would be unnoticed in autobuilders and commited onto master.

I see your point, but OEBasicHash will notice new dependency and then
it will be rebuild
at least by poky autobuilders (if they are building qt4).


