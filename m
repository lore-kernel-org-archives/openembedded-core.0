Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9036FFD7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 17:29:00 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id q21so160951463iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 09:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=dGsKR9k7QguZdbVUsLVoun3+0aCK1JZvd/13LJ8i2bY=;
	b=u3zk36ypImjgQl0XO1SuWB53+9oeLoEfe5zHE9N9gpCn9/zfi/oybGgNfIekKit9YB
	AuGFbrCs7VNPNF96UJ+oO4vGds9ydnMqfiYYkqxxSUexPnzymz9EhJQEfnRt0cLXYTYc
	w56mJF4mP3RYROM3P8P0lxm9d0q5Kv8r/pf911LKt1AaCSMcaZlP+cr8jv+MjjXdtbc3
	pSnf8KtURIfhRQFCKfwXhCnHwFNKy5zHvNlD/KmqteSHx415GI3BjvgfBljQWnz3riaP
	3UtbJDr/f+Q/B8KqVPeN5ZinaFK+hP5arR6XZZZDXV/b/0utDd7kDkT26u6nIS5dlM6m
	oaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=dGsKR9k7QguZdbVUsLVoun3+0aCK1JZvd/13LJ8i2bY=;
	b=KygPAXWGfLCymu8ZuaDICUvZzKfjFaveY2ocPjuV0DweZp3IsC3+3cglnRw37c934F
	AM37p4QO+yp4tw1x4K0E+nCIRH4/Cg5GqoGUpC/TCv4A8MOeDf90OMW7WvvClgtyPq0d
	BtDqSg1tBPBm4oCPTdyxVPjiESNdIyXhTIZJ4ArZqR5Dr2QGFNculoZfQLjVVxA+Hism
	oyopnfoWrKcuU6oQFRwdf0hFNq59/1BSpFWteXiHEu9EdX7Pbs1ptSvEHSGdxNWXCj6E
	HyeFDk482fl5NdL8rDKaw8YuA8Xlt1YgcVWblkL8t2DS78/YyaZ8j9/7vpa4wsy5stzD
	1tBg==
X-Gm-Message-State: ALoCoQmA2AEo+iyMuTT6jLIW0NhJrdh726mqiRL5qWBGPFfBjsLKLiyI7wF7NSmfZqRXL0KzotBWI6/wxIULjxeUlRZCVVGZcM6+1YWj+SUBDiau8jBvG6g=
X-Received: by 10.107.164.161 with SMTP id d33mr73739302ioj.148.1451928541558; 
	Mon, 04 Jan 2016 09:29:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 09:28:42 -0800 (PST)
In-Reply-To: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 17:28:42 +0000
Message-ID: <CAJTo0LY-O9ee3jGoSPOPjqpu=u9zCEo2vfh3jfyxvgC15MWxbQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC] Delete all .la files?
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
X-List-Received-Date: Mon, 04 Jan 2016 17:29:03 -0000
Content-Type: multipart/alternative; boundary=001a1141c976f582220528857409

--001a1141c976f582220528857409
Content-Type: text/plain; charset=UTF-8

On 23 December 2015 at 21:41, Burton, Ross <ross.burton@intel.com> wrote:

> So in the new year I plan on submitting a renamed version of this class to
> oe-core and adding it to INHERIT_DISTRO.  Any comments?
>

Technicalities time: should this be a new class that is in the default
INHERIT_DISTRO?  Or directly integrated into base.bbclass?  Does anyone
have a strong opinion either way?

Ross

--001a1141c976f582220528857409
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 December 2015 at 21:41, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>So in the new year=
 I plan on submitting a renamed version of this class to oe-core and adding=
 it to INHERIT_DISTRO.=C2=A0 Any comments?</div></blockquote><div><br></div=
><div>Technicalities time: should this be a new class that is in the defaul=
t INHERIT_DISTRO?=C2=A0 Or directly integrated into base.bbclass?=C2=A0 Doe=
s anyone have a strong opinion either way?</div><div><br></div><div>Ross</d=
iv></div></div></div>

--001a1141c976f582220528857409--
