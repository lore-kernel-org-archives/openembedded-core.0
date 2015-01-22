Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8044560670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:02:26 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id q108so1539228qgd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 07:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zcSuv62fPD3XBcLIalVTbXBOvfhepeiXjdIiHrjfRSc=;
	b=h+rmJkMwyWzpfuJ40LtdBjHSvr06vPU4S61kqWSjUwzh/IFgARRgz04EusNgq4T8oJ
	jNfMjqT3GOrw/cvDlQ3AqPviUd4eyzt7g9eyrA7e+N0QB5ukHL1qpvYm0U/cQOOzIgbL
	/opvaOR6gX+Nq2J6E0tllrXmhj3Mo/tn/bgpm9essVCq2/6QVwf/+gfSHFRYHCGyRb1N
	WoceGg6abFHoEhxJ1swCx8U6+aR8EGzJMfjm5aZk282P2UhiKOgrJ8aBbQmZUgwBxWul
	fHF8vjDWRgSt483W5fOM+2sT0uuv/3E50PGVRHUCI473jm1y7qq/gUuAq1ojd51JbZPp
	+ulw==
X-Gm-Message-State: ALoCoQlnwH3e9Up6A678cARJliW0tMJsGV1R35WXMeJ7QXyjqPZxk2ElcRVkq9umG/+/xcQCNm2+
X-Received: by 10.224.7.197 with SMTP id e5mr3425609qae.64.1421938946789; Thu,
	22 Jan 2015 07:02:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 22 Jan 2015 07:02:06 -0800 (PST)
In-Reply-To: <20150122145715.GO20639@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<20150121202005.GK20639@denix.org>
	<CAENGNheynLDPzuS6xEJTLbkuheB93cH0wsa2DY-M6i=jqHkdvA@mail.gmail.com>
	<CAJTo0LbY54BAQAx1HcgwBZNGNPSwEzmV6zhbn_mB76=vLnkWxg@mail.gmail.com>
	<20150122145715.GO20639@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jan 2015 15:02:06 +0000
Message-ID: <CAJTo0LbgjEA63TCrh=bE7HuLWE=vi5PTgK1h0f0-YLBaXgbjnA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Thu, 22 Jan 2015 15:02:39 -0000
Content-Type: multipart/alternative; boundary=001a11c223f4d0ec44050d3ef5f8

--001a11c223f4d0ec44050d3ef5f8
Content-Type: text/plain; charset=UTF-8

On 22 January 2015 at 14:57, Denys Dmytriyenko <denis@denix.org> wrote:

> Please note that he's talking about current 2014.07 version, not the
> update!
> Can you confirm that it works or fails on the autobuilder?
>

Sorry, got lost in the thread.  The old version works fine, the upgrade
breaks.

Ross

--001a11c223f4d0ec44050d3ef5f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2015 at 14:57, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":5sw" class=3D"a3s" =
style=3D"overflow:hidden">Please note that he&#39;s talking about current 2=
014.07 version, not the update!<br>
Can you confirm that it works or fails on the autobuilder?</div></blockquot=
e></div><br>Sorry, got lost in the thread.=C2=A0 The old version works fine=
, the upgrade breaks.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11c223f4d0ec44050d3ef5f8--
