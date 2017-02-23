Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id E48EA65D35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 08:52:05 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id l19so13605810ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0D4V6tuiOJMfTOp8ZD+5ZKKGlnLi9VMw4xuCUrfhOjM=;
	b=m2yoJcTfcPy1sW88t1Yx77eq70lNrWaaiJzaz7HQ8CH14dIu3tIhJRjnTPkPjBlaSr
	Q/Ij/1TO/B8WMkTU52jJDZPiEShfeu4WMg1ucbw5WznlAxpp/bkqq48cA5KZkwwpUIbU
	KGwGLi7wXXIkA4ER5fViV7lLWmqByJJPB33cAzRJK8q6N1vz4Gs8+atf5aBwf7tb2pUx
	U3Y6mPkD+LRHqu2vY7sIZkBbx/XP4QVRirJSzBlQrEPwRUhAmbQqZX2+ybGx1HSHvyi8
	mKs4pPTP9Fp7YFfPLHRszckiegBldNAv/YlkPZ2B3eu9rMU7wbIBkqv0VFkr1dCiP52V
	15Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0D4V6tuiOJMfTOp8ZD+5ZKKGlnLi9VMw4xuCUrfhOjM=;
	b=e1hCF1qFBmAAGfLGdwC/b3ZsjzboFIl2FUkMMhlYhL46wqTXG6lllzZ6/876o5LBbq
	lqCFrNnujKOqtpkldKAIeBxh1l86Svgz0uv44L2twlO4gvNVJ/yX9U7nDjK0kdKR7Gog
	JLZ4z4oumxIi+JV9iKgdPHtuLTnvLNpQtX3eE5qj2lX74BLTsmOT4sqW7SbPwf2sxLSO
	brxu3malScU2FWqM+yMOlrLmIEs+x5XPqIkvsvg52woQayDlLHUSMc4YUcS64k4JOsUl
	ELcPG5FrFGkPlNqIx+ZDvrxTUtKbM9rz7UuJLN1onExMzy3Y3ntxrfBn/OYs3zTz8n8z
	w2Mg==
X-Gm-Message-State: AMke39lVPo5UfjiRxSB4vjM+ULLUwuTwPyfmmzAktZlb6fE0Jp/P98vExLMwwdYQqIQz/hKqL38XVSvsx0CqYS03
X-Received: by 10.129.177.197 with SMTP id p188mr26802074ywh.183.1487839927303;
	Thu, 23 Feb 2017 00:52:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.72.195 with HTTP; Thu, 23 Feb 2017 00:51:36 -0800 (PST)
In-Reply-To: <CAJTo0LZT-NukaBOgdA_Wajfu0pVkNCiNu18ZEE_CYGruXOz1ow@mail.gmail.com>
References: <cover.1487764904.git.jussi.kukkonen@intel.com>
	<f6a8a61195fb454781e93c2dcf615e48a2fc8682.1487764904.git.jussi.kukkonen@intel.com>
	<CAJTo0LZT-NukaBOgdA_Wajfu0pVkNCiNu18ZEE_CYGruXOz1ow@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 23 Feb 2017 10:51:36 +0200
Message-ID: <CAHiDW_FBuM3GzPCzEVCZnR8j106EkaKYQ5BJMHFz1qCi3CXSbA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] libdrm: Upgrade 2.4.74 -> 2.4.75
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
X-List-Received-Date: Thu, 23 Feb 2017 08:52:07 -0000
Content-Type: multipart/alternative; boundary=94eb2c14620459972c05492eba0b

--94eb2c14620459972c05492eba0b
Content-Type: text/plain; charset=UTF-8

On 23 February 2017 at 00:22, Burton, Ross <ross.burton@intel.com> wrote:
>
>
> On 22 February 2017 at 13:02, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:
>>
>> * Remove udev from depends (it's not actually used).
>
>
> Is it not used by some of the tests?
>
> packages/corei7-64-poky-linux/libdrm/libdrm-tests: PKGSIZE changed from
350048 to 225496 (-35%)
>   * PV changed from "2.4.74" to "2.4.75"
>   * FILELIST: removed "/usr/bin/dristat /usr/bin/updatedraw
/usr/bin/openclose /usr/bin/name_from_fd /usr/bin/setversion
/usr/bin/getstats /usr/bin/getclient /usr/bin/drmstat /usr/bin/getversion"


No, these were removed as tests for "functionality which is neither being
worked on or actively maintained". Should have mentioned this in the
message.

Jussi

--94eb2c14620459972c05492eba0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 February 2017 at 00:22, Burton, Ross &lt;<a href=3D"=
mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>&gt;<=
br>&gt;<br>&gt; On 22 February 2017 at 13:02, Jussi Kukkonen &lt;<a href=3D=
"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<b=
r>&gt;&gt;<br>&gt;&gt; * Remove udev from depends (it&#39;s not actually us=
ed).<br>&gt;<br>&gt; =C2=A0<br>&gt; Is it not used by some of the tests?<br=
>&gt;<br>&gt; packages/corei7-64-poky-linux/libdrm/libdrm-tests: PKGSIZE ch=
anged from 350048 to 225496 (-35%)<br>&gt; =C2=A0 * PV changed from &quot;2=
.4.74&quot; to &quot;2.4.75&quot;<br>&gt; =C2=A0 * FILELIST: removed &quot;=
/usr/bin/dristat /usr/bin/updatedraw /usr/bin/openclose /usr/bin/name_from_=
fd /usr/bin/setversion /usr/bin/getstats /usr/bin/getclient /usr/bin/drmsta=
t /usr/bin/getversion&quot;<br><br><br>No, these were removed as tests for =
&quot;functionality which is neither being worked on or actively maintained=
&quot;. Should have mentioned this in the message.<br>=C2=A0<div>Jussi</div=
></div>

--94eb2c14620459972c05492eba0b--
