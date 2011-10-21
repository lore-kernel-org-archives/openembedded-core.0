Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH4vX-0002NC-OI
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 04:33:44 +0200
Received: by gyc15 with SMTP id 15so3330124gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 19:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=2Qkec1ZFEUUm27ONjI8HtYi1HqT6wYolHsxzbl3+mF4=;
	b=Z7nmYZ+NybnnPgmiOAQ+vK2i4T68ICIUi7RoDctXe24wSmVubTqvCt5WR9vMdnRIsN
	kpu1GcG4NlXxLY3OKiQWoO7ErhdsR7rr1T01bG1oMdesHK3jg6eWMtDLZLllW2dtmlqY
	+PJBMYPldTr97Gz17k+rWWk49QDr7sD+FIKSA=
Received: by 10.68.20.226 with SMTP id q2mr23917086pbe.115.1319164068333; Thu,
	20 Oct 2011 19:27:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 19:27:18 -0700 (PDT)
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1A8849@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF1A8633@MBX20.4emm.local>
	<1319129657.2410.57.camel@ted>
	<CA+M6bXm9zigRMzMQSdwntHAUYD+vBAmuLbAdNA7RPkBM=wwFNA@mail.gmail.com>
	<1319148494.2410.100.camel@ted>
	<CAMKF1srf2LKe8iv5-KjC7crWFS5pvwbQZArZAzPB33Lmmn1xZA@mail.gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A8849@MBX20.4emm.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 19:27:18 -0700
