Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB6B7F9AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 18:01:14 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id e9so5998054oif.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2019 10:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uE82Of5+MPGaOhndpESUTCFcJhvTshfL764PKp8pLmg=;
	b=hOsU+hXqnNa8Dtcx0bgxtaEjiX4bsaIxs/7r9cM8/WGUF4bBBZbAzdVcdRu64c1LE5
	r/xnoGwWAakRBaXyoaP5h29txMoMqp/jmlf9tEgqb8uQzzAb23teYiz7Ado/n2C+ZF4R
	4mIlT5Z7W/zPfx4KnznYiPdHMnyk4kKmhjcaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uE82Of5+MPGaOhndpESUTCFcJhvTshfL764PKp8pLmg=;
	b=qr2aSMNBIBc4ofjBdlkSvQDEf59PlDXM8Max8Vc7qfD+Sgpwu8dP8GRkRBxte7/9Ay
	TdSAc+s5RRteByw6B4IUnku8dF3qE3akaBhr6AvNr2RyuWnRGBsLfkUlIO0YewqM7CV5
	IPidmYr7+UMOc5Mhsul/n5Rs7S0io+NdYo9V2yxlBLVgmhWJdZkd1sLMAJJO3V7pHONY
	crLiISrE7MDSfPGtWPmsAcbFKEhDUUqpEDP3/2blSpXIeXpyl9+8GL0rU/3Ai0OZ+Zxj
	xtZG2cmInSHwjhP2DxsmTNLF3H9KsHuGZE55ccQ7ozYJBLOgSr5LlKl4O0xwP108F0W8
	gTyg==
X-Gm-Message-State: APjAAAXYDkjZoYpyOFkF5HvS6RnHBW6It6ICPHntBH8FF1jjT23HGWIo
	YZpsdzBETmVN+Y/ikOnTFjPMSyLkADGNxAqhIMO7RA==
X-Google-Smtp-Source: APXvYqwVoxmCE+8oMdfw0vC5dmtk0FtFADemwqbLOzuCbD5iexX3U6qPqw2H3nmfK/hUW5SaUox8dBBk05gxmBTChjc=
X-Received: by 2002:aca:f4c6:: with SMTP id s189mr10978106oih.63.1573236075256;
	Fri, 08 Nov 2019 10:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
	<20191031093655.14852-3-alex.kanavin@gmail.com>
	<dc6caf95-a1e0-0eb7-f721-8dd3d1e2aa93@intel.com>
	<CANNYZj9i0mvP_X3WFapfda49YdVvuY9Tr1KY7mFcsnqRr5J-HA@mail.gmail.com>
	<CANNYZj9dmYgWxYOG6o3hJC9rEk6ghUxYRAak5wZjELMbtOJKag@mail.gmail.com>
	<CANNYZj-Cmx_iNn+tJAW4XE=VSi4MT+LeiaPQk-8REhG+Xd_JsA@mail.gmail.com>
	<CADfgfoYap0Z83h-mRXOLvX2kkC8xitN1Mx5wQM4uHugRhG15Nw@mail.gmail.com>
	<CANNYZj8fQV9vaubTyYF2gzicP3U8w0bZP4Fne91bkRRzPP5hew@mail.gmail.com>
In-Reply-To: <CANNYZj8fQV9vaubTyYF2gzicP3U8w0bZP4Fne91bkRRzPP5hew@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Fri, 8 Nov 2019 10:01:03 -0800
Message-ID: <CADfgfoac9HKAzqsnGcPqDnCHTvqFQJH854uR3esmJnTkdRLYmg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Fri, 08 Nov 2019 18:01:14 -0000
Content-Type: multipart/alternative; boundary="00000000000069ec090596d99189"

