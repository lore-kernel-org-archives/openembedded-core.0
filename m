Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5166072C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 09:21:48 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id sf7so14584656igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 01:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ry+GXUOEl5dvdb81qAlQAxXVtDhPKujb+tmQqJzt0Ys=;
	b=btKsQg4CuL4LdNYK396BYhCGKeioaVe4bsATdLRcE2wrCuhY3jd2RZhqytA6I8DePT
	jhDgEe47JX8VOEqrAg+kMoWuxd78slDCBv6QKrV9zz7VXabJeXPHpE4h/hkb9sk7eNaY
	ooUn/lMON+QfCJgnBDVyMCSWSubVdS3UpCLLRShsMuO7leb+SmfKTu7ySeJVFE/0YJCS
	pB73OKZMn2XGcJNEEIJb6/uB2Teq7ATdfaeiidcYJjjsaEWexKr32ujDRprC3QUcbg7h
	k+x0pUJpoOj/pVhYIdz/apWyUNgppwb+M4Qbr0PZMWzAbi8SISpUZC3MK9UG4T8+IPd8
	QERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ry+GXUOEl5dvdb81qAlQAxXVtDhPKujb+tmQqJzt0Ys=;
	b=WHS7HbAhHH0SuBLAKoZB2xJJ57E6m1GRu7uww2/RT2XIxq7lXqlFvmjgGmRGORiDoM
	B5RVb9sAHOkqeO8V2j91pjwp16sOOQv3w2/WLYndHkINcGfddHEXns+TinNZY1UZcbtU
	soUUcm/YpFEOVrJ3atGi+1W91miIvV+zNqtnC2SnmTjMDGL2xLOdM93p1diFgkVMicIZ
	5RsYM9uLig0zO2q+V03I8be9ZtFsolnYOQ2meCgcGsTNqZtWlQpweaM3qvnRA6q6/HvO
	kKyi5LLdk7YaGs6sr4Uc7XdBifuiV1dcedpSOXVtluozvBDJBJf1iAp5y0iX+Vr1QS9c
	vJNw==
X-Gm-Message-State: ALoCoQlAkq+RXH3GocWtraxa/rJRJrV9SuOMIAe8qkHBebuMurmGUbD6waeQXgolaPao0+gHRgsLW4tHCjKAMBK9ZJs/wyAuLYVPhgtt46ukNZvLeNFId44=
X-Received: by 10.107.3.154 with SMTP id e26mr6712362ioi.99.1450257709343;
	Wed, 16 Dec 2015 01:21:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 16 Dec 2015 01:21:29 -0800 (PST)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48ABABDD6C@SESTOEX04.enea.se>
References: <567039E1.5000205@linux.intel.com>
	<3230301C09DEF9499B442BBE162C5E48ABABDD6C@SESTOEX04.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Dec 2015 09:21:29 +0000
Message-ID: <CAJTo0LYO9ptJ4PDmR49N-Yw9TbTFGsuyCUBUc4zW2FLk2CNoWQ@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Wed, 16 Dec 2015 09:21:49 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a994c7f0527006fe9

--001a113ec10a994c7f0527006fe9
Content-Type: text/plain; charset=UTF-8

On 16 December 2015 at 09:03, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> We are supposed to have reference to the CVE identifier both in the patch
> file/s
>  and the commit message(e.g.  xxx- CVE-2013-6435.pacth) according to the
> guidelines
> for "Patch name convention and commit message" in the Yocto
> Wiki https://wiki.yoctoproject.org/wiki/Security.
>
> If a patch address multiple CVEs, perhaps we should name the patch:
> Fix-for-multiple-CVEs.patch and list all CVEs in the patch file.
>
> Will this not solve the problem? Do you think there is still need for a
> new tag "CVE"?
>

I'd say a new tag is essential if we want to automate tooling, to reduce
the chance of false-positives from simply searching the patch for something
that looks like a CVE reference.

Ross

--001a113ec10a994c7f0527006fe9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 December 2015 at 09:03, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ce" class=
=3D"a3s" style=3D"overflow:hidden">We are supposed to have reference to the=
 CVE identifier both in the patch file/s<br>
=C2=A0and the commit message(e.g.=C2=A0 xxx- CVE-2013-6435.pacth) according=
 to the guidelines<br>
for &quot;Patch name convention and commit message&quot; in the Yocto<br>
Wiki <a href=3D"https://wiki.yoctoproject.org/wiki/Security" rel=3D"norefer=
rer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Security</a>.<br>
<br>
If a patch address multiple CVEs, perhaps we should name the patch:<br>
Fix-for-multiple-CVEs.patch and list all CVEs in the patch file.<br>
<br>
Will this not solve the problem? Do you think there is still need for a new=
 tag &quot;CVE&quot;?</div></blockquote></div><br>I&#39;d say a new tag is =
essential if we want to automate tooling, to reduce the chance of false-pos=
itives from simply searching the patch for something that looks like a CVE =
reference.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a113ec10a994c7f0527006fe9--
