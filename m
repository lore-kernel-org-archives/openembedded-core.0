Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 160E47F9A6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 22:55:42 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id c8so5363656pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 15:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=RoLOSGYYU2bVGbn5Ta2YjQsloKjBxQFyyZXMgYSBy90=;
	b=KVZM5R8SuezgpoV2Ch2NC/yzRr7SE5Kiy6brd8iy7aZnzW+OqFz31PZRxuCmCGi8Kn
	vzoTgRg/JM/PG0hHEwppo70wKE3YsLB511lsJwOSjykl0T8OyomrRig2ya+Hvbi63H5n
	44QrNQfNDkZfVKSxfsxKYEKAqI+vZ3UxUz2m/Q523ELqDppMTScP81msawlTtfTKFohw
	B0QxYvlLga/NcMPrQFm6pTrAIq3Xy5hrPQKxXGkI6tAZpL2j+DZbF5Re5qTkngwHeNcd
	xo6tozrGLHxfYWnqD/Mjdazl9VmN4X0RkLhZYmUOFcI5V08jZX24/BBU/Nm/OeUGmDua
	6GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=RoLOSGYYU2bVGbn5Ta2YjQsloKjBxQFyyZXMgYSBy90=;
	b=gey24UgiyZvwWMMMHypcdSh6iN0P30ozX8Q+0F7djvPcepMvu3Laj8BGZinKp3jTPw
	w0klN6muSfZ/QcWQ876A1fu3Gy3Db7Owie+K2vRg+HFTflaHqsDnMi7gPjVdG22mUtGS
	Hj4yuRxOsiEM7sdIsizmD2ngW7/y3EDDfLL2D+1xS2nZ2Fyzm66M/0Cx/67/mFFms/D4
	MKZP56gei7GbMq3DSmZBQYVcZqocQUGc7qv7Yi9FGwkd88VYpHvKOp54BV7rrnPRPlu6
	eSwsxFFI2nhJsksZG7pdiDd+JcE/fnwq0QJomoQ7UZz+7hMA6TUaegjNryAUYEkSdU1t
	S9Zw==
X-Gm-Message-State: APjAAAUblbc3Z7iucZhyZ36uHrM3rNH5xCGnkeHOEtGxkYOD2Sh59azS
	ewwsPy+jEVEHK9AllHpOMTI1IwBJOoE=
X-Google-Smtp-Source: APXvYqzZ1S8Kl454sYqEWfmRgtdebx1D1J2RAuklsz3xulXnknu89icQ/dZZXFsIE5NjQhzGp+iwEA==
X-Received: by 2002:a63:4b54:: with SMTP id k20mr17836192pgl.70.1572216943830; 
	Sun, 27 Oct 2019 15:55:43 -0700 (PDT)
Received: from [10.192.11.162] ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v3sm533365pfn.171.2019.10.27.15.55.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2019 15:55:43 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <a5bb0fd6ed961516f649139e41cbdddf42ce17e2.camel@linuxfoundation.org>
	<52271207-9556-e9cb-667b-0b2d9916a0d1@gmail.com>
	<2bf2e46efd847d3771fa62f0cfe9cc508f0b4c2d.camel@linuxfoundation.org>
	<CAMKF1sr1VP2buKXC0p4WgZvmY8+6Ok9u6QOCo8hhKoYHArV6LA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ab11000a-0c88-5978-ce53-8bb866695f8a@gmail.com>
Date: Sun, 27 Oct 2019 15:55:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr1VP2buKXC0p4WgZvmY8+6Ok9u6QOCo8hhKoYHArV6LA@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: qemu rebuild contamination
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
X-List-Received-Date: Sun, 27 Oct 2019 22:55:43 -0000
Content-Type: multipart/alternative;
	boundary="------------F039641696559F32B63AD78E"
Content-Language: en-US

--------------F039641696559F32B63AD78E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 10/27/19 12:26 PM, Khem Raj wrote:
>
>
> On Sun, Oct 27, 2019 at 7:19 PM Richard Purdie
> <richard.purdie@linuxfoundation.org
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     On Sun, 2019-10-27 at 07:56 -0700, akuster808 wrote:
>     >
>     > On 10/27/19 2:57 AM, Richard Purdie wrote:
>     > > I've been trying to figure out why we get a weird build failure=

