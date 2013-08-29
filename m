Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3474A6BEC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 17:15:10 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id x10so721954pdj.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 10:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nJZM8ek3ThTXL/g/HCz13fCkLtwqeRJnxG7e7OK9IL8=;
	b=YoLg0uI+VbxbbNVQ0/OTeaPixvBXl3zFtMc1b+7LacWxowGwWQ6KFm/cegrjwwmC1d
	sod3gPVXBPK2RSTbc7RRN0u1R1XMFU8m885omwgEXqnQW2rkSUaR96bkO3WrXiBF1RFM
	UFIQncsZE1MT4bSSmdMRVWFV2opgxZ4e0CKEj/4PfKCwd89NhnT06q5d0VeeGtzpaIN7
	khXfl3+TVyulv93thHvAF/xahqVi+XaGDftn87mpNI/a4BGzdsDZU22FfO7/ZOhVpBlM
	qZkDG/sBY01X/aoH5B5FQAMk8rtmDlJjQ4bixb7TZfucRnJzO8VZAmKAcq8Swm9Lg7YA
	VaHQ==
X-Gm-Message-State: ALoCoQmsK1vcrMiAHHZ0v/JFHnQDMiyBNn4bGMvLESFgWRp/b9fPBoXcsBlDyyrmXhoX4T2tFoaQ
MIME-Version: 1.0
X-Received: by 10.66.228.234 with SMTP id sl10mr5605685pac.149.1377796510954; 
	Thu, 29 Aug 2013 10:15:10 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Thu, 29 Aug 2013 10:15:10 -0700 (PDT)
In-Reply-To: <CAOMwXhM=gnOZzk70yB6=2XdJFKtC6bZoNNHZDb2zd=bhma0Lhw@mail.gmail.com>
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
Date: Thu, 29 Aug 2013 18:15:10 +0100
X-Google-Sender-Auth: m89yjlt6YHUzfGpW1ADdmWoy7us
Message-ID: <CAOMwXhNJdsYHaeKT34GEFXBYX5P75MdRDAs5YHUo-H08jBu+1A@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Aug 2013 17:15:11 -0000
Content-Type: multipart/alternative; boundary=047d7b15a1659bcf9504e5193f4d

--047d7b15a1659bcf9504e5193f4d
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 5:19 PM, Laszlo Papp <lpapp@kde.org> wrote:

> On Wed, Aug 21, 2013 at 3:59 PM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> Regardless of whether you use mirrors or not, if you set
>>  BB_GENERATE_MIRROR_TARBALLS it will create tarballs in DL_DIR of the git
>> repositories. You can then stop trying to check in the /git/  and /git2/
>> subdirectories of DL_DIR and some of your problems will likely go away.
>>
>
> Actually, I have just spent one hour with a full rebuild, but putting this
> variable into the local.conf did not generate any different downloads
> folder. Any other idea how to get rid of the git hassle in here without a
> major infrastructure refactor?
>

What I executed was:  "git rm -r ./downloads/git2 && git commit
./downloads/git2". Even after that, it is broken. :(

--047d7b15a1659bcf9504e5193f4d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 29, 2013 at 5:19 PM, Laszlo Papp <span dir=3D"=
ltr">&lt;<a href=3D"mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</=
a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex">
<div dir=3D"ltr"><div class=3D"im">On Wed, Aug 21, 2013 at 3:59 PM, Richard=
 Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span=
> wrote:<br>
</div><div class=3D"gmail_extra">
<div class=3D"gmail_quote"><div class=3D"im"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div><div><sp=
an style=3D"color:rgb(34,34,34)">Regardless of whether you use mirrors or n=
ot, if you set</span><br>

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
</div></div></div></blockquote><div><br></div><div>What I executed was: =A0=
&quot;git rm -r ./downloads/git2 &amp;&amp; git commit ./downloads/git2&quo=
t;. Even after that, it is broken. :(</div></div><br></div></div>

--047d7b15a1659bcf9504e5193f4d--
