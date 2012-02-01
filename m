Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RsbN9-0005fT-9r
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 15:41:19 +0100
Received: by ggeq1 with SMTP id q1so614932gge.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 06:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=f24uDEi7bDXQXALPQIkVjbrv94jXePyTHYHL7pfWPvY=;
	b=kYyaRAQ3+g5+Fy659Ta9N441Fcqpy36eEhNbGJdw2yDPA+zx6AS8lpz+1dhvvZWiDd
	Rx3wMrYgwuk9F+lPi9xZGK91jszQ2rvkq91JQ1fGIMITOTRNuocCTAfAj/Ej3k6yqBrS
	X4pgR95s27L9UaVkT7D+5Y+T4yx0r3WQ99fig=
MIME-Version: 1.0
Received: by 10.182.11.6 with SMTP id m6mr4027501obb.74.1328106803808; Wed, 01
	Feb 2012 06:33:23 -0800 (PST)
Received: by 10.60.3.228 with HTTP; Wed, 1 Feb 2012 06:33:23 -0800 (PST)
In-Reply-To: <20120201111100.GA12344@ad.chargestorm.se>
References: <1327957970-15159-1-git-send-email-steve@sakoman.com>
	<4F27108D.4090303@linux.intel.com>
	<4F2715ED.9030109@linux.intel.com>
	<CAOSpxdajJLZSuzZS5qb4UPpjuS55ZWB=RR3a0oi9hNDF8J++Fw@mail.gmail.com>
	<4F272E1A.6040702@linux.intel.com>
	<CAOSpxdZsOeOWuB5EcjFf5cN6kkMWzAaWXYue5m2OX_jwWQZEfw@mail.gmail.com>
	<4F275EB2.1020308@linux.intel.com>
	<CAOSpxdYTX7-CAxEe=7TiFV3QN_0M_LTFfgA8nq-YS3Q7zk+a3A@mail.gmail.com>
	<20120131074216.GB4166@ad.chargestorm.se>
	<CAGDS+nmGBsC8r6yTYaSzNyDuF61A1jLL+Q+rJpDM4kb8ufAYWA@mail.gmail.com>
	<20120201111100.GA12344@ad.chargestorm.se>
Date: Wed, 1 Feb 2012 06:33:23 -0800
Message-ID: <CAGDS+nnSuBkSroUKs_aZg57woN5qjFwDW29U-bnpJMZS62SbPQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/3] zypper: support signed repositories
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
X-List-Received-Date: Wed, 01 Feb 2012 14:41:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2012 at 3:11 AM, Anders Darander <anders@chargestorm.se> wro=
te:
> * Steve Sakoman <sakoman@gmail.com> [120131 17:50]:
>> On Mon, Jan 30, 2012 at 11:42 PM, Anders Darander <anders@chargestorm.se=
> wrote:
>> > * Steve Sakoman <steve@sakoman.com> [120131 06:32]:
>> >> On Mon, Jan 30, 2012 at 7:23 PM, Saul Wold <sgw@linux.intel.com> wrot=
e:
>> >> > On 01/30/2012 05:39 PM, Steve Sakoman wrote:
>
>> >> > I will wait to pull this until I hear back from you with another pu=
ll
>> >> > request. =A0Thanks for digging into this, better to get it solved n=
ow then
>> >> > figure it out later that we missed a GPLv2 dependency.
>
>> >> I'll do a build with the libzypp RDEPENDS change and verify no issues=
,
>> >> and then a test build with the gpg2 -> gpg change and verify that too=
.
>
>> >> If it works, then that patch should likely get bundled with the
>> >> introduction of a GnuPG V1.4.10 recipe import from oe-classic.
>
>> > I think you'll have to modify the oe-classic recipe to use GnuPG v1.4.=
7,
>> > as it seems that GnuPG was relicensed to GPLv3 in 1.4.8... At least th=
at
>> > was the conclusion I came to when I looked at this last summer.
>> > (Unfortunately, I didn't have time to work through it).
>
>> This makes me wonder whether libzypp/zypper is an appropriate long
>> term choice for those who want to avoid GPLv3.
>
>> The zypp project obviously made the choice to switch to GPLv3 years
>> ago and it will be an ongoing problem to try to support old versions
>> with GPLv2.
>
>> Perhaps yum would be a better choice for the GPLv3 averse, since IIRC
>> it is still GPLv2.
>
> How does yum handle the signatures? Does it also do it using
> gpg/gpg2-commands? If so, we would probably have the same problem with
> yum as with libzypp/zypper. (Possible without having to patch gpg2 ->
> gpg, but as they are quite compatible, that should be a minor issue). We
> would still have problems using later GnuPG 1.4.x...

I don't know what yum does, and to be honest I'm not too motivated to find =
out!

I'm happy with zypp/zypper and that is the reason for jumping through
hoops to get full support for signed repositories :-)

Yum was merely mentioned as an option for those who can't deal with GPLv3.

> Or is yum (or any other package manager) using GpgME? (The library
> designed to make it easier for applications to interface with gpg). If
> so, it should be OK, as gpgme is licensed under GPLv2(+?)

No idea on this one either!

Steve


