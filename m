X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <842c2a97-3e6f-c30e-a563-35d8747455a0@pr.hu>
Date: Thu, 17 Mar 2022 13:16:02 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] mesa: Fix libopencl-mesa-dev packaging
References: <20220317102915.2467957-1-zboszor@pr.hu>
 <CANPvuRmsP2CaLsQ+akPA+J9yLgzq_5GOnzgtcYaSX9gVVj0pKg@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <CANPvuRmsP2CaLsQ+akPA+J9yLgzq_5GOnzgtcYaSX9gVVj0pKg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>

2022. 03. 17. 11:35 keltezéssel, Jose Quaresma írta:
> Hi Zoltán,
> 
> This patch seems to be a fixup for the previous
> 
> https://lists.openembedded.org/g/openembedded-core/message/163331 
> <https://lists.openembedded.org/g/openembedded-core/message/163331>
> 
> I think a v2 is more appropriate

I will send a v2 then. Thanks.

> 
> Jose
> 
> Zoltan Boszormenyi via lists.openembedded.org <http://lists.openembedded.org> 
> <zboszor=pr.hu@lists.openembedded.org <mailto:pr.hu@lists.openembedded.org>> escreveu no 
> dia quinta, 17/03/2022 à(s) 10:29:
> 
>     From: Zoltán Böszörményi <zboszor@gmail.com <mailto:zboszor@gmail.com>>
> 
>     Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com <mailto:zboszor@gmail.com>>
>     ---
>       meta/recipes-graphics/mesa/mesa.inc | 1 +
>       1 file changed, 1 insertion(+)
> 
>     diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>     index c6e85520f8..e8c07a4563 100644
>     --- a/meta/recipes-graphics/mesa/mesa.inc
>     +++ b/meta/recipes-graphics/mesa/mesa.inc
>     @@ -307,6 +307,7 @@ FILES:libglapi-dev = "${libdir}/libglapi.*"
>       FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES
>     ${libdir}/pkgconfig/glesv1*.pc"
>       FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2
>     ${libdir}/pkgconfig/glesv2.pc"
>       FILES:libgles3-mesa-dev = "${includedir}/GLES3"
>     +FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
>       FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h
>     ${libdir}/pkgconfig/osmesa.pc"
>       FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la
>     <http://libxatracker.la> \
>                                 ${includedir}/xa_tracker.h ${includedir}/xa_composite.h
>     ${includedir}/xa_context.h \
>     -- 
>     2.35.1
> 
> 
>     
> 
> 
> 
> -- 
> Best regards,
> 
> José Quaresma

