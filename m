Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 769D3789CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:53:55 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id k135-v6so12208505ite.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version; 
	bh=BnHcgYBEupjWmIXo9S+uC3LpFdZ55ynuv1zWWzFedyc=;
	b=a+0tjKz5mT9kiDvPj4oGCE9InEqjByzRPea4tF4Z0yPibcuNcIAM0hwPGQW71uY8Vj
	fvzInH4eqRtPWzBGvBmsPjPsUv1h0VsAi7pPenCEZXpRcriPAudXEfU5yyPPDlfFQtUQ
	aSi69IA+4j6iHfiFVPjiqYUB20RlQ0cHeiRRyXzUzZw2hnM/CZD1yEJpOQJPYDTQQeqB
	E5LShneJMsokhFs1CTSy/WYeXNWC/zi3PZUuTlGm57jLkrezKFZYFzCi7n3mEGwTMpC/
	VNIUW/mff4YvsneQHQ3AOAbPMELRLGeYxBZjPoAP4H66573qNJLkik3iv37fD4Iy+O6d
	f7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version;
	bh=BnHcgYBEupjWmIXo9S+uC3LpFdZ55ynuv1zWWzFedyc=;
	b=XGl/dKjfOY6VTSiXudGCgXVe2hQTiuUxCL6iJqujldd3QJJeajQmEKcAxx/t/h1vbS
	eFmgnOnmeHCOVIDZYR+cORpE57fgRgAOPtmphRRqgwmUwCAsoXuqk3x434rWnF1fiUub
	jaIOm302OGjEv+1OMDDQjm5K43UmPwPtwbmAMkyfSWE8MjxLV3G1KM7PmWvwFYrwfwly
	ObJYj/uYSPjnqXBuYVc3iTRleujDS/IA65tiXkUZnMYYwCiyvnM0c04qC5gk1PzS58Q3
	dXHckb6rMjL2c9Sqf8fWcSV5w1zRV2rQzwLC04ZjE2m+l8lzamnbIEQsyxhpus15vwME
	+Avg==
X-Gm-Message-State: AElRT7FLNnb4AtRB8MqL64P95nLP/A9FvQhfDl2vgoKpm8NuRMkoEXNa
	AyO0HS7aeS0QtKH5jg4T6os=
X-Google-Smtp-Source: AG47ELu8jl5xr4VUG9PXfFohh++Olbs0VwDDwDhpW+hpbTx9pKjlo66Y/G2rqaMl3u8reRzP9eJa+A==
X-Received: by 2002:a24:ccd7:: with SMTP id
	x206-v6mr220899itf.136.1521492836278; 
	Mon, 19 Mar 2018 13:53:56 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	x139-v6sm34858itb.3.2018.03.19.13.53.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:53:55 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1521492834.3242.110.camel@gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 15:53:54 -0500
In-Reply-To: <CAPGMVzHgUcWV3TFaTeV40+P=SO2zV-4cjw2oWnB2KsBrozk9Sw@mail.gmail.com>
References: <CAPGMVzHgUcWV3TFaTeV40+P=SO2zV-4cjw2oWnB2KsBrozk9Sw@mail.gmail.com>
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Subject: Re: system lock down in middle of build
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
X-List-Received-Date: Mon, 19 Mar 2018 20:53:55 -0000
Content-Type: multipart/alternative; boundary="=-6EBC7UbPE4xb9bHlacK8"

--=-6EBC7UbPE4xb9bHlacK8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-03-20 at 02:05 +0530, Rajath C S wrote:
> Hi,
> 
> so i am workin gon yocto development on my PC as well as on my
> laptop.
> I have also worked on it on others systems, but the strange thing is
> only on my PC & laptop the systems gets logged out automatically in
> the midst of target build.
> Is this a bug?
> 
> PS: both my PC & laptop are of high-end configurations

Are you using a virtual machine? I've had this same behavior happen
with VirtualBox before.
> Thanks
> 
> 
> 

--=-6EBC7UbPE4xb9bHlacK8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Tue, 2018-03-20 at 02:05 +0530, Rajath C S=
 wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div><di=
v><div>Hi,<br><br></div>so i am workin gon yocto development on my PC as we=
ll as on my laptop.<br></div>I have also worked on it on others systems, bu=
t the strange thing is only on my PC &amp; laptop the systems gets logged o=
ut automatically in the midst of target build.<br>Is this a bug?<br><br></d=
iv>PS: both my PC &amp; laptop are of high-end configurations<br></div></di=
v></div></blockquote><div><br></div><div>Are you using a virtual machine? I=
've had this same behavior happen with VirtualBox before.</div><div><br></d=
iv><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #7=
29fcf solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div>Thanks<br cle=
ar=3D"all"><div><div><div><div><div><div><div><div class=3D"gmail_signature=
" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><br></div></div></div=
>
</div></div></div></div></div></div></div>
</blockquote></body></html>

--=-6EBC7UbPE4xb9bHlacK8--
