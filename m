Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJ3Fr-0002z2-2Y
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 16:15:23 +0200
Received: by pbbro12 with SMTP id ro12so8935909pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=IKAeTiE8IqJv8XRSmsIieFLdq+FheWjTsmZWhAMjWRU=;
	b=yGBBXgfh4Nh9y0AniuuHbbs8kwMbC9oJsADR4S0Y8GufYTG/5vZJoJBi0jODBdlZqq
	1ytlywHc4fsOa7yTF1VZ69a4c/YkQZt85etm47DYNKvLm1NBzq783S0GmSwlc0c5zWKA
	AV4mKFj4lI/T6i3AAtDPVdP/aZDOEQ9ACC1F/1SSgwMDritYEZZqGxBSDAufBgnRs7sO
	8soUZYOCWuMPP/X9uK8vfWnLwyo/tiW0ioTZpphaZ9L2L4AxRtWWtWneAR5yFcKavujN
	siJA2b7YC2qI0XRB7SvhMJa9qlIU8eco5JmfbNlLhgw1mLTQVMJjWAmdYDiYUpxY0jMb
	95MA==
MIME-Version: 1.0
Received: by 10.66.72.132 with SMTP id d4mr44454128pav.61.1349186544043; Tue,
	02 Oct 2012 07:02:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Tue, 2 Oct 2012 07:02:24 -0700 (PDT)
In-Reply-To: <506AF2C2.7050703@cisco.com>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<CAP9ODKqk-xe4vgx1aLJKgnceBU5Ds3RGKCZYkEo3sCKc4OGZaQ@mail.gmail.com>
	<1349185900.32611.88.camel@phil-desktop>
	<CAP9ODKp3H99BCS3k0K890Eb6xtM2_8Toph4T2=Q1yNvZK5XeLQ@mail.gmail.com>
	<506AF195.9040008@cisco.com>
	<CAP9ODKrUDoCMHf7JX6g8r_PQgQypNTcZ_3T9=+Y=9D5D9_rmWQ@mail.gmail.com>
	<506AF2C2.7050703@cisco.com>
Date: Tue, 2 Oct 2012 11:02:24 -0300
X-Google-Sender-Auth: EQ_1w4sAuHI0pcMy5tZTntMXnzY
Message-ID: <CAP9ODKopJDM+ro+iNms83u1cvN+PihBr1cL-fOoz4AhJZbJuuQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 14:15:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 2, 2012 at 10:57 AM, Martin Erts=E5s <mertsas@cisco.com> wrote:
> On 10/02/12 15:59, Otavio Salvador wrote:
>> On Tue, Oct 2, 2012 at 10:52 AM, Martin Erts=E5s <mertsas@cisco.com> wro=
te:
>>> On 10/02/12 15:53, Otavio Salvador wrote:
>>>> On Tue, Oct 2, 2012 at 10:51 AM, Phil Blundell <philb@gnu.org> wrote:
>>>>> On Tue, 2012-10-02 at 10:42 -0300, Otavio Salvador wrote:
>>>>>> Or IMAGE_FEATURES +=3D "dbg-img" ;-)
>>>>> Where is that implemented?  I couldn't find any obvious reference to
>>>>> dbg-img in any classes.
>>>> Sorry by cause a missunderstanding ... I was just pointing to a
>>>> possible new feature you could add.
>>>>
>>> that feature is already implemented though, in dbg-pkgs. If you don't
>>> mean dbg-img should do something other/more than what dbg-pkgs does?
>> To build a separated tar with the symbols, not on the image itself.
>>
> With only the symbols? Or a separate image with symbols, side by side
> with the stripped one? In the later case you could just add a export
> IMAGE_BASENAME =3D "my-dbg-image" in the image recipe. If you mean with
> only the symbols I don't think we have any features for that right now.

I thought it being side by side.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


