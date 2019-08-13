Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
	[209.85.222.41])
	by mail.openembedded.org (Postfix) with ESMTP id A0B6C7D537
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:54:59 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id j8so41270399uan.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 02:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vVDkIjbZv/zzZg1RtX5dsa7VjeQhmuVpB3gJIsB2wF4=;
	b=R1JZqiY8sMFEnJhbTEnVvfSPt6gqAqzXZnzXMWjYLEBbx4HRE2MqwHKxpl8ixcExjR
	+/Y2QjPLOb8VpsThixoRvxB8fkBGWhqeFeMqkUk2a/a7VLWp8cYsSNSf1v89eZjYy2L8
	AkfnZmnkBqUy/0CCohaAWuR9vFvgMsDQO6fWNEifGog690VMekCHXdpkWmG16HXm7yqv
	FHeIYFO5uMUSgkE9+6zhy+MHaWt9vCewoodGe0trxD+dxIKZDNo+OzsNRqQSxERvQnSd
	Tmzv5rBKJBalgaMCLV+Tfu1fGdSVqnWjyYtSYrDyWbeonhxXL/RTcIaTjwbAKqD71+Dd
	Vcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vVDkIjbZv/zzZg1RtX5dsa7VjeQhmuVpB3gJIsB2wF4=;
	b=iK0S6xW62y+UXqQ9Lqvvagbn50A1j/dJCYjJu/1p4+NvLOljCkVU7/btBOwfzrBXhx
	U+NNi3m9pscpUZCewyovYgKr6E6xboCwdi9ZLJIrdG7TLiG/0Cne6Us1s2YsTmPWKkY4
	4Cifs0bOAgwkQZaAySi0C6vLfsQVv/AF7pk34wOKA1drC7rF6Cp8hoebakpq4AvLvHms
	eHRalEPbP7UIrvkEaiR329RuD+w1RLvO/+5M01lsEps1LFal/8HlOSvYxoQHquk69aUo
	jAR/GUR6mIBNe/0VSd8SJHojnHJq2auNdMzx0yxdLz9DqoP8dotzRKjIIp1qEb/hCnuH
	4M8w==
X-Gm-Message-State: APjAAAV2ABS0CBWSSXdCiVoi3+JIC9m04oKUNe1FMEmT1cBX7X2r/6Qa
	2XdS6GXELcY4D4S2UAWLHRPF9h4ssiZO7fBtwJQ=
X-Google-Smtp-Source: APXvYqyRCMA8WtpNyqnTGusKQ9M3IWN/898M86Hxc4MZHdgRIL5MQXZyEb+OFE6HnCUBJ3tHfCQIXy/YXNRIVZxY7lE=
X-Received: by 2002:ab0:810:: with SMTP id a16mr3315579uaf.93.1565690100529;
	Tue, 13 Aug 2019 02:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190812134903.55045-1-alex.kanavin@gmail.com>
	<20190812134903.55045-2-alex.kanavin@gmail.com>
	<72c38e8826111b832afe9df09ab350b099918f8b.camel@linuxfoundation.org>
In-Reply-To: <72c38e8826111b832afe9df09ab350b099918f8b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Aug 2019 11:54:48 +0200
Message-ID: <CANNYZj96rpe3di1jNa9d9N79YWE0Ax8_=wcG1kK5Z87H+dDOiA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] python3-numpy: update to 1.17.0
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
X-List-Received-Date: Tue, 13 Aug 2019 09:54:59 -0000
Content-Type: multipart/alternative; boundary="000000000000453d4a058ffca2ca"

--000000000000453d4a058ffca2ca
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Aug 2019 at 10:34, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> This doesn't build on opensuse 42.3:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/907
>
> Its numpy-native and looks like it might be the old compiler :(
>

That version of opensuse went end-of-life about a month ago. We can hold
this off until the autobuilder is upgraded.

Alex

--000000000000453d4a058ffca2ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 13 Aug 2019 at 10:34, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
This doesn&#39;t build on opensuse 42.3:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/52/build=
s/907" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/52/builds/907</a><br>
<br>
Its numpy-native and looks like it might be the old compiler :(<br>
</blockquote><div><br></div><div>That version of opensuse went end-of-life =
about a month ago. We can hold this off until the autobuilder is upgraded.<=
/div><div><br></div><div>Alex<br></div></div></div>

--000000000000453d4a058ffca2ca--
