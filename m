Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 155206FFE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:44:54 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id ik10so56936305igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 06:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bCGOc4TK4OLmA0Ue/5RTqit5lOzwKUdu81oCKrxwQwE=;
	b=flcu6bMW3KoWJcSr6jILfhCP2yIhA6aBG6uey2oE6QYqVKFTiyCCms0ZO5vhzpTOKw
	7wEZSVPV6QS1r9edol4T3HLOgA96+5e0YWYnFn0u+Wl20o4z9gSIxmN23u8n0PvhNPxb
	b8Cc8/LzehynKiu99ibPAeDy7Hz/ZMfip/Q3mZ31CfBbsM6m0PlCd3b16Spp7edObTFu
	sWGBOgXKlnKe3oQ5cLRd2a71Ve7l7pALe7eAoVm5S3HYq+O81+81AhMdSuvz9mf+XftK
	ErIxgE/ws5wuUESi8gsR8MieKvzdjM6yvxKk+DFOH56H0IDb58rPEBZKZewSrvR8wlCh
	jNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bCGOc4TK4OLmA0Ue/5RTqit5lOzwKUdu81oCKrxwQwE=;
	b=QdlJKajdzDeWE0ZSuNIRtu8OyVzE41lt6YcQMQzb4tP27mbAATKjHp+wanTTgf78/w
	OeXGymtH3ZGbaV1kaSIjn4XULnabc96sSZaw8nzjuUZ57u3zgV4riJ01dGf0xlriNrE1
	STISqRMFXVGhRQdalaHK+6oo3l7O0AMpPs3oVgcMkt6dV2WSvMM3KE2sCpwJKFC51lp4
	TOO1236P4hi9dcqFjzM6t0ACMM0ii/dKhMBI8tj4C++Ef0sqm3hypmKuobhukhocbIw1
	3DGKOCBdkfuGmqp4SMJkNsd3qBa+9gSVNF2TPSKJrGMlk1QczkdRcWfJ9YjeTYT2RNFw
	M4Bw==
X-Gm-Message-State: AG10YOSb0s1C+xVFTKlPKT3TevwvOKlcLgXGfV3rQr6ypz1jpW6A7011P12TTATzHQM6PwMij7EHCxaRbhjYLtOv
X-Received: by 10.50.111.111 with SMTP id ih15mr11409495igb.78.1453128295513; 
	Mon, 18 Jan 2016 06:44:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 06:44:36 -0800 (PST)
In-Reply-To: <35fd9829f35bd0486288037c7f0a3cf5ada85948.1452655299.git.Qi.Chen@windriver.com>
References: <cover.1452655299.git.Qi.Chen@windriver.com>
	<35fd9829f35bd0486288037c7f0a3cf5ada85948.1452655299.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 14:44:36 +0000
Message-ID: <CAJTo0LbRy5fd8Wcz5ZqQ0cTjW1o+wJ-m-srL-H0cRknQua9upw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cups: upgrade to 2.1.2
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
X-List-Received-Date: Mon, 18 Jan 2016 14:44:55 -0000
Content-Type: multipart/alternative; boundary=089e0149be34de1d8a05299ccb2b

--089e0149be34de1d8a05299ccb2b
Content-Type: text/plain; charset=UTF-8

On 13 January 2016 at 03:23, Chen Qi <Qi.Chen@windriver.com> wrote:

> Add PACKAGECONFIG for systemd. And install our own systemd unit files.
>

Why would we want to use our own units over the upstream units?

Ross

--089e0149be34de1d8a05299ccb2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2016 at 03:23, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5qy" class=3D"a3s=
" style=3D"overflow:hidden">Add PACKAGECONFIG for systemd. And install our =
own systemd unit files.<br></div></blockquote></div><br>Why would we want t=
o use our own units over the upstream units?</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0149be34de1d8a05299ccb2b--
