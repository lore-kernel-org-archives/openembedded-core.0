Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id CC09473217
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:42:25 +0000 (UTC)
Received: by oihq81 with SMTP id q81so6692163oih.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jiQqq61g3uoPpAKP+Vf9dEKso2qTicr4S99hIdzyPrc=;
	b=kuzl545rHlNW0TK+zjNatNAeoBDORhnsVEx87G0fBOZkYjXtJ+lAOYEoDtiexURua0
	bx1Lm5mWrpU46fYokXc8YbmF5FOA77FScb6kvt3PmH7Sk6fme/BhtCCViUf7lqQaXNvL
	HNsyn2zsjM6DM3lUEDQiKAL1GRO/XLePT7T81gullftnBocDPbcPDMeiKuwehsSb/GTv
	iZiJqHUodIK+z1fIEnLk98iP3GZpUaJ2bbnKPP8ZlzM5jJtCQr5sf1o0jNf6kHpAeQ+r
	JFIr0u7gazbcPBP4J93RLzpI1kg8eKCDGQ6yYCUZZYI8r3ps8QQ1es6tG2K9ntbJzZW7
	t5iA==
X-Gm-Message-State: ALoCoQmNsunxYpe/J8ANn5VDrsV+9lrz+B6oU+n56iiOsjssrKV+PNCIcd2pTEJReqk519zTqkdQ
X-Received: by 10.60.173.7 with SMTP id bg7mr11761581oec.86.1437691345836;
	Thu, 23 Jul 2015 15:42:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.108.4 with HTTP; Thu, 23 Jul 2015 15:42:06 -0700 (PDT)
In-Reply-To: <55B16CF0.80405@mlbassoc.com>
References: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0Lb41pKOft88tttTNE-47wDekSbSUbYyUWT12WydtKgaCw@mail.gmail.com>
	<55B16CF0.80405@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Jul 2015 23:42:06 +0100
Message-ID: <CAJTo0Lb9npwcdNkLbifoaR6P+QgAX76d0go8pq7ozCpEiW7k-w@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: Use native python3
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
X-List-Received-Date: Thu, 23 Jul 2015 22:42:25 -0000
Content-Type: multipart/alternative; boundary=047d7bd76788f73201051b9299bf

--047d7bd76788f73201051b9299bf
Content-Type: text/plain; charset=UTF-8

On 23 July 2015 at 23:38, Gary Thomas <gary@mlbassoc.com> wrote:

> Well for me, the configure script ended up chosing python3,
> even when I used 'pythonnative' (i.e. python2) in the recipe.
> I could not get it to build any other way.
>
> Since python3-native will most likely already be built, what's
> the harm in doing it this way?
>

Why will it be build?  I certainly don't have a python3 build here.

Inheriting pythonnative is also the wrong thing to do - the pythonnative
classes are solely for when you need to run Python and use non-standard
classes that you've already built natively.  If you just want to run the
host Python, let it find the host python.

Why was the configure script choosing python3 on your host the wrong thing
to do?

Ross

--047d7bd76788f73201051b9299bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 July 2015 at 23:38, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mail=
to:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ef" class=3D"a3s" style=
=3D"overflow:hidden">Well for me, the configure script ended up chosing pyt=
hon3,<br>
even when I used &#39;pythonnative&#39; (i.e. python2) in the recipe.<br>
I could not get it to build any other way.<br>
<br>
Since python3-native will most likely already be built, what&#39;s<br>
the harm in doing it this way?</div></blockquote></div><br>Why will it be b=
uild?=C2=A0 I certainly don&#39;t have a python3 build here.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Inheriting pythonnat=
ive is also the wrong thing to do - the pythonnative classes are solely for=
 when you need to run Python and use non-standard classes that you&#39;ve a=
lready built natively.=C2=A0 If you just want to run the host Python, let i=
t find the host python.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Why was the configure script choosing python3 on your hos=
t the wrong thing to do?</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--047d7bd76788f73201051b9299bf--
