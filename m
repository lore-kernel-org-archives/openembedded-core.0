Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 684546B0D0
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 21:57:10 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo10so5760776obc.13
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 14:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=d8HmvKVPRi6QkCBXYdmCkfXgN3mmi9NTKPrjnmDC79k=;
	b=qn5Joh/5b12QMNmN/Twk9IHVyFsf8Vnpy0RbIYlm0m9KVgGFVKQOYUdCEyltKyXhWt
	Sw9RKbnh3YlJnZCJ93jAW8wJuiJZSIMuHRylhtpmkusHVQP0Jlyz+97oMrvdupg+2jDz
	qyc22LIVcHY8aTiSS8QfCz2nBx4HhehGHJD0nIMmPcb0g5ZZit3nXNcNBwPR1Egwc//j
	nJCmJKxaJd1cNmh8wBrhhvaoGDO4VUwFGycrTv9DpAtHOD44Vqo2V+44LHZVzOE/Mq+F
	/lBjFtCNXGTKmlv+gx8ArkjG1SIkuJG+c41DL73yWfgXBkKGexuR/QRhvkSukad9GUnB
	KJTQ==
MIME-Version: 1.0
X-Received: by 10.60.140.168 with SMTP id rh8mr6005071oeb.76.1375999030317;
	Thu, 08 Aug 2013 14:57:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 8 Aug 2013 14:57:10 -0700 (PDT)
In-Reply-To: <ebd74052582cd3def1b5a4c3d609cfc6b2613933.1375996888.git.nitin.a.kamble@intel.com>
References: <cover.1375996888.git.nitin.a.kamble@intel.com>
	<13a5bf7b035552bb397edea9c91dc528cfa9b70d.1375996888.git.nitin.a.kamble@intel.com>
	<ebd74052582cd3def1b5a4c3d609cfc6b2613933.1375996888.git.nitin.a.kamble@intel.com>
Date: Thu, 8 Aug 2013 18:57:10 -0300
X-Google-Sender-Auth: OonclodyZGn2MKuugmmwnAw_m2U
Message-ID: <CAP9ODKqozB=XwJfoKyx99uEcqcdri_VYd3Uqm3R6yZ3eeLkQ3A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Nitin A Kamble <nitin.a.kamble@intel.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gst-meta-base: bring in the v4l2 related gst plugin
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
X-List-Received-Date: Thu, 08 Aug 2013 21:57:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 8, 2013 at 6:34 PM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> If the v4l2 machine feature is enabled, then the v4l2 gstreamer plugin
> is also pulled in the gst-meta-base packages.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> index 210da37..c1139f4 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> @@ -35,7 +35,9 @@ RDEPENDS_gst-meta-base = "\
>      gst-plugins-base-videoscale \
>      gst-plugins-base-ffmpegcolorspace \
>      gst-plugins-good-autodetect \
> -    gst-plugins-good-souphttpsrc"
> +    gst-plugins-good-souphttpsrc \
> +    gst-plugins-base-videotestsrc \

videotestsrc is not related to this change.

> +    ${@base_contains('MACHINE_FEATURES', 'v4l2', 'gst-plugins-good-video4linux2', '', d)}"
>
>  RRECOMMENDS_gst-meta-x11-base = "\
>      gst-plugins-base-ximagesink \
> --
> 1.8.1.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