--00000000000069ec090596d99189
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 8, 2019 at 9:56 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Fri, 8 Nov 2019 at 18:20, Michael Halstead <
> mhalstead@linuxfoundation.org> wrote:
>
>> > If you replace that with tigervnc (a modern, supported fork of
>> tightvnc), then the tests pass fine.
>> > https://tigervnc.org/
>> >
>>
>> TigerVNC is now installed from the standard repos where available.
>>
>> >
>> > As Fedora has already obsoleted tightvnc in favor of tigervnc, I think
>> we should do the same on all debian machines (debian provides both tightvnc
>> and tigervnc, but treats them as equal).
>> > https://src.fedoraproject.org/rpms/tightvnc/blob/master/f/dead.package
>> > I also checked that tightvnc is not available for opensuse either.
>>
>>
>> Server components of TigerVNC are in xorg-x11-Xvnc package which is
>> installed on all the openSUSE workers so I expect the VNC server there to
>> work. Please let me know if they do not.
>>
>>
>> On Ubuntu 16.04 and Debian 8 workers I've installed from
>> https://bintray.com/tigervnc/stable/tigervnc/1.9.0. This should allow
>> tests to complete. Installing packages outside of the distribution's
>> package manager might invalidate these as sanity tested distros. I'd
>> appreciate feedback about this.
>>
>
> Thanks a lot! There are two things to check:
> 1. Old instances of vnc may still be running and should be shut down (via
> 'vncserver -kill :1')
> 2. vncserver executable should point to tigervnc (if both tigervnc and
> tightvnc are installed - I don't know if you removed the tightvnc packages).
>

I removed tightvnc and all workers have been rebooted so we are good to go.

Any comment on using packages from outside of the distro's official
packaging?


>
> Otherwise everything should be ready for re-testing the patches. I can
> resend them if needed.
>
> Alex
>

--00000000000069ec090596d99189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 8, 2019 at 9:56 AM Alexan=
der Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Fri, 8 Nov 2019 at 18:20, Michael=
 Halstead &lt;<a href=3D"mailto:mhalstead@linuxfoundation.org" target=3D"_b=
lank">mhalstead@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr">&gt; If you replace that with tigervnc (a modern, supported fork of tig=
htvnc), then the tests pass fine.<br>&gt; <a href=3D"https://tigervnc.org/"=
 target=3D"_blank">https://tigervnc.org/</a><br>&gt;<br><br>TigerVNC is now=
 installed from the standard repos where available.<br>=C2=A0<br>&gt;<br>&g=
t; As Fedora has already obsoleted tightvnc in favor of tigervnc, I think w=
e should do the same on all debian machines (debian provides both tightvnc =
and tigervnc, but treats them as equal).<br>&gt; <a href=3D"https://src.fed=
oraproject.org/rpms/tightvnc/blob/master/f/dead.package" target=3D"_blank">=
https://src.fedoraproject.org/rpms/tightvnc/blob/master/f/dead.package</a><=
br>&gt; I also checked that tightvnc is not available for opensuse either.<=
br><br><br>Server components of TigerVNC are in xorg-x11-Xvnc package which=
 is installed on all the openSUSE workers so I expect the VNC server there =
to work. Please let me know if they do not.<br><br><br>On Ubuntu 16.04 and =
Debian 8 workers I&#39;ve installed from <a href=3D"https://bintray.com/tig=
ervnc/stable/tigervnc/1.9.0" target=3D"_blank">https://bintray.com/tigervnc=
/stable/tigervnc/1.9.0</a>. This should allow tests to complete. Installing=
 packages outside of the distribution&#39;s package manager might invalidat=
e these as sanity tested distros. I&#39;d appreciate feedback about this.<b=
r></div></blockquote><div><br></div><div>Thanks a lot! There are two things=
 to check:</div><div>1. Old instances of vnc may still be running and shoul=
d be shut down (via &#39;vncserver -kill :1&#39;)</div><div>2. vncserver ex=
ecutable should point to tigervnc (if both tigervnc and tightvnc are instal=
led - I don&#39;t know if you removed the tightvnc packages).</div></div></=
div></blockquote><div><br></div><div>I removed tightvnc and all workers hav=
e been rebooted so we are good to go.</div><div><br></div><div>Any comment =
on using packages from outside of the distro&#39;s official packaging?</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>Otherwise everythi=
ng should be ready for re-testing the patches. I can resend them if needed.=
</div><div><br></div><div>Alex<br></div></div></div>
</blockquote></div></div>

--00000000000069ec090596d99189--
