Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T1V2Y-0003rr-8n
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 06:17:06 +0200
Received: from mail114-va3-R.bigfish.com (10.7.14.241) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Wed, 15 Aug 2012 04:05:10 +0000
Received: from mail114-va3 (localhost [127.0.0.1])	by
	mail114-va3-R.bigfish.com (Postfix) with ESMTP id 508C4602D8	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 04:05:10 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail114-va3 (localhost.localdomain [127.0.0.1]) by mail114-va3
	(MessageSwitch) id 1345003509104969_9068;
	Wed, 15 Aug 2012 04:05:09 +0000 (UTC)
Received: from VA3EHSMHS002.bigfish.com (unknown [10.7.14.242])	by
	mail114-va3.bigfish.com (Postfix) with ESMTP id 1692D3801A5	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 04:05:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS002.bigfish.com
	(10.7.99.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 15 Aug 2012 04:05:08 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Tue, 14 Aug 2012 23:05:08 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] perf on older kernels
Thread-Index: AQHNem2nfB7df3ESVEOse2py7bZ/LpdahjSAgAAFMQCAAAKkgIAAByKA
Date: Wed, 15 Aug 2012 04:05:07 +0000
Message-ID: <CAEsOVNcz3rSuE6yCV1cyJh-pL4SYWtzDR4TZYDPdea-7nEo0ng@mail.gmail.com>
References: <CAEsOVNcP1hf8OqHqDYmt1QJTQ2S557-HjHOa5ihNxVt-veaqOg@mail.gmail.com>
	<CADkTA4Ox5KqWoBFMa5k6HObyMYBK7jNThakNO6AKS04zLRPM4w@mail.gmail.com>
	<CAEsOVNfh03y944-zeGVOrQ4bRnBc-EKoeyUbxtAKSppgTJ0n4A@mail.gmail.com>
	<CADkTA4OFKLMy9kQZWKmGD1dnKvYfOyYG0jL8jVHwrApJf_96UA@mail.gmail.com>
In-Reply-To: <CADkTA4OFKLMy9kQZWKmGD1dnKvYfOyYG0jL8jVHwrApJf_96UA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: perf on older kernels
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 15 Aug 2012 04:17:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <88020F6720AD5C418B30D4C558D5494E@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 14, 2012 at 10:39 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Tue, Aug 14, 2012 at 11:29 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>
>> On Aug 14, 2012 10:11 PM, "Bruce Ashfield" <bruce.ashfield@gmail.com> wr=
ote:
>>>
>>> On Tue, Aug 14, 2012 at 6:39 PM, McClintock Matthew-B29882
>>> <B29882@freescale.com> wrote:
>>> > I've had to fix / hack the perf_3.4.bb recipe to get it building on m=
y
>>> > older kernel. Should we add perf_3.0.bb recipes in oe-core or my own
>>> > layer? Or try to keep one recipe working for all versions? I have no
>>> > strong opinions.
>>>
>>> I'd prefer one recipe. Liang sent another proposal earlier for a fix
>>> that should make
>>> it work on all kernels. Just waiting to hear on that at the moment.
>>
>> I've actually got other issues...
>
> Did you post the error and I missed it .. I block marked quite a few emai=
l read
> earlier :) In that case, we can factor out common code to a .inc and keep=
 the
> changes between versions as small as possible.

I have not posted it yet.. but it looks something like this so far...
not sure about this fix yet: https://gist.github.com/3352962

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/per=
f/per
index 505c7b8..ff8d281 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -54,6 +54,7 @@ B =3D "${WORKDIR}/${BPN}-${PV}"
 SCRIPTING_DEFINES =3D "${@perf_feature_enabled('perf-scripting', '', 'NO_L=
IBPERL=3D
 TUI_DEFINES =3D "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=3D1',d)}=
"

+export LDFLAGS =3D "-ldl -lutil"
 EXTRA_OEMAKE =3D \
                '-C ${S}/tools/perf \
                O=3D${B} \
@@ -63,6 +64,7 @@ EXTRA_OEMAKE =3D \
                AR=3D"${AR}" \
                prefix=3D/usr \
                NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${SCRIPTING_DEFINES=
} \
+               V=3D1 \
                '

 do_compile() {
@@ -71,7 +73,8 @@ do_compile() {

 do_install() {
        oe_runmake DESTDIR=3D${D} install
-       if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" =3D "1" =
]; then
+       # we are checking for this make target to be compatible with older =
perf
+       if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" =3D "1" =
-a $(gr
                oe_runmake DESTDIR=3D${D} install-python_ext
        fi
 }

-M

>
> Cheers,
>
> Bruce
>
>>
>> -M
>>
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>> >
>>> > -M
>>> >
>>> > _______________________________________________
>>> > Openembedded-core mailing list
>>> > Openembedded-core@lists.openembedded.org
>>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



