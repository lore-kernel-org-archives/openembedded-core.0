Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id A7D3C7199A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:54:24 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 87so8974214ior.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 02:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JsX+zLYNMHDKctBvPpIUMAfzJsJVgTATT5bxvdvq20U=;
	b=2EQk2Q9uOp3z5zCnOUl8yX3QIcvAxghptVFeP3U+9x6LVsKithGdVnVkiBcloU19WE
	x29m9UpfLJ6Ah1nC3W1qTnWOHdVes/IlUOHNk5/Yvzw6gEalfIqCRkO4GAUGQHgnAteQ
	m21uQUcvgbx5zmxDgODp2XKMTGuJL3bXDg3hiXaQqPVTzL4QjgIIuMAIfVXrOA66TEDJ
	VY7MOuBGJdMtHDeTtZ8iJB5pFLAxwrZp95f9lWFSOKIy+cOEl7ESg3fU6WBRP0SWDwQ8
	qzJvcsPGTg/mfQ6IqzTTeLjzJQxFQPMHXMszMhtMj3d4TtprQLMXFVQHCMb+3SBvrpwt
	J6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JsX+zLYNMHDKctBvPpIUMAfzJsJVgTATT5bxvdvq20U=;
	b=IHjuuoTjHGdF+G9adMkdr0vaGNFLHB1laBoK8zq84F2PBaQdvZO+tmmGzG9yI7ODnn
	WWXJe1rNgo4UIkoYfUXaEDRntaeL7yQyezNflc9MF62rKsDCxCfODsq0N4jIr3ANg/fU
	5SbV5Gb0Jlj7PLgs2Jl67sFLpBkyImXqEUC2if2hKAJonIpa+nmGte13WwatiCijYXgk
	oGHBMxrFIEJXQe9HT/TCMS8QJykFFJAhrLKYs2Gq4gWhD8pAkkrK4jUz1sPXrHDsi87m
	yxfWpl5H5uMzjP3LwvAIV/LCI24TbQQXtNCe+jaNitVJJXhTPMZXjWrIQgzOLXlDSblm
	6RVA==
X-Gm-Message-State: AKGB3mIhhElWN01xOsCnkZNUkAcpTFwbEotuylKRe0LY2PrlW8bZX1JZ
	9ow4zNjc+dO7JEPFVkW7RWhouWXra5P7y19Q6gKjpw==
X-Google-Smtp-Source: ACJfBouvP2uOB+BKF0qrp/8DsnGQQDvsJOb2ey9bimmYcCEfVR8M0MRUYzPnXxzB25bW6uV2z3BnvmlkC6N1e+YVGrQ=
X-Received: by 10.107.32.18 with SMTP id g18mr3232426iog.227.1513680865695;
	Tue, 19 Dec 2017 02:54:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Tue, 19 Dec 2017 02:54:05 -0800 (PST)
In-Reply-To: <e900fa4c-708c-a59c-8638-ba26ec754272@gmail.com>
References: <cover.1513527416.git.akuster@mvista.com>
	<1f6d1fa417f9a7128168b0ad934f4ae75a8198e3.1513527416.git.akuster@mvista.com>
	<CAJTo0Lb6JfFMJAH7_1Sph-VwhJ_6aD=-YXtWBfBSH8GWMT8Hcw@mail.gmail.com>
	<e900fa4c-708c-a59c-8638-ba26ec754272@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Dec 2017 10:54:05 +0000
Message-ID: <CAJTo0La7=P+8XhneqCmkQgdJuxHf+n6V_4RKNSkUoY4iOho60g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] bind: Update to 9.11.2
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
X-List-Received-Date: Tue, 19 Dec 2017 10:54:24 -0000
Content-Type: multipart/alternative; boundary="001a1141b4984dae530560af4a25"

--001a1141b4984dae530560af4a25
Content-Type: text/plain; charset="UTF-8"

Related, the musl autobuilder failed like this:

