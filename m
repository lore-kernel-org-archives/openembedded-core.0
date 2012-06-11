Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8j0-0000Fo-6Y
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:48:22 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:37:47 -0700
Received: by lbbgh12 with SMTP id gh12so2565576lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=0jziaTOl4uSx+mXHFu8ZxKSYaRCkZnc7Ke9rNSidFyk=;
	b=fdttkxtacr1rVKUBJ7m/im79G8WwCG+Q8rjLdRJ8O19Qp0w6ZNr8+3XPFidk6te6wQ
	Z8nnMsYaiik7n8N7VoABPbyeCqYbLEAEqi1HDWaDwnymvdAwm5eMjA/FfiGy5NEVY6Hz
	BZzDhSkDjGG2tOBTEoGW6ISL/dJYjXZUAEBB5MTZCK6/9l2E4oLQw+tVjeQNKGQWfmwC
	5A6Qt8Ja015+wyICzLCaaZLwsBfXuPyon05kltFzRGlMEhzmAnCMLCDOcbJQrhREeZDJ
	sufHciBRgivdsA68gO2pLZtLXMky+O7Bus2JmSxBQIsr6+/+ngILGaIeJRojduZf7Lsf
	u6VQ==
MIME-Version: 1.0
Received: by 10.152.125.236 with SMTP id mt12mr17916190lab.12.1339436265455;
	Mon, 11 Jun 2012 10:37:45 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:37:45 -0700 (PDT)
In-Reply-To: <4FB1AF54.1010905@windriver.com>
References: <cover.1336983006.git.liezhi.yang@windriver.com>
	<b82a9a6f0dd12135e53eedc75b0833ce7dfb3eab.1336983006.git.liezhi.yang@windriver.com>
	<50E29635-2A3A-4D94-8826-EBF3846E3638@dominion.thruhere.net>
	<4FB1AF54.1010905@windriver.com>
Date: Mon, 11 Jun 2012 10:37:45 -0700
Message-ID: <CAPhnLPDqOh=kJfzmMbUij=CUvjWq19VteyT44_1GkF-HS90Gsw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnbp0e37kpKSYvMRjXgQn2+88C/2lThjZjuQf/HvmiPIayj/Fwnymg0O4b75rl/WdwUo3sv
Cc: Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] rootfs_rpm.bbclass: save rpmlib rather than remove it
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
X-List-Received-Date: Mon, 11 Jun 2012 17:48:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2012 at 6:20 PM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
>
>
> On 05/14/2012 05:44 PM, Koen Kooi wrote:
>>
>> Op 14 mei 2012, om 10:11 heeft Robert Yang het volgende geschreven:
>>
>>> The rpmlib was removed when core-image-minimal,
>>
>>
>> Please replace 'core-image-minimal' with something like:
>>
>> =A0 =A0 =A0 =A0images that add "remove_packaging_data_files ; " to
>> =A0ROOTFS_POSTPROCESS_COMMAND
>>
>> That points out the actual problem instead of having to guess what
>> core-image-minimal is doing 'wrong' to need this patch.
>>
>
> Thanks, I've updated the commit message and pushed to:
>
> git://git.pokylinux.org/poky-contrib robert/inc_rpm
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drobert/inc_rpm
>
> The current message is:
>
> The rpmlib was removed when images that add
> "remove_packaging_data_files" to ROOTFS_POSTPROCESS_COMMAND, which would
>
> make the increment rpm image generation doesn't work in the second
> build, since list_installed_packages would get incorrect value in the
> second build, move the rpmlib to ${T} rather than remove it, and move it
> back when INC_RPM_IMAGE_GEN =3D1.
>
> // Robert
>

Merged into OE-Core

Thanks

-b

>
>>
>>> which would make the
>>> increment rpm image generation doesn't work in the second build, since
>>> list_installed_packages would get incorrect value in the second build,
>>> move the rpmlib to ${T} rather than remove it, and move it back when
>>> INC_RPM_IMAGE_GEN =3D1.
>>>
>>> [YOCTO #2440]
>>>
>>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>>> ---
>>> meta/classes/image.bbclass =A0 =A0 =A0| =A0 =A06 ++++++
>>> meta/classes/rootfs_rpm.bbclass | =A0 =A06 +++++-
>>> 2 files changed, 11 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>> index 4610731..b5fca32 100644
>>> --- a/meta/classes/image.bbclass
>>> +++ b/meta/classes/image.bbclass
>>> @@ -142,6 +142,12 @@ fakeroot do_rootfs () {
>>> =A0 =A0 # When use the rpm incremental image generation, don't remove t=
he
>>> rootfs
>>> =A0 =A0 if [ "${INC_RPM_IMAGE_GEN}" !=3D "1" -o "${IMAGE_PKGTYPE}" !=3D=
 "rpm" ];
>>> then
>>> =A0 =A0 =A0 =A0 rm -rf ${IMAGE_ROOTFS}
>>> + =A0 =A0elif [ -d ${T}/saved_rpmlib/var/lib/rpm ]; then
>>> + =A0 =A0 =A0 =A0# Move the rpmlib back
>>> + =A0 =A0 =A0 =A0if [ ! -d ${IMAGE_ROOTFS}/var/lib/rpm ]; then
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mkdir -p ${IMAGE_ROOTFS}/var/lib/
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv ${T}/saved_rpmlib/var/lib/rpm
>>> ${IMAGE_ROOTFS}/var/lib/
>>> + =A0 =A0 =A0 =A0fi
>>> =A0 =A0 fi
>>> =A0 =A0 =A0 =A0rm -rf ${MULTILIB_TEMP_ROOTFS}
>>> =A0 =A0 =A0 =A0mkdir -p ${IMAGE_ROOTFS}
>>> diff --git a/meta/classes/rootfs_rpm.bbclass
>>> b/meta/classes/rootfs_rpm.bbclass
>>> index 9039b21..fbc46c0 100644
>>> --- a/meta/classes/rootfs_rpm.bbclass
>>> +++ b/meta/classes/rootfs_rpm.bbclass
>>> @@ -154,7 +154,11 @@ EOF
>>> }
>>>
>>> remove_packaging_data_files() {
>>> - =A0 =A0 =A0 rm -rf ${IMAGE_ROOTFS}${rpmlibdir}
>>> + =A0 =A0 =A0 # Save the rpmlib for increment rpm image generation
>>> + =A0 =A0 =A0 t=3D"${T}/saved_rpmlib/var/lib"
>>> + =A0 =A0 =A0 rm -fr $t
>>> + =A0 =A0 =A0 mkdir -p $t
>>> + =A0 =A0 =A0 mv ${IMAGE_ROOTFS}${rpmlibdir} $t
>>> =A0 =A0 =A0 =A0rm -rf ${IMAGE_ROOTFS}${opkglibdir}
>>> }
>>>
>>> --
>>> 1.7.1
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Elizabeth Flanagan
Yocto Project
Build and Release


