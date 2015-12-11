Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8D2536FFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 21:23:42 +0000 (UTC)
Received: by ioc74 with SMTP id 74so139930143ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 13:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7/XNYgRpmBVDH0WfBxlaMd+YghCTv+vFQFu3VrPhtHY=;
	b=IXmbpK9HCB02TpdzAeqPEYyACW0p9gOzufhStmve+79K0B6y/Rr06mnRkkYYJkaxH7
	4duY961mzLIWiGvq+F8nKIU/gn6cRA44evqqJRtIFZcUAMd+G8IiillZhqkIwM916hi/
	RkIN8YfiD+fmXloYcBKM+hbFxPm1LDQkibm8FskqLj3k+JPJ8vH2QsbdnpfnpWRf3IT4
	d6DuARuXA9Ed495ihB+3uI5tLdo1uuH6HvCj465zKTqD48Xtt+xq2P1Ep7afmVIZW66Z
	OQN5LX3ZlFMjkNOc0EoZXkjQt52Kg56uN+QTnlbuRjsA4NqP33B2k+2Z1IwEB0DwNVrU
	yZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7/XNYgRpmBVDH0WfBxlaMd+YghCTv+vFQFu3VrPhtHY=;
	b=iF0LszbOrxsAFoh3F5ZJNKGQAL3QHoxr0MDxy5aw+g29hD/uGSk6ELzqtdCVdhINmT
	Xg2uHtsYJTaReINZXiWgn21Bz+IUVgnCTFjU6Z3ngvH/1B17uL7HXbQky4poabZyTDFP
	3Cihx+UDs+XjinDL061fF6puZpI2UR5//me355fow4rL416zmlaExG03TDNriBBLyRtS
	VtOXAQCqA76W9yzykcXLDiHFG9LWO7DDOW2v2QilJHIzLJq10AGtQNeR4LqhX7EQnJlb
	LS+Y1YpFo/sdvWFSe+aZHAE9+GldUGEhF8R5hKrlS0qwFPOEgs/z8vIltB9Ef3WMC2GD
	KiGg==
X-Gm-Message-State: ALoCoQkyqSVoWpthEE4ERc5QHflM5gg0G/oSy5AimDNCWGrC6FdJUZQTTKEBcR3hRYWb3uT/5bkJhiw6A0oQ7m4gixuXPhRMbezqcivvWyMPZSu7eVWFNvo=
X-Received: by 10.107.130.155 with SMTP id m27mr20902931ioi.133.1449869023462; 
	Fri, 11 Dec 2015 13:23:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 11 Dec 2015 13:23:24 -0800 (PST)
In-Reply-To: <CAJTo0LbpvDC-NZrKkAmVMan17-DNLptSKUhagrPzA3LcundFNQ@mail.gmail.com>
References: <cover.1449693306.git.randy.e.witt@linux.intel.com>
	<49ad2cee12cc6fdf471ea3e600afb7949138beb6.1449693306.git.randy.e.witt@linux.intel.com>
	<CAJTo0LbpvDC-NZrKkAmVMan17-DNLptSKUhagrPzA3LcundFNQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Dec 2015 21:23:24 +0000
Message-ID: <CAJTo0LZP-uX3vP3WcJqu+SK4XKPD1bY1VGuy8vnv592Tv+fD8w@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][master][PATCH 1/1] uninative.bbclass: Choose the correct loader based on BUILD_ARCH
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
X-List-Received-Date: Fri, 11 Dec 2015 21:23:46 -0000
Content-Type: multipart/alternative; boundary=001a113ecd941d719f0526a5f089

--001a113ecd941d719f0526a5f089
Content-Type: text/plain; charset=UTF-8

On 10 December 2015 at 22:01, Burton, Ross <ross.burton@intel.com> wrote:

> Would it be neater, and more flexible when other arches are different
> (specifically I'm thinking of aarch64 here) to do:
>
> UNINATIVE_LOADER = "${STAGING_DIR_NATIVE}/lib/ld-linux.so.2"
> UNINATIVE_LOADER_x86-64 = "'${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2"
>
> At least I think that overload is correct...
>

Of course BUILD_ARCH != TARGET_ARCH so this is wrong.

Ross

--001a113ecd941d719f0526a5f089
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2015 at 22:01, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_ext=
ra">Would it be neater, and more flexible when other arches are different (=
specifically I&#39;m thinking of aarch64 here) to do:</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">UNINATIVE_LOADER =3D &quot;=
${STAGING_DIR_NATIVE}/lib/ld-linux.so.2&quot;</div><div class=3D"gmail_extr=
a">UNINATIVE_LOADER_x86-64 =3D &quot;&#39;${STAGING_DIR_NATIVE}/lib/ld-linu=
x-x86-64.so.2&quot;</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">At least I think that overload is correct...</div></blockquot=
e></div><br>Of course BUILD_ARCH !=3D TARGET_ARCH so this is wrong.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a113ecd941d719f0526a5f089--
