Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1488F60620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 03:17:14 +0000 (UTC)
Received: by lfs39 with SMTP id 39so79796727lfs.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 19:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NdmEyOEOZajEO3ENSG6BoEytoXDL6XgFJMHMSGXfC3s=;
	b=wFeT5uQpmpjKLtZ5I7bb9swup5OnFjRf2fP+CTN6EJipfjPxwqlAtF/W08ydUh9ult
	sUeWUSM8++qiI1nh9nH0YvOYdHMKzZnWIIH6C7t6+ydeUwmQ91e575eZFQyDHfurWlod
	5pxJ0aZtvqtYo/sFh/N6PvQwF2YhTEcp3iDdYv/bcSt48n+5fSS/9pR0Hm/qvmB6RQJn
	h22WMx3sg0cnQhmBDZVPKkDxSQH3Ms8qP1vLt3Qgom14r4JlUEFGQgoJB48WyFmlWwt5
	9tVb0AgzXOECN0Rfi+OMBV7eH99qDd2FI23m4TVsY/n305KLa98Rf6eX1+otZEdVXevb
	oraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=NdmEyOEOZajEO3ENSG6BoEytoXDL6XgFJMHMSGXfC3s=;
	b=fxABGdT1BwjW8yv6pYpfh3DO9iMJiGrJOaxp1H2OO0c38du1eVFFMw1J4QemjhgPs1
	Zm8H0n8V2P3eIBDaYETGs90DRFZFYkYXHuBvabCtks4Pz6IU6eYi75/wP3TuGPqKKvTv
	+j4OvtT8SK76jIYH1gTyDfMiEYs+mmhD1d6kyn61bumQk+WdUk8mryR2toCERgy/ODqi
	3bgDKVCGjtDDDdj10YXgp33TTNB7Sr9rwTM+DrUbyBu7WCoODgPaxTvOffr02ynvaDoD
	2+OdCOUTCDPfHTo98sCH9BloWsX7Zo0TK8ctsstofh/ukTmq6ZEZBF5/1cNKRTcrxrEJ
	Vd9A==
X-Gm-Message-State: ALoCoQkYmZXtvi6oaXVL0mCiO//YTtBLKGH/kaMoW04UXPoXMWKRG6IFPTMdUxMifw9PGKQzMgaG
MIME-Version: 1.0
X-Received: by 10.25.30.5 with SMTP id e5mr13261944lfe.48.1448507834860; Wed,
	25 Nov 2015 19:17:14 -0800 (PST)
Received: by 10.114.122.72 with HTTP; Wed, 25 Nov 2015 19:17:14 -0800 (PST)
In-Reply-To: <CAJTo0LY5XsdV0ZuR-sK=rFM3GXJf4bRC59tnPno_a8LQJ-srrg@mail.gmail.com>
References: <1448434479-29558-1-git-send-email-jkrishnanjanappa@mvista.com>
	<56557491.4010809@windriver.com> <20151125103453.GM17303@jama>
	<CAD3vsf5rOZXj6oxQ4eaEdCW9bMcFJ-He4VyZy4dJ6KScW1S7dQ@mail.gmail.com>
	<20151125124151.GO17303@jama>
	<CAD3vsf7T2rOeO5n+XdwzFrT_pEecHPQMOPGxH6CJEMD5FvLn2A@mail.gmail.com>
	<CAJTo0LY5XsdV0ZuR-sK=rFM3GXJf4bRC59tnPno_a8LQJ-srrg@mail.gmail.com>
Date: Thu, 26 Nov 2015 08:47:14 +0530
Message-ID: <CAD3vsf6bb9kFYaaLoDFpxv9ucGLhU3DwXxTSeei2AwHVtm=r_A@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Thu, 26 Nov 2015 03:17:16 -0000
Content-Type: multipart/alternative; boundary=001a113fa5d0f3a1e90525690287

--001a113fa5d0f3a1e90525690287
Content-Type: text/plain; charset=UTF-8

Hi Ross,

>
> Yes, since copy_license_files() function is executed within the pseudo
>> environement (fakeroot), both os.getuid() and os.getgid() return 0,
>> which resembles to uid and gid of root user. Also, os.chown accepts integer
>> values for 2nd and 3rd arguments.
>>
>
> So is there any advantage to using os.getuid() over hardcoding 0:0? It's
> not like root is going to have a different UID.
>
> The intention of using os.getuid() is to avoid writing hardcoded value
 "0", since os.getuid() return "0" under fakeroot env; if root user is
having UID as 0.That's the advantage I can think of.

The above has been tested with Poky (Jethro version), it worked fine.
But still, if the opinion is to change os.getuid() and os.getgid() to 0, I
will send v2.

Regards,
Jagadesh


> Ross
>

--001a113fa5d0f3a1e90525690287
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Ross,<br><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_extra"><span class=3D""><div class=3D"gmail_quote"><br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div>Yes, since=C2=A0<span style=3D"font-size:12.800000190734=
9px">copy_license_files() function is executed within the pseudo environeme=
nt (fakeroot), both=C2=A0</span>os.getuid() and os.getgid() return 0, which=
 resembles to uid and gid of root user. Also, os.chown accepts integer valu=
es for 2nd and 3rd arguments.</div><div></div></blockquote></div><br></span=
>So is there any advantage to using os.getuid() over hardcoding 0:0? It&#39=
;s not like root is going to have a different UID.</div><span class=3D"HOEn=
Zb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div></font></s=
pan></div></blockquote><div>The intention of using os.getuid() is to avoid =
writing hardcoded value =C2=A0&quot;0&quot;, since os.getuid() return &quot=
;0&quot; under fakeroot env; if root user is having UID as 0.That&#39;s the=
 advantage I can think of.</div><div><br></div><div>The above has been test=
ed with Poky (Jethro version), it worked fine.</div><div>But still, if the =
opinion is to change os.getuid() and os.getgid() to 0, I will send v2.</div=
><div><br></div><div>Regards,</div><div>Jagadesh</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div dir=3D"ltr"><span class=3D"HOEnZb"><font co=
lor=3D"#888888"><div class=3D"gmail_extra"></div><div class=3D"gmail_extra"=
>Ross</div></font></span></div>
</blockquote></div><br></div></div>

--001a113fa5d0f3a1e90525690287--
