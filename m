Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QU8ej-00009n-3o
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 04:38:05 +0200
Received: by wye20 with SMTP id 20so43842wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 19:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=/kSYXFaP8C3P4zHtuvAyuIDdYBg144JxQyPgNH76VWg=;
	b=O3pv43A+Ol6z1Ah6fjKvI7XFc+pcbJhMQN/wfx/c/H1bok6BlESLybXHXlidBFUoL1
	7s6MsJpz3654Awomyk9iuUhnr4vyNn+FlDp5UQcCXRd9d0kGw/6uZ2khI9PQcp5ThfFO
	qKTtwBesLB4OIQ+BfHJtKDL/vtpw98oWk3U6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=oY8ynjvQ4FHskl6STwdh5xbx0peAUuM6mKNypHITSzwAqJ+YQet21faYf9QJQFDCxy
	JNYAQuVRWQPEcpumgMZHiCYSCMS8Y60kdsznT7/71MA0W95sjhNAON9PQVTwfIlFg+YK
	WaPy5YzSQngj9pbcPigdkdLWS1bdoqxI0+3jg=
Received: by 10.216.239.67 with SMTP id b45mr4497391wer.44.1307500487114; Tue,
	07 Jun 2011 19:34:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.28.19 with HTTP; Tue, 7 Jun 2011 19:34:17 -0700 (PDT)
In-Reply-To: <4DEED78F.7090909@windriver.com>
References: <cover.1307438945.git.kai.kang@windriver.com>
	<46fc6e81f626e87f30a0d0980ed2b8fc3747e6be.1307438945.git.kai.kang@windriver.com>
	<1307440436.2529.4745.camel@phil-desktop>
	<4DEED78F.7090909@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jun 2011 19:34:17 -0700
Message-ID: <BANLkTinS_Vny8vz6TOJveKKgr7yqG6pzcA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Wed, 08 Jun 2011 02:38:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 7, 2011 at 6:59 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
> On 2011=E5=B9=B406=E6=9C=8807=E6=97=A5 17:53, Phil Blundell wrote:
>>
>> On Tue, 2011-06-07 at 17:42 +0800, Kang Kai wrote:
>
> Hi Phil,
>
> Thanks for your comment.
>>>
>>> -DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbhos=
t
>>> wifi nfs zeroconf pci"
>>> +DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbhos=
t
>>> wifi nfs zeroconf pci \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc-ipv6 libc-backt=
race libc-big-macros libc-bsd
>>> libc-cxx-tests libc-catgets libc-charsets libc-crypt \
>>
>> I don't think it is a good idea to invent a new "libc-ipv6" feature; you
>> can just use the existing "ipv6" one. =C2=A0This is probably true for so=
me of
>> your others too.
>
> eglibc needs to support ipv6 by default, but if other application such as
> iptables doesn't want to support ipv6, remove "ipv6" will also disable
> eglibc ipv6 support=E3=80=82

I think if one distro does not need ipv6 then having it in eglibc is not ne=
eded
too

> If it is ok to disable or enable ipv6 at same time, I will update the pat=
ch
> with "ipv6".
>
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# try to fix disable charsets/locales/loca=
le-code compile fail
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if 'libc-charsets' in distro_features and =
'libc-locales' in
>>> distro_features and 'libc-locale-code' in distro_features:
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('PACKAGE_NO_G=
CONV', '0', d)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('PACKAGE_NO_G=
CONV', '1', d)
>>
>> Does that actually work?
>
> Yes, it works. I can build eglic after uncomment the line in
> local.extended.conf to disable all configurable options. But remove the
> codes above, it will fail.
>>
>> p.
>>
>>
> Regards,
> Kai
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


