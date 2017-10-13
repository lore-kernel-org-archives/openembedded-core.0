Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id A0E8A78253
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 23:12:36 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id a192so882281pge.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 16:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NLLO6Wfm+O6jEVirttsyVEIBdOQNnW+/JDNbxzXXFxM=;
	b=kPdngf7wsq5dSw2Ee+bC+GK8ilP8szFpCbPCoUMNWMVozx3JAi6dh7vdQzBwXw+/lG
	DUcjKsFPHz0h9GyLnoRx8B9IQcsV3nVXhEWqnNrwkeJN2NkT7DTgvJnggt8mC28wponn
	5x1azrzC4BUJjFFTQJT3CIUj0YLQNdzKgsK4r2NuluwRJS4xFLosg6Q3J28XjBkFryqe
	ZIVXYI6m1Lth6DTeh5V8OEJ9PhKD014dpt7is1kDYAu2Jl4nY1qZO8kGxIiBTTjOf3eG
	dGgSmN27+l4SVUR3hnNRIlTThaSK40OS+4G0uzbJQ1IXIlPhL2upqZ4MYdG3v8GvVt47
	KvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NLLO6Wfm+O6jEVirttsyVEIBdOQNnW+/JDNbxzXXFxM=;
	b=JcFteugM6z7Bk23cYA4psGVyn1GCUpj+DF9tgG3rRkOGZ6jz8PiE9DWHluwdw59emF
	r/VXwplAlSz7C8FrQCxfP8UNYRVMsGT4O1zh5m4w/38s1Dgw7BzsShYjj+tmRJ9eloka
	ckSSd0xYKvSdf2YxodFQrlOAT/M9badZykCRd34NOhe7CPsKx90yjoUn57NxO+D1LGBt
	nNOp9iOgawMIuu2nrnZZFqpJhG0uMpweXOHwiLsi8EcT8hnQ7Hmqa+ia1n6hH6TiTsZH
	Q1/e63sDbPP1KwCkcG4pD/ME5vbf604bV9PEOtct6j6V940XD00FcedoKi7wrAcCegZY
	vn8A==
X-Gm-Message-State: AMCzsaWX1tMyXm24QOYZ1gCHiQ+rUzmiCM6cyafC+9WbEH8nA65EDCX4
	QyxCnZpaS2bvKL+jmeHQO04MobnCv5hWCXbjq8s=
X-Google-Smtp-Source: AOwi7QBwMrNWBG3pMaeisSwGMx+YOSZX0qSOTWO9hk3o6OabOaGTZtQyx605vbBIYk+IfHCeOAt2vhkDy0V3V79qLzk=
X-Received: by 10.98.150.149 with SMTP id s21mr2589465pfk.151.1507936357946;
	Fri, 13 Oct 2017 16:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <1507836933-142066-1-git-send-email-denis@denix.org>
	<CAJTo0LZOauk809g+8dCqk2t0sp24v6HJA6fGSQtYH0On1mC6Kg@mail.gmail.com>
In-Reply-To: <CAJTo0LZOauk809g+8dCqk2t0sp24v6HJA6fGSQtYH0On1mC6Kg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2017 23:12:26 +0000
Message-ID: <CAMKF1soyqbuKdirGOxfeYp50sLWS2MUFUEYO2zoz0j9TVyD5_A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] wayland-protocols: upgrade to 1.11
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
X-List-Received-Date: Fri, 13 Oct 2017 23:12:36 -0000
Content-Type: multipart/alternative; boundary="94eb2c0a44caf59a09055b75ca5b"

--94eb2c0a44caf59a09055b75ca5b
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 13, 2017 at 4:34 AM Burton, Ross <ross.burton@intel.com> wrote:

> On 12 October 2017 at 20:35, Denys Dmytriyenko <denis@denix.org> wrote:
>
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>
>
> One day I'll figure out why quilt appears to be non-deterministic about
> this but:
>

Does it have CR LF end of line botch ups

>
> ERROR: wayland-protocols-1.11-r0 do_patch: Command Error: 'quilt --quiltrc
> /data/poky-tmp/master/build/work/all-poky-linux/wayland-protocols/1.11-r0/recipe-sysroot-native/etc/quiltrc
> push' exited with 0  Output:
> Applying patch usesysrootprefixforpkgdatadirvariable.patch
> patching file wayland-protocols.pc.in
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file wayland-protocols.pc.in
> Patch usesysrootprefixforpkgdatadirvariable.patch can be reverse-applied
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0a44caf59a09055b75ca5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, Oct 13, 2017 =
at 4:34 AM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.b=
urton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
>On 12 October 2017 at 20:35, Denys Dmytriyenko <span>&lt;<a href=3D"mailto=
:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span> wrote:<b=
r></div><div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-l=
eft:1ex">From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=
=3D"_blank">denys@ti.com</a>&gt;<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=
=3D"_blank">denys@ti.com</a>&gt;<br></blockquote><div><br></div></div></div=
></div><div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div>One =
day I&#39;ll figure out why quilt appears to be non-deterministic about thi=
s but:</div><div></div></div></div></div></blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto">Does it have CR LF end of line botch ups=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><div><br></div><div>ERROR: wayland-protocols-1.11-r0 do_pa=
tch: Command Error: &#39;quilt --quiltrc /data/poky-tmp/master/build/work/a=
ll-poky-linux/wayland-protocols/1.11-r0/recipe-sysroot-native/etc/quiltrc p=
ush&#39; exited with 0 =C2=A0Output:</div><div>Applying patch usesysrootpre=
fixforpkgdatadirvariable.patch</div><div>patching file <a href=3D"http://wa=
yland-protocols.pc.in" target=3D"_blank">wayland-protocols.pc.in</a></div><=
div>Hunk #1 FAILED at 1.</div><div>1 out of 1 hunk FAILED -- rejects in fil=
e <a href=3D"http://wayland-protocols.pc.in" target=3D"_blank">wayland-prot=
ocols.pc.in</a></div><div>Patch usesysrootprefixforpkgdatadirvariable.patch=
 can be reverse-applied</div></div></div></div><div><div class=3D"gmail_ext=
ra"><div class=3D"gmail_quote"><div><br></div><div>Ross=C2=A0</div></div></=
div></div>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c0a44caf59a09055b75ca5b--
