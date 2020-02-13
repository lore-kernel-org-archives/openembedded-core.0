Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 915FC60EE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:42:30 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id v195so6251157qkb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NPFvWcE712w8SWmPIhjRleuZF1kWjtoDP3zL+N5G+Ng=;
	b=X/6uCl1DZrZIoMKTkOIkjyx54VgrX/8ab0oPuNMJhoHFvV67Iq6TfPwJkZatWCPRXI
	/r1Tw6iOhNbgaNmK+qarhAoncWy8y1NhO2gic2znykrIoZLEYXoxTJWhuQlYGTZL0hSC
	Im8NA7+KYyMw/EczFOCdacr9Dv0eXCyG7wsyR+YNIlR9IiE1Ftl3VX9Mqp74W4aDVDd+
	8ZOb4Ehk72lipkG5++HBs2z0go4KuTIHbVwSUf6X0xso1AE5Uu+O7ktt/QE0wydAZTgA
	2fK/W8OdoxFzeTZ7MY+xmEcZyPhJrGDvQLQ4Rum89kNYJ5PdbYAYCvWgeUTXZHCdITeX
	F5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NPFvWcE712w8SWmPIhjRleuZF1kWjtoDP3zL+N5G+Ng=;
	b=RzxK1AEyzD1hOH2u+nwcvXFRPkDuYs4kLbjegDmO64Qwxxpbs9H8/ykRxnUA362Sgq
	UgIcxKANYD1xOC6HvG49nOTzWwZf9SShzjjI6EAaVcP+z5h05aDaDc9To9Rirds7ke2L
	j3alMJNUEtHGEFmXO5936lsL2EDIFpAiOvVbZcXteQ8ZO9y4S2eWdpkjcDSLub1W9pYs
	KHpDPEhzr227pyRPcaxFTnR/Kv5zUDTZ0jwt0TaoYxBJoWIDA/M/HWpVYRon78vy2tf5
	j+oOqWQQISShWk4HLzvu9yOH2dN2+btpL0FnvkJ4wNIyDWNKOT28NZQjT+ht2Yhb6Cwh
	2TrQ==
X-Gm-Message-State: APjAAAWLjCQNAlm5xkSsxucs9NB00dtBbZrhNJwpcty6YNknw/Ijk8mH
	Mb1Dz09mCrSus+MPdpFGoFQrgDT6Hm/IQs+wjZg=
X-Google-Smtp-Source: APXvYqzKYFrf+dgVmruRJlcjpekm0jlwecLOFPBAAaMPKfdQs0Q8ILJ5mru4fYuL9vJqRpaKQvXtq3l5fnRHBnNpKhg=
X-Received: by 2002:ae9:e88e:: with SMTP id a136mr382335qkg.71.1581612151145; 
	Thu, 13 Feb 2020 08:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
	<CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
	<CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
	<CANNYZj8kTvu7Z3C5JtXbjLNvu1NymoTbOgiJnLS3cqLMOKO3pw@mail.gmail.com>
	<CAMKF1spSwxqzVW0r2wxQQqPg6PW3ZwZM+HcNh9L0zai7wz4HfQ@mail.gmail.com>
	<CANNYZj_7n9NKm22GDjT9rBU+XokBhuqZthM20Gz-X-AoAxNP=A@mail.gmail.com>
	<CAMKF1sqiOxhyd98HTVbqCLWhxBeqW1sZ_d5cvT8E+OMUQejMHQ@mail.gmail.com>
	<CANNYZj8FsGqPQ9dOVSiOpg0DEGK-+rXLa3Xr86+ZjDcyyDDoPg@mail.gmail.com>
In-Reply-To: <CANNYZj8FsGqPQ9dOVSiOpg0DEGK-+rXLa3Xr86+ZjDcyyDDoPg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 08:42:20 -0800
Message-ID: <CAMKF1srJRQMqhhQtKJaqLxQdsRsWeb1OC-r=sRL7JD5A-70L3w@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 13 Feb 2020 16:42:30 -0000
Content-Type: multipart/alternative; boundary="000000000000710816059e77c6b0"

--000000000000710816059e77c6b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 8:24 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 13 Feb 2020 at 17:06, Khem Raj <raj.khem@gmail.com> wrote:
>
>> No, problem is that if One wants to use opkg backend then rpm drags alon=
g
>> but apt or dpkg don=E2=80=99t
>>
>> Even if test is made to pass rpm will be dragged into
>> Images which is not desired
>>
>
> We can modify the rpm packaging so that only the library from rpm that
> libresolv links with, but not the executables or other libraries are in t=
he
> image. Would you be ok with that?
>

This still sneaks in pieces of rpm into distros where rpm is not needed so
better would be to retool dnf to not demand rpm support in libsolv and
break the dependency chain. Opkg is usually sought for small systems and
last thing we want is unneeded dependencies

I would rather use the OE configuration powers as such but I am not opposed
to such a solution


> Alex
>

--000000000000710816059e77c6b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 13, 2020 at 8:24 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">O=
n Thu, 13 Feb 2020 at 17:06, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:</div><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"=
auto">No, problem is that if One wants to use opkg backend then rpm drags a=
long but apt or dpkg don=E2=80=99t</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Even if test is made to pass rpm will be dragged into</div><div =
dir=3D"auto">Images which is not desired</div></div></div></blockquote><div=
><br></div><div>We can modify the rpm packaging so that only the library fr=
om rpm that libresolv links with, but not the executables or other librarie=
s are in the image. Would you be ok with that?</div></div></div></blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">This still sneaks in pieces=
 of rpm into distros where rpm is not needed so better would be to retool d=
nf to not demand rpm support in libsolv and break the dependency chain. Opk=
g is usually sought for small systems and last thing we want is unneeded de=
pendencies=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I would=
 rather use the OE configuration powers as such but I am not opposed to suc=
h a solution</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div><br></div><di=
v>Alex</div></div></div>
</blockquote></div></div>

--000000000000710816059e77c6b0--
