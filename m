Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id B56D777342
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 08:05:11 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id l66so6182915ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 00:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version;
	bh=mP14QD7vZ0s7ZWYSdbqKiWbWOvg+yTxYFsV4eeOHD9c=;
	b=lOgZ2rJbPY7bm/BEMrLZrQPPnhCjygdHtXov9pXuXd8eSjCRIy7WvPdUXdDuZq7ma8
	ZMuczd7NfKNZVg0XQqJlYvDNpIhcxUcR5qbowpbIAacTMSgPhJajp6fGDTNloFf3V8NM
	SGX56Fla9gN1PtNMcvd5zshgzhrXBnynkLkTA3icFYV8L2xC0Bv7puAvtBPDDVd+WTyE
	PirD3C4RyyGlZnCixmBKQhlntoyDQ6wobbGKqhfF4W2woCehE0XFBXC8tPKALpeleURw
	PTZl5hN98OoTBTHhYFAW+T4veWIVoOPLq7+jh+bdjajaCMvV8ybpzmdnbKLMQUA3MWwM
	T6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version;
	bh=mP14QD7vZ0s7ZWYSdbqKiWbWOvg+yTxYFsV4eeOHD9c=;
	b=jcynHq3spYy/pfgzKhfzygTr3YhCWbA2TKkwvebwE8WdSApjeDbdKGKBShwQ+9RFMt
	sGbH38/KHz8cM7hmjmMjNfFybtYtinjqGnUM6eBFFGCPOAGnO65WA41gH3w1vIPj+sVN
	TRFhYhvXWJpaqnTTVkUHjAUtCaZre0u8gTG2aahrjzJAjEn9NmDBT0FanOla0Px5qPrN
	nl1Vmv84jSt6TwJNHl78lt5wRxxhVngbl+h9sblV2HaMSgYQFgu4AswdXdlp9dFRA0pt
	YekI8LDG3adzqjYILT2oINM/8pHDZIrz8hMw07mrRvWYqBtcW7g2FwRmuMECJOsXdvgW
	s4vg==
X-Gm-Message-State: AMke39m5/u3JcpnAixT/m02j7AcUXZMaM6BLbufc8bXJelyNcjZ7BqXj15ZldgWFQo4BGgM1
X-Received: by 10.107.147.6 with SMTP id v6mr10895515iod.235.1487405111739;
	Sat, 18 Feb 2017 00:05:11 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DBB1.dip0.t-ipconnect.de. [93.232.219.177])
	by smtp.gmail.com with ESMTPSA id
	g76sm5982648ioj.36.2017.02.18.00.05.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Feb 2017 00:05:10 -0800 (PST)
Message-ID: <1487405108.13854.561.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Neri, Ricardo"
	<ricardo.neri@intel.com>
Date: Sat, 18 Feb 2017 09:05:08 +0100
In-Reply-To: <1487365856.4999.47.camel@linuxfoundation.org>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	<cb8f971b4cb03c90f6459374609be3dce53f2ab1.1485530988.git-series.patrick.ohly@intel.com>
	<1487365856.4999.47.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 03/12] ovmf: move from meta-luv to OE-core
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
X-List-Received-Date: Sat, 18 Feb 2017 08:05:12 -0000
X-Groupsio-MsgNum: 93523
Content-Type: multipart/mixed; boundary="=-VlGPfGfCfPyx8lAg6Chj"

--=-VlGPfGfCfPyx8lAg6Chj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello Ricardo,

another issue with the UEFI recipes. See also Khem's comment (attached).

Bye, Patrick

