Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1E17075E80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 21:17:19 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so77048495qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 14:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IY81hHCRHJN84gwNZUdd6utAeiOHZ494OWfFtigWqNw=;
	b=DJcZrgwy+yduLcNdtOKeWzFdjDfgprPaZaBH/NaOW9HyLWdK0rUYHQ/8FS6hX1mRdS
	20vKB4A9Bt03zFjT6Pz4ITLNVZhmc5v5AI2CiMlJKEd1GLsbUy93yfCdcz/gCvddCJYM
	Ex2yydpR183GeFVhy/+AZZ7O4es8EsMPH6aphHWhiUaBSp+8ZHzXTN6lJtyaHY8TPXWl
	YYp8RO4fvDezRUoTa7olVOhHVMF0324oghOOSqjHsk6FsSmAyDdm9hvvql+3fXaU/n+a
	IiQgBrFI6TQQg9Ro489mduNURj+jYfMmtSbiVnyFU2D5F8XP3gv1S1z4c7gxuf+GDLJC
	dneg==
X-Gm-Message-State: ALoCoQlyQu6an83hD2c5uCOeO8XLj+r9KKXl7Z4r39ESFr1HvCe5Yyd7giXfwfscrKKOQAtRS77G
X-Received: by 10.140.109.74 with SMTP id k68mr28755860qgf.77.1445635039995;
	Fri, 23 Oct 2015 14:17:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Fri, 23 Oct 2015 14:17:00 -0700 (PDT)
In-Reply-To: <CAP71WjyN5pvA_VjwDcGLh6ze5P+e7afM025tYp8dcx1f-cMgZg@mail.gmail.com>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
	<1445242541-41638-2-git-send-email-s.christ@phytec.de>
	<CAP71Wjz2YEuj8qLEw63027bGcYKNAPOazv-8Rd+J5RQ2C50UKA@mail.gmail.com>
	<20151019090300.GC3869@lws-christ>
	<CAP71Wjzhq_UVTb0cZHWLs=FPp0YRseXb-Q0RyAQXjDAuKFFLuQ@mail.gmail.com>
	<20151019092110.GE3869@lws-christ>
	<CAP71WjyN5pvA_VjwDcGLh6ze5P+e7afM025tYp8dcx1f-cMgZg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Oct 2015 22:17:00 +0100
Message-ID: <CAJTo0La+TivBoTBVGoc6SE7PFU=M+Kfw42bOMPTthTqvNKb-cA@mail.gmail.com>
To: Stefan Christ <s.christ@phytec.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] linux-dtb.inc: fix detection of ending '.dts'
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
X-List-Received-Date: Fri, 23 Oct 2015 21:17:25 -0000
Content-Type: multipart/alternative; boundary=001a1139af2408ed280522cc2378

--001a1139af2408ed280522cc2378
Content-Type: text/plain; charset=UTF-8

Hi Stefan,

On 19 October 2015 at 10:46, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> i (very) quickly looked at them..
> #3, #4, #5 look sane.
> #6, #7, i am not sure if this is worth doing this change.. we'll see
> what others think about them..
>

Can you drop 1 and 2 and rebase the remaining patches?  The rest of the
series doesn't apply if 1 and 2 are dropped.

Ross

--001a1139af2408ed280522cc2378
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Stefan,</div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 19 October 2015 at 10:46, Nic=
olas Dechesne <span dir=3D"ltr">&lt;<a href=3D"mailto:nicolas.dechesne@lina=
ro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":1pg" class=3D"a3s" style=3D"=
overflow:hidden">i (very) quickly looked at them..<br>
#3, #4, #5 look sane.<br>
#6, #7, i am not sure if this is worth doing this change.. we&#39;ll see<br=
>
what others think about them..</div></blockquote></div><br>Can you drop 1 a=
nd 2 and rebase the remaining patches?=C2=A0 The rest of the series doesn&#=
39;t apply if 1 and 2 are dropped.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a1139af2408ed280522cc2378--
