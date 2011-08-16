Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtSh7-0006Nc-96
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 01:05:13 +0200
Received: by vxj14 with SMTP id 14so447354vxj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 16:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ol0lBnGK0hFFDyp1LWXnDhimRKDH2pb8JZ3tNUwk/wg=;
	b=vJRu7mHhB/ICqj04P5OSe8+4P6RfYDMMR4p0lrvjlgxx2P1/WoSI32JOP6CP4kdvYW
	N/X4XH9zfbtiWUuJUtRoXQHC/aH6nI7bwRY23TkIIk1dS/zXlf8Fx290Qav1+PZc6kzE
	v76EhQMuK3N566pnFsXXi0xK43GsYbQSg4c3s=
Received: by 10.52.28.226 with SMTP id e2mr253029vdh.521.1313535635081; Tue,
	16 Aug 2011 16:00:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.158.133 with HTTP; Tue, 16 Aug 2011 16:00:05 -0700 (PDT)
In-Reply-To: <23CB1EF8-9ACB-4F95-BE6A-F084E515837A@beagleboard.org>
References: <1313525796-21604-1-git-send-email-agnel.joel@gmail.com>
	<23CB1EF8-9ACB-4F95-BE6A-F084E515837A@beagleboard.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2011 16:00:05 -0700
Message-ID: <CAMKF1spbd4NEHoP-aRk6qorPLR079F33JwH8c7BOZpwOwcBRZg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kooi, Koen" <k-kooi@ti.com>
Subject: Re: [PATCH] angstrom-task-gnome: Added gedit to task-gnome dependencies
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
X-List-Received-Date: Tue, 16 Aug 2011 23:05:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 2:24 PM, Jason Kridner <jkridner@beagleboard.org> w=
rote:
> I see the README says this should be on the OE-core list, but maybe this =
should go on the Angstrom list?
>

it should go to angstrom-devel list in anycase
if this is a patch against angstrom on top of oe.dev then it should go
to oe-devel list too. oe-core is not needed

> On Aug 16, 2011, at 3:24 PM, "Joel A Fernandes" <agnel.joel@gmail.com> wr=
ote:
>
>> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
>> ---
>> This patch can be applied =C2=A0after these have been:
>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-August/0344=
13.html
>>
>> recipes-angstrom/tasks/angstrom-task-gnome.bb | =C2=A0 =C2=A01 +
>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-ang=
strom/tasks/angstrom-task-gnome.bb
>> index a2f9fae..75e59c6 100644
>> --- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
>> +++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
>> @@ -41,6 +41,7 @@ RDEPENDS_task-gnome =3D " \
>> =C2=A0 gpe-scap \
>> =C2=A0 bash \
>> =C2=A0 tzdata \
>> + =C2=A0gedit \
>> "
>>
>> RRECOMMENDS_task-gnome =3D "ofono"
>> --
>> 1.7.0.4
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


