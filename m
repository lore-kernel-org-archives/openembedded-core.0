Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SZ081-0007cD-Sf
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 15:36:58 +0200
Received: by ghbz2 with SMTP id z2so1203477ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2012 06:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=NCJw5YTz5ejrr4oqhOQCjCOSae+S9erEgtNLzXJNtqA=;
	b=oO4DKNHqCKJRNv3EhiC7UZy0gj9qlP1DgS60wL075YBVO9gEeJQBbcwDFk9ZQjClic
	sOeNjKDQf3N+OwK10/yeOCcst4nXeh3Q5lKKdu0VHmADp4Agqu3nMEPMzibJgTb2c0lg
	Cb3B80YoKl78w6lo0ox3n3xXzxlH4AsvZQ3CBEAq8/mwiyuxK6+/8L5qPaak50GtNPu2
	Bm9zfKFMqs+TdQgaXg0fFjXRiJ8DhhbzqQWkc3uXriA5gw9K69VW8DEavAt5Eu9GjH5f
	N3/6HIfQRB55YEP72E90btxtkTw06SPCFKBNdceZMQ7W0Gz0yPV1e+xP/lx84G2QtKDk
	NF2g==
Received: by 10.50.11.133 with SMTP id q5mr4583353igb.40.1338211601117; Mon,
	28 May 2012 06:26:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.28.147 with HTTP; Mon, 28 May 2012 06:26:20 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <4FC37C81.6080200@intel.com>
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
	<4FC35FAD.7090505@intel.com> <4FC35FBA.2060200@gherzan.ro>
	<4FC37C81.6080200@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 28 May 2012 16:26:20 +0300
Message-ID: <CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlUbz5fvz6v86qVaOo7WqyJ3PtKGCYS2bExRF+3cBCurCu1gNZsAvdoffTUmIQaJ78CDuql
Subject: Re: [PATCH 0/3] Package Updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 May 2012 13:36:58 -0000
Content-Type: multipart/alternative; boundary=e89a8f646c1f1e701b04c118ab8c

--e89a8f646c1f1e701b04c118ab8c
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 28, 2012 at 4:24 PM, Radu Moisan <radu.moisan@intel.com> wrote:

> On 05/28/2012 02:21 PM, Andrei Gherzan wrote:
>
>> Dbus comes with a test suite. Running those should be a must.
>>
> I could not find how to run the test suite. I've tried dbus-daemon,
> dbus-monitor, and the rest, but non of them have options for some runtime
> checks. Other than that I imagine the test suite you mention must come in a
> separate package. Do we have a recipe for that to? Which image should I
> build to have that package included and be able to test?
>
>
There is an internal test suite for dbus. You can enable building those
tests in configure:
"--enable-tests"

@g

--e89a8f646c1f1e701b04c118ab8c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, May 28, 2012 at 4:24 PM, Radu Moisan <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:radu.moisan@intel.com" target=3D"_blan=
k">radu.moisan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">

<div class=3D"im">On 05/28/2012 02:21 PM, Andrei Gherzan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Dbus comes with a test suite. Running those should be a must.<br>
</blockquote></div>
I could not find how to run the test suite. I&#39;ve tried dbus-daemon, dbu=
s-monitor, and the rest, but non of them have options for some runtime chec=
ks. Other than that I imagine the test suite you mention must come in a sep=
arate package. Do we have a recipe for that to? Which image should I build =
to have that package included and be able to test?<span class=3D"HOEnZb"><f=
ont color=3D"#888888"><br>


<br></font></span></blockquote><div><br></div><div>There is an internal tes=
t suite for dbus. You can enable building those tests in configure:</div><d=
iv>&quot;--enable-tests&quot;</div><div><br></div><div>@g</div></div>

--e89a8f646c1f1e701b04c118ab8c--
