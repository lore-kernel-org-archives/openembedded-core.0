Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPCYc-0006b4-75
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 15:56:29 +0200
Received: by mail-ob0-f174.google.com with SMTP id wm15so3130477obc.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=36vYsfx5vzWzbWBCVhW6Euy9RW5Pl244WQi8Qp3Fr/0=;
	b=N0gmoBCD0OFMbpHgfWyDn4MI9662cr9pHk11I6O7MxEVkgGob3vkAkAGumpZh8syfl
	dcLPiTQ/E5rR6hh6CtzIgBZlgRIJyp7vYAE01sK/VzGMOoDcQK6+KmyF29gI+PM3atmQ
	eDQvsycaUGX0Zx76Pa5cgCcPCCdhUCxdbOyv1VkNR4oO7QGicnAcoovLBdDl0mGpcg1h
	+T5Xvia4ESuosZDixVKz5t1IG79D21a5UlZ80A1MAwiXip5Zcpk4PV8S3mNYnjbn1xet
	ZdNaXtEkKmrJLvJjs6lpdMDaeqsZlP15Q/wYoUXb+M7MCUCDig69GsBYnFkAYocrN090
	BfpQ==
MIME-Version: 1.0
X-Received: by 10.182.106.16 with SMTP id gq16mr15339083obb.27.1365428346477; 
	Mon, 08 Apr 2013 06:39:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Mon, 8 Apr 2013 06:39:06 -0700 (PDT)
In-Reply-To: <5162038C.2020706@pseudoterminal.org>
References: <5162038C.2020706@pseudoterminal.org>
Date: Mon, 8 Apr 2013 10:39:06 -0300
X-Google-Sender-Auth: Qu4Xl3hdKDGOXK1cUKUWSiI9aXc
Message-ID: <CAP9ODKp9xrRbh4Mq+ZkBEuYZbvOKH=B+mmbXkJXWO275-F2UPQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: gstreamer 1.0 recipes
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
X-List-Received-Date: Mon, 08 Apr 2013 13:56:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Apr 7, 2013 at 8:38 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Hello all,
>
> to start working with GStreamer 1.0 on several embedded platforms, I decided
> to adapt the existing GStreamer recipes from danny for 1.0. Out of this I
> created a layer, which is hosted at https://github.com/dv1/meta-gstreamer1.0
> .
>
> I write this RFC, because I figure that GStreamer 1.0 support is already on
> TODO lists of several people, and will eventually end up in OE-Core, just
> like GStreamer 0.10 did. For this reason, I also didn't add it to the layer
> index.
>
> I built the packages for several platforms (cubox, beagleboard, imx6), and
> they worked well. Since 1.0 has been designed to be able to coexist with
> 0.10 in the same rootfs, I changed the naming convention for the packages:
> they all start with "gstreamer1.0-" .
>
> I also tried to reuse the existing patches. I was able to reuse three.
> Several others are no longer necessary. Four are unclear to me, so I did not
> port them:
> * gstreamer: check_fix.patch (I could not reproduce the documented problem),
> and gstregistrybin.c/.h (why are these present?)
> * gst-plugins-base: configure.ac-fix-subparse-plugin.patch (not sure what
> this is trying to fix, and this line does not exist in 1.0), and
> gst-plugins-base-tremor.patch (again, works well without it)
>
> gst-ffmpeg was replaced by gst-libav upstream. So was gst-openmax (gst-omx
> is its successor). gst-omx has special support for the Raspberry Pi and its
> custom OpenMax IL implementation. The recipe is designed in a way that
> allows for setting the target to something like "rpi", and the recipe then
> sets the PACKAGE_ARCH automatically to MACHINE_ARCH. However, I wasn't able
> to test it on an RPi yet, since I do not have one. I will get access to one
> in a few days.
>
> I am also considering some kind of autodetection for when yasm and liborc
> are available (for example, because meta-oe was added to bblayers.conf), and
> then switches on Orc and enables yasm in gst-libav. Or better yet, if libav
> is available as a recipe, it lets gst-libav use it instead of its internal
> copy. These autodetections would improve performance significantly.
>
> Thoughts?

Neat!!! :-D

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


