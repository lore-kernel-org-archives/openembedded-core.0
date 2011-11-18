Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RRQbK-0005YU-8d
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 16:43:38 +0100
Received: by eyd9 with SMTP id 9so3357914eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YxeAHql/dQP/+gdgq/u7Kp8ZYHOHxXQg5HJUR5/S8aU=;
	b=QGOfdTmhPc2kM5Jf6RB+NxCiH7+Wnf8p64FSSindx3a4fifBkPOnkhg2Ahb0Qj2p8C
	CpBlQIijlIkC7/I6S/OVovqyfM98cOj7c/vcqvN9cZyAz1SMbIcHtkSIzcKZxt4sCBHC
	5rjsZkfYIhMUGldCZDDI5y/Wwy0a98zA+l6Ws=
Received: by 10.180.96.166 with SMTP id dt6mr3644322wib.47.1321630626158; Fri,
	18 Nov 2011 07:37:06 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Fri, 18 Nov 2011 07:36:45 -0800 (PST)
In-Reply-To: <1321626565.15352.18.camel@ted>
References: <CABcZAN=BW7pRGFfQ5RgeX=rwWWFdWo3iJk2Z4zD1oOapTrpdFQ@mail.gmail.com>
	<1321626565.15352.18.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 18 Nov 2011 08:36:45 -0700
X-Google-Sender-Auth: vKBrBUPUzc06Dtn23vpeSMPTnsI
Message-ID: <CABcZAN=mNmn5SJdAhOZ1otrT3OkTO4Cw91SZBecuHDL2H34pHQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: add a couple explicit vardeps
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
X-List-Received-Date: Fri, 18 Nov 2011 15:43:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 7:29 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-11-16 at 14:17 -0700, Chris Larson wrote:
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> ---
>> =C2=A0meta/conf/bitbake.conf | =C2=A0 =C2=A02 ++
>> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 0d6b3b8..c158c61 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -506,6 +506,7 @@ DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types"
>> =C2=A0FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
>> =C2=A0DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} =
-pipe"
>> =C2=A0SELECTED_OPTIMIZATION =3D "${@bb.data.getVar(['FULL_OPTIMIZATION',
>> 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD', 1) =3D=3D '1'], d, 1)}"
>> +SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZATI=
ON"
>> =C2=A0BUILD_OPTIMIZATION =3D "-O2 -pipe"
>>
>> =C2=A0##################################################################
>> @@ -717,6 +718,7 @@ COMBINED_FEATURES =3D "\
>> =C2=A0 =C2=A0 =C2=A0${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEA=
TURES",
>> "usbgadget", d)} \
>> =C2=A0 =C2=A0 =C2=A0${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEA=
TURES",
>> "usbhost", d)} \
>> =C2=A0 =C2=A0 =C2=A0${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEA=
TURES", "wifi", d)}"
>> +COMBINED_FEATURES[vardeps] +=3D "DISTRO_FEATURES MACHINE_FEATURES"
>>
>>
>> =C2=A0# Make sure MACHINE isn't exported
>
> I merged this to master but your patch was line wrapped so I had to
> unmangle it...

Yeah, sorry about that. I was getting an inexplicable error from
send-email, so used imap-send, but forgot that the gmail web interface
line wraps (stupid thing, they need to add an option to disable that).
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


