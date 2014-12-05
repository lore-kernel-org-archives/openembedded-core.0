Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id A617C72391
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 14:58:34 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q107so530811qgd.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 06:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=veVSN7axiz5p2FHVfY6h9GHwuo6AeVOaLI5uw9RZjdg=;
	b=U2iQOx9OPikKHL/tAZ+jwvkBKswnvK5ql4oYuQRjOd1DYrmmZZ/+h28K4wwzU9rkuo
	pJbrC8ExIS3kFKOwXvctsWwK4D1bnbZDyifGsFj/Ffla/am6AcJo4ZbH+Q8BrCXZfISL
	MfUoO8T6/FkQpR9/QktKf7zmCUqLt4wiw/O155Lue2B2dohjS0ClVxfwVeDwXd2pSPyJ
	fMqEpYzs6b8b6NEywgl3Qv5uOqvLtfOWLCHWORgZu0J6EpJ9IQKagYYyIE3mb5bDPR1X
	ZZGVHzxYeYVjMvwxKCB3NcL9yQSkDClldyAvRYI/Os+Ir6vIKufa+JPSknG+/DMUGBrE
	78Gg==
X-Gm-Message-State: ALoCoQnxQ9EdUgvSraP+20hFsD1/ZcUmUamqPtgB4o1IF13wicwtj5G83T6F2m7dQpP44CuuNJNs
X-Received: by 10.140.94.229 with SMTP id g92mr26185976qge.77.1417791514839;
	Fri, 05 Dec 2014 06:58:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Fri, 5 Dec 2014 06:58:14 -0800 (PST)
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28E9FDF811@EU-MBX-03.mgc.mentorg.com>
References: <1417779643-18350-1-git-send-email-awais_belal@mentor.com>
	<CAJTo0LZ1=H4Gz90Ni0sFjL29LMgqMXR18ZTv0uOjLCtsziboEg@mail.gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28E9FDF811@EU-MBX-03.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Dec 2014 14:58:14 +0000
Message-ID: <CAJTo0LY0-X-w2uarbL7bKKCjirw6JUi-w6GXO2Qm3f0zPmcJTA@mail.gmail.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxcb: fix socket writes
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
X-List-Received-Date: Fri, 05 Dec 2014 14:58:45 -0000
Content-Type: multipart/alternative; boundary=001a113a0e8e9ba7410509794ffe

--001a113a0e8e9ba7410509794ffe
Content-Type: text/plain; charset=UTF-8

On 5 December 2014 at 14:26, Belal, Awais <Awais_Belal@mentor.com> wrote:

> I will look into the version upgrade. Can this be merged to dizzy?
>

Dizzy would have to be a backported patch as you originally submitted.

Ross

--001a113a0e8e9ba7410509794ffe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 December 2014 at 14:26, Belal, Awais <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Awais_Belal@mentor.com" target=3D"_blank">Awais_Belal@mentor.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"directio=
n:ltr;font-family:Tahoma;color:#000000;font-size:10pt">I will look into the=
 version upgrade. Can this be merged to dizzy?<br>
<div></div></div></blockquote></div><br>Dizzy would have to be a backported=
 patch as you originally submitted.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a113a0e8e9ba7410509794ffe--
