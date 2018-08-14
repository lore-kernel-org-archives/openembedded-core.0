Return-Path: <nickaein.i@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id E86B97901C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:29:34 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id b66-v6so13821316qkj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=M0TRxrkVrawwjo4+fqAleEcT/DNK3JL1AUKl6YlikOg=;
	b=FOEx2IVoTuyyroWafiFdwiJx69pjD1+h9XTLVBa30hePzH5yVxBmL5H0KHWnru2Ix+
	eSkdP75d/31r0Nk/5et9a4koKk4Xu+5nfjK3rYwiEmcLPAOF2N5hR/LjsVuTgDZL1OZG
	IyF3KFbfMi1BrnoySEryviDtJHx9mwoaywsMDtZwJbyEoa1kXMIAhSIc3YH6xrN/ST9f
	NB+1CAvVNDJPY5JTHxXMNzfgMEA2dRG9U/79ndLCoHEFyxf+s4OqtSdROeL33jm56sBP
	4AxfkWVo3R4iu3fygpOES8b5IvIwCBlZo49ZjESrEn44AKDWtZcsZTKdnSTCqqA/rkam
	fycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=M0TRxrkVrawwjo4+fqAleEcT/DNK3JL1AUKl6YlikOg=;
	b=LabF43gyOpXdfa1fklb1SVQQcgEaS+DDh1Imo2FgHUY/MDHtYNIG2dF22I14Lp9rVq
	eBilWqzQyKLx5OiyInXjUHDLWRPU1dG86o/OimxEoUQk332xeI8UBbaZyOyLuCxFnLP/
	xEPCyQe/dk7O2QhzH6OSQmddEVVb3B5hMLy9XiqY5tYTiUZA15e7YctF1BKk72dj3WoB
	1MBCQ5PYFFwcd70RPRxbso0Y3x36KhWnaOdMt7Csh8dPqamQRpiun9AR0Of8dmNvxLgQ
	QvRC48A3muS0LG13MRtOk13MzLuUJCLOUT/j78MlJhwjk9AIcbJRC/efvEp9QXTigY+l
	n1rQ==
X-Gm-Message-State: AOUpUlGRzC4x8AfbupizsBYGrh3E3gAEvHdDrj/ZFgROBXUsJAXlUrm1
	KUjkQitxlk9llowmil3tza61n5YSdhS81XRbuf0RQ68ziV0=
X-Google-Smtp-Source: AA+uWPxR/3o5xeI4Lx4m5tBWVsmZ2WichWLGOr8gpTLPRrJ/R+i0gWuhWrVDaG65At5iySSQIluDuqekWCqlrBXCQvQ=
X-Received: by 2002:a37:2fc6:: with SMTP id
	v189-v6mr20715558qkh.433.1534264175525; 
	Tue, 14 Aug 2018 09:29:35 -0700 (PDT)
MIME-Version: 1.0
From: Isaac Nickaein <nickaein.i@gmail.com>
Date: Tue, 14 Aug 2018 20:57:47 +0430
Message-ID: <CA+NJmkes2FzO3OvTVxjL075A5G_UMUjj_J-oc1BtjThTQ=YiZg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: iotop: failure, python module subprocess is missing
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
X-List-Received-Date: Tue, 14 Aug 2018 16:29:35 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

iotop built in my custom image complains about missing subprocess module:

   root@colibri-imx7-emmc:~# iotop
   No module named subprocess
   To run an uninstalled copy of iotop,
   launch iotop.py in the top directory
   root@colibri-imx7-emmc:~#

Shouldn't the iotop RDEPENDS on python-subprocess?

I'm on rocko 2.4.2 with following recipe for iotop:
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/iotop/iotop_0.6.bb?h=rocko

