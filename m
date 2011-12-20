Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rd5xs-00074v-Rt
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 21:07:08 +0100
Received: by lami14 with SMTP id i14so2615517lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 12:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=lreghlIQyNhLO20xbAPeY3ch+sIwkqzOvs5hHW5SBGM=;
	b=vTL0u9tiE76UH+Wt/vk/1OEilN1RM7ctasIR+ePrObAggVM9u8E6tnPdPNd1833rwS
	Oao5uJTHj+Lv5uTflkqWOWAAuWYkoMYTqBShJt8NZ+VxB3MjSSPYdgz9CGv56UOZfZ6s
	Q9B68tq+p5Gev9yontoCZj6kCr6pcjapq8A9g=
Received: by 10.152.128.98 with SMTP id nn2mr3411672lab.14.1324411204296; Tue,
	20 Dec 2011 12:00:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.10.3 with HTTP; Tue, 20 Dec 2011 11:59:33 -0800 (PST)
In-Reply-To: <4EF02CDA.8070707@eukrea.com>
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted> <4EE8E607.5080207@emagii.com>
	<CAMKF1sqgzc=RK4G2yMahvFrTAGSwH40fxjCy=tifrMU=isdO+w@mail.gmail.com>
	<4EF02CDA.8070707@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Dec 2011 11:59:33 -0800
Message-ID: <CAMKF1soiqXt3dcJea5o=54bTaJNGUxRDHBoHe6TWa-hEx=AgHw@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
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
X-List-Received-Date: Tue, 20 Dec 2011 20:07:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2011 at 10:36 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi, Khem,
>
> Le 14/12/2011 19:38, Khem Raj a =C3=A9crit :
>
>> On Wed, Dec 14, 2011 at 10:08 AM, Ulf Samuelsson
>> <openembedded-core@emagii.com> =C2=A0wrote:
>>>>
>>>>
>>>>
>>> Not familiar with gcc internals, but just want to reiterate the point
>>> that the problem occured (the one I saw) only when I had
>>> BB_NUMBER_THREADS at a high value, so WHEN things are done seems to be
>>> important.
>>
>>
> Seems more complicated than this. A customeer reproduced it with BB_THREA=
D=3D2
> and PARALLEL=3Dj3 ... (I never reproduced in with BB_THREAD < 5)
>

Can you see when gcc-runtime was finished building and staging w.r.t
to the failing app

>
>> could you test out this patch in your configuration and see if you still
>> see the problem ?
>>
> I reproduced the problem with this patch and BB_THREAD=3D8 so this patch
> doesn't
> improve the current behaviour.

thats was my original expectation

>
> Eric


