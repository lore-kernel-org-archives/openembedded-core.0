Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGAm9-0006Bx-Vw
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 17:40:50 +0200
Received: by eeit10 with SMTP id t10so1212851eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UJnHFO7eXY8Y0AiIHzPjWn3JHP+Cp361pb2uZ8UPFY4=;
	b=zTG1paI+byaxNAEGY7Xv4Y6+ImEB/SUUh5D1eDhVIAMh4cWHUSGRRc3HHApCTASSaS
	4HUVd3sTMaZEqbtgdJ+seyJqeJGKK6+9K8R7tQvhsiPi3jBjVbDduu9RyN/LTHqbN8zV
	QXgXQGh1DY0jlRl0dWocwFf4RR2ImGc2gnnjMkhgpEqghRYvr0ZkKPNqEl29gdZd7ZBK
	rzOKYsbSkQVwxaLcr08lYW4EjgLjVWyr+/wsXJA6ouEWHIBjRXP0+SyrSvDCj+qEwvCq
	+9zF0kz09WELYHK0igdlXydhb+5WcoqCHQesZ3oqU7fFIKsz9IB9b+eB3t2I3eOFgT86
	t8Tw==
MIME-Version: 1.0
Received: by 10.14.202.131 with SMTP id d3mr15355054eeo.32.1348500481700; Mon,
	24 Sep 2012 08:28:01 -0700 (PDT)
Received: by 10.14.173.69 with HTTP; Mon, 24 Sep 2012 08:28:01 -0700 (PDT)
In-Reply-To: <50601FD9.4080009@communistcode.co.uk>
References: <505C7402.4060604@communistcode.co.uk> <505C7F3A.7020400@intel.com>
	<505C8503.2040907@communistcode.co.uk>
	<CAMKF1spWUv8SFWnQ-_hKqw_+0NEK_Yq4-dhfyAnr-eTyMRemyg@mail.gmail.com>
	<50601BC1.9060706@communistcode.co.uk> <50601D62.8070408@intel.com>
	<50601FD9.4080009@communistcode.co.uk>
Date: Mon, 24 Sep 2012 08:28:01 -0700
Message-ID: <CAMKF1sqGGc+mE-0JpxznkC1KkbqMrVOzMqRiUtxX8fOR7FqwTQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "ml@communistcode.co.uk" <ml@communistcode.co.uk>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: ld problems with relocated toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 15:40:50 -0000
Content-Type: multipart/alternative; boundary=047d7b34372a30f43404ca743c07

--047d7b34372a30f43404ca743c07
Content-Type: text/plain; charset=UTF-8

On Monday, September 24, 2012, Jack Mitchell <ml@communistcode.co.uk> wrote:
> On 24/09/12 09:44, Laurentiu Palcu wrote:
>>
>> On 09/24/2012 11:37 AM, Jack Mitchell wrote:
>>>
>>> On 24/09/12 03:17, Khem Raj wrote:
>>>
>>> [snip]
>>>
>>>>
>>>> What does linker command looks like, its not in the above log you
posted.
>>>>
>>>>
>>> Hi Khem,
>>>
>>> Is this enough information?
>>>
>>> Building target: R0005
>>> Invoking: GCC C Linker
>>>
>>> arm-poky-linux-gnueabi-gcc
>>>
-L/home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr/lib
>>> -o "R0005"  ./src/webInterfaces/webInterface_rJSON.o
>>> ./src/webInterfaces/webInterface_sqlite.o
>>> ./src/webInterfaces/webInterface_webSockets.o
>>> ./src/storageInterfaces/sqlite.o ./src/management/management_database.o
>>> ./src/hardwareProtocols/hardwareProtocol_B092SPIImage.o
>>> ./src/hardwareProtocols/hardwareProtocol_axonSPI.o
>>> ./src/hardwareInterfaces/interface_gpio_mmap.o
>>> ./src/hardwareInterfaces/interface_gpio_sysfs.o
>>> ./src/hardwareInterfaces/interface_kMod.o
>>> ./src/hardwareInterfaces/interface_serial.o
>>> ./src/hardwareInterfaces/interface_spidev.o  ./src/B092/B092.o
>>> ./src/B092/B092_config.o ./src/B092/B092_database.o
>>> ./src/B092/B092_init.o ./src/B092/B092_socket.o
>>> ./src/B092/B092_thumbnail.o ./src/B092/BO92_data.o ./src/AX02/AX02.o
>>> ./src/AX02/AX02_PIDs.o ./src/AX02/AX02_config.o ./src/AX02/AX02_data.o
>>> ./src/AX02/AX02_database.o ./src/AX02/AX02_init.o ./src/AX02/AX02_log.o
>>> ./src/AX02/AX02_socket.o ./src/AX02/AX02_tables.o  ./src/R0005.o
>>> ./src/errors.o ./src/systemConfig.o   -lsqlite3 -ljansson -lwebsockets
>>> -lz -lpthread -ljpeg -lpng
>>>
>>>
/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>>> cannot find crt1.o: No such file or directory
>>>
/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>>> cannot find crti.o: No such file or directory
>>>
/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>>> cannot find crtbegin.o: No such file or directory
>>
>> Can you please try the little test app I wrote in order to test this? I
>> attached it in the bug. Let me know if it works.
>>
>>> /lib/libpthread.so.0: file not recognized: File format not recognized
>>
>> This is kind of weird... It looks like it tries to link against the host
>> libpthread library.
>
> I agree, I also can't find libpthread.so.0 in my sysroot either, only
libpthread.so, so maybe it is trying to fallback to host libs?
>