>     > > with
>     > > hash equivalence enabled. Armin has also been searching for an =
odd
>     > > issue with warrior and the qemu tests. I may have a lead.
>     > >
>     > > If you build a standard qemu:
>     > >
>     > > "bitbake qemu-system-native"
>     > >
>     > > and save off the resulting qemu-system-XXX binaries, then add:
>     > >
>     > > PACKAGECONFIG_append_pn-qemu-system-native =3D " gtk+"
>     > > PACKAGECONFIG_append_pn-qemu-system-native =3D " virglrenderer"=

>     > > PACKAGECONFIG_append_pn-qemu-system-native =3D " glx"
>     > >
>     > > to local.conf, then:
>     > >
>     > > "bitbake qemu-system-native"
>     > >
>     > > it rebuilds as expected, save off the qemu-system-XXX binaries,=

>     > >
>     > > then remove the local.conf entries and:
>     > >
>     > > "bitbake qemu-system-native -c configure -f"
>     > > "bitbake qemu-system-native"
>     > >
>     > > then save off the resulting qemu-system-XXX binaries, you'll fi=
nd
>     > > that
>     > > whilst these first and last sets should match, they don't. Its
>     > > obvious
>     > > with "ldd qemu-system-x86_64" that the linked libraries persist=

>     > > from
>     > > the second to third set when they should not.
>     > >
>     > > The reason is that when configuration changes, autotools.bbclas=
s
>     > > will
>     > > wipe out ${B} however qemu doesn't use the autotools class and
>     > > hence B
>     > > is not cleaned for changes in configuration.
>     > >
>     > > We could abstract the pieces of autotools.bbclass which do this=

>     > > into a
>     > > separate class, or, easier, have qemu's do_configure wipe ${B}.=

>     > >
>     > > Armin: This may be the issue you're searching for with warrior?=

>     > You mean the virgl failure? I did set the native packconfig to ma=
ke
>     > the
>     > selftest and that had no affect. In facted, Zeus has the same
>     > mismatch.
>     > Alex's patches I believe align them to match.
>     >
>     > The virgl failure is fixed using an updated version of libdrm. I
>     > thought I sent an email about that.
>
>     I'm travelling so a little out of sync, I see the email now. I thin=
k I
>     managed to hit the rebuild issue when I tried to debug it which is =
why
>     it seemed related to me.
>
>     For the libdrm issue in warrior, we could:
>
>     a) Break policy and upgrade libdrm
>     b) Just upgrade libdrm-native and nativesdk
>     c) Mark f30 as broken in warrior for qemugl and not expected to wor=
k.
>
errrr, Looking at the test report for 2.7.1, this failed back then too
so saying it does not work is fine.

https://autobuilder.yocto.io/pub/releases/yocto-2.7.1.rc1/testresults/oe-=
selftest-fedora/testresults.json