On Fri, 2017-02-17 at 13:10 -0800, Richard Purdie wrote:
> On Fri, 2017-01-27 at 16:30 +0100, Patrick Ohly wrote:
> > From: meta-luv <luv@lists.01.org>
> > 
> > This is an unmodified copy of
> > github.com/01org/luv-yocto/meta-luv/recipes-core/ovmf revision
> > 4be4329.
> 
> https://autobuilder.yocto.io/builders/nightly-world/builds/156
> 
> which boils down to:
> 
> | "gcc-ar" cr /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootLogoLib/BootLogoLib/OUTPUT/BootLogoLib.lib  @/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootLogoLib/BootLogoLib/OUTPUT/object_files.lst
> | make: *** [/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib/DEBUG/BootMaintenanceManager.c] Error 2
> | VfrCompile: ERROR 1003: Invalid option value
> |   VFR file name /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib/OUTPUT/BootMaintenanceManager.i is too long.
> | "gcc-ar" cr /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/Library/NvVarsFileLib/NvVarsFileLib/OUTPUT/NvVarsFileLib.lib  @/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/Library/NvVarsFileLib/NvVarsFileLib/OUTPUT/object_files.lst
> 
> i.e. path length issues.
> 
> We saw this on multiple builds :(.
> 
> Cheers,
> 
> Richard


--=-VlGPfGfCfPyx8lAg6Chj
Content-Disposition: inline
Content-Description: Attached message - Re: [OE-core] [PATCH v5 03/12] ovmf:
 move from meta-luv to OE-core
Content-Type: message/rfc822

Delivered-To: patrick.ohly@gapps.intel.com
Received: by 10.28.156.137 with SMTP id f131csp408734wme; Fri, 17 Feb 2017
 18:05:15 -0800 (PST)
X-Received: by 10.84.233.206 with SMTP id
 m14mr15348138pln.153.1487383515730; Fri, 17 Feb 2017 18:05:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from mga11.intel.com (mga11.intel.com. [192.55.52.93]) by
 mx.google.com with ESMTPS id f2si6724460pln.297.2017.02.17.18.05.15 for
 <patrick.ohly@gapps.intel.com> (version=TLS1_2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Fri, 17 Feb 2017 18:05:15
 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
 209.85.192.196 as permitted sender) client-ip=209.85.192.196;
Authentication-Results: mx.google.com; dkim=fail header.i=@gmail.com;
 spf=pass (google.com: domain of raj.khem@gmail.com designates
 209.85.192.196 as permitted sender) smtp.mailfrom=raj.khem@gmail.com
Received: from orsmga002.jf.intel.com ([10.7.209.21]) by
 fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Feb
 2017 18:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,173,1484035200";  d="scan'208";a="49234853"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128]) by
 orsmga002.jf.intel.com with ESMTP; 17 Feb 2017 18:05:14 -0800
Received: from orsmga004.jf.intel.com (10.7.209.38) by
 orsmsx101-1.jf.intel.com (10.22.225.128) with Microsoft SMTP Server id
 14.3.248.2; Fri, 17 Feb 2017 18:05:12 -0800
Received: from fmsmga104.fm.intel.com ([10.1.193.100])  by
 orsmga004-1.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Feb
 2017 18:04:44 -0800
Authentication-Results: mga04.intel.com; spf=None
 smtp.pra=raj.khem@gmail.com; spf=Pass smtp.mailfrom=raj.khem@gmail.com;
 spf=None smtp.helo=postmaster@mail-pf0-f196.google.com; dkim=pass
 (signature verified) header.i=@gmail.com; dmarc=pass (p=none dis=none)
 d=gmail.com
IronPort-PHdr:  =?us-ascii?q?9a23=3AcVfitRxopi0sikrXCy+O+j09IxM/srCxBDY+r6Qd?=
 =?us-ascii?q?2+4fIJqq85mqBkHD//Il1AaPBtSGraobwLaK+4nbGkU4qa6bt34DdJEeHzQksu?=
 =?us-ascii?q?4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPERvjKwV1?=
 =?us-ascii?q?Ov71GonPhMiryuy+4ZPebgFIiTanfb9/Lhq6oAreu8ILnYZsN6E9xwfTrHBVYe?=
 =?us-ascii?q?pW32RoJVySnxb4+Mi9+YNo/jpTtfw86cNOSL32cKskQ7NWCjQmKH0169bwtRbf?=
 =?us-ascii?q?VwuP52ATXXsQnxFVHgXK9hD6XpP2sivnqupw3TSRMMPqQbwoXzmp8rxmQwH0hi?=
 =?us-ascii?q?gZKzE58XnXis1ug6JdvBKhvAF0z4rNbI2IKPZyYqbRcNUHTmRDQ8lRTTRMDI28?=
 =?us-ascii?q?YYUREuQPPuhYoIbhqFQTohWxBwejCfjzyjJLnHL6wbE23v4jHAzAwQcuH8gOsH?=
 =?us-ascii?q?PRrNjtMakSUf66zKzVxjvfdfxW2yr25Y/Sch87o/GAR7FwccrPxkkqDA7FgVCQ?=
 =?us-ascii?q?ppbkPzORzOgCr2+b7+95WO+plmUppQZxoj21ycctjInEnoIUylfY+iVlx4Y5P9?=
 =?us-ascii?q?y4SEljbd6rEZtQqyGaN5ZtTc84X25ovyM6x7sbspC4ZCgH0IorywLbZvCdcIWF?=
 =?us-ascii?q?4gjvWPuVLDtmnn5pZbayiheq/UWiy+DwTNS43EpUoiZfnNTAqGoB2wHX58SZTP?=
 =?us-ascii?q?Z2412v1iyV1w/J7+FJOUA0mrTfK54m2rMwk4AcsUXHHiPvgEX2grOaelwq+uS1?=
 =?us-ascii?q?7+nqY6/qppCbN49zhQH+NrohltajDuQ/NwgCR2mb+eKi273/5UD1XqlGg/ksnq?=
 =?us-ascii?q?TasJ3WP9kXq6qnDwNPz4ou7xeyAy+j0NsCnHkHKFxFeAiAj4jsI1zOOur3DfWl?=
 =?us-ascii?q?j1SvkDdk2fXGM6buApXINHfDkbPhcaxh5E5bzQo/1cpf6I5MCrEdPPLzXVf8tM?=
 =?us-ascii?q?TCAR8lKQy0wvroCNZn2oMZWWKPBq+YPbjTsV+O+uIgPe2MaJUJtzb6Lvh2r8Lp?=
 =?us-ascii?q?2EU4kl8UZ6Xh5YYNZHG1VqB8Ik6ZaGDgxM8cC2sLsyI6Ter3mFOFTDhfbmqzWK?=
 =?us-ascii?q?R64Ss0XtGIF4DGE6OtjbnJ5i65VslMb2IACVCBFF/ncoyFX7EHbyfEcZwpqSAN?=
 =?us-ascii?q?SbX0E9xp7hqprgKvjuM/duc=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result:  =?us-ascii?q?A0DnAQC6qqdYhsTAVdFeHAEBBAEBCgEBF?=
 =?us-ascii?q?wEBBAEBCgEBhAeBCYNainqRJIh6g1SIZoIDCR8LhXgCgiVBFgEBAQEBAQEBAQE?=
 =?us-ascii?q?BEgEBAQgLCwodL4IzIgGCGgEBAQEDASIPAQ0BGx0BAwwGBRUDAgIFIQICDwUPB?=
 =?us-ascii?q?QwBBQEBIROJUwEDFQUJo3g/jAOCAwUBHIMJBYNhChknDVWDPgEBAQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEXAgYJAQgOa4M0hnyHWi6CMQWPR36LPIZxhgyFD3WBZodihliRV?=
 =?us-ascii?q?zKBFSYBgTAgFB2FCSCCDlSLEQEBAQ?=
X-IPAS-Result:  =?us-ascii?q?A0DnAQC6qqdYhsTAVdFeHAEBBAEBCgEBFwEBBAEBCgEBhAe?=
 =?us-ascii?q?BCYNainqRJIh6g1SIZoIDCR8LhXgCgiVBFgEBAQEBAQEBAQEBEgEBAQgLCwodL?=
 =?us-ascii?q?4IzIgGCGgEBAQEDASIPAQ0BGx0BAwwGBRUDAgIFIQICDwUPBQwBBQEBIROJUwE?=
 =?us-ascii?q?DFQUJo3g/jAOCAwUBHIMJBYNhChknDVWDPgEBAQEBAQEBAQEBAQEBAQEBAQEXA?=
 =?us-ascii?q?gYJAQgOa4M0hnyHWi6CMQWPR36LPIZxhgyFD3WBZodihliRVzKBFSYBgTAgFB2?=
 =?us-ascii?q?FCSCCDlSLEQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.35,173,1484035200";  d="scan'208";a="99686222"
Received: from mail-pf0-f196.google.com ([209.85.192.196])  by
 mga04.intel.com with ESMTP/TLS/AES128-GCM-SHA256; 17 Feb 2017 18:04:43 -0800
Received: by mail-pf0-f196.google.com with SMTP id o64so5189571pfb.1 for
 <patrick.ohly@intel.com>; Fri, 17 Feb 2017 18:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com;
 s=20161025; h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to :user-agent;
 bh=9bJhsg1Qpnne6c40kRPyOu/MHitqI52/EVK9mqKOHOI=;
 b=OiVSX15X5KmpHwESOS58iLfUR+8mPlcdjWEQMukeS7AnyUwYCKr7rZyRVnH0rIR3Iv
 lCk44NqNMM8yYwwXNcIqI2qhRtZBAY0Nne5Unwvw9MgpD6g4GP4llO/xBwQvqmgBDtH9
 6S4O2W4X/+TWmHsytXldZ9NR17zZmNZYP+XqpgXW7u0NziWCZSpeDXIt/Nb306JyzO1v
 kBs00z3EAKh6x9rzf696BeiFb7/pFcSVRHc4IOAioV5aTfkbKq5jyP70EUNC9aIkK6m1
 TbQfaxQvJpNK6Wzm4fZMblgfbazA5WwXOvnfRXk6PB/lgdAWv72fRUphWGbgeH9Mf6wv ZK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent; bh=9bJhsg1Qpnne6c40kRPyOu/MHitqI52/EVK9mqKOHOI=;
 b=cTLGzPeqS9BY6jbU+8+oZ9BHujHf16u2rAoOw5skcN5C38crOD0hsQIAhDBLdZmEW7
 KpKkcSRV8mkswP33I9eaPoI2LbQIpIWjjW4LrbcaMcrWAr5Bqyz1oGT187osn6W6EbKf
 AI6lPlQEC4D/+/nMjy+hq1LL6wcAs5utNQDmgnFaCNhALF7SvhwmcEzSp2fMJFFbECsG
 Zm3jgLE6AU3eP/eH0KDlJ03VbFIAcJp+KgFgZCTZBu5BN+aKzr9YilwQ+Ve5Tdah6wwR
 wD13gtO/QnJ/jjB8rOSwIxWQ1dXjOOc/m4yU8jOe/w1rJiKnmVBj3Z4BJVRZcyp8KR/P HwrA==
X-Gm-Message-State:  AMke39nk+ox+OKVr1kireOaCi20844cFsW9TcvEjQcFl0fOoXRPiSEKWVRx0boplp2MN8Q==
X-Received: by 10.99.131.198 with SMTP id
 h189mr5164636pge.226.1487383483343; Fri, 17 Feb 2017 18:04:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net.
 [76.102.32.192]) by smtp.gmail.com with ESMTPSA id
 m6sm21654323pfg.126.2017.02.17.18.04.42        (version=TLS1_2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);        Fri, 17 Feb 2017
 18:04:42 -0800 (PST)
