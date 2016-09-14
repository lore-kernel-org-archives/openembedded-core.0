Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 264A0731F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:05:12 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id o3so40332867ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d/P/63n/t+oAy+pPGTA8n8+3nUpOeAl/S51TS/C+zeo=;
	b=GJrpybbPrhDWkqGlqhYg3UBWfUDoUP6O0C9LGBrsdknBrjhYgt+DoPyK0xXhCzZEar
	yvISqwERjy340eaXug7Lrn6s6itVRlzJbAq+i/mFrr6o/nwSsIP5zSxMpp3lcCkGPHNe
	S7ugbM6UpwWuhWVu8P53nDWJY+niRLDJd+hLzMUcwIawAcddxPQxtnOo8d+IVfKy8a1l
	v/6YwMZX3xmIX1KfG0ZqR1O89W5ydM2SCn7LHUDMXcZQSngUMfT5/nTT9VMXmDUVoZ+F
	z0eNZ0VrCjBoped48UFrUWHKuJ/rUzA+74e5V+eRC+tr20tBhNzG+68LdbuSVDtJezxZ
	uilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d/P/63n/t+oAy+pPGTA8n8+3nUpOeAl/S51TS/C+zeo=;
	b=SeD9WGPi66YZlwsEiDjeyINRJvxt5l3cNN/+EE3BgE92aKePTye7WFkiPV9aKCQ3rf
	LbQhuXsYPEq02EZll1/0NxFz7QTloeqh3Qycz0TcULetROoEDaI6zM2gvscKsh9J4/S7
	IVOjkU83BS+MbCrUE8dHxTpwwMB40dj5jKY9JyMcYnbwyNd7kxTqMmb6A0N/nRyA8+Fz
	f1IUKhroVXKf55/qGoObnc0wPZswfQS14fYo8uC/gM5FbUxcMtM9SGq0y4q0iDK21+St
	Fgaz2QWzkjfeNANgxoisGx8tcN1VJdOs5TzGoAI8D75BNJgH29Y9IYjRkKKHctn/jBKM
	ncyw==
X-Gm-Message-State: AE9vXwM8wJne7YWAvXXUPV8z6XOVBMDqujFM0MR87hQJVjCIhcPRIOy0wry74WbMWdvqjHbQwRvtUJFZ/uw5I+CE
X-Received: by 10.107.35.13 with SMTP id j13mr5409988ioj.189.1473854713665;
	Wed, 14 Sep 2016 05:05:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 14 Sep 2016 05:04:53 -0700 (PDT)
In-Reply-To: <20160914050848.14612-1-jackie.huang@windriver.com>
References: <20160914050848.14612-1-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Sep 2016 13:04:53 +0100
Message-ID: <CAJTo0LY4n8WdBNAJkOco-ih1T5crmWOsHpeeHodW=-NFU=BsOA@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: add support for additional boost libs
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
X-List-Received-Date: Wed, 14 Sep 2016 12:05:16 -0000
Content-Type: multipart/alternative; boundary=001a1140292aa8b750053c768a92

--001a1140292aa8b750053c768a92
Content-Type: text/plain; charset=UTF-8

On 14 September 2016 at 06:08, <jackie.huang@windriver.com> wrote:

> * Added libs:
>   - container
>   - context
>   - coroutine
>   - exception
>   - graph_parallel
>   - locale
>   - math
>   - mpi
>   - wave
>

I don't see packages created for mpi, graph_parallel or exception.  Is this
intentional?

Ross

--001a1140292aa8b750053c768a92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 September 2016 at 06:08,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jac=
kie.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2vm" class=
=3D"a3s aXjCH m157272899329453d">* Added libs:<br>
=C2=A0 - container<br>
=C2=A0 - context<br>
=C2=A0 - coroutine<br>
=C2=A0 - exception<br>
=C2=A0 - graph_parallel<br>
=C2=A0 - locale<br>
=C2=A0 - math<br>
=C2=A0 - mpi<br>
=C2=A0 - wave</div></blockquote></div><br>I don&#39;t see packages created =
for mpi, graph_parallel or exception.=C2=A0 Is this intentional?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140292aa8b750053c768a92--
