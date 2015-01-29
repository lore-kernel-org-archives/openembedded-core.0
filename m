Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 632FC60024
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 10:35:25 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q108so26086351qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 02:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4zNsXtTTjW9HN+AgcJ8wndjny7F9MrR61FT5vgso1sM=;
	b=Rhr4uoLpYKmJvzfvN9PnnJKTxMm3j9wW48qYY6Kk1R4t2H15LV0Ps2j2js+HmqNOCO
	3wVx09mEEHsNVxKOBQ2cEICO18rekGv0DWcwYOSHXnqlzCY5JNKfX6/LoeHqxox5mC4R
	Gvv9gI1azexxbaGAAIpCOoosyg3pZNIzUnxoPgHjO+BqlHpfulcOIfU5CoiQyUsp2JGQ
	44j8uZKgnwHQYS0t3P8E7Cunkkl8pyKcUYMldWXrYEy8fTtnOpnzb/p2xfgaj77ab1Df
	7ipxyrmcdH/sBmHb3jd3Sc3lKFoYVFhOq7FstIEVQSaCzLs5rmRaQfYrpO95LQQTVWHr
	FRLA==
X-Gm-Message-State: ALoCoQkqoYRjlH2G1MLWPrROrI1WGVD83RLvu8UkweyXQGCaVlQ4u7LA1uLMleOuoHXena07yxw0
X-Received: by 10.140.94.195 with SMTP id g61mr6654qge.80.1422527726695; Thu,
	29 Jan 2015 02:35:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 29 Jan 2015 02:35:05 -0800 (PST)
In-Reply-To: <CAP71WjwH+Z6Ys+vLQ66Agr07HrDNzVmy1q5NFgLXzdwCK5L=+A@mail.gmail.com>
References: <1422435425-20620-1-git-send-email-pengyu.ma@windriver.com>
	<CAP71Wjyba6f0VpKMFJkOs21KPFdtX_ScR3E=jtJTit_mkaN0cA@mail.gmail.com>
	<54CA05D4.6040404@windriver.com>
	<CAP71WjwH+Z6Ys+vLQ66Agr07HrDNzVmy1q5NFgLXzdwCK5L=+A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Jan 2015 10:35:05 +0000
Message-ID: <CAJTo0LaxjO4nX9fWWQN-e0EgTSt6RRc9U-DovdQFY5+z7tMLmw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] mesa: Upgrade to 10.4.0
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
X-List-Received-Date: Thu, 29 Jan 2015 10:35:33 -0000
Content-Type: multipart/alternative; boundary=001a113a59eed55182050dc80b47

--001a113a59eed55182050dc80b47
Content-Type: text/plain; charset=UTF-8

On 29 January 2015 at 10:10, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> well, i am not sure this is right... at least probably not the right
> argument. oe-core is not meant to be tied to specific intel stable
> releases, whether it is about content or  schedule..
>
> i would believe our goal is to provide the most recent stable release
> instead. so that each OE (well, Yocto) release ends up with the most
> recent versions.
>
> fwiw, for the boards/platforms i care about, 10.4.3 would be fine.
>

Agreed.  The Intel driver release is tested with 10.4.0 but 10.4.3 is a
newer point release so should work, and Intel's aim of ensuring that the
latest driver stack is supported doesn't trump having the latest upstream
releases in oe-core.

If it turns out that 10.4.3 is critically broken with the Intel driver then
*meta-intel* can ship 10.4.0.

Please re-submit this with 10.4.3 instead of 10.4.0.

Ross

--001a113a59eed55182050dc80b47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 January 2015 at 10:10, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@=
linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":20z" class=3D"a3s" style=3D"overflow:hidden">well, i am not sure this =
is right... at least probably not the right<br>
argument. oe-core is not meant to be tied to specific intel stable<br>
releases, whether it is about content or=C2=A0 schedule..<br>
<br>
i would believe our goal is to provide the most recent stable release<br>
instead. so that each OE (well, Yocto) release ends up with the most<br>
recent versions.<br>
<br>
fwiw, for the boards/platforms i care about, 10.4.3 would be fine.</div></b=
lockquote><div><br></div><div>Agreed.=C2=A0 The Intel driver release is tes=
ted with 10.4.0 but 10.4.3 is a newer point release so should work, and Int=
el&#39;s aim of ensuring that the latest driver stack is supported doesn&#3=
9;t trump having the latest upstream releases in oe-core.</div><div><br></d=
iv><div>If it turns out that 10.4.3 is critically broken with the Intel dri=
ver then *meta-intel* can ship 10.4.0.</div><div><br></div><div>Please re-s=
ubmit this with 10.4.3 instead of 10.4.0.</div><div><br></div><div>Ross</di=
v></div></div></div>

--001a113a59eed55182050dc80b47--
