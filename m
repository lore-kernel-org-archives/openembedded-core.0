Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7BFD16D494
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 10:26:37 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id w17so4889145wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 02:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EqLhPPUa0Ah8pYzqtUwmZDLE7C/wE785l6gn90M9gqo=;
	b=an2Q0/kXj2BrXeAZddHYjzTCpjD3ppyA0WX2z/zGhnry8KJSAd5Hqs9MYWYeO02TEw
	0uRbkv8BPzvOugOJ6nt3OoG5B1xDng4/cyDBKo20iRmSVYxtp/+O2eunqRLAVXCAIeH+
	eXspc1865z9O8QBd5P/qH4NZkENpge/LTe/0zFValH6HzklScCj5TUUClhHATtm7it63
	74cvRqoH9CFtCeSft4GYLH32+/1BkjdD6YZt9IONv4dQhNQKMbJzWpOZVCE5L5L83xKa
	gHoU4r/LAQzS2e5rz2GVT1ai9bMKtFLq5sfAibq4pg2Fs9RaeY9KoAriTYTbGNVRYx0P
	hgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EqLhPPUa0Ah8pYzqtUwmZDLE7C/wE785l6gn90M9gqo=;
	b=N7QiLy8YSUbLs/ehV1DfDBvLmoBvE8NL0WMaAxyrcpkPNsSyHqGhHTLWF3dQ9J1Vra
	S+K9F7gnKUHpu+ZoH4aaoQWpwKHrHLaCzpzd3oPpF4Fw0AiJtSn1tKtF1SIrneFeBv6r
	yqhSpp522Kw8DAxv8oveHx+ypGSwATlD+1E/ph+9U9fwxV+BGGCRcXOMpXUu6bzVPJxW
	49rAtRzPmG+ZieyuGJJNg5oj2lkkZuYoPbWMmUFhHretujGVMO9SjyFGEcfw+Yw6nYMj
	H4QI/2Q4v2G2NRauMkX39ANhg9rDKCaQxxlq3hcCG9hbJdX0iLJgFE9hC1sdnEX8q/B/
	SWKA==
X-Gm-Message-State: APjAAAWhNV0EVAvaHKXD8MfX5wRhuh9aODOjqCaDyJVXcIqow3Y2TbiV
	lzTIKsps5nGiNmXTGSd2Qa6fFYsr4WGOSpydRWQ=
X-Google-Smtp-Source: APXvYqx3YnsrJN5QdpflTZwpiXEq3tMySMxVg41553SG4Ayz151mkmbpew13TTxWZ165+KoDS7tz+lVwITNrzR30O3M=
X-Received: by 2002:adf:fc87:: with SMTP id g7mr11833714wrr.136.1551695198161; 
	Mon, 04 Mar 2019 02:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<CAJdd5GaOk=asx=r1yVOEokMbiVPsk_8bdArYq1KzrNR22_LcNQ@mail.gmail.com>
	<20190303225159.GM5026@bill-the-cat>
	<CAJTo0LaOGr4iJh0r1s=wWOy3XA47-L+++Dq+zQOV5hD3LCD4Kw@mail.gmail.com>
In-Reply-To: <CAJTo0LaOGr4iJh0r1s=wWOy3XA47-L+++Dq+zQOV5hD3LCD4Kw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 4 Mar 2019 11:26:27 +0100
Message-ID: <CA+chaQeQ6CBXZLs_+-8znBkjNPLG1S49WcA3X7bivr-2fAmZeA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Mon, 04 Mar 2019 10:26:37 -0000
Content-Type: multipart/alternative; boundary="000000000000160f540583423116"

--000000000000160f540583423116
Content-Type: text/plain; charset="UTF-8"

There is, you can prune outdated duplicate sstate archives while still
separately building multiple DISTRO_VERSIONs.

On Mon, Mar 4, 2019 at 11:17 AM Burton, Ross <ross.burton@intel.com> wrote:

> On Sun, 3 Mar 2019 at 22:52, Tom Rini <trini@konsulko.com> wrote:
> > SSTATE_DIR =
> "${HOME}/work/OE/sstate-cache-${DISTRO_VERSION}${TARGET_VENDOR}"
>
> FWIW there isn't much point in isolating sstate like that.  You'll
> just rebuild stuff that would have been available.
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000160f540583423116
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is, you can prune outdated duplicate sstate archives=
 while still separately building multiple DISTRO_VERSIONs.</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 4, 20=
19 at 11:17 AM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Sun, 3 Mar 2019 at 22:52, Tom Rini &lt;<a href=3D"mai=
lto:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:=
<br>
&gt; SSTATE_DIR =3D &quot;${HOME}/work/OE/sstate-cache-${DISTRO_VERSION}${T=
ARGET_VENDOR}&quot;<br>
<br>
FWIW there isn&#39;t much point in isolating sstate like that.=C2=A0 You&#3=
9;ll<br>
just rebuild stuff that would have been available.<br>
<br>
Ross<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000160f540583423116--
