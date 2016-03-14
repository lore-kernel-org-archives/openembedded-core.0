Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id B8E526FF22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:34:07 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id ig19so71844579igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JndvyHAklBw9pHwldea0nGHDg0j3nB0GzNQlr+xfEvA=;
	b=LcltEC8Fk+zJsWq0bzauuoQSa/XbZCdKNOAVzJISvvu8YInb8UdHT5EwzPtPcsQgzS
	NtP2WPAgZTKXP6me/cPN//fBs5IQxjPL7ecmzP4tc7pJpuDLZNgdmwoKV2MKoK9XPRA+
	3DrYCb8q9ajJhfQi8fwK2B0DaB6lk9v0xHiupZbAwV3olRcC8p9DIVe3QZmqGD7UXb21
	dNqHYvht6RDOUSIzgS81bXAO8uiVNTbcXvJLxnV8xPgFBTZA5fWmw2FXKTp5prAeihCo
	E32UZOY5D5sz7pvWnSoiebNHUg+d4mCZxmOERzB+Hz06QlXOzjknsnrCBJcxjBWqhWtn
	8f4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JndvyHAklBw9pHwldea0nGHDg0j3nB0GzNQlr+xfEvA=;
	b=UFZg2T72jlswGi26cqdDX6YpW0qi5Pw0YYkAg2iq+2X0ic77VonTs+DqhmvZ5rzyF4
	1fl+a1y1qZNuUHtPI7+8v2tSRPX5Aw2As7yGR7atiqG3OgR1NoXLIOtT7RthvPxfo+jf
	/tc+iyeWPfn2M28KhlRgF8mLfwzef1aQnHwF7TMzKxv3FmvExXt7O0ViaDfesNgJfvho
	jlVwyEveWtX6gySRNsZDgOeTW0rZjU7LJxlNFinTEbodr6jtf36hxm3TNYVajbSdXyDv
	nXoqyrXKOEhAtkO1NNcJ+SLd+A3UDq+e5Z8JgMGCOAnHcNz8XkKdCpRlRyopcyoHuEb4
	Q+hQ==
X-Gm-Message-State: AD7BkJIE62QipS5nFibBXmi7Sjvwbd/9DKLhaTH0198s98DcvEGx+CePioN3ScHDK5Tc/oRzHPGsSSdZtS0JvfqH
X-Received: by 10.50.97.71 with SMTP id dy7mr20386583igb.78.1457987647878;
	Mon, 14 Mar 2016 13:34:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 14 Mar 2016 13:33:48 -0700 (PDT)
In-Reply-To: <CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Mar 2016 20:33:48 +0000
Message-ID: <CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 20:34:08 -0000
Content-Type: multipart/alternative; boundary=047d7b10cfc1d707cf052e0833bf

--047d7b10cfc1d707cf052e0833bf
Content-Type: text/plain; charset=UTF-8

On 14 March 2016 at 19:12, Otavio Salvador <otavio.salvador@ossystems.com.br
> wrote:

> Just for completeness, this is only need on Jethro.
>

Wouldn't a better fix be to
backport 161bb3409edee21827cf594cc011fe88185f1496?

Ross

--047d7b10cfc1d707cf052e0833bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2016 at 19:12, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color=
:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":26t=
" class=3D"" style=3D"overflow:hidden">Just for completeness, this is only =
need on Jethro.<br></div></blockquote></div><br>Wouldn&#39;t a better fix b=
e to backport=C2=A0161bb3409edee21827cf594cc011fe88185f1496?</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b10cfc1d707cf052e0833bf--
