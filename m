Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 68A6B721D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 14:04:37 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id i17so3729007qcy.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 06:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mJ24wBOM8Lue0zFp2qiv/ILxwEQYDx9srNhpYUVrPyw=;
	b=eEGhb8/NN2Z7i2SartFc31q2IlHe5eA7hSJrC1gFTa+aWc2odfId2kg54L43MyqzeD
	OFNRdsL88rQVelceyIr2LH+NJ2CFbDAacD1QeBazEie3sg8mCXIRFUiv+1XKuvQW3i9W
	6HAyVYyvoOXeRknKmVkvgIM5QGX+KaN8U661BmWdkfdWIMsTBRYmc8V50A/eNL44Rp48
	uNq2ol6o1xH/VUnghLAj3UelyHTdu6JKWNu03eg8e2rdkZogd3H8KoaqK/4AeO5uczS7
	ZRULyIf1vHALcL2av9nenr4+Znac8XSBHcd7ZaVn+GPFNkMM0lRuE70jiLI7S+ZOSp1G
	Y6bQ==
X-Gm-Message-State: ALoCoQl3FuxX0to3E8rQpDwfSHwMqGBHW1jcKdOMc4pGm+HB4LtDQNH+9XjqBJK2M7vNxqh77SId
X-Received: by 10.140.17.67 with SMTP id 61mr6473345qgc.59.1416578678171; Fri,
	21 Nov 2014 06:04:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Fri, 21 Nov 2014 06:04:17 -0800 (PST)
In-Reply-To: <20141121140133.GE2163@jama>
References: <20141112153903.E7E7F50273@opal.openembedded.org>
	<20141121140133.GE2163@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Nov 2014 14:04:17 +0000
Message-ID: <CAJTo0LYjQqu-VWVrmTU=6BWm8b6g+9yOiv=xcMZLquJ3jEbLaA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Ross Burton : vala: upgrade to 0.26.1
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
X-List-Received-Date: Fri, 21 Nov 2014 14:04:38 -0000
Content-Type: multipart/alternative; boundary=001a11c0fa28e8c6a005085eec62

--001a11c0fa28e8c6a005085eec62
Content-Type: text/plain; charset=UTF-8

On 21 November 2014 14:01, Martin Jansa <martin.jansa@gmail.com> wrote:

> > vala: upgrade to 0.26.1
> >
> > vapigen can't be disabled anymore, so remove --disable-vapigen.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Was this needed and tested with some real world applications?
>
> Or was it tested only because package index was showing possible
> upgrade?
>
> Causes couple failures in world builds:
>

Yes and yes (the new rygel that I'm about to submit to meta-multimedia).

I don't have those layers checked out - are they failing because they want
a specific version of vala, or some other reason?

Ross

--001a11c0fa28e8c6a005085eec62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 November 2014 14:01, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3q1" class=
=3D"a3s" style=3D"overflow:hidden">&gt; vala: upgrade to 0.26.1<br>
&gt;<br>
&gt; vapigen can&#39;t be disabled anymore, so remove --disable-vapigen.<br=
>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
<br>
Was this needed and tested with some real world applications?<br>
<br>
Or was it tested only because package index was showing possible<br>
upgrade?<br>
<br>
Causes couple failures in world builds:</div></blockquote></div><br>Yes and=
 yes (the new rygel that I&#39;m about to submit to meta-multimedia).</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I don&#39;t=
 have those layers checked out - are they failing because they want a speci=
fic version of vala, or some other reason?</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c0fa28e8c6a005085eec62--
