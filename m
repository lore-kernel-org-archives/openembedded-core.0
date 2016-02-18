Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id AB3486067D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 15:20:12 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id g203so76548585iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 07:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=pEp4DZEaVrQxtBr/bzaQifjBmwsbTrFN3vaBKOe135M=;
	b=eFzffL70nS3XYYMyzR30HJMBctYaqcp4RIF9TNR4WBq5yDzi8L5fkP//K85GQlIETm
	zsjUR6gSPusLd3rkdyJ32oga2D0t/arJQ1+GdFERzQEhhJ/bgeh/J4GsgJh/kl7gGvdW
	X/ZOt23FRS4GzjZxWIprjpENuGilENyKj3xWxokEKjw/intoE15LKZLSZDZdPwl/fqxz
	NpRR3/ei9Jw8EDoXjBJYL0nhI2Dd4CysIcTVIMtB3pvNhbUluLd5/aVEiBp9xPlFaJ7E
	PnBSQ4dJGAKH/TRmRn/HcRmtHspK9gAjyq7FuIPrQybQ/Dg1po0dpx81ESri68a2g9Mr
	36QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=pEp4DZEaVrQxtBr/bzaQifjBmwsbTrFN3vaBKOe135M=;
	b=KMEuuw2VwgFbQ+7w29mFRkMwwmlWnVFLqLq51aM7z6kx79AIUPhSjXfDp5u8fJIqn0
	cU2pZdgbqo3k5W7D8kmQv2gmdcqq7OWITTVHhynJ1QRJhHa87lxe2QPPKzIs0LbTaliK
	ONSZbkdD+rkTCi4l8RJ1j7dz47HWz6x9BsU+29GU0qhdcl26KfcT/LMh3iSK8SosJovC
	coTC2f98jYCHabMMqOBhw5/iCVAm6JEY6ExcJ5rRWhGMGo0Dx/21+naJNc0IGfB9UmBQ
	BewLCBKGcfkO/Uei/9f2nZT8vPimblhZEm1ILxohHxL/lJzMffl92JQpJs0edYtPTYQM
	QtEg==
X-Gm-Message-State: AG10YOQbvlCQQjQc0JrVKX8pd5aewKRhXB+owRq5+XyRxHftmbHgcleYBSaQRLGYJYY+2bb7Xvh90DirJtHA1A==
X-Received: by 10.107.14.66 with SMTP id 63mr10062609ioo.150.1455808786653;
	Thu, 18 Feb 2016 07:19:46 -0800 (PST)
MIME-Version: 1.0
References: <1455805135-20814-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1455805135-20814-3-git-send-email-markus.lehtonen@linux.intel.com>
In-Reply-To: <1455805135-20814-3-git-send-email-markus.lehtonen@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 18 Feb 2016 15:19:37 +0000
Message-ID: <CABcZANmsXr=_Tim1MNpBcDxSJOu34THuzMejVo_bYm5e3XGOiA@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] devtool: update-recipe: create config fragment
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
X-List-Received-Date: Thu, 18 Feb 2016 15:20:12 -0000
Content-Type: multipart/alternative; boundary=001a113fe1be990f6e052c0ce545

--001a113fe1be990f6e052c0ce545
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 18, 2016 at 7:19 AM Markus Lehtonen <
markus.lehtonen@linux.intel.com> wrote:

> Create config fragment if the user makes modifications to kernel config.
> User may change .config e.g. by directly editing it or by running the
> 'do_menuconfig' bitbake task. Devtool generates one monolithic fragment
> by simply doing a diff between .config and .config.baseline files in the
> source directory.  If either of these files is missing, the config
> fragment is not gerenrated or updated. The output is a file,
> 'devtool-fragment.cfg' that gets added to SRC_URI in the recipe (as well
> as copied into the 'oe-local-files' directory if that is present in the
> source tree).
>
> ${S}/.config will be a symlink to ${B}/.config. We need to do this as
> devtool is not able to access ${B} because ${B} is set in a .bbappend in
> the workspace layer which is not parsed by devtool itself.
>
> [YOCTO #8999]
>
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>

If the devtool-fragment.cfg already exists, what's the behavior? Will it
update it with both the old and new changes, or will it create a second
fragment?

--001a113fe1be990f6e052c0ce545
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, Feb 18, 2016 at 7:19 AM Markus Lehtonen &lt;<a href=3D"mailto:markus.leht=
onen@linux.intel.com">markus.lehtonen@linux.intel.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Create config fragment if the user makes =
modifications to kernel config.<br>
User may change .config e.g. by directly editing it or by running the<br>
&#39;do_menuconfig&#39; bitbake task. Devtool generates one monolithic frag=
ment<br>
by simply doing a diff between .config and .config.baseline files in the<br=
>
source directory.=C2=A0 If either of these files is missing, the config<br>
fragment is not gerenrated or updated. The output is a file,<br>
&#39;devtool-fragment.cfg&#39; that gets added to SRC_URI in the recipe (as=
 well<br>
as copied into the &#39;oe-local-files&#39; directory if that is present in=
 the<br>
source tree).<br>
<br>
${S}/.config will be a symlink to ${B}/.config. We need to do this as<br>
devtool is not able to access ${B} because ${B} is set in a .bbappend in<br=
>
the workspace layer which is not parsed by devtool itself.<br>
<br>
[YOCTO #8999]<br>
<br>
Signed-off-by: Markus Lehtonen &lt;<a href=3D"mailto:markus.lehtonen@linux.=
intel.com" target=3D"_blank">markus.lehtonen@linux.intel.com</a>&gt;<br></b=
lockquote><div><br></div><div>If the devtool-fragment.cfg already exists, w=
hat&#39;s the behavior? Will it update it with both the old and new changes=
, or will it create a second fragment?</div></div></div>

--001a113fe1be990f6e052c0ce545--
