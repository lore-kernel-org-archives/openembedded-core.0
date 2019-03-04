Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6057C731
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 10:56:54 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id z84so4209588wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 02:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Wa9fFd83vY5b7Qqnc7KCqeo5kiuLfrM9iVNtdRStVik=;
	b=usvu94SKHYfPlDJ86+Mv/RaUXo6gy9qzPWvxxE8yVYdIvqLBaKVpowfHkj3zrnK+w/
	INj3LAV1QGdzVaIOKD0gbcF++IfLwLSetxeZ9WyAeVA/ydmsq6aKGtNjCQCab1UJ2x30
	HPc6cVCju6bgEvuZbk+19I65t7ym7Rx3S3XUoHe3jWwYS9+XSdktZbCA8ozt31eUsgsG
	WWk0dcL3JoIj4ZaqdgyCi4daNNHk+/MzOY3Kzl38pYSRadT6ptr0jxY3AQn0kokl4T3W
	UEWMHeLnQDlKXUuDmGp6i06DXqqh6AC4SmaPjMXYjO0NwQsAAl0pyYhZgVFh2fYAe1VJ
	QgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Wa9fFd83vY5b7Qqnc7KCqeo5kiuLfrM9iVNtdRStVik=;
	b=mmpUNdhzcLCb78D0UVOOE/4I1vD3pfnmGU1c0IsbvLk1YlQzZmYLQqx4ao/46UC979
	1oJAHb+NtIGTdWUKHcIywMHGH9gEA1Nn0+R6xLubff8hLHB4d40J0Vq3RaJvlJ4S+vtT
	/GTsl13TTv2VV4Isn+91OCjdAbfumQYBVQx2KLVL1sM1Ms3e1Y1IgMaZf7lZfQqc1jBB
	FZeC/mfCl55Fx8l8z9+XCt9f2WHF7r/RrBxTtdCpUKLoITG6sYo2OP5J16RismQmS+sh
	I33ot2ZwQ3TLSUfMQo4N01+kwbp5/vP7/oT/UnAMACXIXA7x+a6S1ZxUCjALVRsUHLLL
	5aEQ==
X-Gm-Message-State: APjAAAW2ndBdGZAR5NBp7PtCj2IlWy8RnSXa+RrN8KMm7f8bnDyJGQ3Q
	EgATSCX4SziIUPN6eOprgnWqtQUADhIHCfeAKZY=
X-Google-Smtp-Source: APXvYqwWwQUz7PGxcvbvpoBECgt1ICVd8f1ZanMqmyoWVyW3fLJmNO0HlNKdJBSVOmh3ADRD38f96806SVypHhgdBtk=
X-Received: by 2002:a1c:b702:: with SMTP id h2mr10233377wmf.94.1551697015549; 
	Mon, 04 Mar 2019 02:56:55 -0800 (PST)
MIME-Version: 1.0
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<CAJdd5GaOk=asx=r1yVOEokMbiVPsk_8bdArYq1KzrNR22_LcNQ@mail.gmail.com>
	<20190303225159.GM5026@bill-the-cat>
	<CAJTo0LaOGr4iJh0r1s=wWOy3XA47-L+++Dq+zQOV5hD3LCD4Kw@mail.gmail.com>
	<CA+chaQeQ6CBXZLs_+-8znBkjNPLG1S49WcA3X7bivr-2fAmZeA@mail.gmail.com>
	<CAJTo0LZtAYkROXuABefAfw5WeAaw=1+fKX4OQnCAPM3sb8YnZQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZtAYkROXuABefAfw5WeAaw=1+fKX4OQnCAPM3sb8YnZQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 4 Mar 2019 11:56:43 +0100
Message-ID: <CA+chaQft0P79cydV-Qzq-6Oc6i=O2iOzpbeFc3s_KEKKZnyzsw@mail.gmail.com>
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
X-List-Received-Date: Mon, 04 Mar 2019 10:56:55 -0000
Content-Type: multipart/alternative; boundary="0000000000006936e40583429dce"

--0000000000006936e40583429dce
Content-Type: text/plain; charset="UTF-8"

4TB of sstate is just for few weeks for me :).

On Mon, Mar 4, 2019 at 11:45 AM Burton, Ross <ross.burton@intel.com> wrote:

> On Mon, 4 Mar 2019 at 10:27, Martin Jansa <martin.jansa@gmail.com> wrote:
> > There is, you can prune outdated duplicate sstate archives while still
> separately building multiple DISTRO_VERSIONs.
>
> We don't all have 4TB disks? :)
>
> Ross
>

--0000000000006936e40583429dce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">4TB of sstate is just for few weeks for me :).</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar =
4, 2019 at 11:45 AM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.co=
m">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Mon, 4 Mar 2019 at 10:27, Martin Jansa &lt;<a hr=
ef=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.c=
om</a>&gt; wrote:<br>
&gt; There is, you can prune outdated duplicate sstate archives while still=
 separately building multiple DISTRO_VERSIONs.<br>
<br>
We don&#39;t all have 4TB disks? :)<br>
<br>
Ross<br>
</blockquote></div>

--0000000000006936e40583429dce--