ERROR: bind-9.11.2-r0 do_package_qa: QA Issue: /usr/sbin/dnssec-keymgr
contained in package bind requires
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/hosttools/python3,
but no providers found in RDEPENDS_bind? [file-rdeps]

I suspect the python3 check is looking at the host?

Ross

On 18 December 2017 at 17:11, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 12/18/2017 07:05 AM, Burton, Ross wrote:
>
> On 17 December 2017 at 16:34, Armin Kuster <akuster808@gmail.com> wrote:
>
>> From: Armin Kuster <akuster@mvista.com>
>>
>> New License (mpl-2.0) and LICESE file.
>>
>> New features in bind 9.11
>> see: https://www.isc.org/wp-content/uploads/2016/09/BIND9.11NewFe
>> atures.pdf
>>
>> add zlib PACKAGECONF
>>
>
> packages/corei7-64-poky-linux/bind/bind-doc: FILELIST: removed
> "/usr/share/man/man8/dnssec-checkds.8 /usr/share/man/man8/dnssec-coverage.8",
> added "/usr/share/man/man1/mdig.1"
>
> I see you're removing those binaries from a sed, so have they been removed
> entirely?  Are they somewhere else, or just disabled?
>
>
>  hmm, let me double check. I know there where no longer there.
>
>
> packages/corei7-64-poky-linux/bind/bind: FILELIST: removed
> "/usr/lib/python3.5/site-packages/isc/__pycache__/dnskey.cpython-35.pyc
> /usr/lib/python3.5/site-packages/isc/__pycache__/coverage.cpython-35.pyc
> /usr/lib/python3.5/site-packages/isc/eventlist.py /usr/lib/python3.5/site-packages/isc/keyevent.py
> /usr/lib/python3.5/site-packages/isc-1.0-py3.5.egg-info
> /usr/lib/python3.5/site-packages/isc/__pycache__/eventlist.cpython-35.pyc
> /usr/lib/python3.5/site-packages/isc/keydict.py /usr/lib/python3.5/site-
> packages/isc/__pycache__/keyzone.cpython-35.pyc /usr/lib/python3.5/site-
> packages/isc/__pycache__/keydict.cpython-35.pyc /usr/lib/python3.5/site-
> packages/isc/__pycache__/checkds.cpython-35.pyc /usr/lib/python3.5/site-packages/isc/checkds.py
> /usr/sbin/dnssec-coverage /usr/lib/python3.5/site-packages/isc/keyzone.py
> /usr/lib/python3.5/site-packages/isc/__init__.py /usr/lib/python3.5/site-
> packages/isc/__pycache__/utils.cpython-35.pyc /usr/sbin/dnssec-checkds
> /usr/lib/python3.5/site-packages/isc/__pycache__/keyevent.cpython-35.pyc
> /usr/lib/python3.5/site-packages/isc/__pycache__/__init__.cpython-35.pyc
> /usr/lib/python3.5/site-packages/isc/dnskey.py /usr/lib/python3.5/site-packages/isc/coverage.py
> /usr/lib/python3.5/site-packages/isc/utils.py", added "/usr/bin/mdig"
>
> All the Python bindings have disappeared, is this intentional?
>
>
> hmm.. let me check.
>
> - armin
>
>
> Ross
>
>
>

--001a1141b4984dae530560af4a25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Related, the musl autobuilder failed like this:<br><br>ERR=
OR: bind-9.11.2-r0 do_package_qa: QA Issue: /usr/sbin/dnssec-keymgr contain=
ed in package bind requires /home/pokybuild/yocto-autobuilder/yocto-worker/=
nightly-musl-x86-64/build/build/tmp/hosttools/python3, but no providers fou=
nd in RDEPENDS_bind? [file-rdeps]<div><br></div><div>I suspect the python3 =
check is looking at the host?</div><div><br></div><div>Ross</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 18 December 2017 a=
t 17:11, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmai=
l.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <p><br>
    </p>
    <br>
    <div class=3D"m_-511155010141567160moz-cite-prefix">On 12/18/2017 07:05=
 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">On 17 December 2017 at 16:34, Armin Kuster <span dir=
