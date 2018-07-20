Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0989678AF8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 09:11:12 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id s9-v6so8782174wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DMSWvQL3w8bwE0c8fzqa2Kb+uYFCvJ1CrvfkQaK51jQ=;
	b=SoKU8AlbRApCvQSK2vfgU/amSmz9vtK6TQm0fhaRdBFQszDE65Z2JQZoa3T5GkDEeA
	AXq4eBrqdh5Cpt1eAaTXwxyUQgu7Wp6cNTmvWporu7Z2FSAquGdIpbUXfBJ+6u8a9G2n
	RIeB1s3/AimZqZ0idBjBb9fy6IiL3Q/4+O1KtIAzpdhf6Qa/IZCUvRLwMpvR1LcmCVez
	faYuVsFgsEJrJgh9USjGwcyR9P8o0aPHvu/FjISt+zGXuQziEQc+Wvh5qOaNUw5cKxZ+
	oxc6pfCPI9VCOa+j6iuCroQoSpDBsjGNviN1Fh5qOkWzWb2x4PWdRQvCEOfgexOm0UYX
	iqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DMSWvQL3w8bwE0c8fzqa2Kb+uYFCvJ1CrvfkQaK51jQ=;
	b=IqoM53e3smX2Yi0PbcO57T+wOUhatImdOeJV/tQmHApArtE+lgOyWZ5ZqoMxcvPMDh
	4WRhbfdIxh9FhSn4Kg6762NFPD+NBBVvj3Fv1rR/3GU8L5X33k+Yc6ORlF8XJMd7CLEv
	GE07/pWnB+0U2fb3O/a5DgOLNK5n52F85CPyaIR1CiUT5J4QYK/4NrFt6WzRwL/ke1y9
	glfVMU2dmEhiOPKo0+30WAlq9uWDa12+Tf8iXmyLbJN/NTkKzAaBBa0ujFtMBtyeRNWZ
	hEsm/DX9bNm1TuO5YlbWguqduAvkWKYOGyGjbIwXD9PUu7Amh2QJKo9yJM97owzUdQdG
	6HAQ==
X-Gm-Message-State: AOUpUlEXgSyMf2POLCEQf8QIs0i+d3OGN3/m6Se7jMmupATeJm+IhcfU
	eEMW49Q06FO8zx5ypPGx+xsbt4QzihIZJXtFAfk=
X-Google-Smtp-Source: AAOMgpe95LOSNhWncmZy/JokYNncpc2Kv7fwUfXR5Ghmu5EKZFWA58Bw/VU/ZdtZm5OOfJm6YKwZjXCUx8AIWfBH+r4=
X-Received: by 2002:a1c:b484:: with SMTP id
	d126-v6mr984460wmf.17.1532077873700; 
	Fri, 20 Jul 2018 02:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <43d5b925-755b-3dbc-63b0-0df6e89396db@linux.intel.com>
	<20180320121017.943-1-Martin.Jansa@gmail.com>
	<CAJTo0LY26Yp5tgyc3CJLGbeNioRB0Bu_SRd0o3CgAeHzvO8+=w@mail.gmail.com>
	<580eec70-ffc4-fa12-b52d-28717c0c21a5@linux.intel.com>
In-Reply-To: <580eec70-ffc4-fa12-b52d-28717c0c21a5@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Jul 2018 11:11:04 +0200
Message-ID: <CA+chaQe0U+-KTqnMe015uKuF5ExFY4qq0Brbnx7thOzNLoFvSA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gio-module-cache.bbclass: disable update_gio_module_cache postinst script for nativesdk
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
X-List-Received-Date: Fri, 20 Jul 2018 09:11:13 -0000
Content-Type: multipart/alternative; boundary="0000000000006e24fc05716aad91"

--0000000000006e24fc05716aad91
Content-Type: text/plain; charset="UTF-8"

I've tried to remove this from my sumo build and noticed that it's still
failing, the log shows:

NOTE: Running intercept scripts:
NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
WARNING: The postinstall intercept hook 'update_gio_module_cache-nativesdk'
failed, details in my-sdk/1.0.0-1-r3/temp/log.do_populate_sdk
NOTE: Exit code 255. Output:
my-sdk/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_64/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec/nativesdk-gio-querymodules:
Invalid ELF image for this architecture

unfortunately the workdir is again gone already, I'll check if it happens
with latest master as well and will try to keep the workdir if rm_work
isn't faster than me.

Cheers,

On Tue, Mar 20, 2018 at 7:02 PM Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 03/20/2018 06:07 PM, Burton, Ross wrote:
> > Can you file a bug for this? Probably best to fix instead of working
> > around, as this leaves gio modules broken.
>
> I also wonder if the shadow recipe's postinst needs to be fixed properly
> (instead of removing it altogether for nativesdk). On the other hand
> these two have been broken for a long time, and no one noticed, so maybe
> they don't need working nativesdk postinst at all.
>
> Alex
>

--0000000000006e24fc05716aad91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve tried to remove this from my sumo build and =
noticed that it&#39;s still failing, the log shows:</div><div><br></div><di=
v>NOTE: Running intercept scripts:</div><div>NOTE: &gt; Executing update_gi=
o_module_cache-nativesdk intercept ...</div><div>WARNING: The postinstall i=
ntercept hook &#39;update_gio_module_cache-nativesdk&#39; failed, details i=
n my-sdk/1.0.0-1-r3/temp/log.do_populate_sdk</div><div>NOTE: Exit code 255.=
 Output:</div><div><span style=3D"font-size:small;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">my-sdk</span>/1.0.0-1-r3/sdk/image/opt/webos-sdk-x86_6=
4/7.0~s14/sysroots/x86_64-webossdk-linux/usr/libexec/nativesdk-gio-querymod=
ules: Invalid ELF image for this architecture</div><div><br></div><div>unfo=
rtunately the workdir is again gone already, I&#39;ll check if it happens w=
ith latest master as well and will try to keep the workdir if rm_work isn&#=
39;t faster than me.</div><div><br></div><div>Cheers,</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Tue, Mar 20, 2018 at 7:02 PM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">alexa=
nder.kanavin@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">On 03/20/2018 06:07 PM, Burton, Ross wrote:<br>
&gt; Can you file a bug for this? Probably best to fix instead of working <=
br>
&gt; around, as this leaves gio modules broken.<br>
<br>
I also wonder if the shadow recipe&#39;s postinst needs to be fixed properl=
y <br>
(instead of removing it altogether for nativesdk). On the other hand <br>
these two have been broken for a long time, and no one noticed, so maybe <b=
r>
they don&#39;t need working nativesdk postinst at all.<br>
<br>
Alex<br>
</blockquote></div>

--0000000000006e24fc05716aad91--
