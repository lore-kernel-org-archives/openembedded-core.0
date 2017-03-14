Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id EB29E71A2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 11:01:33 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id y76so244467243qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 04:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EZRehr9TLaSji+ZY+WunZbQr0Ac3QYCP4P8V9OMQGpo=;
	b=fQHQiFOhs71KH/RX5g11dKRaVVCcpf+ad0nrdC/Gbka1met73m9Qapht2RdcB4yMxQ
	k7MBh/x7eykL9gKOC8BJ0RYK4w2SJFIAtSdAM3XgDmixtn+JLmETJrgVzaOqgzAFLVWl
	WMeZVgzyxuU5FCv+Ksl9bje2IhpbqqGw5BDFUnF/TyLRVcZ13/+KMYPWa4+ixOYvCFob
	FpDMMt6ApHEUaPdTsr5kkG9qyej+p7IUH61v0BNZ4++BR2JllW15eVeNFCdBD2e3BefP
	98yACt0ZY28tU/NB0DfgckyQhEKATuZy/PEOQFEIFVKrjGo8jtcBXzJWykhBw/fxZi9Q
	O1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EZRehr9TLaSji+ZY+WunZbQr0Ac3QYCP4P8V9OMQGpo=;
	b=jnxMLnK7KKejt6+pR/XtzCKFC7YhYqAOvFq1Qc4Jfz/irI+5ajzThdLob6qQLDCFjz
	hzs2LNpNr6kAPfogwaYij8Sy+NFqQmbH5bmRQ3lAwWWoVmhzRqSG7dhD17LCzTQLkJlg
	7urhGD8FEVm9AlZEQsDrDsgqJhDSOvii7n8ToJcifZposdVm4O8YvpsfBYNwfXZTt/IE
	B9WNa6jTSUxRizrUbKObjNe80+lj4cDyrrCcEB89XuXwe5LmD4PT7MFHSnxSQCoHlhB5
	wfyGE6To7cU/EkChlK/15i7C24ni2yPEUWlU7s7bysRVQePZtaTkQHyxXHWliktbGEJo
	bOtg==
X-Gm-Message-State: AFeK/H06HPqgcyITzmNded3FzQvK6e84zID76mSpYcvq3g6zB/zFaD8i84aCHcJEg8OE1tk/6dqOTbL5Z46NM9nq
X-Received: by 10.55.192.145 with SMTP id v17mr38447615qkv.3.1489489293972;
	Tue, 14 Mar 2017 04:01:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 14 Mar 2017 04:01:13 -0700 (PDT)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48AC3351D9@SESTOEX04.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48AC3351D9@SESTOEX04.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Mar 2017 11:01:13 +0000
Message-ID: <CAJTo0LaKOR3HRz=Mb+Gyr958KXpjC-_zk17-4S47cEYwFUMZNg@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Use-SHA256-not-MD5-as-default-digest.patch file is not added to the openssl_1.0.2k.bb
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
X-List-Received-Date: Tue, 14 Mar 2017 11:01:36 -0000
Content-Type: multipart/alternative; boundary=001a1149a1c243bcaa054aaec06b

--001a1149a1c243bcaa054aaec06b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 March 2017 at 09:35, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> Does anyone know why =E2=80=9CUse-SHA256-not-MD5-as-default-digest.patch=
=E2=80=9D is in
> the openssl directory but has not been added to the openssl recipes? (bot=
h
> in master and morty branches):
>

Because something went badly wrong...

(patch incoming)

Ross

--001a1149a1c243bcaa054aaec06b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2017 at 09:35, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Does anyone know why =
=E2=80=9CUse-SHA256-not-MD5-as-<wbr>default-digest.patch=E2=80=9D is in the=
 openssl directory but has not been added to the openssl recipes? (both in =
master and morty branches):</div>
<div></div></blockquote></div><br>Because something went badly wrong...</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(patch in=
coming)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a1149a1c243bcaa054aaec06b--
