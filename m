Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id BB23E610CA;
	Thu,  9 Jan 2014 16:37:24 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id p5so2328147vbn.25
	for <multiple recipients>; Thu, 09 Jan 2014 08:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=2eUD36M/z4RdiijCn4aV+CNysRkrKIp8bOKrs+rFEiM=;
	b=keIidRVMStnhjlaX4HQ7Vlfcld1AK5upfvma0hjaDJmofrdN5Op+ekB8S3X2zmI/J9
	jcLbsIUaLi+NsDsRfzCzhhaMlo22Gw30pqXX56JXK7EOD2kGXP8dQ2caCZq7tO6SMi53
	eU8Mtwq6CmsVDyMVlgCWyOFQd5NxOJErLmq5L8ejTGcUbgW88gSaIypic3WSfFSuiKoV
	FyBuMtOkpmzUFUPtyc5+RQ8lUt3ur27Bjv8wozC6woJ3c4fcB9kkhBWqsnqRTZd7JCu2
	pQqY0sf9IfsDvhzLP9Af0OGCW9Oxmc7Dvr8ihljKEzXehXi/M0BRwqonvAS+2O0/zGB2
	KpyA==
MIME-Version: 1.0
X-Received: by 10.52.57.194 with SMTP id k2mr2652823vdq.41.1389285444184; Thu,
	09 Jan 2014 08:37:24 -0800 (PST)
Received: by 10.52.106.202 with HTTP; Thu, 9 Jan 2014 08:37:24 -0800 (PST)
In-Reply-To: <20140109152308.GI3709@jama>
References: <20140109144626.GG3709@jama>
	<CALbNGRQ5jDLUA80jmXeoHU8g-0k04UwgXGtdjL3xTJdG6heSKg@mail.gmail.com>
	<20140109152308.GI3709@jama>
Date: Thu, 9 Jan 2014 17:37:24 +0100
Message-ID: <CALbNGRSjqo1+03hjQxeKN5aPFpGWK0PZv9YgR2NNcqHVhXZhGQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2014-01-09
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
X-List-Received-Date: Thu, 09 Jan 2014 16:37:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2014 at 4:23 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Thu, Jan 09, 2014 at 04:12:52PM +0100, Andreas M=C3=BCller wrote:
>> On Thu, Jan 9, 2014 at 3:46 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> > http://www.openembedded.org/wiki/Bitbake_World_Status
>> >
>> > =3D=3D Failed tasks 2014-01-09 =3D=3D
>> >
>> > =3D=3D=3D common (6) =3D=3D=3D
>> >     * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb,=
 do_configure
>> >     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_=
git.bb, do_fetch
>> >     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do=
_compile
>> >     * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4=
.bb, do_compile
>> >     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb,=
 do_compile
>> >     * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile
>>
>> I have problems with qtwayland too and think that I am close to
>> understand what's going on (on 5.2 branch). Where do I find logs for
>> this error?
>
> Links for each machine are on the bottom of the e-mail:
>
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/...
>
> qtwayland builds for me fine with oe-core only and also in qt5-5.2.0 +
> webos-ports, so I haven't looked much into it yet.
OK - I can't find that in the logs - but anyway: I am working also on
5.2.0 and my error for qtwayland showed up as tons of multiple defined
GL data types as

'error: 'GLdouble' has a previous declaration as 'typedef GLfloat GLdouble'=
'

Reason was that I had GL-headers in my sysroot but qtwayland was
configured without wayland-egl / egl (it took me long to find out that
that wayland-egl is supplied by mesa..). So qtwayland tried to build
glx-compositor which does not work with GL/GLES headers in sysroot.
After building egl and wayland-egl, qtwayland configured fine and the
errors disappeared.

Andreas

