Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mail.openembedded.org (Postfix) with ESMTP id CD77A6B7B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 15:40:07 +0000 (UTC)
Received: by mail-vb0-f49.google.com with SMTP id w16so679671vbb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 08:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HhIy1ud973M6wJU0dgHfE/c1LJ+JJgk6akwsjnKaiHI=;
	b=bM47k0SGTg58BDxS9W3WKO0k3Bji1c4ApNu6F+sqdLdzMEfVjaS65wq0Gkxb0FQMQ7
	NWXL2hmHo7gA3Qgf3X060tfsscIjDcdT1qoMB/CICtHDR1rkPt11AiOq3Jm1CYbuC6n4
	+t6scH+oWmdy+VH/1zhiNibE2io4JRnA8z37IrQFuqclC0b6lN616UNiTyQsAcAOATJs
	WAdyXOVc0dLBSsehUqc57/ZlWKMLf38eGTSM51qHaPMvjI89Iyii3LpdsnvsVHyasuWy
	V9siFeLRismQAlVdEw9SS01JHqJ+Euslw7F4EPqirw6yiVwrJhLCHD47wWJhVQMWq0ja
	HPAA==
X-Gm-Message-State: ALoCoQmzZkfHURJqufNAPK+WyTytxK1scNjg3sGe6yQTFpCXe8cm5R2JIfn+aCbSa+4rtidMjHCE
X-Received: by 10.52.117.79 with SMTP id kc15mr469825vdb.45.1376581208441;
	Thu, 15 Aug 2013 08:40:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 15 Aug 2013 08:39:48 -0700 (PDT)
In-Reply-To: <cover.1376580529.git.sgw@linux.intel.com>
References: <cover.1376580529.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Aug 2013 16:39:48 +0100
Message-ID: <CAJTo0LbFSvRztxR3kOYTKYnENbFMhJ3ajHyssX8grN+-7VktYA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: paul.eggleton@linux.intel.com, clarson@kergoth.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/32] Ready for Final ACK & Pull
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
X-List-Received-Date: Thu, 15 Aug 2013 15:40:08 -0000
Content-Type: text/plain; charset=UTF-8

On 15 August 2013 16:32, Saul Wold <sgw@linux.intel.com> wrote:
> Richard,
>
> I updated this by removing the connman patch as suggested by Ross. I
> chose to leave in the Read-Only rootfs, as I have talked with Qi and
> I will have him send a follow on patch to fix the internal patch header.
>
> I have tested the read-only stuff locally.

Acked-By: Ross Burton <ross.burton@intel.com>

Ross

