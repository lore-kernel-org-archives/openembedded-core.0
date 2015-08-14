Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id D029B72A78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 14:12:57 +0000 (UTC)
Received: by igxp17 with SMTP id p17so12783838igx.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=f/xTs111SIAW8gSW9MfrQ01TqBbzymbIx7RWr2+A2WE=;
	b=bfcr6hrc9ghR7U0+Ivxlg53WvPmONvn052EtM5lyDLgpC+Qlm8IwhiqwQbH/h22eMf
	B3t3IArrmRm7/GjO7sCF6nmYawz9oBlFVJ1KPVd2rhhnLO0ZRbZEcef/ze62/n0yjdtr
	J4vYwNOCCsn1sxPE+FHfLoEGhcqcVnv1gTN527iyq7eenJG4Z5cCHOkC63TZeQUlGOFq
	1IgYD23wwrbRvAokYfZM835v3QX9wfe+BCIxxXDtziXe0nyTX4hD8sBVrI6roriUhrcN
	nDKrzCdnp5aursXO+24jTV3mMsgRewRzeBbo1koLSnCvIxxFJkpoiJrpQ5qi8CV4arbo
	C56A==
X-Received: by 10.50.112.166 with SMTP id ir6mr2602852igb.75.1439561577591;
	Fri, 14 Aug 2015 07:12:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 14 Aug 2015 07:12:28 -0700 (PDT)
In-Reply-To: <CALbNGRSbR5fzUUs7F+s_NqesaQa=XG5E8j4gEew845-tVpE3AA@mail.gmail.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
	<1b0885ef5ddc0c9caa947f2a444dc83d55591d3c.1439549437.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSbR5fzUUs7F+s_NqesaQa=XG5E8j4gEew845-tVpE3AA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Aug 2015 07:12:28 -0700
Message-ID: <CAMKF1sphA4gM6MAyZxUXMyh6BP9USRHvaKBivng7++0yXjQXrA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/22] libwnck3: add a recipe from meta-gnome
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
X-List-Received-Date: Fri, 14 Aug 2015 14:12:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2015 at 4:04 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Aug 14, 2015 at 12:55 PM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> libwnck is a dependency of epiphany
>>

send a patch to remove it from  meta-gnome as well.

>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>  meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>  create mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
>>
>> diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb b/meta/recipe=
s-gnome/libwnck/libwnck3_3.14.0.bb
>> new file mode 100644
>> index 0000000..6bc625a
>> --- /dev/null
>> +++ b/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "Window navigation construction toolkit"
>> +LICENSE =3D "LGPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec52=
2ec2"
>> +
>> +BPN =3D "libwnck"
>> +
>> +SECTION =3D "x11/libs"
>> +DEPENDS =3D "gobject-introspection-stub gtk+3 gdk-pixbuf-native libxres=
"
>> +
>> +PR =3D "r1"
> ^ Please skip
>
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

