Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 963AD734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 20:20:15 +0000 (UTC)
Received: by wgv5 with SMTP id 5so18402796wgv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 13:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=0TEGXob1oJPH9WU0mvpQB9GhGOYlToRl/v37gHEwHUY=;
	b=acfSP9O259MQFWTAZVuM8VzutPwqJnz+uU6pGJrmabWMgR+AM7Uv2Lcdzo0YkN3Xg6
	YisdzyNtQ4S00a8ILQMpMjBHK7rumLhblQWOBuB2wEEIVPOdMjrFcLGTiqdO1wIsZQag
	7ASAM1x5vw5C21U4OTDtk8k/dfqa1uwVHuO9N8g5FB9tpHvcAITcO9BH6TRllDqkMpLF
	l62cjVJqT2ZrT4CZRMYjiWQq7hJm7kPISDDnwDb1dpdo+yVf7tmUKwXXcodNdG7fqyFp
	lsSjaxi0MxHlAniuG52mgJRaDb9+4xsNKW+9KyH6agx+/fzbbvGBqPgfK9MYevMZeClQ
	3/DA==
X-Received: by 10.180.83.135 with SMTP id q7mr779890wiy.17.1433362816192;
	Wed, 03 Jun 2015 13:20:16 -0700 (PDT)
Received: from [192.168.0.7] (212-41-119-77.adsl.solnet.ch. [212.41.119.77])
	by mx.google.com with ESMTPSA id v3sm3173901wix.8.2015.06.03.13.20.13
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jun 2015 13:20:14 -0700 (PDT)
Message-ID: <1433362812.2622.5.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Krishnakumar Kulkarni <kulakarni.krishnakumar@gmail.com>
Date: Wed, 03 Jun 2015 22:20:12 +0200
In-Reply-To: <CAJTo0La-EL3Yd807gK5b_yCUcHrsfJhriLHqxUViESP7qtSndw@mail.gmail.com>
References: <CADQ2m_xJEa1uw8PoVdCn6A8Xt_MPO3R9nhLMn-EHopc0P0+5mw@mail.gmail.com>
	<CAJTo0LbafkiQvTu8ancvk3OE8Ai6pFUyeNtPC4HNGara5qDoyQ@mail.gmail.com>
	<CAJTo0La-EL3Yd807gK5b_yCUcHrsfJhriLHqxUViESP7qtSndw@mail.gmail.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: EGL version error while building the weston.
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
X-List-Received-Date: Wed, 03 Jun 2015 20:20:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Am Mittwoch, den 03.06.2015, 14:08 +0100 schrieb Burton, Ross:
> On 3 June 2015 at 14:05, Burton, Ross <ross.burton@intel.com> wrote:
> 
> > *| Requested 'egl >= 7.10' but version of egl is 1*
> >>
> >
> > Your EGL packages don't follow the Mesa versioning, so can't be considered
> > a drop-in replacement.  This is a problem with your BSP so you should
> > contact Toradex.
> 
> 
> In particular this file:
> 
> http://git.toradex.com/cgit/meta-toradex.git/tree/recipes/trdx-nv-binaries/files/egl.pc
> 
> You could just try changing that 1 to 7.10 and seeing if it works... but at
> this point you're hoping that the nVidia drivers they ship are compatible
> enough with Mesa to actually work with Weston.
> 
> Ross

Note that the Nvidia's in question only works on top of Nvidia's X11
display driver. So probably the whole exercise will not give the
expected results independent on how compatible the EGL implementation
is.

Regards
Max


