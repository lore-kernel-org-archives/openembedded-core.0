Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3872D78D2C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:17:29 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id l10-v6so10028277oii.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gHbSh4ObK8ANAbjuryxQ7jXi5tuBCe/CY/LtWebgJI8=;
	b=TZjfaqziH4tHHUVN2K1XGdCy7tAc/KQaEi2diQpq59taz6pjXYd17uy4IdVtgWFpfa
	Hkv9a06D5FH6X/Qcu+hHPiDyQ7Efj0M0fzkTb5SgWh090FxSxAdDSv+s4aHIgEmnkRkl
	sjxj+Nt/9OfvDBiiakIjDsH8yWaFMgJ3CTiAANhtCL1RKk2mxytpqDgjJpDMZwqBAqwf
	GpxPSpxKaqTyooRiuvRD+0E/7YGhWzmiBIL9SboaqDQ5scGZLaF0+YtwO9e/YliIUC33
	26vcNen4/J4Jhx/W+Zd9cwyqyZycgmh0gNbKnvRnJlGAP9iGAOdMroBVih2aJnsI482p
	UI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gHbSh4ObK8ANAbjuryxQ7jXi5tuBCe/CY/LtWebgJI8=;
	b=T3A8w6lGwl5LzlNOtahrxLc86LakLb85NcN/G6Z8jPtUW41QAlAj8pdbIH1erOkIPt
	qoFDDlPR2nqoJCacMT6lQ2GWeGMT44+WCBxFF2uPmbWpvd309qEiRuNeCuQM/ow61NJw
	5UtjR7f93jzdRymZB6rJcE0hmEgDBHZLMjMQZbDBT1YRhwL05WTlW5neDM366nDwFBeg
	TgJx/u9l0HgQnE2rKo4zuon2g96NyXntqvFWWKqjiFGa6hT/h7WJVGVly+pnzYwfv9+k
	OTtc4/73BXfDSKYEy5pAk1POxJEc0TwQhMp5FQVC1XHeRhonHjPqj3t6w9n4oJ1y+qXJ
	ruSg==
X-Gm-Message-State: AOUpUlG14DWXAGT+b6aSaSZQcgbnwLnlNXlkDXTMVm1WgUVGS9wuQMxl
	acCgwwjfCf/E5lHT855Sv0pB0M6PWD49/sT5sKhXiGlI
X-Google-Smtp-Source: AAOMgpfIZZ8FTCzHFhdOD/svggQsUzhkF8U4DJlQnNpq07yeBJhY/9c8ZcCZG6B4DQG+zW4UGS9Hzy2rgMCHs4cyqHo=
X-Received: by 2002:aca:e185:: with SMTP id
	y127-v6mr7660098oig.245.1532708250173; 
	Fri, 27 Jul 2018 09:17:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 09:17:09
	-0700 (PDT)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF738709E4B2@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <33D4DBCAC5F2D74E96B07F6E7632BF738709E4B2@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Jul 2018 17:17:09 +0100
Message-ID: <CAJTo0Lb58D_haLtZnZx8sTG3LaNk3U-c6zu1Yd0A0hcjf3ruSw@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IG1kYWRt77yaIHN5c3RlbWQgc2VydmljZSBxdWVzdGlvbg==?=
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
X-List-Received-Date: Fri, 27 Jul 2018 16:17:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Presumably because the recipe doesn't install it.  Patches welcome.

Ross

On 26 July 2018 at 04:35, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote=
:
> Hi All=EF=BC=9A
>
> I found there is a systemd service file in the source code of mdadm-4.0.
> mdadm-4.0/systemd/mdmonitor.service
>
> And why this service was not added into the rpm package?
>
> rpm -qpl deploy-rpms/x86_64/mdadm-4.0-r0.x86_64.rpm
> /lib
> /lib/udev
> /lib/udev/rules.d
> /lib/udev/rules.d/63-md-raid-arrays.rules
> /lib/udev/rules.d/64-md-raid-assembly.rules
> /sbin
> /sbin/mdadm
> /sbin/mdmon
>
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

