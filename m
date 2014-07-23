Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id E79517064B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 08:27:22 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id i50so997575qgf.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 01:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RWCvEl9RT4HuC3sP91Puh90orr6P8+HKEccplGHHsss=;
	b=iK1Gy47Mj7SyBuF+R7bhIGH6nHk/c6A19VfAvOZoPzR2i0SGN9Txmr8+7MIOKYDxvN
	fH+nKRCOn4j3GGjucDj/Cu+3E3qXThIuhMAYu3UFxPEeWxMM3lLVpf/KTpVa3SdYQ3tN
	dVSuZnCO5IJ79DlOoWE51BEYKf6jJnOIQZxg0gei4UCd5DsMZ3DDBHiMD/UgsvbstblX
	rewE4KkAG+VZxqnLU5D0sE8I60eoPi7d9cTQw5VpXRHRARmc3yzrivC9WnyMNQ6VUFSa
	eY8JzBh0NEyta1vky1f/HcS5IdWjUHks5dXsnXnKgZifqtNjEI/+TLLWilR0bEG6qcLs
	ecvw==
X-Gm-Message-State: ALoCoQkwBlFIW08PF3sFDXKDr9kr+FAOGXFvmFt6GIXzsdDXsB+kTgLb0yx0pGdRDlxztkVWUw4R
X-Received: by 10.224.43.77 with SMTP id v13mr65757301qae.34.1406104043549;
	Wed, 23 Jul 2014 01:27:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Wed, 23 Jul 2014 01:27:03 -0700 (PDT)
In-Reply-To: <1406102685-28553-1-git-send-email-jackie.huang@windriver.com>
References: <1406102685-28553-1-git-send-email-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Jul 2014 09:27:03 +0100
Message-ID: <CAJTo0LbXfr099Rdb4aaXy__bobFN1oF2FWhF-fDvy6FK8+wkJA@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxfont: fix for CVE-2014-0209 CVE-2014-0210 CVE-2014-0211
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
X-List-Received-Date: Wed, 23 Jul 2014 08:27:31 -0000
Content-Type: text/plain; charset=UTF-8

On 23 July 2014 09:04,  <jackie.huang@windriver.com> wrote:
> 0001-CVE-2014-0209-integer-overflow-of-realloc-size-in-Fo.patch
> CVE-2014-0209:
> Multiple integer overflows in the (1) FontFileAddEntry and
> (2) lexAlias functions in X.Org libXfont before 1.4.8 and
> 1.4.9x before 1.4.99.901 might allow local users to gain
> privileges by adding a directory with a large fonts.dir or
> fonts.alias file to the font path, which triggers a heap-based
> buffer overflow, related to metadata.
>
> CVE-2014-0210:
> Multiple buffer overflows in X.Org libXfont before 1.4.8 and
> 1.4.9x before 1.4.99.901 allow remote font servers to execute
> arbitrary code via a crafted xfs protocol reply to the
> (1) _fs_recv_conn_setup, (2) fs_read_open_font,
> (3) fs_read_query_info, (4) fs_read_extent_info,
> (5) fs_read_glyphs, (6) fs_read_list, or
> (7) fs_read_list_info function.
>
> CVE-2014-0211:
> Multiple integer overflows in the (1) fs_get_reply,
> (2) fs_alloc_glyphs, and (3) fs_read_extent_info functions
> in X.Org libXfont before 1.4.8 and 1.4.9x before 1.4.99.901
> allow remote font servers to execute arbitrary code via
> a crafted xfs reply, which triggers a buffer overflow.

I sent an upgrade to 1.5.0 yesterday, which has all of these integrated.

Ross

