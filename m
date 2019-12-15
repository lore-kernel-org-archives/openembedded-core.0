Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
	[209.85.217.48])
	by mail.openembedded.org (Postfix) with ESMTP id 410B77F6B5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 18:10:44 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id m5so2749976vsj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 10:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xskeiWnyjBN2QzR4mjMP+pknr/S47lr6ab8AhXx/tN0=;
	b=Ic1jX5E30x6kuVMuCu0UN2SOJnLM2+UoVgVz1+vZ2Y8pQt/Wr9/6vt7qEiQ0W22WLV
	1rWMC/P8igd4AoMJG8z/67fa1Le9na57sUZPOBgXfwV8DneCm44H+X2w6EqM6ZjNIwTV
	xJN001mJePIe4xTaz+76y/ZCQkUwx/3ffyuAyXk8ENDFA/cLHuQVYP+Tt1bjLa1AnPb6
	mmtuV/E6zKDDEE9ZYEQ07YqsEGRQ+KU/r1sySQdPi7gLnClMzISWemvok/9csP4tcEWq
	M8Rs8sYPD+0J3cgCh+OxYfbjsUAMqxavOQMZHqAZO/i3cuvqQ74ukynaFIxLy5m0VGKV
	yEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xskeiWnyjBN2QzR4mjMP+pknr/S47lr6ab8AhXx/tN0=;
	b=o5ldIHsVkChKQgWloKyqRumECSxFTEuVlrY6/MC0FvRMbVUfrK2gG9ov1WQGK1jDrk
	oZjBcHYxYA/qVhd0WzHyvHJxnDuKV8QztGxYu4l0oO0hFqo3SE97C/oTWSsCYlNUvrEG
	doGT07W3RkKYX5ycPxbVW40Foh1nhdM7zWwsfcakqWDsXBxNT0o0nXbJViCh13rkxVLw
	FJXH5A1HK1GKwovhXxquts4fDfjTUH7c+S9dqfVQOKP5LTW7UXnpMmBDr3902CK5D9M1
	HCIPLdac7jyOeyWLOsjSkolovMB5nAIol2HwHT3f01vhutdlTx3FPslJqghtBu06NTm9
	dbUQ==
X-Gm-Message-State: APjAAAUK8knfaO+f3EZnN51CikZXqVAUTRZfUPcuprLLMLgO7AL7Ufy6
	+FXOX0ceP01O4q4I/BBd51lw2C23GhYLLCoTe1U=
X-Google-Smtp-Source: APXvYqw1JGuiru1KFMN6KPq+ozuK+tjPCgJiwtRTO/m0yCTFfsH1SVPypYeKL5ADyOV3MWiB6GnGdEAS9emg7qwg7xU=
X-Received: by 2002:a05:6102:21d8:: with SMTP id
	r24mr19243039vsg.83.1576433445094; 
	Sun, 15 Dec 2019 10:10:45 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-7-alex.kanavin@gmail.com>
	<CAMKF1spXie5SDtsJj6R=6hAUjYo8kBTmyj+SfW4rYU+1cWUtig@mail.gmail.com>
	<CANNYZj_k4NmmSAp+r80Ss+jgsd22hYcxRSySqYn7Yby8PCrDJw@mail.gmail.com>
	<CAMKF1sof2JwFMX=kHVaup_-LA3UjsqrU5iGXZymR5TOzGik1ZA@mail.gmail.com>
	<CANNYZj_ZaJ-prapQf6adS6Adp4CnF2X4TG3HPDonivPj_QAnrA@mail.gmail.com>
	<CAMKF1sp6a-hOuGazGtBj0mZQj9DpaM3iiC1Sbvw7Ah49vLLx9g@mail.gmail.com>
	<823eb2bc-4c55-1679-011d-53733df3b80f@mailbox.org>