Libpthread.so should be a linker script stub and that might not be adjusted
for relocation since linker now will need sysroot option as the built in
defaults aren't valid after relocation

Btw I needed the real LD command which you will get with -v
> I have attached the output from the test cases you propsed and attached
them to the bug report.
>
> I also just tried passing the --sysroot= argument to no avail.
>
>>
>> Thanks,
>> Laurentiu
>>>
>>> collect2: error: ld returned 1 exit status
>>>
>>> make: *** [R0005] Error 1
>>>
>>> Regards,
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> --
>
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   http://www.embed.me.uk
>
> --
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--047d7b34372a30f43404ca743c07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, September 24, 2012, Jack Mitchell &lt;<a href=3D"mailto:=
ml@communistcode.co.uk">ml@communistcode.co.uk</a>&gt; wrote:<br>&gt; On 24=
/09/12 09:44, Laurentiu Palcu wrote:<br>&gt;&gt;<br>&gt;&gt; On 09/24/2012 =
11:37 AM, Jack Mitchell wrote:<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; On 24/09/12 03:17, Khem Raj wrote:<br>&gt;&gt;=
&gt;<br>&gt;&gt;&gt; [snip]<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;=
&gt;&gt; What does linker command looks like, its not in the above log you =
posted.<br>
&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt; Hi Khem,<br>&gt;&gt;&g=
t;<br>&gt;&gt;&gt; Is this enough information?<br>&gt;&gt;&gt;<br>&gt;&gt;&=
gt; Building target: R0005<br>&gt;&gt;&gt; Invoking: GCC C Linker<br>&gt;&g=
t;&gt;<br>
&gt;&gt;&gt; arm-poky-linux-gnueabi-gcc<br>&gt;&gt;&gt; -L/home/jack/Projec=
ts/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr/lib<br>=
&gt;&gt;&gt; -o &quot;R0005&quot; =C2=A0./src/webInterfaces/webInterface_rJ=
SON.o<br>
&gt;&gt;&gt; ./src/webInterfaces/webInterface_sqlite.o<br>&gt;&gt;&gt; ./sr=
c/webInterfaces/webInterface_webSockets.o<br>&gt;&gt;&gt; ./src/storageInte=
rfaces/sqlite.o ./src/management/management_database.o<br>&gt;&gt;&gt; ./sr=
c/hardwareProtocols/hardwareProtocol_B092SPIImage.o<br>
&gt;&gt;&gt; ./src/hardwareProtocols/hardwareProtocol_axonSPI.o<br>&gt;&gt;=
&gt; ./src/hardwareInterfaces/interface_gpio_mmap.o<br>&gt;&gt;&gt; ./src/h=
ardwareInterfaces/interface_gpio_sysfs.o<br>&gt;&gt;&gt; ./src/hardwareInte=
rfaces/interface_kMod.o<br>
&gt;&gt;&gt; ./src/hardwareInterfaces/interface_serial.o<br>&gt;&gt;&gt; ./=
src/hardwareInterfaces/interface_spidev.o =C2=A0./src/B092/B092.o<br>&gt;&g=
t;&gt; ./src/B092/B092_config.o ./src/B092/B092_database.o<br>&gt;&gt;&gt; =
./src/B092/B092_init.o ./src/B092/B092_socket.o<br>
&gt;&gt;&gt; ./src/B092/B092_thumbnail.o ./src/B092/BO92_data.o ./src/AX02/=
AX02.o<br>&gt;&gt;&gt; ./src/AX02/AX02_PIDs.o ./src/AX02/AX02_config.o ./sr=
c/AX02/AX02_data.o<br>&gt;&gt;&gt; ./src/AX02/AX02_database.o ./src/AX02/AX=
02_init.o ./src/AX02/AX02_log.o<br>
&gt;&gt;&gt; ./src/AX02/AX02_socket.o ./src/AX02/AX02_tables.o =C2=A0./src/=
R0005.o<br>&gt;&gt;&gt; ./src/errors.o ./src/systemConfig.o =C2=A0 -lsqlite=
3 -ljansson -lwebsockets<br>&gt;&gt;&gt; -lz -lpthread -ljpeg -lpng<br>&gt;=
&gt;&gt;<br>
&gt;&gt;&gt; /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-l=
inux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-ne=
on-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:<br>&gt;&gt;&gt; =
cannot find crt1.o: No such file or directory<br>
&gt;&gt;&gt; /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-l=
inux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-ne=
on-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:<br>&gt;&gt;&gt; =
cannot find crti.o: No such file or directory<br>
&gt;&gt;&gt; /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-l=
inux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-ne=
on-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:<br>&gt;&gt;&gt; =
cannot find crtbegin.o: No such file or directory<br>
&gt;&gt;<br>&gt;&gt; Can you please try the little test app I wrote in orde=
r to test this? I<br>&gt;&gt; attached it in the bug. Let me know if it wor=
ks.<br>&gt;&gt;<br>&gt;&gt;&gt; /lib/libpthread.so.0: file not recognized: =
File format not recognized<br>
&gt;&gt;<br>&gt;&gt; This is kind of weird... It looks like it tries to lin=
k against the host<br>&gt;&gt; libpthread library.<br>&gt;<br>&gt; I agree,=
 I also can&#39;t find libpthread.so.0 in my sysroot either, only libpthrea=
