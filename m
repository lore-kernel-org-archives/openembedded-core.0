Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 41B93772EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 21:45:23 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so4867028pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 13:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=sender:subject:to:references:cc:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=p77HjDSAf+LRSZFHYyXUczN4axnr32b2Rk230DzLh1s=;
	b=JVvm0GrEXNXzRh7z0pCfsx7HZEVgeSil/jGKOi3IHcx4WyDfLvgLYJGF2Q32gSOKuq
	j3SDBcKIm2GnyzLT7IMGTFLOG6THHkbAgfUbmqMg1vTBVPQxOpiOMrd5TR6YURYPzlYb
	+XafiuJs83EggpwR1PTqCQVts3Tkbp2M8i54M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to:content-type;
	bh=p77HjDSAf+LRSZFHYyXUczN4axnr32b2Rk230DzLh1s=;
	b=GpRsyJw13Y63MRTKKewuGPblOeNabcs3ACr9PjhlKoCTgt1jc+NI2N/P2p7b5L6Itn
	GkOr3DhbZHn1C2MkANIEya2+OfVxiyYV/HsuolL6XES2pW9flJRSwUbx+Bi/Vabmp4E1
	MTXkwEInSeyndIG78hVG59Y7DM9WqG2mChKoeOjhebgI38z4ltVxAsF7GYn8urm3uJEu
	tENfP/1QE9VpgoquW+cGG6jcCSjTrR1IeQawVqVKgAs/CA5vFDVaEhdGSyP/HPhmurAP
	NxXBgO1Z5oH5yXZWrP3su1RxkMr5EpxDez+p2AfV9M5WgrGD8/k1YyC4fWP6Iil6QrOL
	3Ogg==
X-Gm-Message-State: ALoCoQkAkAWprzzLtYuo72WllLPyKnZQ/Qf9/qhGwtPsE3wmPqeKE342PWVwQrfk0BZOsl6uzr1T
X-Received: by 10.68.65.74 with SMTP id v10mr35052961pbs.67.1447451124410;
	Fri, 13 Nov 2015 13:45:24 -0800 (PST)
Received: from [192.168.17.200] (50-39-160-18.bvtn.or.frontiernet.net.
	[50.39.160.18]) by smtp.gmail.com with ESMTPSA id
	d12sm10897965pbu.20.2015.11.13.13.45.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 13:45:23 -0800 (PST)
Sender: Michael Halstead <mhalstead@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
References: <56451D46.50707@gmail.com> <20151113115958.GD2567@jama>
	<056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
	<564658A0.60609@yoctoproject.org>
	<DC4D8315-D63D-495C-B3AF-2932584B319C@gmail.com>
From: Michael Halstead <michael@yoctoproject.org>
Openpgp: id=D1F2407285E571ED12A407A73373170601861969
Message-ID: <564659EF.8070606@yoctoproject.org>
Date: Fri, 13 Nov 2015 13:45:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <DC4D8315-D63D-495C-B3AF-2932584B319C@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: oecommit ml
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Nov 2015 21:45:28 -0000
X-Groupsio-MsgNum: 73428
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="0Wcumm3M0mrBOTl24e3Ksvp4kQgXb1bGP"

--0Wcumm3M0mrBOTl24e3Ksvp4kQgXb1bGP
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Bitbake is disabled with the note:

# interferes with patchwork sice it sends emails after the patches are
closed
# we could re-enable it if the mails went to someother ml may be
bitbake-commits

This happens because it was mailing bitbake-devel@lists.openembedded.org

We can mail openembedded-commits@lists.openembedded.org which would work
fine. Or I can create a bitbake-commits@lists.openembedded.org. Which is
better?

Michael Halstead
Yocto Project / SysAdmin

On 11/13/2015 01:41 PM, Khem Raj wrote:
>> On Nov 13, 2015, at 1:39 PM, Michael Halstead <michael@yoctoproject.or=
g> wrote:
>>
>> It seems git-notify was sending mail as "cia@cia.navi.cx" and that was=

>> causing the mail server to get added to blacklists so it was disabled.=

>> I've changed the script and re-enabled it for:
>>
>> openembedded-core
>> meta-openembedded
>> OpenEmbedded (but I don't know if we need it)
> bitbake too plz.
>
>> Michael Halstead
>> Yocto Project / SysAdmin
>>
>> On 11/13/2015 12:47 PM, Khem Raj wrote:
>>>> On Nov 13, 2015, at 3:59 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>>>>
>>>> On Thu, Nov 12, 2015 at 06:14:14PM -0500, Trevor Woerner wrote:
>>>>> It seems I missed some announcement. At first I thought I had been
>>>>> unsubscribed from the openembedded-commits mailing list (since I ha=
ven't
>>>>> received any emails on that list since about the end of September).=
 So I
>>>>> looked up http://lists.openembedded.org/pipermail/openembedded-comm=
its/
>>>>> and it seems to have gone quiet about that time too.
>>>> I've already asked Paul and Michael few times on IRC in last few wee=
ks.
>>>>
>>>> I haven't received any reply from Michael, adding him to To, now.
>>> I see that git-notify hooks have been disabled explicitly for all rep=
os in update.secondary file. thats why the messages are not being
>>> sent. We can enable them but I would like to know the reason they wer=
e disabled in first place. Since we do not have this under some
>>> sort of revision history, I can not find information for them as well=
=2E So we need this info before we enable them back.
>>>
>>>>> I liked being able to watch the commits to see what was going in, a=
nd to
>>>>> check if my patches were added (before sending "ping"s, without hav=
ing
>>>>> to "git pull" and search). Is there a new workflow for seeing what'=
s
>>>>> going in?
>>>> Yes, I find them useful too (e.g. to report issue with commit which =
was
>>>> recently merged) or in general to know that it's worth doing "git pu=
ll".
>>>>
>>>> --
>>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>



--0Wcumm3M0mrBOTl24e3Ksvp4kQgXb1bGP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWRlnvAAoJEH9hAclg9EfIS5IH/A7v2F8Xw0ZRE4dMGVXPJuzw
FQI/dVubXFbkzZssUZukplDXPiZIF4er2oZu9uUSw0doTtxm1x9PQHezIBb4rKKk
/uUIabLb/9bBhJQK35jsPpsOcgTvf3iyKEMm+XPyRlbClREbIYAdYZfe9AkDhuc5
G4rnVet6r0/BKi14uSFtLPV4qCEL1YRjh+1FBCPoxZaU0PA/3I5XHNb36x1FwTww
gVktgT4GPvMTeWB2F8nQLfzpymg1BQ1qkN6eWl0EGJmmzhDVK3q6qfXMOQHWPaFz
uHBMqNhY62o+GxCRWrkgXVxz6qIiIGy3Zv5KYts9tkp+2GsILY65HbX+oig9Bp8=
=oi0p
-----END PGP SIGNATURE-----

--0Wcumm3M0mrBOTl24e3Ksvp4kQgXb1bGP--
