Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKKEG-0008Cc-S8
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 02:58:12 +0200
Received: by bwz5 with SMTP id 5so1005065bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 17:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZeOaZdm/kP5YK+B8PHRKM2yZkvgysNqnkslp6HuFutI=;
	b=WuXlW6wpUR6zSJsaKnDZlCmxTET6rseTd1bmIDtHEE+q+dXTKyXGBiNZOG/YWaBS8K
	jsDal4AMQiR3lDa4adAKSKcD41H0FtDlFemjfoMRwrQfvOrl0KhbMZTGb1F7/NToPXJP
	6OBLYX/Vs92aJcraPrkOkBa9+H2Jg5vZzZRtQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ENO9o7xCJAouXYWDylx4HZAJazKvE6fBJaMeZbeNeoLwuwbPbP2I8o1Gp7nQHVcg5X
	Mh/leiL8eAhgprs5JcgrEsNwm4R9em76JqIDDcGs9Aic3UZxLOktBq7Po39VxdT1qFiz
	mF7luW9PjgMPXKx1Mpb5uUOX1wrpTfSSAJfnk=
MIME-Version: 1.0
Received: by 10.204.40.70 with SMTP id j6mr471236bke.81.1305161725850; Wed, 11
	May 2011 17:55:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Wed, 11 May 2011 17:55:25 -0700 (PDT)
In-Reply-To: <4DC9C3B2.3050201@mentor.com>
References: <1305053706-19572-1-git-send-email-tom_rini@mentor.com>
	<BANLkTin42LTK6D9ui-C_SXmWiNLAz1T66Q@mail.gmail.com>
	<4DC9C3B2.3050201@mentor.com>
Date: Wed, 11 May 2011 21:55:25 -0300
X-Google-Sender-Auth: ZT3sGWbTxXeKpZzIm-r7n3Y3VGY
Message-ID: <BANLkTi=-aqvW4UgaC26r8gaVNJRo1VkBqw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] create-pull-request: Add -l location switch
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
X-List-Received-Date: Thu, 12 May 2011 00:58:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 20:01, Tom Rini <tom_rini@mentor.com> wrote:
> On 05/10/2011 12:18 PM, Otavio Salvador wrote:
>> On Tue, May 10, 2011 at 15:55, Tom Rini <tom_rini@mentor.com> wrote:
>>> Add a -l switch that takes an argument of either github or gitorious
>>> and will make the cover letter have a fill-in-the-blank of where the
>>> changes are on either github or gitorious.
>>
>> Another possibility would be to use git config interface to store
>> those. You might have something like:
>>
>> [oe-core-pull-request]
>> mode =3D github
>> user =3D foo
>>
>> or
>>
>> [oe-core-pull-request]
>> mode =3D gitorious
>> user =3D bar
>>
>> This could be used to fill the fields in a proper way since those are
>> predictable.
>
> If I had a good bit more time, I might re-write the script in python and
> parse .ini files (same syntax as gitconfig) so that lots of useful
> defaults could be saved. =A0But here's the real test, given that you're a=
n
> intended user, would you use the -l switch or just make a local change
> to the script like Martin showed?

(devel)~/hacking/el/openembedded-core% git config --add --path
oe-pull-request.mode github
(devel)~/hacking/el/openembedded-core% git config --get oe-pull-request.mod=
e
github

This does the trick! ;-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


