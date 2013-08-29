Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1181A6BF57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:19:10 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj1so1133297pad.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=KgbDmjMuowgM/rfwMczSC8IauNWFvxDTWb5e13AYy8c=;
	b=i2+2GtRN3CK2JhKuxsWkvliqU7DstEharWluTXGTPzbSxzjLrx04unyRGVbsiUEIva
	BATHR+ZjVO36U9RSKvT7URQ//fw586RunqUCWUPTTOgYMnlfeDLpfVNxaBY3fKtJY9K0
	KeHOoQof+QTnbsPH0GkCbLewWBFxBK/QgTYzf4pJdFOAmACnWqqjMIsbgKdOL+t/Vl6p
	0rITR6Vr0F55sXdMRmVbTxfBeZvI7gS0J80z0ndir0cJl18Xm5p9SKovLwELs2/AyA5T
	rerVgk5YWdH+Ec0lC8y9ez7pEdjs7nEG7VGwrhRDF/LeHe00HO4PGabLam2D8L7DXlA/
	fCsg==
X-Gm-Message-State: ALoCoQlIfDegTLMmaKQ5WgoF0MQELs8/b1PiPBv6N57sJA6wtKcEwoUyIoxCIAbXSXYsy4fEj8Aq
MIME-Version: 1.0
X-Received: by 10.68.161.132 with SMTP id xs4mr4514412pbb.172.1377793151066;
	Thu, 29 Aug 2013 09:19:11 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Thu, 29 Aug 2013 09:19:10 -0700 (PDT)
In-Reply-To: <1377097189.25999.118.camel@ted>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
	<CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
	<CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
	<CAOMwXhMOQo3PiAT+3L2M894MDJvLg0eEwunqtQD3TGMwBReXHw@mail.gmail.com>
	<CAJTo0La2UVtZ9rM-HRGY9DGzD9=D4RTZzutHT8Aks4QJ9E=zPw@mail.gmail.com>
	<CAOMwXhP6awmXzW2Sm0OMKyrWBFtQRje1CkL3yWtvzdU6fvd1bw@mail.gmail.com>
	<20130821110401.GG522@jama>
	<CAOMwXhP+k2qnhPsAEYvppC3eTf7N0UUY7V0-KVNs+83u-XU2oA@mail.gmail.com>
	<1377097189.25999.118.camel@ted>
Date: Thu, 29 Aug 2013 17:19:10 +0100
X-Google-Sender-Auth: drkDWALet_-EHKVf8G_HMXEDi_4
Message-ID: <CAOMwXhM=gnOZzk70yB6=2XdJFKtC6bZoNNHZDb2zd=bhma0Lhw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Thu, 29 Aug 2013 16:19:10 -0000
Content-Type: multipart/alternative; boundary=047d7bd6c27657f9c104e51877b2

--047d7bd6c27657f9c104e51877b2
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 3:59 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Regardless of whether you use mirrors or not, if you set
> BB_GENERATE_MIRROR_TARBALLS it will create tarballs in DL_DIR of the git
> repositories. You can then stop trying to check in the /git/  and /git2/
> subdirectories of DL_DIR and some of your problems will likely go away.
>

Actually, I have just spent one hour with a full rebuild, but putting this
variable into the local.conf did not generate any different downloads
folder. Any other idea how to get rid of the git hassle in here without a
major infrastructure refactor?

--047d7bd6c27657f9c104e51877b2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Aug 21, 2013 at 3:59 PM, Richard Purdie <span dir=
=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><di=
v class=3D"gmail_extra">
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOE=
nZb"><div class=3D"h5"><span style=3D"color:rgb(34,34,34)">Regardless of wh=
ether you use mirrors or not, if you set</span><br>
</div></div>
BB_GENERATE_MIRROR_TARBALLS it will create tarballs in DL_DIR of the git<br=
>
repositories. You can then stop trying to check in the /git/ =A0and /git2/<=
br>
subdirectories of DL_DIR and some of your problems will likely go away.<br>=
</blockquote><div><br></div><div>Actually, I have just spent one hour with =
a full rebuild, but putting this variable into the local.conf did not gener=
ate any different downloads folder. Any other idea how to get rid of the gi=
t hassle in here without a major infrastructure refactor?</div>
</div></div></div>

--047d7bd6c27657f9c104e51877b2--
