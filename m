Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mail.openembedded.org (Postfix) with ESMTP id 94EF86AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 16:33:17 +0000 (UTC)
Received: by mail-vb0-f49.google.com with SMTP id w16so4195115vbb.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 09:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=15joM2VQUK1Eb8N+6GHl8+zM6WHGyNHrpDhtybuT7bA=;
	b=XLUDegByenmLWFUdx5ST0lg4zIaSIxP1X7HMeRCmbCYhtgMjtvgVlUk5xycyB8jIjc
	SXwB7LxDvsbHogfqT2y1cM3adBRRZ2OcJDyJJq4gel8XrDJAudC1USqQ1wkhByRHTN48
	5d6ZvZm07r/8ipKEXNDUfJ+aloqVw5UsIVQsPl1/n/rWDc3SbjlKzAwXRnuihD1paza0
	8NXSeIn7B80m5XFshZjQoEIr6PkolPjrJJREUziOfc8KzzZWirIGMnxNmpDnOZ0da7Jk
	F80BBemI+I1lsaEgMmOPjr+YZdMcjLGWdhpBLD56MdsN1ROFwLqEobBcP4YyE4tQGHeX
	T6Zw==
X-Gm-Message-State: ALoCoQnsD07iEtD8TdLlqdPzoURlgCnJgnY6NPloXbiUVxXX3eHFI/LHvC2hgQPr3HHRybSDQRla
X-Received: by 10.58.233.8 with SMTP id ts8mr917647vec.44.1376065998234; Fri,
	09 Aug 2013 09:33:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 9 Aug 2013 09:32:58 -0700 (PDT)
In-Reply-To: <dd5b55f4d3f2ef9218001d44fbb3d848dbc91c1a.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
	<dd5b55f4d3f2ef9218001d44fbb3d848dbc91c1a.1376038140.git.paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Aug 2013 17:32:58 +0100
Message-ID: <CAJTo0LZML+XWhhpj4PS2nXt3XzgzLDpay4wBBM-vsavVmcHWgA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] yasm: add from meta-oe and tweak
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
X-List-Received-Date: Fri, 09 Aug 2013 16:33:18 -0000
Content-Type: text/plain; charset=UTF-8

On 9 August 2013 09:59, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> +SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"

Does this mean we can drop nasm to avoid having numerous assemblers in
oe-core?  You can't feed them after midnight you know.

Ross

