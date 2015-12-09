Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC3D6012C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 04:36:07 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so242626647wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 20:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=iq353bU7G+rXi0Np4BERUKDTS1VTIvqQlc1vurOEC8E=;
	b=L1Zjdbn46uk7yeFGauYKB+blzOF39Tn72gA4DqP8h7Ngqg2ir5PD2hJie0NPXRkf9y
	n1kzBoKNOi9qaWwxCz+yY0xe9SWgaiOm0Cr+EO6+RDITMs5cxOPJlNMwEYtBLgP3vjZk
	U3n4f5aF+rIk+GS+GiptDpEtETGPSwh5w5OD+67N6WbshxOBaWcdWY8bLYPo1Zxxfj6K
	ybYSAriMeMzCDCBifQNWZP4xWxmsU+LPvg0/oufjP+7e2Ya+ASYCRCUgnOupbCR5TS+A
	4gFmvJiAuefaw0ynHWlI3gyPSBAYNzns2SOKeEvKQGr8sGmDQO5W7J/bPINdxkr5mnnV
	4DTA==
MIME-Version: 1.0
X-Received: by 10.194.24.226 with SMTP id x2mr3331705wjf.43.1449635767394;
	Tue, 08 Dec 2015 20:36:07 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Tue, 8 Dec 2015 20:36:07 -0800 (PST)
Date: Tue, 8 Dec 2015 20:36:07 -0800
Message-ID: <CAJ86T=Xg9mE5MCKL-w=6O+LUZAv5e-iOeTX9Rgto4LVhS+Xoww@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Robert Yang <liezhi.yang@windriver.com>
Subject: jethro backports
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
X-List-Received-Date: Wed, 09 Dec 2015 04:36:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi Robert,

Could you please consider backporting the following fixes to jethro:

  c075d6e directfb.inc: force bfd linker for armv7a
  c725328 prelink: Fix various prelink issues on IA32, ARM, and MIPS.
  70c55aa gcc: Update default Power GCC settings to use secure-plt
  12c86bd glibc: Fix ld.so / prelink interface for
ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA
  cb8f842 cairo: fix license for cairo-script-interpreter

Thanks

