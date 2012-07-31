Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SwANs-0000zI-M0
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:13:04 +0200
Received: by yenl13 with SMTP id l13so5286372yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=/ccPgLI/Dq9hWRhffroM4ao7s9Fpk+2eQRtLXyI/lqQ=;
	b=szSjnG4di9ntCab/h78I2VdHZUOpee4/2xcPcDBSV+G7/PY+ONNlidl7+OBYO6joRa
	QkFTwqk5f/EVZAlZOi1dylIgrXCy1IS2L+onctvgUIL6MDbWsynQCYoVSm4S8O+0tFJM
	hBUf//HlJCvmVap9E+QbTOI5fzEKrQZnvyuu8clggDA/FqgDlP60R0FQfECBXsFhtaj/
	eisTPJ1hUQmKvE1pLk+e/BL0V4a1ZiO/MAJ8FkmYorKDfrBOfwk27N778xF24KxmktG5
	eDj6bSsCN836sv0LaMOsB0SZgi4cRrFlMBxPnTBQJ/6QH8/iTHgXKf8aI/3Fx+x93OfU
	yQAQ==
MIME-Version: 1.0
Received: by 10.50.219.226 with SMTP id pr2mr1551989igc.51.1343732486978; Tue,
	31 Jul 2012 04:01:26 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 31 Jul 2012 04:01:26 -0700 (PDT)
In-Reply-To: <20120731104203.GQ3261@jama.jama.net>
References: <CALbNGRR4weykX9t_XwJ6ACVoXS2SbogcxXLPAj7vpAC2+AQpww@mail.gmail.com>
	<20120731104203.GQ3261@jama.jama.net>
Date: Tue, 31 Jul 2012 13:01:26 +0200
Message-ID: <CALbNGRQq9VjWZ1NqKYfE33U=fe9XxK5yeyF9JVNFZJzzgwvj0w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: do_rootfs fails
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
X-List-Received-Date: Tue, 31 Jul 2012 11:13:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 12:42 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Tue, Jul 31, 2012 at 12:37:52PM +0200, Andreas M=FCller wrote:
>> Hi,
>>
>> after long journey mending recipes I now get with latest updates:
>>
>> |  * opkg_install_cmd: Cannot install package gnome-icon-theme-locale-fr=
.
>> |  * opkg_install_cmd: Cannot install package gnome-icon-theme-locale-en=
-gb.
>> |  * opkg_install_cmd: Cannot install package gnome-icon-theme-locale-de=
.
>> |  * satisfy_dependencies_for: Cannot satisfy the following
>> dependencies for gcc-runtime-locale-fr:
>> |  *  gcc-runtime *
>> |  * opkg_install_cmd: Cannot install package gcc-runtime-locale-fr.
>> |  * satisfy_dependencies_for: Cannot satisfy the following
>> dependencies for gcc-runtime-locale-de:
>> |  *  gcc-runtime *
>> |  * opkg_install_cmd: Cannot install package gcc-runtime-locale-de.
>>
>> I checked:
>>
>> * gnome-icon-theme-locale-* are empty
>> * gcc-runtime is not there
>>
>> Any suggestion what causes this?
>
> yup, test this:
> http://patchwork.openembedded.org/patch/33273/
>
Thanks that fixes first part but I still get

|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for gcc-runtime-locale-fr:
|  * 	gcc-runtime *
|  * opkg_install_cmd: Cannot install package gcc-runtime-locale-fr.
|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for gcc-runtime-locale-de:
|  * 	gcc-runtime *
|  * opkg_install_cmd: Cannot install package gcc-runtime-locale-de.
| ERROR: Function failed: do_rootfs (see
/home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-ful=
l-image-1.0-r0/temp/log.do_rootfs.18542
for further informatio

since I don't have gcc-runtime package

Andreas


