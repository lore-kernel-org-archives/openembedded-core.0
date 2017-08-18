Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id AEC4777FF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 20:32:08 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id x35so841480uax.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 13:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BTk8BCeovnBkcQK6S1wMXS997PpeZS+2fGr68zVgK8A=;
	b=hgq5QKSHMO/to/caZNZ2nSKmdVoJSxA2Hu20N4r4PNniDDsPvhtaBPx7ysLP1cYkCu
	cRoFwrDsbtT0poiJ6RGP6aOePZohto5fgARyXOU0I7LLpVbAH3wgq8x0CAIo3ObNTLmk
	WBrcOkOqdgX7kn/lRWLjNam4XO18ZcqL6+512r2bXScH2PlDcbT7Yx+FD+iSdBINw1P2
	WNYp+eWYBtT/l39c1Knlq5CyIXbfKF9givc4MAGeIrslMS8faDDclYjZiy3iCc8nbD2d
	RHYDvt1ulWFz4Ud44Gk12IJku1QittkdBWCzPsnqunAhycCUcQBo4Z3/xNvc8gucluZY
	S6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BTk8BCeovnBkcQK6S1wMXS997PpeZS+2fGr68zVgK8A=;
	b=tFcIIW5/OwXtbLUTs0g4F6eSf6IkCDea3xdmqGu04yn7TJoQUZGmhWZm0OudGoBt/+
	fKNdYySF0nZeDRpJUZgSB18fz0D5ndHfhPagsp4KXNrbHe0PJiRHs8n1ubaRLeSPE2Ve
	tTunQ3/bI6hqIvuOtd0i/FhW1Gjv793Fd9L1kc2/lp6C4LX1J/y7ibwhIZ/MOvNVCc/x
	P7DAPZthPG4yXNLVkYJ4C1m2oBa1NsS/7BsWlfKSxRKE/9sxyRZzfvn+lX+Ll/omqf9U
	LLKj9XGw5kAakCO2LJ82uf/AOla+XhyK9prlbQgT86pdhEL/BYReIetVut9cNoqnvNBr
	698w==
X-Gm-Message-State: AHYfb5hEj4gXRah9rZQuu7S+RqlCSkfqV19gCfT6WwIb1RhEh1bRtLFI
	c8PncEklsDTnKqUYlW388aGi5G6IQw==
X-Received: by 10.176.95.85 with SMTP id z21mr904194uah.183.1503088329532;
	Fri, 18 Aug 2017 13:32:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Fri, 18 Aug 2017 13:32:09 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6119E8748@ORSMSX112.amr.corp.intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQcb27Zvu_Hd6pDZ8KHkyF86sJkB3rm4rvzfb_gy98pu4A@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119E8748@ORSMSX112.amr.corp.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 Aug 2017 22:32:09 +0200
Message-ID: <CA+chaQcAid1J41JMPZnFLhr4fwR9xr63JvYB7hQcLGFfLabrrg@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 00/11] Reproducible binaries
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
X-List-Received-Date: Fri, 18 Aug 2017 20:32:08 -0000
Content-Type: multipart/alternative; boundary="f403045f2860f2a9d905570d0509"

--f403045f2860f2a9d905570d0509
Content-Type: text/plain; charset="UTF-8"

Thanks!

FWIW: I've refreshed the patches from ML and still see:
WARNING: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0 do_unpack:
Unable to determine src_date_epoch!
path:/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-source



On Fri, Aug 18, 2017 at 8:27 PM, Bystricky, Juro <juro.bystricky@intel.com>
wrote:

> I will resend the remaining patches, today & tomorrow. Obviously there are
> also some other changes, but the error you mention should be fixed. I will
> rebase them on the current master as of today
> (0bd2dd08e3daf284a6bb7757651af8d40393aec2)
>
>
> ------------------------------
> *From:* Martin Jansa [martin.jansa@gmail.com]
> *Sent:* Friday, August 18, 2017 11:11 AM
> *To:* Bystricky, Juro
> *Cc:* Patches and discussions about the oe-core layer; Richard Purdie;
> Joshua G Lock; Burton, Ross; Juro Bystricky
> *Subject:* Re: [PATCH v3 00/11] Reproducible binaries
>
> I've seen that some of these patches were already merged to master.
>
> Can you please resend remaining patches for oe-core? I'm testing some
> slightly older version of your patches and I see couple recipes failing
> e.g. like this one:
> http://errors.yoctoproject.org/Errors/Details/151939/
>
>
>

--f403045f2860f2a9d905570d0509
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks!<div><br></div><div>FWIW: I&#39;ve refreshed the pa=
tches from ML and still see:</div><div><div>WARNING: linux-yocto-4.10.17+gi=
tAUTOINC+e92bd55409_6648a34e00-r0 do_unpack: Unable to determine src_date_e=
poch! path:/OE/build/oe-core/tmp-glibc/work-shared/qemux86/kernel-source</d=
iv></div><div><br></div><div><br></div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Fri, Aug 18, 2017 at 8:27 PM, Bystricky, Jur=
o <span dir=3D"ltr">&lt;<a href=3D"mailto:juro.bystricky@intel.com" target=
=3D"_blank">juro.bystricky@intel.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">




<div>
<div style=3D"direction:ltr;font-family:Tahoma;color:#000000;font-size:10pt=
">I will resend the remaining patches, today &amp; tomorrow. Obviously ther=
e are also some other changes, but the error you mention should be fixed. I=
 will rebase them on the current
 master as of today<br>
(<wbr>0bd2dd08e3daf284a6bb7757651af8<wbr>d40393aec2)<br>
<br>
<br>
<div style=3D"font-family:Times New Roman;color:#000000;font-size:16px">
<hr>
<div id=3D"m_-2775859198971940146divRpF105861" style=3D"direction:ltr"><fon=
t size=3D"2" face=3D"Tahoma" color=3D"#000000"><b>From:</b> Martin Jansa [<=
a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gma=
il.com</a>]<br>
<b>Sent:</b> Friday, August 18, 2017 11:11 AM<br>
<b>To:</b> Bystricky, Juro<br>
<b>Cc:</b> Patches and discussions about the oe-core layer; Richard Purdie;=
 Joshua G Lock; Burton, Ross; Juro Bystricky<br>
<b>Subject:</b> Re: [PATCH v3 00/11] Reproducible binaries<br>
</font><br>
</div><span class=3D"">
<div></div>
<div>
<div dir=3D"ltr">
<div>I&#39;ve seen that some of these patches were already merged to master=
.</div>
<div><br>
</div>
<div>Can you please resend remaining patches for oe-core? I&#39;m testing s=
ome slightly older version of your patches and I see couple recipes failing=
 e.g. like this one:</div>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/151939/" target=3D=
"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/151939/</a></di=
v>
<div class=3D"gmail_extra"><br>
<br>
</div>
</div>
</span></div>
</div>
</div>

</blockquote></div><br></div>

--f403045f2860f2a9d905570d0509--
