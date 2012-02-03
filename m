Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1RtM9p-0001xm-Gd
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 17:38:41 +0100
Received: by obhx4 with SMTP id x4so4957608obh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 08:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=tbzAznR6iAs5JV3be42jssHY/c3hfdvHor/9CvVTwNk=;
	b=x2Jkw0nvet7tSCOSsX9jEK7SSE00OJimdOZlcLXIw8Nys7SZyNDxpC9O2XaDhnpCNR
	0Y7xeG7uWs71FordT8zRIzw9XkH0Xf4lcIv3m3iupOo7mxMnBCmF6jKEbA8b61Uwhh2y
	xq1A+mhblq0fI6/XSd5JL0FodqK/h3itK5F/4=
MIME-Version: 1.0
Received: by 10.182.160.2 with SMTP id xg2mr7187933obb.33.1328286643563; Fri,
	03 Feb 2012 08:30:43 -0800 (PST)
Received: by 10.60.39.39 with HTTP; Fri, 3 Feb 2012 08:30:43 -0800 (PST)
In-Reply-To: <1328284640.3895.118.camel@ted>
References: <cover.1328139407.git.nitin.a.kamble@intel.com>
	<1328284640.3895.118.camel@ted>
Date: Fri, 3 Feb 2012 19:30:43 +0300
Message-ID: <CAFZPMoZf-x5ff+n-1xFFC4wth=PO=Q6SizVnnWXd-tE_jZZc8Q@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [patch-v2 0/7] Various recipe upgrades
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
X-List-Received-Date: Fri, 03 Feb 2012 16:38:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 3, 2012 at 7:57 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-02-01 at 15:40 -0800, nitin.a.kamble@intel.com wrote:
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>
>> Just upgrades. And some cleanups as per comments on v1 pull request.
>>
>> Nitin
>>
>> The following changes since commit 8d4d9a15c4947e55ed217c6035e76fcff724e=
544:
>>
>> =A0 package bbclass: allow per package PRIVATE_LIBS (2012-02-01 15:15:15=
 +0000)
>>
>> are available in the git repository at:
>> =A0 git://git.pokylinux.org/poky-contrib nitin/upgrades
>> =A0 http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dnitin/upgrad=
es
>>
>> Nitin A Kamble (7):
>> =A0 byacc: upggrade from 20111219 to 20120115
>> =A0 gmp: upgrade from 5.0.2 to 5.0.3
>> =A0 gdb: upgrade from 7.3.1 to 7.4
>> =A0 quilt: upgrade from 0.50 to 0.51
>> =A0 python-dbus: upgrade from 0.84.0 to 1.0.0
>> =A0 bdwgc: change the PV
>> =A0 distro_tracking: update for current upgrades
>
> Merged to master, thanks (with the exception of bdwgc which was dropped)
>
> Cheers,
>
> Richard

This breaks
meta-openembedded/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bba=
ppend

S.


