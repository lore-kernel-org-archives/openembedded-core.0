Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rw8JG-0002Cm-Iw
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 09:27:54 +0100
Received: by lahc1 with SMTP id c1so3098419lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 00:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=1e0U2+h7GwXTgZnNRzUTzg/9VZUvD0p5rYcrmD5l1DI=;
	b=OB0zQArNPfgtuFindozn3yQqUtsSAPFHdU1NW6yp5lRDt3l2BU6DVqyBn0YazhYZlo
	aUvZxYkcpIadozFCe2h1eongkwBMYwXVd6Q6Q27nSlI4/rawo1NgLvPKQt6kgD7Q6Pnl
	I5ohbHnKliBHaKhNlDAA+Tm/qyERgl6nv/MgU=
Received: by 10.112.32.1 with SMTP id e1mr3205644lbi.3.1328948387239; Sat, 11
	Feb 2012 00:19:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sat, 11 Feb 2012 00:19:17 -0800 (PST)
In-Reply-To: <CAMKF1spbXwjnn8v0xaNMmm2XC8M24j5vk1XWAQE8BOEGNaR7JA@mail.gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<CAMKF1spbXwjnn8v0xaNMmm2XC8M24j5vk1XWAQE8BOEGNaR7JA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Feb 2012 00:19:17 -0800
Message-ID: <CAMKF1sqpb4qOA760XOEHj1RVQMcwZBMMo_F0DkrHHH2e7Q+HwA@mail.gmail.com>
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
X-List-Received-Date: Sat, 11 Feb 2012 08:27:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2012 at 12:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Feb 10, 2012 at 9:09 PM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>>
>> Op 11 feb. 2012, om 06:05 heeft Steve Sakoman het volgende geschreven:
>>
>>> On Tue, Feb 7, 2012 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Tue, Feb 7, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>>
>>>>> Can you verify if you have a .la file in you sysroot?
>>>>
>>>>
>>>> No its not there and thats the point we probably should learn to live
>>>> with out it
>>>> actually one of radical ideas I have is to get rid of all .la files in
>>>> OE completely
>>>> right now python modules e.g. =C2=A0have them and thats wrong since th=
ey never use it
>>>> and there are other packages like that.
>>>
>>> FWIW, after a pull of oe-core today that included the zlib update I am
>>> getting similar failures on meta/recipes-gnome/gtk+/gtk+_2.24.8.bb:
>>>
>>> | /bin/grep: /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la=
:
>>> No such file or directory
>>> | /bin/sed: can't read
>>> /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la: No such
>>> file or directory
>>> | arm-poky-linux-gnueabi-libtool: link:
>>> `/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la' is not a
>>> valid libtool archive
>>> | make[4]: *** [libgdk-x11-2.0.la] Error 1
>>
>>
>> It works if you -c cleansstate on a bunch of recipes, pango, cairo, font=
config, gtk+, etc
>
> yeah libtool is very hard to get rid of see how many of files in your
> sysroot has zlib.la added to other .la files. You need to clean all
> those
>
> I wrote a small script which grepped oe-core for occurrence of all
> zlib.la in *.la files in sysroot
> and then dumps the ipks content to figure out which package provided
> that .la then bumped PRs of those recipes which were providing those
> ipks.
> unfortunately this script was in tmdir and got deleted.

ah screen saved a snapshot here is the script

sysroot=3D/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-egli=
bc/sysroots/qemux86
deploy=3D"/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-egli=
bc/deploy/ipk/i586
/home/kraj/work/angstrom/sources/
openembedded-core/build/tmp-eglibc/deploy/ipk/qemux86"

las=3D$(find $sysroot -name *.la|xargs grep -Hns libz.la | cut -d':' -f 1)
for f in $las
do
    ff=3D`basename $f`
        for fff in $(find $deploy -name '*.ipk')
        do
            dpkg-deb -c $fff | grep $ff >& /dev/null
            if [ $? =3D 0 ]
            then
                ls $fff
                break
            fi
        done
done