In-Reply-To: <823eb2bc-4c55-1679-011d-53733df3b80f@mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Dec 2019 19:10:33 +0100
Message-ID: <CANNYZj8ddwZznSYvf6h13OXN6oZY2qKZgKknOrFPb1Xaw776PQ@mail.gmail.com>
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/30] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Sun, 15 Dec 2019 18:10:45 -0000
Content-Type: multipart/alternative; boundary="00000000000081c9730599c20353"

--00000000000081c9730599c20353
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 15 Dec 2019 at 18:52, Carlos Rafael Giani <crg7475@mailbox.org>
wrote:

> Is this related to an issue I mentioned in my RFC?
>
> > gstreamer1.0-python_1.16.1.bb currently has a problem in that the
> gst-python code tries to load /usr/lib/libpython3.7m.so. But, in a
> regular installation, only /usr/lib/libpython3.7m.so.1.0 would be availal=
e.
> It is possible to adjust the libpython path & name during the build. But =
-
> what would it be adjusted to? How would the recipe know that
> "/usr/lib/libpython3.7m.so.1.0" is the correct choice? Or perhaps would i=
t
> make sense to add the /usr/lib/libpython3.7m.so symlink to the regular
> (as in: non-dev) Python package?
>

The way I read the code [1], it only tries to do this if it's not
explicitly linked with libpython, and at least on my host, it is:

ak@linux-f9zs:~/development/poky> ldd /usr/lib64/gstreamer-1.0/
libgstpython.cpython-37m-x86_64-linux-gnu.so
        linux-vdso.so.1 (0x00007fffe931a000)
        libpython3.7m.so.1.0 =3D> /usr/lib64/libpython3.7m.so.1.0
(0x00007fbb718e7000)
        libgstreamer-1.0.so.0 =3D> /usr/lib64/libgstreamer-1.0.so.0
(0x00007fbb717a3000)
        libgobject-2.0.so.0 =3D> /usr/lib64/libgobject-2.0.so.0
(0x00007fbb71747000)
...

The use case is rather marginal I'd say: writing gstreamer plugins in
python. The *other* thing gst-python does, accessing gstreamer API from
python scripts, is not affected.

[1]
https://gitlab.freedesktop.org/gstreamer/gst-python/blob/1.16.2/plugin/gstp=
ythonplugin.c#L227

Alex



> On 15.12.19 18:32, Khem Raj wrote:
>
>
>
> On Sun, Dec 15, 2019 at 9:12 AM Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
>
>> On Sun, 15 Dec 2019 at 18:06, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> This is expected; the patch should be merged together with 3.8 upgrade.
>>>
>>> I don=E2=80=99t think this patch is right though since this patch is cr=
eating
>>> py3.8 dependency if you want to upstream something that should work wit=
h
>>> all py3 I think
>>>
>>
>> It's being discussed in the upstream submission ticket, and will be
>> resolved; we can take the 3.8-specific fix meanwhile.
>>
>
> For better processing this series should be in three parts
>
> 1 Python 3.8 updates
> 2 gettext updates
> 3 rest of them
>
> I have filtered it into roughly these and currently staged in yoe/mut jus=
t
> the third part which i think can be applied with out much problem
>
> For 1 and 2 there are breakages for many packages
> And it would be better to identify them and let community know of and see=
k
> help
>
>
>> Alex
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000081c9730599c20353
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 15 Dec 2019 at 18:52, Carlos Rafa=
el Giani &lt;<a href=3D"mailto:crg7475@mailbox.org">crg7475@mailbox.org</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Is this related to an issue I mentioned in my RFC?</p>
    <p>&gt; <a href=3D"http://gstreamer1.0-python_1.16.1.bb" target=3D"_bla=
nk">gstreamer1.0-python_1.16.1.bb</a> currently has a problem in
      that the gst-python code tries to load /usr/lib/<a href=3D"http://lib=