Date: Fri, 17 Feb 2017 18:04:40 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Patrick Ohly <patrick.ohly@intel.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 03/12] ovmf: move from meta-luv to OE-core
Message-ID: <20170218020440.GB30443@haswell>
References: 	 <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	 <cb8f971b4cb03c90f6459374609be3dce53f2ab1.1485530988.git-series.patrick.ohly@intel.com>
	 <1487365856.4999.47.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1487365856.4999.47.camel@linuxfoundation.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Evolution-Source: 1313596106.10938.4@pohly-mobl1
Content-Transfer-Encoding: quoted-printable

On 17-02-17 13:10:56, Richard Purdie wrote:
> On Fri, 2017-01-27 at 16:30 +0100, Patrick Ohly wrote:
> > From: meta-luv <luv@lists.01.org>
> >=20
> > This is an unmodified copy of
> > github.com/01org/luv-yocto/meta-luv/recipes-core/ovmf revision
> > 4be4329.
>=20
> https://autobuilder.yocto.io/builders/nightly-world/builds/156
>=20
> which boils down to:
>=20
> | "gcc-ar" cr /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-worl=
d/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/Ov=
mfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootLogoLib/BootLogoLib/OUTPU=
T/BootLogoLib.lib=C2=A0=C2=A0@/home/pokybuild/yocto-autobuilder/yocto-worke=
r/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r=
0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootLogoLib/Boo=
tLogoLib/OUTPUT/object_files.lst
> | make: *** [/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world=
/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/Ovm=
fIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootMaintenanceManagerUiLib/Bo=
otMaintenanceManagerUiLib/DEBUG/BootMaintenanceManager.c] Error 2
> | VfrCompile: ERROR 1003: Invalid option value
> |=C2=A0=C2=A0=C2=A0VFR file name /home/pokybuild/yocto-autobuilder/yocto-=
worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/=
git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootMainte=
nanceManagerUiLib/BootMaintenanceManagerUiLib/OUTPUT/BootMaintenanceManager=
.i is too long.
> | "gcc-ar" cr /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-worl=
d/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/Ov=
mfIa32/RELEASE_GCC5/IA32/OvmfPkg/Library/NvVarsFileLib/NvVarsFileLib/OUTPUT=
/NvVarsFileLib.lib=C2=A0=C2=A0@/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-=
r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/Library/NvVarsFileLib/NvVar=
sFileLib/OUTPUT/object_files.lst
>=20
> i.e. path length issues.
>=20
> We saw this on multiple builds :(.

I wonder why its using gcc-ar that should actually be <cross>-gcc-ar
so probably we need to set AR to point to <cross>-gcc-ar, but I would
like to see if we can use normal ar since  gcc-ar would fail with clang

--=-VlGPfGfCfPyx8lAg6Chj--
