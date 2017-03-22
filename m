Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 64C6377A87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:20:01 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id v127so155141904qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5hdiLZzTwinB7sHUjuyeNwjZmuP8CWq0eH5N2UjnYLs=;
	b=cNO/W3dFpe/TtCJw9izORPDxy6NwLnY2JfKkzxaSsxXU4kmRZHZtN9P5h4LGlnuA5v
	Vm48ugSfgcfnaDEeVopnd7R5hHtziNzwR81mPXn54gEhyJkT0Sez16HXGozi4C6WhLY0
	dAcHqmlEjQrHxdmUu+fKCSy9KXXy3Avrj6g9guVK60H196x//n6tVp1NixiJV3L+Me6F
	/QDfTWoBWCupVKVfOFy5qhv3RF9nafOSKWqvREqPP8zGqmflPxSnnWzmXO0ZfXHg6PWG
	8m4DcLraCtBt1fpBNepfjKZcymMA9b3vhhkoFk4hRbX9cEWd7NFDk2W3oAuwI9ThXTMp
	TIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5hdiLZzTwinB7sHUjuyeNwjZmuP8CWq0eH5N2UjnYLs=;
	b=Hk62Ghwl9AHq9HJ9cxVMmGr82WcXXsNn4vPgU3mxl+l3CKF0G8MBgdVgjD5GKFlwjr
	Vh81KGf+W32GnHHBouHjr++AhWtY0nw/rKm+JIFMgMBvn6WebW6aOxKqHi3HhPWue2GP
	4We+plIoWbehtOSm+Py9cIXXfd3BLYDZaB75NIEXG7fkSYwzF2/XnvV5XKuvnBGrGCfs
	bpVj2adsuepVixFH+PY8Gyype30dhvcvkAqviorUIB7Muo0hXbcqvnjFVsevV7NvgtAt
	Wd5D2nhB8AilJn23zjFj0nRHGjY1JvEa/QkDNKVsZFjHNtqcs7nJeC+B4vOQz6Y1NOMH
	v3dA==
X-Gm-Message-State: AFeK/H2pXPYQxLN1XCjhwg4RJHILzcruMMJgPOfwzkE7CwZvMeHz5909CE3a3KANDNGVVa6+6Vp2USq46+MDxyHH
X-Received: by 10.55.175.195 with SMTP id y186mr34678163qke.26.1490181602429; 
	Wed, 22 Mar 2017 04:20:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 22 Mar 2017 04:19:42 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Mar 2017 11:19:42 +0000
Message-ID: <CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: design question: should layer.conf contain "PREFERRED_VERSION" settings?
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
X-List-Received-Date: Wed, 22 Mar 2017 11:20:01 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c115673054b4ff1fa

--94eb2c06093c115673054b4ff1fa
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 11:14, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

> so, just to be clear, the simple act of adding that layer to a
> project's bblayers.conf file will cause those preferred versions to
> be selected, correct?
>
>   is that considered good design? in a perfect world, i've always
> believed that you should be able to load up your bblayers.conf file
> with as many extraneous layers as you want and (well, with some
> exceptions), if you choose not to take advantage of the contents of a
> layer, it shouldn't hurt you.
>

Yes.

No.

It's a violation of the layer design rules and should result in the new
layer compat tools failing the layer.

Ross

--94eb2c06093c115673054b4ff1fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2017 at 11:14, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":35" clas=
s=3D"a3s aXjCH m15af5ba4e9d18421">so, just to be clear, the simple act of a=
dding that layer to a<br>
project&#39;s bblayers.conf file will cause those preferred versions to<br>
be selected, correct?<br>
<br>
=C2=A0 is that considered good design? in a perfect world, i&#39;ve always<=
br>
believed that you should be able to load up your bblayers.conf file<br>
with as many extraneous layers as you want and (well, with some<br>
exceptions), if you choose not to take advantage of the contents of a<br>
layer, it shouldn&#39;t hurt you.</div></blockquote></div><br>Yes.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">No.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">It&#39;s a viola=
tion of the layer design rules and should result in the new layer compat to=
ols failing the layer.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c06093c115673054b4ff1fa--
