Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id C57326D899
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 18:39:55 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id l6so2748137oag.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 10:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6DYV7D8BlIAfUv9BdjmVAbjmoB4ljb+ZMIre6fH+hY8=;
	b=PAnkWziBTumjNLemoYVo/o85CP8C6Qay0Ehd+eBM+/d+60TEj28A/Z5ubT3bfQAgCA
	m6QTuuC1wjq5C6Z2RlEoTqbFOyE+o4CpN6sKJW9qkuv86I75YFJXaV8+l5M3VD22A1h1
	+m4w7jxDTn6NemUr34apGVWlG9HzLmw/zccf0n/PzlOXdr3FSFkC3UfaH1AjxR058TYQ
	FoiOJVkKCX/PMugptmnsqU6vC1IwEuk4w/VbFGwj0krDYSTnRLTvT9IZOSz7lIh7P3J9
	DW2+Kc6NeZAStMgtDmHW2vF3J24002TYS77vJkQL+gUoxwiNqbJC7PANuuzg3lrb9kFk
	GOPg==
X-Gm-Message-State: ALoCoQnwYbgZUWoYsYusG1V8R/c5/R2flco76MqCP6CvyVlbksp/ZDJkMqba+8lftM5iJz5CDpxW
X-Received: by 10.60.146.210 with SMTP id te18mr16600991oeb.20.1385231994741; 
	Sat, 23 Nov 2013 10:39:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.0.50 with HTTP; Sat, 23 Nov 2013 10:39:33 -0800 (PST)
In-Reply-To: <528DB2FC.90205@emagii.com>
References: <528D2429.7040705@emagii.com> <1384982956.16887.94.camel@ted>
	<528D3B01.8060700@emagii.com> <20131121001922.GW3708@jama>
	<528DB2FC.90205@emagii.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Sat, 23 Nov 2013 19:39:33 +0100
Message-ID: <CAP71WjygNQtn8Qc78G4J8yL7sWOdoT4UO59h2pn3pAcVDOqq2w@mail.gmail.com>
To: ulf@emagii.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Improving Build Speed
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
X-List-Received-Date: Sat, 23 Nov 2013 18:39:57 -0000
Content-Type: multipart/alternative; boundary=047d7b5d42f8fa7a8604ebdc743c

--047d7b5d42f8fa7a8604ebdc743c
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 21, 2013 at 8:15 AM, Ulf Samuelsson <ulf@emagii.com> wrote:

> I currently do not use INHERIT += "rm_work"
> since I want to be able to do changes on some packages.
> Is there a way to defined rm_work on a package basis?
> Then the majority of the packages can be removed.
>

from rm_work.bbclass:

# To inhibit rm_work for some recipes, specify them in RM_WORK_EXCLUDE.

          # For example, in conf/local.conf:


#


# RM_WORK_EXCLUDE += "icu-native icu busybox"

--047d7b5d42f8fa7a8604ebdc743c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 21, 2013 at 8:15 AM, Ulf Samuelsson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ulf@emagii.com" target=3D"_blank">ulf@emagii.com</a>&gt;</span=
> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":7e2" style=3D"overflow:hidden">I currently do =
not use INHERIT +=3D &quot;rm_work&quot;<br>


since I want to be able to do changes on some packages.<br>
Is there a way to defined rm_work on a package basis?<br>
Then the majority of the packages can be removed.<br></div></blockquote></d=
iv><br>from rm_work.bbclass:</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra"><div class=3D"gmail_extra"># To inhibit rm_work for =
some recipes, specify them in RM_WORK_EXCLUDE. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 # For example, in conf/local.conf: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0</div>

<div class=3D"gmail_extra"># =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0=A0</div><div class=3D"gmail_extra">

# RM_WORK_EXCLUDE +=3D &quot;icu-native icu busybox&quot; =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0=A0</div><div><br></div></div></div>

--047d7b5d42f8fa7a8604ebdc743c--
