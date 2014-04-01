Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id C93786E9A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 05:30:46 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id lx4so8747880iec.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 22:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hkBaGy9xVVyCDxnBuuWbVVmS8MisFARcYEamxtBwedg=;
	b=dz1IcShf+C7bI+MprWfWxwz9nxcykpmWaFNWtjFUeJBWB/D97RgmQtc6bbIZ1xhknc
	9t2ku4RrTr+2FoKnc6OWmzjB//HGEdqjLI2nmQupiNWpV2sCDs47JZu7Ky/hN50X1J14
	jH90AmgL3/PfaQwXoxN8dxxDrh5Nv48jcBkToCcVBV2b4MWPO/JHk3tmZAH2oSJZLCZv
	1Ui9Hi1ujFaCYtt8LRY4D30MqjlHZHTPQP9lvbPS05jRlhk3aaLE2ka4EWGor+68FOPz
	EulOdmKLnhp12eZWr1BTa0N1+bOz/IfvpWiF3p0TUUkLqu3Wd2fCGUOJmvENGFoP+QTE
	Jhkg==
X-Received: by 10.42.20.6 with SMTP id e6mr37709147icb.29.1396330248152; Mon,
	31 Mar 2014 22:30:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Mon, 31 Mar 2014 22:30:18 -0700 (PDT)
In-Reply-To: <eedfe13af69c82c667fb78152bb070b0cc448bc2.1395997035.git.hongxu.jia@windriver.com>
References: <cover.1395997035.git.hongxu.jia@windriver.com>
	<eedfe13af69c82c667fb78152bb070b0cc448bc2.1395997035.git.hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2014 22:30:18 -0700
Message-ID: <CAMKF1sozZEVsJ=oaBW-mqex27LvOTfOGW90+g_9gkPg27OJEhA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libarchive: fix CVE-2013-0211
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
X-List-Received-Date: Tue, 01 Apr 2014 05:30:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 28, 2014 at 2:43 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> ++      const size_t max_write = INT_MAX;

I think INT_MAX is a mismatch here size_t may not be defined 'unsigned
int' on all kind of architectures.

