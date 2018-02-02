Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9138B78862
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 21:34:51 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id n7so24381524iob.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Feb 2018 13:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1uZtwODhdwI3PnSwBhDRzaefI6RDJYMXj3ORg1BNc5g=;
	b=bq7jcBKfbB9aE1L5cHalz7O/xt6dS7p897ROZLvqcXcuq/kVZoAz4PyjgEtH1tSTZn
	QCSqI7+zfDgswVuMpwj1ttaoCuWpmVHllJQ1dDz/8lw5L+2ts1yjdG4VkXRwsiSmjcEP
	kpt5bVHA9K4h5JO8oeWF+LYRZz7Y336EfaLzWmN82aglW4wOr1b2zgOhO5QW0ErNuqAc
	MTQPNQ6BZKmhyM1F7C9+y41oPpAGUimK/b7KGSL6JK/JlzVemaKKpWZM494W04jEIpP0
	QLzriLdzM5fvMHhiC1Ejf6LVGkpwzns7aWt7lHG4zJboELkccZZOrJzo8VbKhma5KdKs
	zsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1uZtwODhdwI3PnSwBhDRzaefI6RDJYMXj3ORg1BNc5g=;
	b=MYhqmqNZxrNNGoeLwnNrRSV2ZnOmqptbO3Q1Wo2yC81sFCDKw1zpJZXH819c867mF+
	0RZIgKDy71y48+ZjJXYtZElZ1uU8IoQfy5wIsLXsoFhIfVYpu6WDG14Ys33cfUiFe7Xp
	BlHUOYwf092rKLaCnt1NiL2XHJn9xoLMBAYLgSR3wFs5Gqklw6uxBFFiABKFMMKKhFRy
	w0Pw5wt8VJ8UKOEMN041iw78GuRoVxCUiiytcUwhUFQJu/dSzC3vs14ScrwgwS5HxoEH
	2p8HBGPAXqNHxzSwrlO2BaK81t6GWF075V9xTJhXoVNUuDjxd/sMkmElXj7EDfEfEqor
	LgEg==
X-Gm-Message-State: AKwxyteCR4mQL5xPw56tmxR7JDMvO+kd8TMd3l4AI9ut8KB9C60iOfS3
	sUgk7oAVamxtTavYhgRoOt7r39GM14V798nd2xbVkA==
X-Google-Smtp-Source: AH8x225gHiAiDKkae9qQ/HE7N81sjlaOzfKzlZ16wOjVaL1jlI5fntKeaDG1frKNayrg1Mfg5NwqvJ7Znehwc0kT5so=
X-Received: by 10.107.175.8 with SMTP id y8mr45008567ioe.37.1517607292522;
	Fri, 02 Feb 2018 13:34:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 2 Feb 2018 13:34:32 -0800 (PST)
In-Reply-To: <bcc359a5-5ba7-8cd0-d9c9-767f20114d39@xilinx.com>
References: <1517523029-19272-1-git-send-email-alejandr@xilinx.com>
	<20180201223257.15539.41169@do.openembedded.org>
	<MWHPR0201MB3401497FB2219F33ADADA13FACF90@MWHPR0201MB3401.namprd02.prod.outlook.com>
	<CAJTo0LbLxeJEGu=sTpg0uXWNRue7FcFuHMc+qbb1zzDe2QH_cQ@mail.gmail.com>
	<1fa84e7e-1032-906c-c25c-136f0a52d695@xilinx.com>
	<bcc359a5-5ba7-8cd0-d9c9-767f20114d39@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Feb 2018 21:34:32 +0000
Message-ID: <CAJTo0LYVgznrXnP0tBpgwmErE47Pp23aA6mHb9bxQ-W1cK0F8w@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG5pbmphOiBVcGdyYWRlIGZyb20gMS43LjIgdG8gbWFqb3IgcmVsZWFzZSAxLjguMiAocmV2Mik=?=
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
X-List-Received-Date: Fri, 02 Feb 2018 21:34:51 -0000
Content-Type: multipart/alternative; boundary="001a1144a2689463540564417b5b"

--001a1144a2689463540564417b5b
Content-Type: text/plain; charset="UTF-8"

So I'm 99% sure this is Exchange tramping the mail and git not handling
that, as the patch is quoted-printable encoded.    I'll pick from the
branch :)

Ross

On 2 February 2018 at 21:28, Alejandro Enedino Hernandez Samaniego <
alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:

