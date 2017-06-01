Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id D7CBB77E13
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:06:14 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id d127so66245737wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 09:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=0xSTtI2KXWCnSFL25LPIS6y1oj/6DMTcC4yt6WEw8/E=;
	b=pFj3Jy3uYvsDeP/U819nrsispPopqcPLvMNkRpOWU04kusQwau0rp0w8cwJUBWc7vK
	fripK1oHdF+aL0gRPlqdpm3peVff9VHYImz9IoYBGeZgIkxMh2Ub7f00LEBvmB4z4Ubw
	MYfEBRbTD9hwi7RZGHhcZ5w9LQiTP+4Ox5ZlGkO5FENF4yQirNn4vtnv53SI6Ivx6O40
	3xmiHgnxN/jGmM6XWMta8AWywSVzztz4QzKY9AEdSdEjKXQOnQ1gaCzf7TMgJeyqn07I
	87z6koN/0UhOwT6tBmad16DhKqU2YATVPiz97jFGGH6zWuFr98E1ghW2zG33GZsWgyYp
	YcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=0xSTtI2KXWCnSFL25LPIS6y1oj/6DMTcC4yt6WEw8/E=;
	b=BA4CmLAtoYTe/5EfdkczbtzuwcItbngxVNrjHLyHX018DPdWLA52OYzByKyANEHjM2
	reQRlLv2CNdVmLrIPZyNX18KAGDExXvt76jSXTl5aW849wvXTkfFFz7v7y4Fk2nRhS1O
	JIHfNailctRt/vQ5kLz51aH3p4zqYLmQ51KPhVg+b8gVQLMGIh5HqAMO/W9Dum/suJEZ
	2Rwpx23E9AlR6JsfVuobcUFwHbzYuGPr7jpko5jdou7fEN+CdOeizKkuLpKnHAXFUnFG
	e1UiH1oV96bLXZ/JUVIKcbrpisIGSVcFjNcc7+8Nl74smVD13MZwvTIIL8iA0ytWT+sK
	EERg==
X-Gm-Message-State: AODbwcAtSV3r4LmD5IBMUduS793UCMbx51lodJ78ICpLDhhCH18zuD7m
	lDib4XreEuO+IK6PKXOg+oplHCZ4cQ==
X-Received: by 10.80.182.35 with SMTP id b32mr2473254ede.123.1496333175182;
	Thu, 01 Jun 2017 09:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spQcs7rHhT=NgHBWhDESzEzbJx4XReBmREtr=rs5c9FjQ@mail.gmail.com>
	<12b1e915-31c9-3258-1013-46854abb78ae@windriver.com>
	<f960d84e-0372-07f1-22f9-0768f5792f8b@linux.intel.com>
	<CAMKF1spOiMc6rT4MBN5zx8LfqnpZAHVCGHWbarjy7YaS+rWLuA@mail.gmail.com>
	<29a09c94-56d0-e60a-9444-94d5df312673@linux.intel.com>
In-Reply-To: <29a09c94-56d0-e60a-9444-94d5df312673@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 01 Jun 2017 16:06:04 +0000
Message-ID: <CAMKF1srrXOyor_5T5ftDSKaG3+OTqQXzg_DCEFj3oGsAkEc9_w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	Mark Hatle <mark.hatle@windriver.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: AS_NEEDED and rpm4
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
X-List-Received-Date: Thu, 01 Jun 2017 16:06:15 -0000
Content-Type: multipart/alternative; boundary="94eb2c0e433a5f59da0550e8375a"

--94eb2c0e433a5f59da0550e8375a
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 1, 2017 at 8:43 AM Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 06/01/2017 06:37 PM, Khem Raj wrote:
> > I don't use rpm so I won't be able to test it
>
> You only need to issue 'bitbake rpm', no?



Be mindful of what you ask for just building is not enough for such a
change and rpm is quite fundamental component

>
>
>
> Alex
>
>

--94eb2c0e433a5f59da0550e8375a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Thu, Jun 1, 2017 at 8:43 AM Ale=
xander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">ale=
xander.kanavin@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On 06/01/2017 06:37 PM, Khem Raj wrote:<br>
&gt; I don&#39;t use rpm so I won&#39;t be able to test it<br>
<br>
You only need to issue &#39;bitbake rpm&#39;, no?</blockquote><div><br></di=
v><div><br></div><div>Be mindful of what you ask for just building is not e=
nough for such a change and rpm is quite fundamental component=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
<br>
<br>
Alex<br>
<br>
</blockquote></div></div>

--94eb2c0e433a5f59da0550e8375a--
