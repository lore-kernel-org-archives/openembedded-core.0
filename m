Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2291B77038
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:12:02 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 38so26577972iol.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q5c9v6O1uwC79ZBTeovAUJasyTs54VE9PIfzRu71yas=;
	b=ICoHVVRYBeqT4Y2N3nsTXTqmpXIDU+t/qwL39R8ZNb6+/nxMFJZQdb3ttk7c1lUbHB
	bGfkayJmCrYejO0mWxPxCoBgzUF+l3VfrpakSsWVDlFEKzEijzFrfyqwKR9yuRZTn366
	dmRee1R7MMuYftt5ukhYN6nA5VPoURexj3mbO2ebajcMKDzXyNfv8kTy/3V0cNlP0+R5
	9WceWdlZIIZgPJPjsqDnc8zaLohWX72xnzcursMRIfx8r6rEuhVwoW5mxcp1d8b2UN54
	OhAqBrikecC0Q6xk3gXNVly1A46X1UZD+GtVdfkoIkVGgzAs1nupoG2AzK/LdmWooiNG
	5cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q5c9v6O1uwC79ZBTeovAUJasyTs54VE9PIfzRu71yas=;
	b=AHPOca+x37ySCJpTaiC5monjopNJrvdgX8/7gl6svdJGAFqxHjnB3F+BcNDDyMhj2V
	aU6sUNdwaJMVTYVrdYfJg0/I899plIpfnbDRDqmNQKKNezJzEuTst86yStTOJflNSNG7
	+eHgyFcuH03aqhB2H574g1ekXQCnWSrkYug+x0y1+Z3HiT4xAVpQZ00KqOT7sm5+h0wb
	ZrfDfkDszSUaS0oc8/b9/1EozCzunhUUGlzywbcdzkT/m7F7Ya2AJDj78OlB0iskn0vO
	ZjNLSG0Nq7/wfq8QvY6wib8ISrno3asDFnHdE9jn9F+kbdkHvQ3VAgoue+URsz9t2nRI
	D8vQ==
X-Gm-Message-State: AEkoousZEuy1mX6aBb0WqySAvPNTBsVpwx6wpCzACNtAqFGzAZHTgahOk8UzpF3pqv48CkcAxTEZApHqcl7FkiHi
X-Received: by 10.107.154.196 with SMTP id c187mr4588528ioe.99.1471543923419; 
	Thu, 18 Aug 2016 11:12:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 18 Aug 2016 11:11:43 -0700 (PDT)
In-Reply-To: <56847BB1-DCA8-446D-9418-2D42098A7073@gmail.com>
References: <1471499308-1666-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<CAJTo0LZy-mx4K=eSJdNRq12JVDzGwW+Oe0uf40YRZAmyWVJsZQ@mail.gmail.com>
	<56847BB1-DCA8-446D-9418-2D42098A7073@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Aug 2016 19:11:43 +0100
Message-ID: <CAJTo0LZJRJFC71=xEa_EQUiOTZNWR8QPGtnJvSWqqGLqM_QjcQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: 2.34.0 -> 2.35.3
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
X-List-Received-Date: Thu, 18 Aug 2016 18:12:03 -0000
Content-Type: multipart/alternative; boundary=001a1140e81ed3c1d2053a5c84e9

--001a1140e81ed3c1d2053a5c84e9
Content-Type: text/plain; charset=UTF-8

On 18 August 2016 at 18:58, Khem Raj <raj.khem@gmail.com> wrote:

> perhaps recipe updater script should account for such presets ?
>

It does:  http://recipes.yoctoproject.org/rrs/recipedetail/451/ says
up-to-date as we have 2.34.0 despite there being 2.35.3.

These upgrades have been done without reference to the tooling we've got.

Ross

--001a1140e81ed3c1d2053a5c84e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 August 2016 at 18:58, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex"><div>perhaps recipe updater script should account=
 for such presets ?=C2=A0</div></blockquote></div><br>It does: =C2=A0<a hre=
f=3D"http://recipes.yoctoproject.org/rrs/recipedetail/451/">http://recipes.=
yoctoproject.org/rrs/recipedetail/451/</a> says up-to-date as we have 2.34.=
0 despite there being 2.35.3.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">These upgrades have been done without reference to =
the tooling we&#39;ve got.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a1140e81ed3c1d2053a5c84e9--