> I might be wrong but you can check it here as well:
> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/
> log/?h=aehs29/ninja
>
>
>
> On 02/02/2018 01:22 PM, Alejandro Enedino Hernandez Samaniego wrote:
>
> This is what I got:
>
>
> $ git remote show origin
> * remote origin
>   Fetch URL: git://git.yoctoproject.org/poky
>   Push  URL: git://git.yoctoproject.org/poky
>   HEAD branch: master
>
> latest commit:
>
> bca260ef4dca87c11fc9d30b2b8a17664dc2d879 ninja: Upgrade from 1.7.2 to
> major release 1.8.2
> 385944254d0ef88bd6450a221a54cbcb40020b42 tcmode-default.inc: drop
> preferred version of gzip-native
>
>
>
> On 02/02/2018 12:58 PM, Burton, Ross wrote:
>
> On 2 February 2018 at 19:06, Alejandro Enedino Hernandez Samaniego <
> alejandr@xilinx.com> wrote:
>
>> This makes no sense to me, I rebased to master just before sending it.
>>
>
> Are you sure that the master you're rebasing is the actual upstream master?
>
> Applying: ninja: Upgrade from 1.7.2 to major release 1.8.2
> Using index info to reconstruct a base tree...
> error: patch failed: meta/recipes-devtools/ninja/ninja_1.7.2.bb:1
> error: meta/recipes-devtools/ninja/ninja_1.7.2.bb: patch does not apply
> error: Did you hand edit your patch?
> It does not apply to blobs recorded in its index.
> Patch failed at 0001 ninja: Upgrade from 1.7.2 to major release 1.8.2
>
>
>
>
>
>

--001a1144a2689463540564417b5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So I&#39;m 99% sure this is Exchange tramping the mail and=
 git not handling that, as the patch is quoted-printable encoded. =C2=A0 =
=C2=A0I&#39;ll pick from the branch :)<div><br></div><div>Ross</div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 2 February 2018=
 at 21:28, Alejandro Enedino Hernandez Samaniego <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:alejandro.enedino.hernandez-samaniego@xilinx.com" target=3D"_=
blank">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>I might be wrong but you can check it here as well:<br>
    </p>
<a class=3D"m_965412715345799169moz-txt-link-freetext" href=3D"https://git.=
yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Daehs29/ninja" target=
=3D"_blank">https://git.yoctoproject.org/<wbr>cgit/cgit.cgi/poky-contrib/<w=
br>log/?h=3Daehs29/ninja</a><div><div class=3D"h5"><br>
    <br>
    <br>
    <div class=3D"m_965412715345799169moz-cite-prefix">On 02/02/2018 01:22 =
PM, Alejandro
      Enedino Hernandez Samaniego wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <p>This is what I got:</p>
      <p><br>
      </p>
      <p>$ git remote show origin<br>
        * remote origin<br>
        =C2=A0 Fetch URL: git://<a href=3D"http://git.yoctoproject.org/poky=
" target=3D"_blank">git.yoctoproject.org/<wbr>poky</a><br>
        =C2=A0 Push=C2=A0 URL: git://<a href=3D"http://git.yoctoproject.org=
/poky" target=3D"_blank">git.yoctoproject.org/<wbr>poky</a><br>
        =C2=A0 HEAD branch: master</p>
      <p>latest commit:</p>
      <p>bca260ef4dca87c11fc9d30b2b8a17<wbr>664dc2d879 ninja: Upgrade from
        1.7.2 to major release 1.8.2<br>
        385944254d0ef88bd6450a221a54cb<wbr>cb40020b42 tcmode-default.inc:
        drop preferred version of gzip-native<br>
      </p>
      <p><br>
      </p>
      <br>
      <div class=3D"m_965412715345799169moz-cite-prefix">On 02/02/2018 12:5=
8 PM, Burton, Ross
        wrote:<br>
      </div>
      <blockquote type=3D"cite">
        <div dir=3D"ltr">On 2 February 2018 at 19:06, Alejandro Enedino
          Hernandez Samaniego <span dir=3D"ltr">&lt;<a href=3D"mailto:aleja=
ndr@xilinx.com" target=3D"_blank">alejandr@xilinx.com</a>&gt;</span>
          wrote:<br>
          <div class=3D"gmail_extra">
            <div class=3D"gmail_quote">
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">This
                makes no sense to me, I rebased to master just before
                sending it.<br>
              </blockquote>
              <div><br>
              </div>
              <div>Are you sure that the master you&#39;re rebasing is the
                actual upstream master?</div>
              <div><br>
              </div>
              <div>Applying: ninja: Upgrade from 1.7.2 to major release
                1.8.2</div>
              <div>Using index info to reconstruct a base tree...</div>
              <div>error: patch failed: meta/recipes-devtools/ninja/<a href=
=3D"http://ninja_1.7.2.bb:1" target=3D"_blank">ni<wbr>nja_1.7.2.bb:1</a></d=
iv>
              <div>error: meta/recipes-devtools/ninja/<a href=3D"http://nin=
ja_1.7.2.bb" target=3D"_blank">ni<wbr>nja_1.7.2.bb</a>:
                patch does not apply</div>
              <div>error: Did you hand edit your patch?</div>
              <div>It does not apply to blobs recorded in its index.</div>
              <div>Patch failed at 0001 ninja: Upgrade from 1.7.2 to
                major release 1.8.2</div>
              <div><br>
              </div>
              <div>=C2=A0</div>
            </div>
          </div>
        </div>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--001a1144a2689463540564417b5b--
