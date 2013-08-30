Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 738466BD69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 13:42:36 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so1897890pde.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 06:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=12Sn+w2WaQgTS2FSgJYgSfLsL3enD/imX1lMS7eZMUo=;
	b=F0PP71qjbHy6T6Zpug8eGcAk/rjI2zWHPcKlzFtMJBNiPeVqy1Z+b8aLOzs20kUA3I
	qlrCgx1SbCpwkdPaLQvO3M/6kUDHlpEayaSnJdpnaytZA32jSNi469TPWroM7mQjA1W0
	L0PFN5rsoHzbPO2fown9RPkBtaaV4y58xCX3jUFylHemdLpHQmODJyEUP+Gr1R+5KZ0y
	wJpmQexAN+GA/dIE4cGlzggAzrxEc7OvgdmsNsX1qS6gFXTTXuufzC5sbnb0536OHpIw
	6JbeYCZLD/a4YPKv8+UqIJI78WHf9Z8l7qZiwXbEBIZa9m3fJ+6kivQtmPiwRqfkhJDo
	6YeA==
X-Gm-Message-State: ALoCoQmGLI5tZip6E7+g5Ah57cduxoq40yQSn/b/TqRhx1lv9yr1GMYJ3CXURsxpovCwMeJWFp50
MIME-Version: 1.0
X-Received: by 10.68.254.226 with SMTP id al2mr9965051pbd.157.1377870157511;
	Fri, 30 Aug 2013 06:42:37 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Fri, 30 Aug 2013 06:42:37 -0700 (PDT)
In-Reply-To: <CAOMwXhNJdsYHaeKT34GEFXBYX5P75MdRDAs5YHUo-H08jBu+1A@mail.gmail.com>
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
	<CAOMwXhM=gnOZzk70yB6=2XdJFKtC6bZoNNHZDb2zd=bhma0Lhw@mail.gmail.com>
	<CAOMwXhNJdsYHaeKT34GEFXBYX5P75MdRDAs5YHUo-H08jBu+1A@mail.gmail.com>
Date: Fri, 30 Aug 2013 14:42:37 +0100
X-Google-Sender-Auth: OVOosidiSQCHlkfXymnH2p-ZGbg
Message-ID: <CAOMwXhP+PmKnr=uP=XeXqYSznW=ooCuMPH91kQsK295ekO=_=w@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Aug 2013 13:42:37 -0000
Content-Type: multipart/alternative; boundary=047d7b2e0fc74914f804e52a6516

--047d7b2e0fc74914f804e52a6516
Content-Type: text/plain; charset=ISO-8859-1

OK, it seems to finally work on our CI. Thanks to all for the help.


On Thu, Aug 29, 2013 at 6:15 PM, Laszlo Papp <lpapp@kde.org> wrote:

> On Thu, Aug 29, 2013 at 5:19 PM, Laszlo Papp <lpapp@kde.org> wrote:
>
>> On Wed, Aug 21, 2013 at 3:59 PM, Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> Regardless of whether you use mirrors or not, if you set
>>>  BB_GENERATE_MIRROR_TARBALLS it will create tarballs in DL_DIR of the git
>>> repositories. You can then stop trying to check in the /git/  and /git2/
>>> subdirectories of DL_DIR and some of your problems will likely go away.
>>>
>>
>> Actually, I have just spent one hour with a full rebuild, but putting
>> this variable into the local.conf did not generate any different downloads
>> folder. Any other idea how to get rid of the git hassle in here without a
>> major infrastructure refactor?
>>
>
> What I executed was:  "git rm -r ./downloads/git2 && git commit
> ./downloads/git2". Even after that, it is broken. :(
>
>

--047d7b2e0fc74914f804e52a6516
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, it seems to finally work on our CI. Thanks to all for =
the help.</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote=
">On Thu, Aug 29, 2013 at 6:15 PM, Laszlo Papp <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> w=
rote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div class=3D"h5">On T=
hu, Aug 29, 2013 at 5:19 PM, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<=
br>
</div></div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><div=
 class=3D"h5"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">

<div dir=3D"ltr"><div>On Wed, Aug 21, 2013 at 3:59 PM, Richard Purdie <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" targ=
et=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
</div><div class=3D"gmail_extra">
<div class=3D"gmail_quote"><div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex"><div><div><span style=3D"c=
olor:rgb(34,34,34)">Regardless of whether you use mirrors or not, if you se=
t</span><br>


</div></div>
BB_GENERATE_MIRROR_TARBALLS it will create tarballs in DL_DIR of the git<br=
>
repositories. You can then stop trying to check in the /git/ =A0and /git2/<=
br>
subdirectories of DL_DIR and some of your problems will likely go away.<br>=
</blockquote><div><br></div></div><div>Actually, I have just spent one hour=
 with a full rebuild, but putting this variable into the local.conf did not=
 generate any different downloads folder. Any other idea how to get rid of =
the git hassle in here without a major infrastructure refactor?</div>

</div></div></div></blockquote><div><br></div></div></div><div>What I execu=
ted was: =A0&quot;git rm -r ./downloads/git2 &amp;&amp; git commit ./downlo=
ads/git2&quot;. Even after that, it is broken. :(</div></div><br></div></di=
v>

</blockquote></div><br></div>

--047d7b2e0fc74914f804e52a6516--
