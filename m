Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id EB4AD6B25A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 10:31:52 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bg4so679585pad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 03:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=WlPZvdPMXscU6QygU3FX6y0iEUVeii2tSFB6hRJqwjA=;
	b=aVK+wfWYYyW38e758RhF09JtyUisj+MTIApmyCIhRmZC+9lNAcFOIQKRVuRWivr7nF
	33sa5k/6tOK3WgbU8sVt4rhVR/zxZpLPjo1PMiMxYj2o9YlRcYUQxIUncO4gMBwN25z6
	IZvLB9dVyJCLGx6boxO4OkHPHJyWWjPy5SqtUOlCFc2zKcxM07qdMVnOvfRK5S5xD8FT
	d45O0Z+EXTXUTHwjIlrPHsfMRpiZUIpVzExmSM1Sk8pQ+T2aaFQHKoOKJT/OhwJaHJo1
	IWwD+z4FL7nOaeCaRx8Ftn4XX1mzfuOyAQAfzRMEHcrBJKUP4BHjjKlUXaZ5VjVKHMoS
	nDIg==
X-Gm-Message-State: ALoCoQlHlqUwxSPxSBP10msozn8WBj8R4MJlaaqkAkq+NnMk0kdbaTE0tqMHXMUFJUqEtsDEqQOI
MIME-Version: 1.0
X-Received: by 10.68.48.166 with SMTP id m6mr6895013pbn.105.1377081113632;
	Wed, 21 Aug 2013 03:31:53 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 21 Aug 2013 03:31:53 -0700 (PDT)
In-Reply-To: <CAJTo0La2UVtZ9rM-HRGY9DGzD9=D4RTZzutHT8Aks4QJ9E=zPw@mail.gmail.com>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
	<CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
	<CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
	<CAOMwXhMOQo3PiAT+3L2M894MDJvLg0eEwunqtQD3TGMwBReXHw@mail.gmail.com>
	<CAJTo0La2UVtZ9rM-HRGY9DGzD9=D4RTZzutHT8Aks4QJ9E=zPw@mail.gmail.com>
Date: Wed, 21 Aug 2013 11:31:53 +0100
X-Google-Sender-Auth: OD6IID9rvZG_VcMCErxYIcX3N6c
Message-ID: <CAOMwXhP6awmXzW2Sm0OMKyrWBFtQRje1CkL3yWtvzdU6fvd1bw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 21 Aug 2013 10:31:53 -0000
Content-Type: multipart/alternative; boundary=bcaec53aedb29af6ab04e472ae53

--bcaec53aedb29af6ab04e472ae53
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 11:26 AM, Burton, Ross <ross.burton@intel.com>wrote:

> On 21 August 2013 11:24, Laszlo Papp <lpapp@kde.org> wrote:
>
>> I am not saying to fix gtk-doc-stub only. I am saying fix the nastiness
>> of using git repositories for released and supposedly stable versions. I do
>> not see why tarball would not be enough for those to work off-hand? That
>> should be the ideal architecture IMHO.
>>
>
> Two good reasons to allow git repositories as a source:
>
> 1) Many projects don't make tarball releases.
>

That does not mean bitbake cannot generate tarball out of the git
repository. In fact, it is relatively simple. ;-)


> 2) It's incredibly useful to be able to build from git snapshots for
> development/testing purposes.
>

I was explicitly mentioning stable and official released variants.

What you're asking for is the inability to use git repositories in SRC_URI,
> which won't happen.
>

No, that is not what I am asking.

Here you can find the feature request:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5035

Cheers, L.

--bcaec53aedb29af6ab04e472ae53
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Aug 21, 2013 at 11:26 AM, Burton, Ross <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"im">On 21 August 2013 11:24=
, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"mailto:lpapp@kde.org" target=
=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<br>
</div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D"i=
m"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex">


<div dir=3D"ltr">I am not saying to fix gtk-doc-stub only. I am saying fix =
the nastiness of using git repositories for released and supposedly stable =
versions. I do not see why tarball would not be enough for those to work of=
f-hand? That should be the ideal architecture IMHO.</div>


</blockquote><div>=A0</div></div><div>Two good reasons to allow git reposit=
ories as a source:</div><div><br></div><div>1) Many projects don&#39;t make=
 tarball releases.</div></div></div></div></blockquote><div><br></div><div>
That does not mean bitbake cannot generate tarball out of the git repositor=
y. In fact, it is relatively simple. ;-)</div><div>=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex=
">
<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
>2) It&#39;s incredibly useful to be able to build from git snapshots for d=
evelopment/testing purposes.</div></div></div></div></blockquote><div><br><=
/div>
<div>I was explicitly mentioning stable and official released variants.</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex">
<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
>What you&#39;re asking for is the inability to use git repositories in SRC=
_URI, which won&#39;t happen.<br></div></div></div></div></blockquote><div>=
<br>
</div><div>No, that is not what I am asking.</div><div><br></div><div>Here =
you can find the feature request:=A0<a href=3D"https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D5035">https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D5035</a></div>
<div><br></div><div>Cheers, L.</div></div></div></div>

--bcaec53aedb29af6ab04e472ae53--
