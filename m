Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1Rw5HU-0000f2-Pg
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 06:13:52 +0100
Received: by obhx4 with SMTP id x4so4994958obh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 21:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=8ltOX6b3s+/SunLst8NEGnZV3OoASUT48g6B59Ym6co=;
	b=IeIaX4NDk5auEK+ybZlLwal8i6WlwtiV1/yY4ibeJjRyfqKlldyI3u41MsRHQHzA47
	rniuC5y4A6zy4OzaHn/wVyadpKIj45gZGHk9PppW8mVn9gZ5a64TnkXkE33O8XBVQ1TA
	+b80cXZDh8tG9wLdx1aDYCa8Lxqnmgxi+At9E=
MIME-Version: 1.0
Received: by 10.182.121.101 with SMTP id lj5mr5931530obb.39.1328936745110;
	Fri, 10 Feb 2012 21:05:45 -0800 (PST)
Received: by 10.182.80.10 with HTTP; Fri, 10 Feb 2012 21:05:45 -0800 (PST)
In-Reply-To: <CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
Date: Fri, 10 Feb 2012 21:05:45 -0800
Message-ID: <CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Sat, 11 Feb 2012 05:13:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Feb 7, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> Can you verify if you have a .la file in you sysroot?
>
>
> No its not there and thats the point we probably should learn to live
> with out it
> actually one of radical ideas I have is to get rid of all .la files in
> OE completely
> right now python modules e.g. =A0have them and thats wrong since they nev=
er use it
> and there are other packages like that.

FWIW, after a pull of oe-core today that included the zlib update I am
getting similar failures on meta/recipes-gnome/gtk+/gtk+_2.24.8.bb:

| /bin/grep: /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la:
No such file or directory
| /bin/sed: can't read
/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la: No such
file or directory
| arm-poky-linux-gnueabi-libtool: link:
`/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la' is not a
valid libtool archive
| make[4]: *** [libgdk-x11-2.0.la] Error 1

Steve


