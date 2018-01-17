Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id AC0A37864B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 14:26:16 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 25so21024145ioj.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 06:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W5qINhfjUMe8GcBiMNGJ+i6JPuoFQvhvzvRDJkLZTOI=;
	b=EtzsQwJyeIKbS1PtEtYdc+AL1kxIOlPuqvQgSWIr6mdndrvwjPQQKa02cXQSXloIvt
	QGlQenE3DfG1HsEAQX4VhxUzw/HW+vwpslXEToa4DDiGeTdyop0DACepOAI1YJL/Xp/M
	ZodjWMrx6TtaLe8gjsMVlK8ZOwopTY6o6DBlLpNt5jzwZlF6dEwQ8p+Rd8xb186XWBG/
	83Xa1+/Wa6hRJ3KS9E5mqApF9yFvv/ZrBd4wO/1eQ64J/j35Pq+6gFcvEmFnbbb9NT3g
	mGJNDpCvjc7ChjMzTxrpYxvGsgOfjRqGC69pnSlyEqwovJvg4e+fzaksKJTyRme7h61P
	wWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W5qINhfjUMe8GcBiMNGJ+i6JPuoFQvhvzvRDJkLZTOI=;
	b=Lt0qW0qomE3f1CR3gPQ/7FDSjuJ4i5C2wEoNtW+xj9eGYSMC9O6zicADYpN+4d/nRx
	FfuKPNwQfkjwFifn9jyeeleIL0obopFENlZk5CluVApDpnWxXTo2dYa6FwbYI/4h4XAp
	mUXozzJQPsqAXmab3HOyHw53Ke9fgpc/Xmi8gEZ5JxOwU/u7Lf0lQieKb03kYs1oDKhM
	0+e2iDgdgYnUjbOUHMQLxpkY0Nw4NLLbT6QTBMrdGoXSMEhjFGo76eR6HitokRHi9OXE
	WHsC5n895lcH56l26tROQNf+RbonTzIFWDLNqcRw7fyNjCJSKrqVa6AAPtNqbRKGZ49q
	AhmQ==
X-Gm-Message-State: AKwxyte9oIj5cNiXpEhPjH2NRumEqH4pubRZdvRscBQIqvZ4gR6PWjdf
	NPRAflKJVXyOoQP+Kd5F8UdIrK5too7XiE3iicqmgQ==
X-Google-Smtp-Source: ACJfBovTmuTMcwTt2TgHDW2o4XLcVwzdW/nRzG6q5GKq0L/tUCANhqd34v/VUrlwwZS1+EleLwIh6VFnyVaPaF8iiNU=
X-Received: by 10.107.47.137 with SMTP id v9mr3128647iov.217.1516199177891;
	Wed, 17 Jan 2018 06:26:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Wed, 17 Jan 2018 06:25:57 -0800 (PST)
In-Reply-To: <f1ba6a43-33ec-4f5d-dfcf-950ac40a8dab@linux.intel.com>
References: <20180117132107.3599-1-otavio@ossystems.com.br>
	<20180117132107.3599-3-otavio@ossystems.com.br>
	<f1ba6a43-33ec-4f5d-dfcf-950ac40a8dab@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Jan 2018 14:25:57 +0000
Message-ID: <CAJTo0LasphGec2rDe0COg0JsETHjvia1f+Fg8KK6YNec7f1n8Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] cmake: upgrade 3.9.5 -> 3.10.1
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
X-List-Received-Date: Wed, 17 Jan 2018 14:26:16 -0000
Content-Type: multipart/alternative; boundary="001a1136f5666893d00562f9a11d"

--001a1136f5666893d00562f9a11d
Content-Type: text/plain; charset="UTF-8"

On 17 January 2018 at 14:21, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 01/17/2018 03:21 PM, Otavio Salvador wrote:
>
>>   ...make-native_3.9.5.bb => cmake-native_3.10.1.bb} |   0
>>   .../cmake/{cmake_3.9.5.bb => cmake_3.10.1.bb}      |   2 +-
>>
>
> Can you look into merging the -native recipe into the main recipe? Is
> there still a particular reason why they're separate? (I'm sure there was
> some historical one :)
>

It's not very simple as cmake builds using cmake, so the native recipe is a
bootstrap.

Ross

--001a1136f5666893d00562f9a11d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 January 2018 at 14:21, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 01/17/2018 03:21 PM, Otavio Salvador wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 ...<a href=3D"http://make-native_3.9.5.bb" rel=3D"noreferrer" target=
=3D"_blank">make-native_3.9.5.bb</a> =3D&gt; <a href=3D"http://cmake-native=
_3.10.1.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.10.1.bb</a>=
} |=C2=A0 =C2=A00<br>
=C2=A0 .../cmake/{<a href=3D"http://cmake_3.9.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">cmake_3.9.5.bb</a> =3D&gt; <a href=3D"http://cmake_3.10.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">cmake_3.10.1.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
</blockquote>
<br>
Can you look into merging the -native recipe into the main recipe? Is there=
 still a particular reason why they&#39;re separate? (I&#39;m sure there wa=
s some historical one :)<br></blockquote><div><br></div><div>It&#39;s not v=
ery simple as cmake builds using cmake, so the native recipe is a bootstrap=
.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1136f5666893d00562f9a11d--
