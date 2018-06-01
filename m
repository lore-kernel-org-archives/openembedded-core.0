Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id A8246605C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 17:56:21 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id i5-v6so30273530otf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 10:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xj+eTeRkzWAC4+gtDd5U7kh+Ft7xX6Gq7HD5cY4xttM=;
	b=dZF8cKWzy+bp4UmwxieXYWMTxBwJhu8t5SAjPShiTq6iuh0uszDlveX5ZQJ4DkGMaV
	P17SfXjYs1p/lNfwBZKdXGg/DeM0pnc2PUlz1S9H0HzgO/7pikHRBDuuHmPlkYJI49eD
	RNMzz5nW8mmQxvhlPidPCAPhmgmpeM5QBICfZ0zmvELvDUo0qzeYr2mTx/JmuITejGE2
	vF7i5f5Y0O8sRv8kRn/boE1ULlfzHpzZjiLXozphFKU2ED1Y8XYYx7BXC2wENE6oWwq7
	qGM0gIritXxy84K2fAGe/wlgfdx2Lgm+tc9/0xKNdViq2bZONuX6myG4mcnojorYWsKX
	hR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xj+eTeRkzWAC4+gtDd5U7kh+Ft7xX6Gq7HD5cY4xttM=;
	b=hFa4fJq6/IUUtvPVMxApGTQmSUAaw9rRBTv3Jt75nT4mcRQXUb/ZDO7gzWRt3gtley
	KaVCAHKYXZ0e5edUnOgiMGFI+t+eH+h06wOfiPolye7Q4GOyBcBCp6RRxrm+VcVrtZjc
	jg9jsL/TjV//Ea+ZvtP/ZHsiJ633S6HGqkjPpl19e4l/IFk7p7Nec2U50hvfXx5jbysR
	/Jd2zuqPovMPgyoBYwC+gMwZqTcT+Vm8ABSfiHKZnD7i4aLL3EONb/LrCJJFkykFs/H7
	S+RTY+GU63nNZgPMNeIhT6TZScMq6oam8zdWYJirOzY/7sNKElY3H1Aq9MCUVX3vDve0
	nLtg==
X-Gm-Message-State: ALKqPwf67Gsye2mrAo71dU+9+g0xVvnXOIwkzUE26ySdA++yT8Ef8ayF
	MW6SNVkt7P8blzPzeELZSdqTFD7zmkeV5kZGo1s=
X-Google-Smtp-Source: ADUXVKIyIEppTpT32XYc/Iiq90P1wFDLnqkQ7QociToobEbyleHmUhzQdNd4FOKoprqPs3ro9cR+P7if6hcWdCSlIBw=
X-Received: by 2002:a9d:cd:: with SMTP id 13-v6mr8335748otk.155.1527875782555; 
	Fri, 01 Jun 2018 10:56:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 10:56:22 -0700 (PDT)
In-Reply-To: <62a9d51c-67da-353b-778e-b8af72408413@gmail.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
	<CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
	<5B10DBE5.5050603@windriver.com>
	<62a9d51c-67da-353b-778e-b8af72408413@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Jun 2018 20:56:22 +0300
Message-ID: <CANNYZj-JRVCWfRr++c6YQzEtq1WgmhUgf8CwAx4_N6PEdXrYHg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 01 Jun 2018 17:56:21 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-01 20:07 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
> these symbols are added by assembler, if you have .file asm directive
> either explicitly added to .s file or emitted by compiler, compiler
> would emit it if the path specified to source file is absolute during
> compiler invocation, it will take it verbatim and put it in generated .s
> file

The .s file is not generated and it does not contain any .file
directives. The .o file also does not contain the path. It appears in
the final .so library at linking stage.

Alex

