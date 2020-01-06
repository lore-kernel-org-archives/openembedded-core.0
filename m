Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 977FF7F89C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 11:34:59 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id c14so15774844uaq.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 03:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RqhnFNka03z1KW9/DtEjtsZk7Ugkemc/3a1jzsSkhto=;
	b=bFssCYjn5pT4Y3wU4ycDepBqMd3PIH0dWiWV95dqZ9aXMwPqZsoV0zRLsAJX4/a82a
	kNGF+Gj1Oh0cVMFQJs3QUe+UyJagsmsRcc1b59lVOm3VVFrSJOEsYTILSlcb1OReKblh
	S5IqCGtjxo1VAb2bV0b7anP7YswjytmWhs1sKcIMj3WCZBWg0UbbesNDUiQGoe0mzmvG
	u54v5WDKopK53O0G4FWtyn4o7f3HPNUs5ooOurozJ4T6iMCHgiHKCcZofpZP1hacvNaM
	VVYDrTqtecN2XGQOwyP4QmB7QjC6uLqI44RkB2BUAjuxTdWgG4HFtzVHkcilJOCLs+R0
	2QGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RqhnFNka03z1KW9/DtEjtsZk7Ugkemc/3a1jzsSkhto=;
	b=tmRWf71MZ4R0QBZOgg38lxeUaw21Ryx6ei3w7GPvN2YRz7R6PMDpeqKYEo22MIKOqE
	i+3Pk+QKfAVgGEp3TZHDEcbNpXocpLoFuvMezNLJV0kciichRONosNo+JoZ9oSzpTYPi
	4M66hCHjzx7LEQ8BxAGieGjDYdnGhdDVM70DSLac+J95xkbxV84z6RPUoTtvamccmYTe
	hkwPO0M7yhbtfFzNI8GNKQ0jeUII1ORz/ocgWpXBiYjHL/829ZNvifTTJeoOflgz4dgc
	IZsvzL0zGTJynBwUWapOVszwnKsA/48yeYqeRXMFPF2hmPSu9UNhjXAq+Kjp4l7R4pgZ
	ZTAg==
X-Gm-Message-State: APjAAAUKXrJJUI/qSjp2HjzIUUn4YrzeFJVTy95AAVkyrUom4TlNaQCt
	2QtwSCZp62W/gRL9NrpBnjHc3LF3rGfO00RW36iMtbZs2uY=
X-Google-Smtp-Source: APXvYqxcFy1HjeEZ0dSPzE87/6jdGYMRG5cTHYFi7T6Hpab5PKOOqZraU6PYDSdDvJS782nEbtbNSXh3zT4rYkYidZE=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr56458315uae.89.1578310500409; 
	Mon, 06 Jan 2020 03:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
	<20191127164003.115980-6-alex.kanavin@gmail.com>
	<81f2806c-4107-2ce5-2c0f-4bdd28438fb1@windriver.com>
	<CANNYZj8CX3JB_XW=x-pXKejnHQ1GXFjgp01UtFUxnuC4xmmt2A@mail.gmail.com>
	<c39de046-dc12-23a9-e4ec-a77abf5b12d4@windriver.com>
In-Reply-To: <c39de046-dc12-23a9-e4ec-a77abf5b12d4@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Jan 2020 12:34:49 +0100
Message-ID: <CANNYZj9pcGfOh5suLKVf+Tgb4ENj1SWOgyYL7yGq44CNsZsUHA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/14] dummy-sdk-package.inc: do not include files into RREPLACES
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
X-List-Received-Date: Mon, 06 Jan 2020 11:34:59 -0000
Content-Type: multipart/alternative; boundary="000000000000b8e356059b770c93"

--000000000000b8e356059b770c93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I made a couple of patches for this, they seem to fix the issues. Please
test:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/pack=
age-version-updates&id=3Da695bd5a8951b640add0cbc3e8171da7f58982b6
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/pack=
age-version-updates&id=3D6574516432dec7e5a716ff7c17c1bcaea06a3fb7