d.so, so maybe it is trying to fallback to host libs?<br>
&gt;<br><br>Libpthread.so should be a linker script stub and that might not=
 be adjusted for relocation since linker now will need sysroot option as th=
e built in defaults aren&#39;t valid after relocation<br><br>Btw I needed t=
he real LD command which you will get with -v<br>
&gt; I have attached the output from the test cases you propsed and attache=
d them to the bug report.<br>&gt;<br>&gt; I also just tried passing the --s=
ysroot=3D argument to no avail.<br>&gt;<br>&gt;&gt;<br>&gt;&gt; Thanks,<br>
&gt;&gt; Laurentiu<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; collect2: error: ld retu=
rned 1 exit status<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; make: *** [R0005] Error =
1<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Regards,<br>&gt;&gt;&gt;<br>&gt;&gt; ____=
___________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>&gt;&gt; <a href=3D"mailto:Opene=
mbedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.o=
rg</a><br>&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listin=
fo/openembedded-core</a><br>
&gt;<br>&gt;<br>&gt; --<br>&gt;<br>&gt; =C2=A0 Jack Mitchell (<a href=3D"ma=
ilto:jack@embed.me.uk">jack@embed.me.uk</a>)<br>&gt; =C2=A0 Embedded System=
s Engineer<br>&gt; =C2=A0 <a href=3D"http://www.embed.me.uk">http://www.emb=
ed.me.uk</a><br>
&gt;<br>&gt; --<br>&gt;<br>&gt;<br>&gt; ___________________________________=
____________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mail=
to:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openem=
bedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--047d7b34372a30f43404ca743c07--