-armin
>
>
>     Any thougts?
>
>
> I support c ad well but I think there is some hope to identify a fix
> that can be backported=C2=A0
>
>
>
>     I'm tempted by c).
>
>     Cheers,
>
>     Richard
>
>     --=20
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------F039641696559F32B63AD78E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 10/27/19 12:26 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sr1VP2buKXC0p4WgZvmY8+6Ok9u6QOCo8hhKoYHArV6LA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Sun, Oct 27, 2019 at 7:19
            PM Richard Purdie &lt;<a
              href="mailto:richard.purdie@linuxfoundation.org"
              moz-do-not-send="true">richard.purdie@linuxfoundation.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun,
            2019-10-27 at 07:56 -0700, akuster808 wrote:<br>
            &gt; <br>
            &gt; On 10/27/19 2:57 AM, Richard Purdie wrote:<br>
            &gt; &gt; I've been trying to figure out why we get a weird
            build failure<br>
            &gt; &gt; with<br>
            &gt; &gt; hash equivalence enabled. Armin has also been
            searching for an odd<br>
            &gt; &gt; issue with warrior and the qemu tests. I may have
            a lead.<br>
            &gt; &gt; <br>
            &gt; &gt; If you build a standard qemu:<br>
            &gt; &gt; <br>
            &gt; &gt; "bitbake qemu-system-native"<br>
            &gt; &gt; <br>
            &gt; &gt; and save off the resulting qemu-system-XXX
            binaries, then add:<br>
            &gt; &gt; <br>
            &gt; &gt; PACKAGECONFIG_append_pn-qemu-system-native = "
            gtk+"<br>
            &gt; &gt; PACKAGECONFIG_append_pn-qemu-system-native = "
            virglrenderer"<br>
            &gt; &gt; PACKAGECONFIG_append_pn-qemu-system-native = "
            glx"<br>
            &gt; &gt; <br>
            &gt; &gt; to local.conf, then:<br>
            &gt; &gt; <br>
            &gt; &gt; "bitbake qemu-system-native"<br>
            &gt; &gt; <br>
            &gt; &gt; it rebuilds as expected, save off the
            qemu-system-XXX binaries,<br>
            &gt; &gt; <br>
            &gt; &gt; then remove the local.conf entries and:<br>
            &gt; &gt; <br>
            &gt; &gt; "bitbake qemu-system-native -c configure -f"<br>
            &gt; &gt; "bitbake qemu-system-native"<br>
            &gt; &gt; <br>
            &gt; &gt; then save off the resulting qemu-system-XXX
            binaries, you'll find<br>
            &gt; &gt; that<br>
            &gt; &gt; whilst these first and last sets should match,
            they don't. Its<br>
            &gt; &gt; obvious<br>
            &gt; &gt; with "ldd qemu-system-x86_64" that the linked
            libraries persist<br>
            &gt; &gt; from<br>
            &gt; &gt; the second to third set when they should not.<br>
            &gt; &gt; <br>
            &gt; &gt; The reason is that when configuration changes,
            autotools.bbclass<br>
            &gt; &gt; will<br>
            &gt; &gt; wipe out ${B} however qemu doesn't use the
            autotools class and<br>
            &gt; &gt; hence B<br>
            &gt; &gt; is not cleaned for changes in configuration.<br>
            &gt; &gt; <br>
            &gt; &gt; We could abstract the pieces of autotools.bbclass
            which do this<br>
            &gt; &gt; into a<br>
            &gt; &gt; separate class, or, easier, have qemu's
            do_configure wipe ${B}.<br>
            &gt; &gt; <br>
            &gt; &gt; Armin: This may be the issue you're searching for
            with warrior?<br>
            &gt; You mean the virgl failure? I did set the native
            packconfig to make<br>
            &gt; the<br>
            &gt; selftest and that had no affect. In facted, Zeus has
            the same<br>
            &gt; mismatch.<br>
            &gt; Alex's patches I believe align them to match.<br>
            &gt; <br>
            &gt; The virgl failure is fixed using an updated version of
            libdrm. I<br>
            &gt; thought I sent an email about that.<br>
            <br>
            I'm travelling so a little out of sync, I see the email now.
            I think I<br>
            managed to hit the rebuild issue when I tried to debug it
            which is why<br>
            it seemed related to me.<br>
            <br>
            For the libdrm issue in warrior, we could:<br>
            <br>
            a) Break policy and upgrade libdrm<br>
            b) Just upgrade libdrm-native and nativesdk<br>
            c) Mark f30 as broken in warrior for qemugl and not expected
            to work.<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    errrr, Looking at the test report for 2.7.1, this failed back then
    too so saying it does not work is fine.<br>
    <br>
<a class="moz-txt-link-freetext" href="https://autobuilder.yocto.io/pub/releases/yocto-2.7.1.rc1/testresults/oe-selftest-fedora/testresults.json">https://autobuilder.yocto.io/pub/releases/yocto-2.7.1.rc1/testresults/oe-selftest-fedora/testresults.json</a><br>
    <br>
    -armin<br>
    <blockquote type="cite"
cite="mid:CAMKF1sr1VP2buKXC0p4WgZvmY8+6Ok9u6QOCo8hhKoYHArV6LA@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <br>
            Any thougts?</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">I support c ad well but I think there is some
            hope to identify a fix that can be backported </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            <br>
            I'm tempted by c).<br>
            <br>
            Cheers,<br>
            <br>
            Richard<br>
            <br>
            -- <br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a href="mailto:Openembedded-core@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
            <a
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------F039641696559F32B63AD78E--