Alex

On Fri, 3 Jan 2020 at 01:49, Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2020/1/3 =E4=B8=8A=E5=8D=882:06, Alexander Kanavin wrote:
>
> On Thu, 2 Jan 2020 at 11:18, Kang Kai <Kai.Kang@windriver.com> wrote:
>
>> On 2019/11/28 =E4=B8=8A=E5=8D=8812:39, Alexander Kanavin wrote:
>> > rpm 4.15 no longer allows it, which makes sense.
>> >
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>
>> Hi Alex,
>>
>> I tried this patch with rpm 4.15 and it fails to run task populate_sdk
>> when multilib is enabled and lib32-perl is installed.
>>
>> IMAGE_INSTALL_append =3D " lib32-perl "
>>
>
> I believe this is due to DUMMYPROVIDES_PACKAGES needing the same multilib
> expansion as:
>
> DUMMYPROVIDES +=3D "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in
> d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
> <$%7B@''.join([multilib_pkg_extend(d,pkg)forpkgind.getVar('DUMMYPROVIDES_=
PACKAGES').split()])%7D>
>
> So that RREPLACES has all the multilib variants included.
>
> However, there is also a different issue, that looks similar, but actuall=
y
> pre-dates this patch, and rpm 4.15 update:
>
> if you do
> IMAGE_INSTALL_append =3D " perl "
>
> (with multilib enabled), a similar error will happen:
>
> Problem: package
> target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with
> perl provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
> conflicts with perl-module-strict provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
> conflicts with perl-module-warnings provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
> conflicts with perl-module-vars provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
> conflicts with perl-module-config provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
> conflicts with perl-module-warnings-register provided by
> perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
> conflicts with /usr/bin/perl provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
> conflicts with libperl.so.5 provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
> obsoletes perl provided by perl-5.30.1-r0.core2_32
>   - cannot install the best candidate for the job
>   - conflicting requests
>
> Inspecting
> /home/alexander/development/poky/build-multilib/tmp/work/qemux86-poky-lin=
ux/core-image-minimal/1.0-r0/sdk/image/opt/poky/3.0/sysroots/core2-32-poky-=
linux/etc/dnf/vars/arch,
> I see:
>
> core2_32:i686:i586:x86:sdk_provides_dummy_target:qemux86:x86_64
>
> Even though sdk_provides_dummy_target should be up-front, rather than in
> the middle (so that it takes priority over other architectures).
>
> I could not figure out a good way to fix this, but I think this issue
> should be addressed first, and then we can fix the lib32/64-perl issue.
>
>
> Thanks for your detailed reply. I'll try to figure a way out.
>
> Regards,
> Kai
>
>
>
> Alex
>
>
> --
> Kai Kang
>
>

--000000000000b8e356059b770c93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I made a couple of patches for this, they seem to fix=
 the issues. Please test:</div><div><a href=3D"http://git.yoctoproject.org/=
cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-updates&amp;id=
=3Da695bd5a8951b640add0cbc3e8171da7f58982b6">http://git.yoctoproject.org/cg=
it.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-updates&amp;id=3Da=
695bd5a8951b640add0cbc3e8171da7f58982b6</a></div><div><a href=3D"http://git=
.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-versio=
n-updates&amp;id=3D6574516432dec7e5a716ff7c17c1bcaea06a3fb7">http://git.yoc=
toproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-up=
dates&amp;id=3D6574516432dec7e5a716ff7c17c1bcaea06a3fb7</a></div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, 3 Jan 2020 at 01:49, Kang Kai &lt;<a href=
=3D"mailto:Kai.Kang@windriver.com">Kai.Kang@windriver.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <div>On 2020/1/3 =E4=B8=8A=E5=8D=882:06, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">On Thu, 2 Jan 2020 at 11:18, Kang Kai &lt;<a href=
=3D"mailto:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com=
</a>&gt;
          wrote:<br>
        </div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2019/11/28 =
=E4=B8=8A=E5=8D=8812:39,
            Alexander Kanavin wrote:<br>
            &gt; rpm 4.15 no longer allows it, which makes sense.<br>
            &gt;<br>
            &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
            <br>
            Hi Alex,<br>
            <br>
            I tried this patch with rpm 4.15 and it fails to run task
            populate_sdk <br>
            when multilib is enabled and lib32-perl is installed.<br>
            <br>
            IMAGE_INSTALL_append =3D &quot; lib32-perl &quot;<br>
          </blockquote>
          <div><br>
          </div>
          <div>I believe this is due to DUMMYPROVIDES_PACKAGES needing
            the same multilib expansion as:<br>
          </div>
          <div><br>
          </div>
          <div>DUMMYPROVIDES +=3D <a href=3D"mailto:$%7B@&#39;&#39;.join([m=
ultilib_pkg_extend(d,pkg)forpkgind.getVar(&#39;DUMMYPROVIDES_PACKAGES&#39;)=
.split()])%7D" target=3D"_blank">&quot;${@&#39; &#39;.join([multilib_pkg_ex=
tend(d,
            pkg) for pkg in
            d.getVar(&#39;DUMMYPROVIDES_PACKAGES&#39;).split()])}&quot;</a>=
</div>
          <div><br>
          </div>
          <div>So that RREPLACES has all the multilib variants included.<br=
>
          </div>
          <div><br>
          </div>
          <div>However, there is also a different issue, that looks
            similar, but actually pre-dates this patch, and rpm 4.15
            update:</div>
          <div><br>
          </div>
          <div>if you do <br>
          </div>
          <div>IMAGE_INSTALL_append =3D &quot; perl &quot;</div>
          <div><br>
          </div>
          <div>(with multilib enabled), a similar error will happen:</div>
          <div><br>
          </div>
          <div>Problem: package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl provided by perl-5.30.1-r0.core2_32<br>
            =C2=A0 - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl-module-strict provided by
            perl-5.30.1-r0.core2_32<br>
            =C2=A0 - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl-module-warnings provided by
            perl-5.30.1-r0.core2_32<br>
            =C2=A0 - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl-module-vars provided by
            perl-5.30.1-r0.core2_32<br>
            =C2=A0 - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl-module-config provided by
            perl-5.30.1-r0.core2_32<br>
            =C2=A0 - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl-module-warnings-register provided by
            perl-5.30.1-r0.core2_32<br>
            =C2=A0 - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with /usr/bin/perl provided by
            perl-5.30.1-r0.core2_32<br>
            =C2=A0 - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with libperl.so.5 provided by
            perl-5.30.1-r0.core2_32<br>
            =C2=A0 - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            obsoletes perl provided by perl-5.30.1-r0.core2_32<br>
            =C2=A0 - cannot install the best candidate for the job<br>
            =C2=A0 - conflicting requests</div>
          <div><br>
          </div>
          <div>Inspecting
/home/alexander/development/poky/build-multilib/tmp/work/qemux86-poky-linux=
/core-image-minimal/1.0-r0/sdk/image/opt/poky/3.0/sysroots/core2-32-poky-li=
nux/etc/dnf/vars/arch,
            I see:</div>
          <div><br>
          </div>
          <div>core2_32:i686:i586:x86:sdk_provides_dummy_target:qemux86:x86=
_64</div>
          <div><br>
          </div>
          <div>Even though sdk_provides_dummy_target should be up-front,
            rather than in the middle (so that it takes priority over
            other architectures).</div>
          <div><br>
          </div>
          <div>I could not figure out a good way to fix this, but I
            think this issue should be addressed first, and then we can
            fix the lib32/64-perl issue.</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks for your detailed reply. I&#39;ll try to figure a way out.<br=
>
    </p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
Kai Kang</pre>
  </div>

</blockquote></div>

--000000000000b8e356059b770c93--
