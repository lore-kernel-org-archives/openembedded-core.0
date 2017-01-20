Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 24F9971D9A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:42:44 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id l19so86996767ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PWwwjN/3zR4zdOv1x7/SA+msZXYk4nM1rnZmar2bbdI=;
	b=yg7uKfYGRQp6dkWJmtTRLH45rnLFSW0TwC/O1x712ST/xONrt/er+5DteczcaFzdz2
	U/Nr0TTTVILLkHGhDHcdJLw9ptq8OZYH9nhwaKTsmVUGbCJo9FyA6Y8YmDpbKfWqZtrA
	Mor6at2EkfFb8VChNxvVph3CgBz6iu4rP4t1ujQ614oUar4q7Zhd/sz/wbfiP5pLoZDB
	e64dTFAZlTPlDU2Aq04Bq1C0d61103Yns9HFJhyS3qj+pywouvVLSts8xjn8JNmPjzhQ
	d0E/3goz57B6cWBBGNTonfwhThYMgy2pvD6gceJVyohMhI69tW2uVT0oM90tzCKfGtjE
	w0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PWwwjN/3zR4zdOv1x7/SA+msZXYk4nM1rnZmar2bbdI=;
	b=uOH8IGHNXlGRX+phDooFDPO4Bzew0+ww0+ybQ55+uyOe2Bv1NVYzH39+LdMbtRM26y
	A94kysjNC9L4fUC+cHHEIABn9g4L6Uwu+yPk38Q2N8XSeMabNAY5ULoX7eKuRXcQszAU
	PWoMmAFzwsbLE1+RgUkhvyGGf9DUeuPnv1rBF5Igp1Bf8YrgrH7o5ypf8YSZzLsOZ5+b
	pkRPeUFt2V7ycHlDHm/7HWtUmkztobPfHVIwhCl8sGum11OVLw/wjvCG55fCrTfAJlVd
	8Pkyip0Ys5SQpuBnzIhOjT/mhtiN8E4FN6ICV/FihVDsyS28xvGivrWjUAH+lnr005Ir
	5/Qw==
X-Gm-Message-State: AIkVDXI9EZVb0Q/5ltC8R/tnvTaeg+7m+P+RgzqLDEXceA5N+sIFzOzBYL41EkQadNP4TBlVQTF4zlDhZPylkQk9
X-Received: by 10.55.16.11 with SMTP id a11mr13113610qkh.3.1484919764983; Fri,
	20 Jan 2017 05:42:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 20 Jan 2017 05:42:24 -0800 (PST)
In-Reply-To: <CALbNGRS1L24_fJK3D14vacfRAKcxUfftR4BA8G8hxzHhuYgrFA@mail.gmail.com>
References: <1484505711-6341-1-git-send-email-juro.bystricky@intel.com>
	<CALbNGRS1L24_fJK3D14vacfRAKcxUfftR4BA8G8hxzHhuYgrFA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Jan 2017 13:42:24 +0000
Message-ID: <CAJTo0LZ3kywd2HR7bNTburb-7Ef9z0kW+NCfXRJEdsb98taBgg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: require conf/multiconfig/${BB_CURRENT_MC}.conf
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
X-List-Received-Date: Fri, 20 Jan 2017 13:42:45 -0000
Content-Type: multipart/alternative; boundary=001a11475cbc1cb37b054686d3f6

--001a11475cbc1cb37b054686d3f6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20 January 2017 at 13:36, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> | ERROR: ParseError at
> /home/superandy/oe-core/sources/openembedded-core/
> meta/conf/bitbake.conf:704:
> Could not include required file conf/multiconfig/${BB_CURRENT_MC}.conf
>

The patch creates the file that it requires:

 meta/conf/bitbake.conf             | 2 +-
 meta/conf/multiconfig/default.conf | 0

Did it really look for /multiconfig/default.conf or is the fact that the
path is not expanded the problem here?  oe-core master needs bitbake from
git, which has changed the behaviour for getVar() (expands by default).

Ross

--001a11475cbc1cb37b054686d3f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 January 2017 at 13:36, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony=
@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:r=
gb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-=
:lq" class=3D"gmail-a3s gmail-aXjCH gmail-m159bc18866aa78a6">| ERROR: Parse=
Error at<br>
/home/superandy/oe-core/<wbr>sources/openembedded-core/<wbr>meta/conf/bitba=
ke.conf:704:<br>
Could not include required file conf/multiconfig/${BB_CURRENT_<wbr>MC}.conf=
<br></div></blockquote></div><br>The patch creates the file that it require=
s:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><di=
v class=3D"gmail_extra">=C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-</div><div class=3D"gmail_extra">=C2=A0meta/conf=
/multiconfig/default.conf | 0</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Did it really look for /multiconfig/default.conf or=
 is the fact that the path is not expanded the problem here? =C2=A0oe-core =
master needs bitbake from git, which has changed the behaviour for getVar()=
 (expands by default).</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div></div>

--001a11475cbc1cb37b054686d3f6--
