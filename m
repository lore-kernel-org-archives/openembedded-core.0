Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 872C377AB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 17:02:57 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id y76so161479458qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 10:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G/Hw47nI3g9eVudfhXjzidM+D8VaQJP/PG1dvXQCToo=;
	b=kR+2eg/ChXiAWcob5Fgi4IhO6gnSp6KPRq3kKD3Yr8db6dqCFoeHK9bl+KDPpvI/zc
	NfLlP0rgOxrC3pE7GeIHWL1T28UiXhY0aZEjDVpzCTOtRIgekG8x7ZOKqcgBkNsZV3rL
	Bp2Ve7RirpX1BSO2TngF72mVc/UJ1tvOLeJKy+1PvUrgniHGHw37FAM2DrCceluTKqyK
	1d57cjte8qhnxp9t/xeqSJhS5vjjXKe/9KhawcGA2j6OYwHDq65+52AHVAOTFI/1mFr3
	GXfx+eUQqDNKB6sCJzt+wQ+emHEIuSTrhw3c/AuahvfcqiLaobEOHPHBRXECEJe3AFyj
	CIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G/Hw47nI3g9eVudfhXjzidM+D8VaQJP/PG1dvXQCToo=;
	b=MDhBCD+zORdAAObNwAiooO9jLdyX8RWY2s35heoSFTdBn7e/OMVmIEzwYPmOL7Htlm
	D8OCkWtqq8GsDcC4GT4q9anCrmTbgggHoK6b7jQMHSO/EQDPjJVFqXT7btbkpM0ZTTKt
	3PEihnUqm6gA3TytrCduoV2sQwheBHjlL3XI4ySCcHEFcjgeafgS7zCdujwjKBl76EjS
	M4vVPjF5KBk+zS6NRJBJPes95D16YlHZzPSZf1bXNd6xIOLrN+gTs3GFuhJhTjNoLHhk
	yZQOUqsYNufnWFGA/kgezgCDHBK0Z5bZoJ75Sz7YiHwZoJa9/f8GPpmoDMIP9pwbXsPF
	0FMg==
X-Gm-Message-State: AFeK/H1MQrbXOssXlZdmQv8MUOc7OrR/dY+aTPO8XSNyz6xC1GHz58CrjB5lp4THAKgh49UxgxA2rhVlv63fTQ==
X-Received: by 10.55.174.6 with SMTP id x6mr39037147qke.318.1490202178224;
	Wed, 22 Mar 2017 10:02:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Wed, 22 Mar 2017 10:02:57 -0700 (PDT)
In-Reply-To: <CAJTo0LZV4kh3=r=cxYpBydGO74R6cvootczedwMW3s_k1xxSWQ@mail.gmail.com>
References: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
	<CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
	<CADkTA4Oj1mC+CMoT=DJAzsDtmCnm6TdZAO_xVFhujg+3kiwWVw@mail.gmail.com>
	<CAJTo0LaNwjnEvRRYrXwP6DJptvHc0Cm6E2QZyVEKsk1xLVoNJA@mail.gmail.com>
	<CADkTA4NhsEnk1j=_i3ahu2Lt23t802wn7yfyb5-fK9K3XAdM_Q@mail.gmail.com>
	<alpine.LFD.2.20.1703220821160.16426@uk63952.mitel.com>
	<CADkTA4OV+n4cMpR-6GTbM+Qu+bJ8TNntOXyQ7UWYDLHtB_JYfg@mail.gmail.com>
	<1490194798.13980.172.camel@linuxfoundation.org>
	<CAJTo0LZV4kh3=r=cxYpBydGO74R6cvootczedwMW3s_k1xxSWQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 22 Mar 2017 13:02:57 -0400
Message-ID: <CADkTA4NsUKkRBgZT1vVHXPCC1fGwr5xm-6nk26qT_=F5sR5Czg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: design question: should layer.conf contain "PREFERRED_VERSION" settings?
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
X-List-Received-Date: Wed, 22 Mar 2017 17:02:57 -0000
Content-Type: multipart/alternative; boundary=94eb2c06404e7a6887054b54bbbc

--94eb2c06404e7a6887054b54bbbc
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 22, 2017 at 11:44 AM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 22 March 2017 at 14:59, Richard Purdie <richard.purdie@
> linuxfoundation.org> wrote:
>
>> What should happen is that the openstack recipe should complain loudly
>> (error) if anyone tried to build it (or parse it?) with anything except
>> the versions its known to work with.
>>
>
> Is this a good time to bring up versions in DEPENDS?
>
> It would be awesome to automatically set PREFERRED_VERSION as appropriate
> depending on the constrains in DEPENDS, but I'd be really happy with errors
> if the versions specified were not selected.
>
> So in this case openstack could do DEPENDS=python-something (>4.0) and
> bitbake would error out if python-something v3 is being built.
>

That would be ideal, and it was actually something I tried in the past. But
it was causing
issues with some package backends, so most of those specifics had to be
dropped.

The details are fuzzy, but I could data mine my email if needed.

Bruce


>
> Ross
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c06404e7a6887054b54bbbc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Mar 22, 2017 at 11:44 AM, Burton, Ross <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote=
">On 22 March 2017 at 14:59, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@<wbr>linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div id=3D"m_-2016157887089947049:1nx" class=3D"m_-2016157887089=
947049a3s m_-2016157887089947049aXjCH m_-2016157887089947049m15af689089651d=
6d">What should happen is that the openstack recipe should complain loudly<=
br>
(error) if anyone tried to build it (or parse it?) with anything except<br>
the versions its known to work with.<br></div></blockquote></div><br></span=
>Is this a good time to bring up versions in DEPENDS?</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">It would be awesome to auto=
matically set PREFERRED_VERSION as appropriate depending on the constrains =
in DEPENDS, but I&#39;d be really happy with errors if the versions specifi=
ed were not selected.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">So in this case openstack could do DEPENDS=3Dpython-someth=
ing (&gt;4.0) and bitbake would error out if python-something v3 is being b=
uilt.</div></div></blockquote><div><br></div><div>That would be ideal, and =
it was actually something I tried in the past. But it was causing</div><div=
>issues with some package backends, so most of those specifics had to be dr=
opped.=C2=A0</div><div><br></div><div>The details are fuzzy, but I could da=
ta mine my email if needed.</div><div><br></div><div>Bruce</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span class=3D"HOEnZb=
"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c06404e7a6887054b54bbbc--
