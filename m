Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S379v-0006xi-1D
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 15:39:07 +0100
Received: by obqv19 with SMTP id v19so805908obq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 06:30:36 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.193.73 as permitted sender) client-ip=10.182.193.73; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.193.73 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.193.73])
	by 10.182.193.73 with SMTP id hm9mr2101588obc.29.1330612236827
	(num_hops = 1); Thu, 01 Mar 2012 06:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6ZL0GRZwJcz3TwN8GKRqv/aLboOKd7EYC+hZGiJVRFQ=;
	b=UgVrDpG9awB/Zn/Xtjc1h50zCMP4O9Q6haYJb0e97J7WJ/dUb5rXPXvAAhx8FutfdP
	ti9UsdGZ9poLscIC6QNLhJ4rRXSWSTqvTMJ3zb0hGAVgx7ieSsnpEkgax3eY7gMnYRmg
	TAoloM5boiYzK3nyyoC2F32lGHGfbHEX2axeI=
MIME-Version: 1.0
Received: by 10.182.193.73 with SMTP id hm9mr1816030obc.29.1330612236704; Thu,
	01 Mar 2012 06:30:36 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Thu, 1 Mar 2012 06:30:36 -0800 (PST)
In-Reply-To: <4F4F5079.1050608@gmail.com>
References: <CAGDS+nmNeyC3P+x+mk0g-qOKhkJ5pMNhX-ckBXr4F273poq2yw@mail.gmail.com>
	<4F4DB40B.6000300@windriver.com>
	<20120229084544.GH21882@ibawizard.net>
	<CAGDS+nnW6QBngHLVVn7AS=HU_DAdc6JQr9k=mrpu9mx=dLRLOQ@mail.gmail.com>
	<CAGDS+nnd_hZnxgX1JfKMksxmfREYjqEYFYN+Yhj=sgffUsCXNA@mail.gmail.com>
	<4F4F5079.1050608@gmail.com>
Date: Thu, 1 Mar 2012 06:30:36 -0800
Message-ID: <CAGDS+nnK9w9yM_=47=ra-XdHU=jTUqqAgtnbc6kzaLA+GZEVpA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: psuedo-native strangeness on 64 bit build machine
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
X-List-Received-Date: Thu, 01 Mar 2012 14:39:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 1, 2012 at 2:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On 02/29/2012 07:12 AM, Steve Sakoman wrote:
>> On Wed, Feb 29, 2012 at 6:22 AM, Steve Sakoman <sakoman@gmail.com> wrote=
:
>>> On Wed, Feb 29, 2012 at 12:45 AM, Petr =C5=A0tetiar <ynezz@true.cz> wro=
te:
>>
>>>> Now it's impossible to finish the build, the most noticeable failure i=
s gcc,
>>>> which fails for me in patching task due to the parallel build settings=
.
>>>> Changing the parallel settings back to 1 helps here also.
>>>
>>> I just tried building gcc and can confirm that it fails for me on the
>>> 64 bit build machine.
>>
>> For me, a -c cleansstate gcc and then a rebuild resulted in a
>> successful gcc build. =C2=A0I did not need to turn off parallel builds.
>>
>
> just add NO32LIBS =3D "1" to your local.conf

I can do that, but I'm still a bit confused why a clean build
succeeds, but a rebuild triggered by sstate hash fails with the 32 bit
lib issue.

Is this another case of a flawed recipe (like wpa-supplicant) that
can't be rerun because it modifies $S?

Steve