Message-ID: <CAMKF1souA16ckbCXuasee8fE2DDN+SpbY8dh1a92xPv6h72uXA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: sdk path problem
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
X-List-Received-Date: Fri, 21 Oct 2011 02:33:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 6:57 PM, James Limbouris
<james@digitalmatter.com.au> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Friday, 21 October 2011 6:49 AM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] sdk path problem
>>
>> On Thu, Oct 20, 2011 at 3:08 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Thu, 2011-10-20 at 13:24 -0700, Tom Rini wrote:
>> >> On Thu, Oct 20, 2011 at 9:54 AM, Richard Purdie
>> >> <richard.purdie@linuxfoundation.org> wrote:
>> >> > On Thu, 2011-10-20 at 08:22 +0000, James Limbouris wrote:
>> >> >> Hi,
>> >> >>
>> >> >> I have been using meta-toolchain-qte in the past to cross compile =
a Qt
>> app, and the Linux kernel.
>> >> >> Recently I replaced my old SDK image with a fresh one, and found t=
hat I
>> could not link vmlinux anymore.
>> >> >>
>> >> >> When building the kernel, I use the following ('rica' is the distr=
ibution
>> name):
>> >> >> export PATH=3D$PATH:/usr/local/rica-eglibc-i686-armv5te/sysroots/i=
686-
>> ricasdk-linux/usr/bin/armv5te-rica-linux-gnueabi/
>> >> >> make ARCH=3Darm CROSS_COMPILE=3Darm-rica-linux-gnueabi- zImage
>> >> >>
>> >> >> The new error message is:
>> >> >>
>> >> >> Kernel: arch/arm/boot/Image is ready
>> >> >> =C2=A0 AS =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/head.o
>> >> >> =C2=A0 GZIP =C2=A0 =C2=A0arch/arm/boot/compressed/piggy.gz
>> >> >> =C2=A0 CC =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/misc.o
>> >> >> =C2=A0 AS =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/piggy.o
>> >> >> =C2=A0 LD =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/vmlinux
>> >> >> arm-rica-linux-gnueabi-ld: cannot find libgcc.a: No such file or d=
irectory
>> >> >>
>> >> >> Comparing the build with the old sdk to the build with the new one=
, I find
>> that the command line for linking has changed from:
>> >> >>
>> >> >> arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=3D0x80008000 --def=
sym
>> initrd_phys=3D0x80800000 --defsym params_phys=3D0x80000100 -p --no-undef=
ined
>> -X /usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-
>> gnueabi/usr/lib/arm-rica-linux-gnueabi/4.5.4/libgcc.a -T
>> arch/arm/boot/compressed/vmlinux.lds arch/arm/boot/compressed/head.o
>> arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/misc.o -o
>> arch/arm/boot/compressed/vmlinux
>> >> >>
>> >> >> to:
>> >> >>
>> >> >> arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=3D0x80008000 --def=
sym
>> initrd_phys=3D0x80800000 --defsym params_phys=3D0x80000100 -p --no-undef=
ined
>> -X libgcc.a -T arch/arm/boot/compressed/vmlinux.lds
>> arch/arm/boot/compressed/head.o arch/arm/boot/compressed/piggy.o
>> arch/arm/boot/compressed/misc.o -o arch/arm/boot/compressed/vmlinux
>> >> >>
>> >> >> So libgcc.a has lost its path qualification.
>> >> >> I also straced the two linker commands, and found that they differ=
ed in
>> one sequence.
>> >> >>
>> >> >> Old:
>> >> >> lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=3DS_IFDIR|=
0755,
>> st_size=3D4096, ...}) =3D 0
>> >> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots",
>> {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
>> >> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-lin=
ux-
>> gnueabi", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
>> >> >>
>> >> >> New:
>> >> >> lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=3DS_IFDIR|=
0755,
>> st_size=3D4096, ...}) =3D 0
>> >> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots",
>> {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
>> >> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-lin=
ux-
>> gnueabi", 0xbffe67cc) =3D -1 ENOENT (No such file or directory)
>> >> >>
>> >> >> Both toolchains are looking for a sysroot at 'arm-rica-linux-gnuea=
bi', but
>> the new toolchain should be looking at 'armv5te-rica-linux-gnueabi', as =
the
>> names have changed.
>> >> >> I'm not yet acquainted with the darker arts of toolchain generatio=
n. Can
>> anyone help with this?
>> >> >
>> >> > There should be a --sysroot option being passed to the compiler/lin=
ker
>> >> > to tell which sysroot to look at. We did recently change the sysroo=
t
>> >> > location to reflect the target architecture it was optimized for bu=
t
>> >> > this does mean the compiler and other tools need the correct sysroo=
t
>> >> > path to be specified. The environment script that ships with the
>> >> > toolchain should do this?
>> >>
>> >> At least not for things like u-boot and the kernel, no, this isn't
>> >> enough. =C2=A0Just re-confirmed.
>> >
>> > The place I'd start looking is how to ensure the tools get called with
>> > the right flags.
>> >
>> > The end result may be we need to create separate cross bin directories
>> > for each target sysroot with wrapper scripts for the tools to ensure t=
he
>> > right flags get passed. Rather nasty and I'd prefer not to but I don't
>> > see easy alternatives if getting the flags to the tools is a problem.
>>
>> linker also has its own notion of sysroot when invoked bare and I suspec=
t thats
>> coming into play here thats why I asked for build logs.
>
> Hi,
>
> Logs are attached.
> Here are two interesting bits from the configuration:
>
> + gnu-configize
> configure.ac:32: error: Please use exactly Autoconf 2.64 instead of 2.68.
> config/override.m4:12: _GCC_AUTOCONF_VERSION_CHECK is expanded from...
> configure.ac:32: the top level
> autom4te: m4 failed with exit status: 1
>
> Not relevant to the current problem, but I hope it's harmless...

yes it is


>
> And:
> + /home/james/oe/build/tmp-eglibc/work/i686-nativesdk-ricasdk-linux/binut=
ils-cross-canadian-arm-2.21.1a-r1/binutils-2.21.1/configure --build=3Di686-=
linux --host=3Di686-ricasdk-linux --target=3Darm-rica-linux-gnueabi --prefi=
x=3D/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasdk-linux/usr --e=
xec_prefix=3D/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasdk-linu=
x/usr --bindir=3D/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasdk-=
linux/usr/bin/armv5te-rica-linux-gnueabi --sbindir=3D/usr/local/rica-eglibc=
-i686-armv5te/sysroots/i686-ricasdk-linux/usr/bin/armv5te-rica-linux-gnueab=
i --libexecdir=3D/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasdk-=
linux/usr/libexec/armv5te-rica-linux-gnueabi --datadir=3D/usr/local/rica-eg=
libc-i686-armv5te/sysroots/i686-ricasdk-linux/usr/share --sysconfdir=3D/usr=
/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasdk-linux/etc --sharedsta=
tedir=3D/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasdk-linux/com=
 --localstatedir=3D/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasd=
k-linux/var --libdir=3D/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ri=
casdk-linux/usr/lib/armv5te-rica-linux-gnueabi --includedir=3D/usr/local/ri=
ca-eglibc-i686-armv5te/sysroots/i686-ricasdk-linux/usr/include --oldinclude=
dir=3D/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasdk-linux/usr/i=
nclude --infodir=3D/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasd=
k-linux/usr/share/info --mandir=3D/usr/local/rica-eglibc-i686-armv5te/sysro=
ots/i686-ricasdk-linux/usr/share/man --disable-silent-rules --disable-depen=
dency-tracking --with-libtool-sysroot=3D/home/james/oe/build/tmp-eglibc/sys=
roots/i686-ricasdk-linux-nativesdk --with-sysroot=3D/usr/local/rica-eglibc-=
i686-armv5te/sysroots/arm-rica-linux-gnueabi --program-prefix=3Darm-rica-li=
nux-gnueabi- --disable-werror --enable-nls
>
> Where we see that the arm sysroot is misconfigured. (--with-sysroot=3D/us=
r/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueabi instead of=
 --with-sysroot=3D/usr/local/rica-eglibc-i686-armv5te/sysroots/armv5te-rica=
-linux-gnueabi)
>

correct thats what I expected to be the problem. Can you try this patch
http://paste.ubuntu.com/714780/

and see if it helps ?

> Regards,
> James
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