=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akus=
ter808@gmail.com</a>&gt;</span>
        wrote:<br>
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">From:
              Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" target=
=3D"_blank">akuster@mvista.com</a>&gt;<br>
              <br>
              New License (mpl-2.0) and LICESE file.<br>
              <br>
              New features in bind 9.11<br>
              see: <a href=3D"https://www.isc.org/wp-content/uploads/2016/0=
9/BIND9.11NewFeatures.pdf" rel=3D"noreferrer" target=3D"_blank">https://www=
.isc.org/wp-content<wbr>/uploads/2016/09/BIND9.11NewFe<wbr>atures.pdf</a><b=
r>
              <br>
              add zlib PACKAGECONF<br>
            </blockquote>
            <div><br>
            </div>
            <div>packages/corei7-64-poky-linux/<wbr>bind/bind-doc: FILELIST=
:
              removed &quot;/usr/share/man/man8/dnssec-<wbr>checkds.8
              /usr/share/man/man8/dnssec-<wbr>coverage.8&quot;, added
              &quot;/usr/share/man/man1/mdig.1&quot;</div>
            <div><br>
            </div>
            <div>I see you&#39;re removing those binaries from a sed, so
              have they been removed entirely?=C2=A0 Are they somewhere els=
e,
              or just disabled?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    =C2=A0hmm, let me double check. I know there where no longer there.<spa=
n class=3D""><br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><br>
            </div>
            <div>packages/corei7-64-poky-linux/<wbr>bind/bind: FILELIST:
              removed
              &quot;/usr/lib/python3.5/site-<wbr>packages/isc/__pycache__/<=
wbr>dnskey.cpython-35.pyc
/usr/lib/python3.5/site-<wbr>packages/isc/__pycache__/<wbr>coverage.cpython=
-35.pyc
              /usr/lib/python3.5/site-<wbr>packages/isc/eventlist.py
              /usr/lib/python3.5/site-<wbr>packages/isc/keyevent.py
              /usr/lib/python3.5/site-<wbr>packages/isc-1.0-py3.5.egg-<wbr>=
info
/usr/lib/python3.5/site-<wbr>packages/isc/__pycache__/<wbr>eventlist.cpytho=
n-35.pyc
              /usr/lib/python3.5/site-<wbr>packages/isc/keydict.py
              /usr/lib/python3.5/site-<wbr>packages/isc/__pycache__/<wbr>ke=
yzone.cpython-35.pyc
/usr/lib/python3.5/site-<wbr>packages/isc/__pycache__/<wbr>keydict.cpython-=
35.pyc
/usr/lib/python3.5/site-<wbr>packages/isc/__pycache__/<wbr>checkds.cpython-=
35.pyc
              /usr/lib/python3.5/site-<wbr>packages/isc/checkds.py
              /usr/sbin/dnssec-coverage
              /usr/lib/python3.5/site-<wbr>packages/isc/keyzone.py
              /usr/lib/python3.5/site-<wbr>packages/isc/__init__.py
              /usr/lib/python3.5/site-<wbr>packages/isc/__pycache__/<wbr>ut=
ils.cpython-35.pyc
              /usr/sbin/dnssec-checkds
              /usr/lib/python3.5/site-<wbr>packages/isc/__pycache__/<wbr>ke=
yevent.cpython-35.pyc
/usr/lib/python3.5/site-<wbr>packages/isc/__pycache__/__<wbr>init__.cpython=
-35.pyc
              /usr/lib/python3.5/site-<wbr>packages/isc/dnskey.py
              /usr/lib/python3.5/site-<wbr>packages/isc/coverage.py
              /usr/lib/python3.5/site-<wbr>packages/isc/utils.py&quot;, add=
ed
              &quot;/usr/bin/mdig&quot;</div>
            <div><br>
            </div>
            <div>All the Python bindings have disappeared, is this
              intentional?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    hmm.. let me check. <br>
    <br>
    - armin<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><br>
            </div>
            <div>Ross=C2=A0</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div><br></div>

--001a1141b4984dae530560af4a25--