python3.7m.so" target=3D"_blank">libpython3.7m.so</a>.
      But, in a regular installation, only /usr/lib/libpython3.7m.so.1.0
      would be availale. It is possible to adjust the libpython path
      &amp; name during the build. But - what would it be adjusted to?
      How would the recipe know that &quot;/usr/lib/libpython3.7m.so.1.0&qu=
ot; is
      the correct choice? Or perhaps would it make sense to add the
      /usr/lib/<a href=3D"http://libpython3.7m.so" target=3D"_blank">libpyt=
hon3.7m.so</a> symlink to the regular (as in: non-dev)
      Python package?</p>
    </div></blockquote><div><br></div><div>The way I read the code [1], it =
only tries to do this if it&#39;s not explicitly linked with libpython, and=
 at least on my host, it is:</div><div><br></div><div>ak@linux-f9zs:~/devel=
opment/poky&gt; ldd /usr/lib64/gstreamer-1.0/<a href=3D"http://libgstpython=
.cpython-37m-x86_64-linux-gnu.so">libgstpython.cpython-37m-x86_64-linux-gnu=
.so</a><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-vdso.so.1 (0x00007fffe931a000)=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 libpython3.7m.so.1.0 =3D&gt; /usr/lib64/lib=
python3.7m.so.1.0 (0x00007fbb718e7000)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgs=
treamer-1.0.so.0 =3D&gt; /usr/lib64/libgstreamer-1.0.so.0 (0x00007fbb717a30=
00)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgobject-2.0.so.0 =3D&gt; /usr/lib64/l=
ibgobject-2.0.so.0 (0x00007fbb71747000)</div><div>...</div><div><br></div><=
div>The use case is rather marginal I&#39;d say: writing gstreamer plugins =
in python. The *other* thing gst-python does, accessing gstreamer API from =
python scripts, is not affected.<br></div><div></div><div><br></div><div>[1=
] <a href=3D"https://gitlab.freedesktop.org/gstreamer/gst-python/blob/1.16.=
2/plugin/gstpythonplugin.c#L227">https://gitlab.freedesktop.org/gstreamer/g=
st-python/blob/1.16.2/plugin/gstpythonplugin.c#L227</a></div><div><br></div=
><div>Alex<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div>
    <div>On 15.12.19 18:32, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 15, 2019 at 9:1=
2
            AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div dir=3D"ltr">On Sun, 15 Dec 2019 at 18:06, Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt;
                wrote:<br>
              </div>
              <div class=3D"gmail_quote">
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div dir=3D"ltr">
                    <div>This is expected; the patch should be merged
                      together with 3.8 upgrade.</div>
                  </div>
                  <div>
                    <div class=3D"gmail_quote">
                      <div dir=3D"auto"><br>
                      </div>
                      <div dir=3D"auto">I don=E2=80=99t think this patch is=
 right
                        though since this patch is creating py3.8
                        dependency if you want to upstream something
                        that should work with all py3 I think <br>
                      </div>
                    </div>
                  </div>
                </blockquote>
                <div><br>
                </div>
                <div>It&#39;s being discussed in the upstream submission
                  ticket, and will be resolved; we can take the
                  3.8-specific fix meanwhile.</div>
              </div>
            </div>
          </blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">For better processing this series should be in
            three parts=C2=A0</div>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">1 Python 3.8 updates</div>
          <div dir=3D"auto">2 gettext updates</div>
          <div dir=3D"auto">3 rest of them</div>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">I have filtered it into roughly these and
            currently staged in yoe/mut just the third part which i
            think can be applied with out much problem</div>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">For 1 and 2 there are breakages for many
            packages</div>
          <div dir=3D"auto">And it would be better to identify them and
            let community know of and seek help</div>
          <div dir=3D"auto"><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div class=3D"gmail_quote">
                <div><br>
                </div>
                <div>Alex<br>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset></fieldset>
    </blockquote>
  </div>

-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000081c9730599c20353--
