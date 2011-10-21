Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHEHt-0001mv-HS
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 14:33:25 +0200
Received: by bkat8 with SMTP id t8so5048833bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 05:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CWb/R1RlO0mZI3pi5Lr/h9rFt1OD5ZsYxzImgmSbDMo=;
	b=KAlUaVMLzHN9CbIY8gTOdzmePS3iKjWTrrA6VY1irWd7lFg31cVi+XixN2tVyviorC
	/kVjG0orGdpstutQ746XwXo4QEmAHZMnw5qlgZK7hVfw3yn4P7t0gQWPruek/3GbWq1q
	mJU2iN5hrxyNqvsQzONo3SDjB6L/GaFH1N12k=
MIME-Version: 1.0
Received: by 10.204.156.1 with SMTP id u1mr10670669bkw.18.1319200052226; Fri,
	21 Oct 2011 05:27:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Fri, 21 Oct 2011 05:27:32 -0700 (PDT)
In-Reply-To: <CAMKF1sqpvqZ4cOg4jceaB9P6HMTcZqhYVFG1SqZxN4Um3G1fAA@mail.gmail.com>
References: <cover.1319167843.git.otavio@ossystems.com.br>
	<5980062f84b228fa8977cf3f14c064192ba91eee.1319167843.git.otavio@ossystems.com.br>
	<CAMKF1sqpvqZ4cOg4jceaB9P6HMTcZqhYVFG1SqZxN4Um3G1fAA@mail.gmail.com>
Date: Fri, 21 Oct 2011 10:27:32 -0200
X-Google-Sender-Auth: tV6Xq85twFk331p_qy5ZhnAAyJA
Message-ID: <CAP9ODKqYn0WY2qsCttbdvCvJJnQpuKvmH79u4aAXs-XbQfCMYQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] bootimg.bbclass: add support to disable HDD image building
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
X-List-Received-Date: Fri, 21 Oct 2011 12:33:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 04:07, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Oct 20, 2011 at 8:31 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> =A0meta/classes/bootimg.bbclass | =A0 44 +++++++++++++++++++++----------=
----------
>> =A01 files changed, 23 insertions(+), 21 deletions(-)
>>
>> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
>> index a5ba3cf..eecc2bf 100644
>> --- a/meta/classes/bootimg.bbclass
>> +++ b/meta/classes/bootimg.bbclass
>> @@ -48,34 +48,36 @@ SYSLINUXMENU =3D "${HDDDIR}/menu"
>> =A0inherit syslinux
>>
>> =A0build_boot_bin() {
>> - =A0 =A0 =A0 install -d ${HDDDIR}
>> - =A0 =A0 =A0 install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage \
>> - =A0 =A0 =A0 ${HDDDIR}/vmlinuz
>> + =A0 =A0 =A0 # Create an HDD image
>> + =A0 =A0 =A0 if [ "${NOHDD}" !=3D "1" ] ; then
>
> please document this new variable NOHDD somewhere so people know how
> and when to use it

What do you suggests.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


