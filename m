Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3YwR-0005zN-H4
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 22:51:19 +0200
Received: by eaad12 with SMTP id d12so1659649eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 13:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KG40Ug3SfjCVzXduVcIiGRU/xrvZ9QQQGz17MRWc7hs=;
	b=pKtOaZHZfWKaaIIaVdqiLh0vgueWEVSoFANDXIuBCQzscoz5q5KLfd+ZMMS86NK6pi
	y4fhHw8ZxL9j38Wdz22iTWPpyPqslhe2MP4oChYCBBX1oOWYI+OM0hkjuejDdLgcp4v/
	601kU3vw4gx9tGGi7GLgrRRQ/0q8KrWiSsHdPIszQ7qMU6BFUc6GmB7X09oFClv55ovT
	eCpvrxxjjrOb2ywXYnJqd7npLj51NIV0r9vXq/JKvthtJzZ50gC6Dqw7hsEEuESeAcXD
	DPqWu9T5V+wwIoUkXjG9vf2FXt7ynhFJ1JA4/nEuFzca8qftaWPC1OscAKUSlUtGWFzk
	S9zQ==
MIME-Version: 1.0
Received: by 10.14.204.72 with SMTP id g48mr10334617eeo.45.1345495156723; Mon,
	20 Aug 2012 13:39:16 -0700 (PDT)
Received: by 10.14.2.5 with HTTP; Mon, 20 Aug 2012 13:39:16 -0700 (PDT)
In-Reply-To: <5031FF3C.8020106@nedap.com>
References: <5031FF3C.8020106@nedap.com>
Date: Mon, 20 Aug 2012 13:39:16 -0700
Message-ID: <CAMKF1soivnA-XUREAQfEuaGcPWtbRp5eawEp2jgH9a86swQJWw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Jaap de Jong <jaap.dejong@nedap.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: icedtea compile error
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
X-List-Received-Date: Mon, 20 Aug 2012 20:51:19 -0000
Content-Type: multipart/alternative; boundary=047d7b343cccdd0e4004c7b880ec

--047d7b343cccdd0e4004c7b880ec
Content-Type: text/plain; charset=UTF-8

On Monday, August 20, 2012, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> while compiling openjdk-6 for qemux86.
> Anyone seen this before? (and fixed...)
>

Firstly its a meta-java question so ask it on oe-devel would be more
suitable secondly yes I have patches for this problem that I will send
sometime soon
> | precompiled.incl.gch
> | In file included from ../generated/incls/_precompiled.incl:230:0:
> |
/media/OpenEmbedded/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/i686-linux/icedtea6-native-1.8.11-r5.1/icedtea6-1.8.11/openjdk-ecj/hotspot/src/share/vm/runtime/interfaceSupport.hpp:394:0:
error: "__LEAF" redefined [-Werror]
> | /usr/include/i386-linux-gnu/sys/cdefs.h:44:0: note: this is the
location of the previous definition
> | cc1plus: all warnings being treated as errors
> | make[7]: *** [incls/_precompiled.incl.gch] Error 1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--047d7b343cccdd0e4004c7b880ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, August 20, 2012, Jaap de Jong &lt;<a href=3D"mailto:jaap=
.dejong@nedap.com">jaap.dejong@nedap.com</a>&gt; wrote:<br>&gt; while compi=
ling openjdk-6 for qemux86.<br>&gt; Anyone seen this before? (and fixed...)=
<br>
&gt;<br><br>Firstly its a meta-java question so ask it on oe-devel would be=
 more suitable secondly yes I have patches for this problem that I will sen=
d sometime soon<br>&gt; | precompiled.incl.gch<br>&gt; | In file included f=
rom ../generated/incls/_precompiled.incl:230:0:<br>
&gt; | /media/OpenEmbedded/oe-core/develop/build/tmp-angstrom_v2012_05-egli=
bc/work/i686-linux/icedtea6-native-1.8.11-r5.1/icedtea6-1.8.11/openjdk-ecj/=
hotspot/src/share/vm/runtime/interfaceSupport.hpp:394:0: error: &quot;__LEA=
F&quot; redefined [-Werror]<br>
&gt; | /usr/include/i386-linux-gnu/sys/cdefs.h:44:0: note: this is the loca=
tion of the previous definition<br>&gt; | cc1plus: all warnings being treat=
ed as errors<br>&gt; | make[7]: *** [incls/_precompiled.incl.gch] Error 1<b=
r>
&gt;<br>&gt;<br>&gt; _______________________________________________<br>&gt=
; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-cor=
e@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--047d7b343cccdd0e4004c7b880ec--
