Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0yj2-0006L6-8S
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 18:14:32 +0100
Received: by lahc1 with SMTP id c1so3186957lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 09:06:09 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.23.100 as permitted sender) client-ip=10.112.23.100; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.23.100 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.23.100])
	by 10.112.23.100 with SMTP id l4mr1305466lbf.24.1330103169436 (num_hops
	= 1); Fri, 24 Feb 2012 09:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ZZcsc28LJLjdikpNhmqEPcVwnEV147FSh7qslp7xsjo=;
	b=ZoqSId4e8gu9TcUv8Wln/9qD/2Z6XbO6FGzi9nqjpK1tdFr+NbI2Zv8h1aldqHoKei
	EY514fbSOiyH3orJb221fbK3SHbbO9j9HPKA15cXhfjSKGFhweq8rJdBHa3Ixow9oiQJ
	XMgbOqkSlbvRhQdPt5LY3S/nj4Q3gHKzcF9Jo=
Received: by 10.112.23.100 with SMTP id l4mr1075844lbf.24.1330103169291; Fri,
	24 Feb 2012 09:06:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Fri, 24 Feb 2012 09:05:39 -0800 (PST)
In-Reply-To: <1330100504.5477.6.camel@ted>
References: <cover.1330053959.git.raj.khem@gmail.com>
	<bab8960657c873358e301979445c8fa4e81cc15f.1330053959.git.raj.khem@gmail.com>
	<1330100504.5477.6.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Feb 2012 09:05:39 -0800
Message-ID: <CAMKF1srNpxainQ2ZyZ=wKZmmuLdp_fEjyTr1JKMRGVO4X8QV2w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] default-distrovars: Add empty weak definition for DISTRO variable
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
X-List-Received-Date: Fri, 24 Feb 2012 17:14:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 8:21 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-02-23 at 19:33 -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/conf/distro/include/default-distrovars.inc | =C2=A0 =C2=A07 +=
++++++
>> =C2=A01 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf=
/distro/include/default-distrovars.inc
>> index 16b3108..dba204e 100644
>> --- a/meta/conf/distro/include/default-distrovars.inc
>> +++ b/meta/conf/distro/include/default-distrovars.inc
>> @@ -41,6 +41,13 @@ NO32LIBS ??=3D "1"
>>
>> =C2=A0# Default to emitting logfiles if a build fails.
>> =C2=A0BBINCLUDELOGS ??=3D "yes"
>> +
>> +# dummy distro related variables
>> +# they should be overridden by real distros
>> +# these fallbacks only serve the purpose of
>> +# oe-core standalone testability
>> +
>> +DISTRO ??=3D ""
>> =C2=A0SDK_VERSION ??=3D "oe-core.0"
>> =C2=A0DISTRO_VERSION ??=3D "oe-core.0"
>
> Why do we need this? The commit message tells me what you're doing but
> not why. I'm really getting frustrated with one line commit messages
> with no details.
>
> I don't think we should need this either, I'm not sure I like the
> change. The whole idea was OE-Core could run "distroless".
>

There is an error case I dont remeber how I obtained that where it
prints bogus value if DISTRO is not
defined at all but and empty DISTRO var is distroless in essence anyway IMO

> Cheers,
>
> Richard
>
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


