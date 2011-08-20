Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qur8Q-0005uO-Dl
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 21:23:10 +0200
Received: by pzk2 with SMTP id 2so9270802pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2011 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=8bumcFA1Ro28VW7X7X96kt+01803Bj+KVbgZygLatYw=;
	b=VzHTWv1IGouilmdSzuRVl5yiN1/vDZrWHFrgAhuMPgQDgOSdpKAD5G8M8HkA0zf6jQ
	jasQPztpV4lu9RcYbpZ6y9i4EWNEEB5UDtoYciXVEIQ9stCa3zLObFN+1ERfGz4OCC+A
	M6AkZhq8VrVX0DOhVCq3Hcc6fj4rrehBBeZ+4=
Received: by 10.142.156.20 with SMTP id d20mr488866wfe.119.1313867906106; Sat,
	20 Aug 2011 12:18:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.40.168 with HTTP; Sat, 20 Aug 2011 12:17:56 -0700 (PDT)
In-Reply-To: <1313863112.24904.5.camel@lenovo.internal.reciva.com>
References: <91e2a59d20e1d1992691684fb2dd64a6405ec6e3.1313791350.git.dvhart@linux.intel.com>
	<fa0a22eee3461de38fc4b41a76f15980b78fd0bf.1313791350.git.dvhart@linux.intel.com>
	<4E4FDA4D.9020508@gmail.com>
	<1313863112.24904.5.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Aug 2011 12:17:56 -0700
Message-ID: <CAMKF1srwn4zKwDzysWD9PkwwvMu4xMME7XddUxbzPbRK6uVFnw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] tune: remove thumb flag from non-thumb cortexa8 tune variables
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
X-List-Received-Date: Sat, 20 Aug 2011 19:23:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 20, 2011 at 10:58 AM, Phil Blundell <philb@gnu.org> wrote:
> On Sat, 2011-08-20 at 09:01 -0700, Khem Raj wrote:
>> On 8/19/2011 3:06 PM, Darren Hart wrote:
>> > The thumb flag "t" appears to have been copy/pasted to all the
>> > PACKAGE_EXTRA_ARCHS tune variables. Remove it from the non-thumb versi=
ons.
>> >
>>
>> hmmm non thumb versions can run thumb packages. So I think its ok to
>> have t in EXTRA_ARCHS
>
> Er, really? =C2=A0If it can run thumb code, in what sense is it a "non th=
umb"
> version?
>
It was for armv7 pov here not for all arms like v4
with EABI, on cortex and interworking being mandatory it should run thumb c=
ode
thats what I meant.
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


