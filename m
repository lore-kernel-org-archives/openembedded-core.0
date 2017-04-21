Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 81C6A71AB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:18:23 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id g60so68099720qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 05:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W5mN2pLeS27hxgYuOK2yV7X2P+iwiV6/DN6Kg439/yM=;
	b=AOt8oumUK7Gzsjrj0KJHZcYX/idDpHS2sQJGS5Bk1fCdys9vpCx6mDgzcGh4Sc/o9Q
	7O5AQLEQuyzzwhbRQjNTVHuex1rNmXYVTVQBgk8jPNIkO5Pa/rouVvXR2OLqpQ4LGz8H
	vXotfb703gp45lwxHZdXz6smI/I+sLTrJMYA4dNBHyvOzlEAreYASfLfLIRwNvZ8re7O
	ydbfhd+nN9Ew9T3NVNQfC92R+DZ5/HKEa+kgSmfm571uH2KlztEFMS869jPvmPutpD/9
	ZaG1kKHukbyHHhxg8AuJq23Gu1qOLH4VMRQnzlN4HDeg75uGSf5IkwRxBqTGFp6LRlzu
	KTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W5mN2pLeS27hxgYuOK2yV7X2P+iwiV6/DN6Kg439/yM=;
	b=qYsn/6KYEvHgxRNLazzaPCCNX28k4MtL7Glvx77bVoLEMN/ZEMhtATkuopzUv153qy
	OQYg2md/8XcZRgP3Y6s63y9ebt9cfPSMqRMc2VjPuyQOPJ0aqW46B8EZEeMEq1gLmjta
	k+5dM/AXp22zCiKTHmQtIy2PdR+5qkIIDg5ViQHjKrxvcJj8vNU0e8L+Qm4HmClrnKYP
	1z/AOxRtTNwQd/K6DPvMH/IyxykMeaGK5DKuy6V3QMDPqqwbcQiTC30wugSScEiDayms
	/UB50FBEV0+GfwdTPqQymcs5PKNjQKWn/1VWgf7GDoTsxIO21mr/Oj4iXiJZTWTvMIPC
	9z7g==
X-Gm-Message-State: AN3rC/5V+9huSvPf+wY9TElkqivFweamXteZaPpoxBn0OIOH/4SQmIU2
	iD89RZMcdJ6nfUK+ntfqRe71Py3kBVAU
X-Received: by 10.200.46.26 with SMTP id r26mr14019044qta.197.1492777104367;
	Fri, 21 Apr 2017 05:18:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 21 Apr 2017 05:18:03 -0700 (PDT)
In-Reply-To: <3f5a2d43-819b-230b-534c-89d304f7f5c8@linuxfoundation.org>
References: <4130d91cdc58431bbea8292c7cc30498@XBOX02.axis.com>
	<CAJTo0LbNUuNXdnXw3QRU+LfSfHSNa4PcWPRhe0B2N0RVhH68Xw@mail.gmail.com>
	<3f5a2d43-819b-230b-534c-89d304f7f5c8@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Apr 2017 13:18:03 +0100
Message-ID: <CAJTo0LbAkYAWO1UqXJf3kyK36VU10ZoimCcHpoJAXxcerM02DQ@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building logrotate for older releases is broken
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
X-List-Received-Date: Fri, 21 Apr 2017 12:18:24 -0000
Content-Type: multipart/alternative; boundary=001a114708cc08f6b4054dac41aa

--001a114708cc08f6b4054dac41aa
Content-Type: text/plain; charset=UTF-8

On 20 April 2017 at 17:48, Michael Halstead <mhalstead@linuxfoundation.org>
wrote:

> I've restored "4492b145b6d542e4a2f41e77fa199ab0  logrotate-3.9.1.tar.gz"
> on downloads.yoctoproject.org and set it so it can't be overwritten.
>
> Please let me know if anything else is required.
>

Thanks Michael!

Ross

--001a114708cc08f6b4054dac41aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 April 2017 at 17:48, Michael Halstead <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mhalstead@linuxfoundation.org" target=3D"_blank">mhalstead@linux=
foundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 text=3D"#000000" bgcolor=3D"#FFFFFF">I&#39;ve restored &quot;<wbr>4492b145=
b6d542e4a2f41e77fa199a<wbr>b0=C2=A0
    logrotate-3.9.1.tar.gz&quot; on <a href=3D"http://downloads.yoctoprojec=
t.org" target=3D"_blank">downloads.yoctoproject.org</a> and set it so
    it can&#39;t be overwritten. <br>
    <br>
    Please let me know if anything else is required.</div></blockquote></di=
v><br>Thanks Michael!</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a114708cc08f6b4054dac41aa--
